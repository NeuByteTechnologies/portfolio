#API Contract — Metadata (Updated with workout_statuses)
##1. Endpoint Summary
| Endpoint | Method | Purpose | Authentication | Notes |
| --- | --- | --- | --- | --- |
| ``/metadata`` | GET | Returns all metadata/type tables in one payload | None | Used by onboarding + settings |
| ``/metadata/{type}`` | GET | Returns a single metadata type list | None | Optional convenience endpoint |

## 2. Metadata Types Included (Alphabetical)
Your OLTP schema includes the following type tables:  
- email_types
- event_types
- help_categories
- notification_types
- phone_types
- unit_types
- user_types
- workout_statuses
- workout_types
- This is now the authoritative list.

## 3. Response Schemas
### 3.1 Get All Metadata (GET /metadata)
*Response*
json  
{  
  "email_types": [  
    { "email_type_id": 1, "name": "Personal" },  
    { "email_type_id": 2, "name": "Work" }  
  ],  
  "event_types": [  
    { "event_type_id": 1, "name": "User Created" },  
    { "event_type_id": 2, "name": "Workout Completed" }  
  ],  
  "help_categories": [  
    { "help_category_type_id": 1, "name": "Account" },  
    { "help_category_type_id": 2, "name": "Programs" }  
  ],  
  "notification_types": [  
    { "notification_type_id": 1, "name": "Reminder" },  
    { "notification_type_id": 2, "name": "Achievement" }  
  ],  
  "phone_types": [  
    { "phone_type_id": 1, "name": "Mobile" },  
    { "phone_type_id": 2, "name": "Home" }  
  ],  
  "unit_types": [  
    { "unit_type_id": 1, "name": "Pounds", "abbreviation": "lb", "category": "weight" },  
    { "unit_type_id": 2, "name": "Kilograms", "abbreviation": "kg", "category": "weight" },  
    { "unit_type_id": 3, "name": "Miles", "abbreviation": "mi", "category": "distance" },  
    { "unit_type_id": 4, "name": "Kilometers", "abbreviation": "km", "category": "distance" }  
  ],  
  "user_types": [  
    { "user_type_id": 1, "name": "Standard User" },  
    { "user_type_id": 2, "name": "Admin" }  
  ],  
  "workout_statuses": [  
    { "workout_status_id": 1, "name": "Started" },  
    { "workout_status_id": 2, "name": "Completed" },  
    { "workout_status_id": 3, "name": "Abandoned" },  
    { "workout_status_id": 4, "name": "Draft" }  
  ],  
  "workout_types": [  
    { "workout_type_id": 1, "name": "Strength" },  
    { "workout_type_id": 2, "name": "Cardio" }  
  ]  
}  
### 3.2 Get Single Metadata Type (GET /metadata/{type})
Example: GET /metadata/workout_statuses  
json  
{  
  "workout_statuses": [  
    { "workout_status_id": 1, "name": "Started" },  
    { "workout_status_id": 2, "name": "Completed" },  
    { "workout_status_id": 3, "name": "Abandoned" },  
    { "workout_status_id": 4, "name": "Draft" }  
  ]  
}  
## 4. Validation Rules
**All Metadata**  
- No authentication required
- Only return active metadata entries
- {type} must match a valid metadata group

**Single Metadata Type**
- If {type} is invalid → return INVALID_TYPE
- Response key must match the type name

## 5. Business Rules
**Metadata is static**
- Rarely changes
- Cached by the client (optional)
- Used across:
 - Onboarding
 - Profile
 - Preferences
 - Notifications
 - Help categories
 - Workout logging
 - Dashboard logic

'workout_statuses'
- Used by:
 - Workout Logging
 - Dashboard
 - Workout History
 - Sync logic
 - Detecting abandoned workouts
 - Resuming workouts

**Single endpoint vs multiple**
- /metadata returns everything (preferred)
- /metadata/{type} is optional convenience

## 6. Error Model
| HTTP Code | Error Code | Message | Description |
| --- | --- | --- | --- |
| 400 | ``INVALID_TYPE`` | Unknown metadata type | Invalid ``{type}`` parameter |
| 500 | ``SERVER_ERROR`` | Internal error | Unexpected failure |

## 7. Example Requests
**Get All Metadata**
- GET /metadata

** Get Only Workout Statuses**
- GET /metadata/workout_statuses

## 8. Notes / Edge Cases
- Metadata is read‑only
- No pagination
- No filtering
- No authentication
- Returned alphabetically
- Client may cache for 24 hours