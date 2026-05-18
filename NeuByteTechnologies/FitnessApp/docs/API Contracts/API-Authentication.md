# API Contract — Authentication
## 1. Endpoint Summary
| Endpoint | Method | Purpose | Authentication | Rate Limits |
| --- | --- | --- | --- | --- |
| ``/auth/login`` | POST | Authenticate user and issue session token | None | Standard |
| ``/auth/logout`` | POST | Invalidate current session | Required | Standard |
| ``/auth/session`` | GET | Validate active session and return user context | Required | Standard |


## 2. Request & Response Schemas
### 2.1 Login Request
json
{
  "email": "string",
  "password": "string",
  "mfa_code": "string (optional)"
}
### 2.2 Login Response
json
{
  "session_token": "string",
  "expires_in": 3600,
  "mfa_required": false,
  "user": {
    "user_id": "string",
    "name": "string",
    "email": "string"
  }
}
### 2.3 Logout Request
json
{
  "session_token": "string"
}
### 2.4 Logout Response
json
{
  "success": true
}
### 2.5 Session Check Response
json
{
  "valid": true,
  "user": {
    "user_id": "string",
    "name": "string",
    "email": "string"
  },
  "expires_in": 1800
}
### 3. Validation Rules
**Login**
- Email must be valid format
- Password must not be empty
- If MFA is enabled for the user → mfa_code required
- Account must be active
- Password must match stored hash

**Logout**
- Session token must be valid
- Session must exist
- Session Check
- Token must be present
- Token must not be expired
- Token must match active session

### 4. Business Rules
**Login**
- On successful login, generate a new session token
- If MFA is enabled:
 - Return mfa_required = true
 - Do NOT return a session token until MFA is verified
- Log event: User Logged In
- Update last login timestamp

**Logout**
- Invalidate session token
- Log event: User Logged Out

**Session Check**
- Used by UI to:
 - Auto‑login user on app open
 - Detect session timeout
 - Refresh dashboard context
- If token expired:
 - Return valid = false
 - Do not return user object

5. Error Model
| HTTP Code | Error Code | Message | Description |
| --- | --- | --- | --- |
| 400 | ``INVALID_REQUEST`` | Invalid email or password | Missing or malformed fields |
| 401 | ``UNAUTHORIZED`` | Invalid credentials | Wrong password or unknown user |
| 401 | ``MFA_REQUIRED`` | MFA code required | MFA enabled but code missing |
| 403 | ``ACCOUNT_LOCKED`` | Account locked | Too many failed attempts |
| 440 | ``SESSION_EXPIRED`` | Session expired | Token no longer valid |
| 500 | ``SERVER_ERROR`` | Internal error | Unexpected failure |

### 6. Example Requests & Responses
**Login Example**
*Request*  

{
  "email": "gordon@example.com",
  "password": "Password123!"
}
*Response*  
json
{
  "session_token": "abc123xyz",
  "expires_in": 3600,
  "mfa_required": false,
  "user": {
    "user_id": "U123",
    "name": "Gordon",
    "email": "gordon@example.com"
  }
}
**Session Check Example**
*Response*  
json
{
  "valid": true,
  "user": {
    "user_id": "U123",
    "name": "Gordon",
    "email": "gordon@example.com"
  },
  "expires_in": 1200
}

### 7. Notes / Edge Cases
- If MFA is required, login returns mfa_required = true and no session token
- Session tokens expire after inactivity (configurable)
- Session check endpoint is used by:
 - Dashboard load
 - Background refresh
 - Auto‑logout logic
- Logout is idempotent (calling twice is safe)