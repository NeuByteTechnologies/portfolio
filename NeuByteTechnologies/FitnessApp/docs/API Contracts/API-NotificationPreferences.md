# API Contract — Notification Preferences
## 1. Endpoint Summary

| Endpoint | Method | Purpose | Authentication | Notes |
| --- | --- | --- | --- | --- |
| ``/notification_preferences`` | GET | Get user’s notification preferences | Required | Used by Notification Preferences screen |
| ``/notification_preferences`` | PUT | Update user’s notification preferences | Required | Toggle‑only design |
| ``/notification_preferences/defaults`` | GET | Get system default notification preferences | None | Used during onboarding |

## 2. Request & Response Schemas
### 2.1 Get User Notification Preferences (GET /notification_preferences)
**Response**  
json  
{  
  "preferences": [  
    {  
      "notification_type_id": 1,  
      "notification_type_name": "Reminder",  
      "enabled": true  
    },  
    {  
      "notification_type_id": 2,  
      "notification_type_name": "Achievement",  
      "enabled": false  
    }  
  ]  
}  
### 2.2 Update Notification Preferences (PUT /notification_preferences)
**Request**
json  
{  
  "preferences": [  
    {  
      "notification_type_id": 1,  
      "enabled": true  
    },  
    {  
      "notification_type_id": 2,  
      "enabled": false  
    }  
  ]  
}  
**Response**
json  
{  
  "success": true,  
  "updated_count": 2  
}  
### 2.3 Get Default Notification Preferences (GET /notification_preferences/defaults)
**Response**  
json  
{  
  "defaults": [  
    {  
      "notification_type_id": 1,  
      "enabled": true  
    },  
    {  
      "notification_type_id": 2,  
      "enabled": true  
    }  
  ]  
}  
## 3. Validation Rules
**Get Preferences**
- User must be authenticated
- Return all notification types (static list)
- If user has no saved preferences → return defaults

**Update Preferences**
- User must be authenticated
- Each notification_type_id must exist in notification_type
- enabled must be boolean
- Missing types should not be deleted — only updated

**Defaults**
- No authentication required
- Defaults come from:
 - system config
 - or hardcoded values

## 4. Business Rules
**Static Notification Categories**  
Matches your decision from May 4:  
- Notification categories are static, not dynamic
- They map directly to notification_type metadata
- No description column
- No dynamic category creation

**Default Behavior**  
- New users receive default preferences  
- Defaults are:
- In‑app notifications enabled
- Email notifications disabled (future enhancement)

**Update Behavior**
- Updating preferences overwrites the user’s user_notification_preference table
- Only toggles are supported
- No time‑of‑day scheduling
- No per‑channel preferences (future enhancement)

**UI Behavior**
- Each row is:
 - Notification Type Name
 - Toggle (on/off)
- Save button commits changes
- Cancel button returns to previous screen

## 5. Error Model
| HTTP Code | Error Code | Message | Description |
| --- | --- | --- | --- |
| 400 | ``INVALID_REQUEST`` | Missing or invalid fields | Validation failure |
| 401 | ``UNAUTHORIZED`` | Invalid or missing token | Auth required |
| 404 | ``NOTIFICATION_TYPE_NOT_FOUND`` | Invalid type ID | Metadata mismatch |
| 500 | ``SERVER_ERROR`` | Internal error | Unexpected failure |

## 6. Example Requests & Responses
**Get Preferences Example**  
json  
{  
  "preferences": [  
    {  
      "notification_type_id": 1,  
      "notification_type_name": "Reminder",  
      "enabled": true  
    },  
    {  
      "notification_type_id": 2,  
      "notification_type_name": "Achievement",  
      "enabled": false  
    }  
  ]  
}  
**Update Preferences Example**  
*Request*  

json  
{  
  "preferences": [  
    { "notification_type_id": 1, "enabled": false },  
    { "notification_type_id": 2, "enabled": true }  
  ]  
}  
*Response*

json  
{  
  "success": true,  
  "updated_count": 2  
}  
## 7. Notes / Edge Cases
- If a new notification type is added later → user inherits default for that type  
- Preferences are stored per user in user_notification_preference
- Notification Center uses these preferences to filter which notifications are created
- Preferences do not affect historical notifications
- Preferences do not affect unread count logic