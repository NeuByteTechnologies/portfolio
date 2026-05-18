API Contract — Preferences
## 1. Endpoint Summary
| Endpoint | Method | Purpose | Authentication | Notes |
| --- | --- | --- | --- | --- |
| ``/preferences`` | GET | Get all user preferences | Required | Used by Preferences screen |
| ``/preferences`` | PUT | Update user preferences | Required | Updates multiple preferences at once |
| ``/preferences/defaults`` | GET | Get system default preferences | None | Used during onboarding |

## 2. Preference Categories Included
Your Preferences module includes:  

### 2.1. Unit Preferences
- Weight unit (lb/kg)
- Distance unit (mi/km)

### 2.2. Notification Preferences
(Handled by Notification Preferences API, but included here for completeness)
- Reminder notifications
- Achievement notifications
- System notifications

### 2.3. Profile Preferences
- Preferred email type
- Preferred phone type

### 2.4. Future‑safe
- Theme (light/dark) (future release) 
- Language
- Timezone

Your API supports these even if the UI doesn’t expose them yet.  

## 3. Request & Response Schemas
### 3.1 Get User Preferences (GET /preferences)
**Response**  
json  
{  
  "preferences": {  
    "units": {  
      "weight_unit_type_id": 1,  
      "distance_unit_type_id": 3  
    },  
    "profile": {  
      "email_type_id": 1,  
      "phone_type_id": 1  
    },  
    "system": {  
      "theme": "light",  
      "language": "en-US",  
      "timezone": "America/Denver"  
    }  
  }  
}  
### 3.2 Update User Preferences (PUT /preferences)
**Request**  
json  
{  
  "units": {  
    "weight_unit_type_id": 2,  
    "distance_unit_type_id": 4  
  },  
  "profile": {  
    "email_type_id": 2,  
    "phone_type_id": 1  
  },  
  "system": {  
    "theme": "dark",  
    "language": "en-US",  
    "timezone": "America/Denver"  
  }  
}  
**Response**  
json  
{  
  "success": true,  
  "updated_count": 5  
}  
### 3.3 Get Default Preferences (GET /preferences/defaults)
**Response**  
json  
{  
  "defaults": {  
    "units": {  
      "weight_unit_type_id": 1,  
      "distance_unit_type_id": 3  
    },  
    "profile": {  
      "email_type_id": 1,  
      "phone_type_id": 1  
    },  
    "system": {  
      "theme": "light",  
      "language": "en-US",  
      "timezone": "America/Denver"  
    }  
  }  
}  
## 4. Validation Rules
**Get Preferences**  
- User must be authenticated
- If user has no saved preferences → return defaults

**Update Preferences**  
- User must be authenticated
- All *_type_id values must exist in metadata tables
- Missing categories should not delete existing preferences
- Only provided fields are updated

**Defaults**  
- No authentication required
- Defaults come from:
 - system config
 - or hardcoded values

## 5. Business Rules
**Preferences Storage**  
- Stored in user_preference table
- Each preference is:
 - user_id
 - preference_id
 - preference_value

**Unit Preferences**  
- Weight unit applies to:
 - weigh‑ins
 - weight goals
 - exercise weight
- Distance unit applies to:
 - cardio exercises
 - distance‑based metrics

**Profile Preferences**  
- Email type and phone type map to metadata  
- Used by Profile module

**System Preferences**  
- Theme, language, timezone are future‑safe
- UI may not expose them yet
- API supports them for portfolio completeness

**Update Behavior**  
- PUT request overwrites only provided values
- Unspecified preferences remain unchanged

## 6. Error Model
| HTTP Code | Error Code | Message | Description |
| --- | --- | --- | --- |
| 400 | ``INVALID_REQUEST`` | Missing or invalid fields | Validation failure |
| 401 | ``UNAUTHORIZED`` | Invalid or missing token | Auth required |
| 404 | ``PREFERENCE_TYPE_NOT_FOUND`` | Invalid preference type | Metadata mismatch |
| 500 | ``SERVER_ERROR`` | Internal error | Unexpected failure |

## 7. Example Responses
**Get Preferences Example**  
json  
{  
  "preferences": {  
    "units": {  
      "weight_unit_type_id": 1,  
      "distance_unit_type_id": 3  
    },  
    "profile": {  
      "email_type_id": 1,  
      "phone_type_id": 1  
    },  
    "system": {  
      "theme": "light",  
      "language": "en-US",  
      "timezone": "America/Denver"  
    }  
  }  
}  
**Update Preferences Example**  
json  
{  
  "success": true,  
  "updated_count": 3  
}  
## 8. Notes / Edge Cases
- Preferences are loaded on login and cached client‑side
- Changing units triggers recalculation of displayed values
- Preferences do not affect historical data storage
- Preferences are per‑user, not global