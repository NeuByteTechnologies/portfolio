# API Contract — MFA Enrollment
##1. Endpoint Summary
Endpoint	Method	Purpose	Authentication	Notes
/mfa/enroll	POST	Begin MFA enrollment and generate secret + QR	Required	First‑time setup
/mfa/verify	POST	Verify MFA code during enrollment	Required	Completes enrollment
/mfa/reenroll	POST	Reset MFA and generate new secret	Required	Optional feature
/mfa/disable	POST	Disable MFA for the user	Required	Admin or user‑initiated


## 2. Request & Response Schemas
### 2.1 Begin Enrollment (POST /mfa/enroll)
**Request**  
json  
{  
  "session_token": "string"  
}  
**Response**  
json  
{  
  "mfa_secret": "string",  
  "qr_code": "string (base64 or URL)",  
  "instructions": "Scan the QR code with your authenticator app."  
}  
### 2.2 Verify Enrollment (POST /mfa/verify)
**Request**  
json  
{  
  "session_token": "string",  
  "mfa_code": "string"  
}  
**Response**  
json  
{  
  "success": true,  
  "message": "MFA enrollment complete."  
}  
### 2.3 Re‑Enroll MFA (POST /mfa/reenroll)
*(Optional but supported by your UI Spec)*
**Request**
json  
{  
  "session_token": "string"  
}  
**Response**
json  
{  
  "mfa_secret": "string",  
  "qr_code": "string",  
  "message": "MFA reset. Please scan the new QR code."  
}  
### 2.4 Disable MFA (POST /mfa/disable)
**Request**  
json  
{  
  "session_token": "string"  
}  
**Response**  
json  
{  
  "success": true,  
  "message": "MFA disabled."  
}  
## 3. Validation Rules
**Enroll**  
- User must be authenticated
- User must not already have MFA enabled
- Generate a unique TOTP secret
- QR code must encode:
   - issuer
 - user email
 - secret

**Verify**
- mfa_code must be 6 digits
- Code must match TOTP algorithm
- Code must be within allowed time window
- After success:
 - Mark MFA as enabled
 - Store secret securely

**Re‑Enroll**  
- User must already have MFA enabled
- Old secret must be invalidated

**Disable**
- User must be authenticated
- MFA must be enabled
- Log security event

## 4. Business Rules
**Enroll**  
- Generates:
 - MFA secret
 - QR code
- Logs event: MFA Enrollment Started
- Does not enable MFA until verification succeeds

**Verify**
- Logs event: MFA Enrollment Completed
- Enables MFA for the user
- Future logins require MFA code

**Re‑Enroll**
- Logs event: MFA Re‑Enrollment Started
- Old secret invalidated immediately
- User must verify new code

**Disable**
- Logs event: **MFA Disabled**
- Should require password confirmation (future enhancement)

## 5. Error Model
| HTTP Code | Error Code | Message | Description |
| --- | --- | --- | --- |
| 400 | ``INVALID_REQUEST`` | Missing or invalid fields | Validation failure |
| 401 | ``UNAUTHORIZED`` | Invalid session | Auth required |
| 409 | ``MFA_ALREADY_ENABLED`` | MFA already active | Enrollment blocked |
| 409 | ``MFA_NOT_ENABLED`` | MFA not active | Re‑enroll/disable blocked |
| 422 | ``INVALID_MFA_CODE`` | Incorrect MFA code | Verification failed |
| 500 | ``SERVER_ERROR`` | Internal error | Unexpected failure |

## 6. Example Requests & Responses
**Begin Enrollment Example**  
*Response*  
json  
{  
  "mfa_secret": "JBSWY3DPEHPK3PXP",  
  "qr_code": "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAA...",  
  "instructions": "Scan the QR code with your authenticator app."  
}  
**Verify Enrollment Example**
*Request*  
json  
{  
  "session_token": "abc123xyz",  
  "mfa_code": "482913"  
}  
*Response*  
json  
{  
  "success": true,  
  "message": "MFA enrollment complete."  
}  
## 7. Notes / Edge Cases
- MFA enrollment is not part of login except during first‑time setup
- QR code generation is UI‑agnostic (base64 or URL)
- Re‑enrollment is optional but supported by your Profile → Manage MFA flow
- Disabling MFA may require password confirmation in future versions
- MFA codes follow standard TOTP (30‑second window)