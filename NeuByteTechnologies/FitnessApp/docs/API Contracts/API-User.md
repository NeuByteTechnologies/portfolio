# API Contract — User
## 1. Endpoint Summary
| Endpoint | Method | Purpose | Authentication | Notes |
| --- | --- | --- | --- | --- |
| ``/user`` | POST | Create a new user (Onboarding) | None | Creates base profile + preferences |
| ``/user`` | GET | Retrieve current user profile | Required | Used by Dashboard + Settings |
| ``/user`` | PUT | Update user profile | Required | Name, email, phone, DOB, units |


## 2. Request & Response Schemas
### 2.1 Create User (POST /user)
*Request*  
json
{
  "name": "string",
  "email": "string",
  "email_type_id": 1,
  "phone": "string (optional)",
  "phone_type_id": 1,
  "password": "string",
  "unit_type_weight_id": 1,
  "unit_type_distance_id": 3,
  "user_type_id": 1
}
*Response*  
json
{
  "user_id": "string",
  "name": "string",
  "email": "string",
  "unit_preferences": {
    "weight_unit": "lb",
    "distance_unit": "mi"
  }
}
### 2.2 Get User Profile (GET /user)
*Response*  
json
{
  "user_id": "string",
  "name": "string",
  "email": "string",
  "phone": "string",
  "unit_preferences": {
    "weight_unit": "lb",
    "distance_unit": "mi"
  },
  "user_type": "Standard User"
}
### 2.3 Update User Profile (PUT /user)
*Request*  
json
{
  "name": "string",
  "email": "string",
  "email_type_id": 1,
  "phone": "string",
  "phone_type_id": 1,
  "unit_type_weight_id": 1,
  "unit_type_distance_id": 3
}
*Response*  
json
{
  "success": true,
  "user": {
    "user_id": "string",
    "name": "string",
    "email": "string",
    "phone": "string",
    "unit_preferences": {
      "weight_unit": "lb",
      "distance_unit": "mi"
    }
  }
}
## 3. Validation Rules
**Create User**
- name required
- email required, must be unique
- password must meet security requirements
- email_type_id must exist in email_type
- phone_type_id optional but must be valid if provided
 -unit_type_weight_id must reference a weight unit
- unit_type_distance_id must reference a distance unit
- user_type_id defaults to Standard User if omitted

**Get User**
- Session token required
- User must exist and be active

**Update User**
- Email uniqueness enforced
- Unit types must be valid
- Phone format validated
- Cannot change user_type_id (admin-only)

## 4. Business Rules
**Create User**
- Creates:
 - user record
 - default preferences
 - default notification settings
- Logs event: User Created
 -Sends welcome notification (if enabled)

**Get User**
- Used by:
 - Dashboard
 - Profile screen
 - Settings
 - Returns normalized unit preferences

**Update User**
- Logs event: Profile Updated
- If email changes → triggers email verification workflow (future)
- If unit preferences change → dashboard recalculates metrics

## 5. Error Model
| HTTP Code | Error Code | Message | Description |
| --- | --- | --- | --- |
| 400 | ``INVALID_REQUEST`` | Missing or invalid fields | Validation failure |
| 409 | ``EMAIL_EXISTS`` | Email already in use | Unique constraint |
| 401 | ``UNAUTHORIZED`` | Invalid or missing token | Auth required |
| 404 | ``USER_NOT_FOUND`` | User not found | Invalid session |
| 500 | ``SERVER_ERROR`` | Internal error | Unexpected failure |


## 6. Example Requests & Responses
**Create User Example**  
*Request*  
json  
{  
  "name": "Gordon",  
  "email": "gordon@example.com",  
  "email_type_id": 1,  
  "password": "Password123!",  
  "unit_type_weight_id": 1,  
  "unit_type_distance_id": 3,  
  "user_type_id": 1  
}   
*Response*  
json  
{  
  "user_id": "U123",  
  "name": "Gordon",  
  "email": "gordon@example.com",  
  "unit_preferences": {  
    "weight_unit": "lb",  
    "distance_unit": "mi"  
  }  
}   
**Update User Example**  
*Request*  
json  
{  
  "name": "Gordon Smith",  
  "email": "gordon.smith@example.com",  
  "email_type_id": 1,  
  "phone": "208-555-1234",  
  "phone_type_id": 2,  
  "unit_type_weight_id": 2,  
  "unit_type_distance_id": 4  
}  
*Response*  
json
{  
  "success": true,  
  "user": {  
    "user_id": "U123",  
    "name": "Gordon Smith",  
    "email": "gordon.smith@example.com",  
    "phone": "208-555-1234",  
    "unit_preferences": {  
      "weight_unit": "kg",  
      "distance_unit": "km"  
    }  
  }  
}  
## 7. Notes / Edge Cases
- Changing units does not retroactively convert historical data
- Email change may require re-verification (future enhancement)
- User type cannot be changed by the user
- Phone number is optional but recommended for MFA