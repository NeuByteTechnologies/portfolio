# API Contract — Exercise Program
## 1. Endpoint Summary
| Endpoint | Method | Purpose | Authentication | Notes |
| --- | --- | --- | --- | --- |
| ``/programs`` | GET | Get list of available exercise programs | Required | Used on Program List screen |
| ``/programs/{program_id}`` | GET | Get high‑level program detail | Required | Does *not* include workout steps |
| ``/programs/{program_id}/start`` | POST | Start a program for the user | Required | Creates user_program record |
| ``/programs/{program_id}/complete`` | POST | Mark program as completed | Required | Used when final workout is done |
| ``/programs/active`` | GET | Get user’s active program | Required | Used by Dashboard |

## 2. Request & Response Schemas
### 2.1 Get Program List (GET /programs)
*Response*  
json  
{  
  "programs": [  
    {  
      "program_id": "string",  
      "name": "string",  
      "description": "string",  
      "duration_weeks": 8,  
      "workout_days_per_week": 4,  
      "image_url": "string"  
    }  
  ]  
}  
### 2.2 Get Program Detail (GET /programs/{program_id})  
This is high‑level detail only — the next API (Program Detail) will handle the day‑by‑day and workout‑by‑workout breakdown.  

*Response*
json  
{  
  "program_id": "string",  
  "name": "string",  
  "description": "string",  
  "duration_weeks": 8,  
  "workout_days_per_week": 4,  
  "goals": ["Strength", "Endurance"],  
  "equipment_required": ["Dumbbells", "Bench"],  
  "image_url": "string"  
}  
### 2.3 Start Program (POST /programs/{program_id}/start)
*Request*  
json  
{  
  "session_token": "string"  
}  
*Response*  
json  
{  
  "uccess": true,  
  "program_id": "string",  
  "start_date": "2026-05-18"  
}  
### 2.4 Complete Program (POST /programs/{program_id}/complete)  
*Request*  
json  
{  
  "session_token": "string"  
}  
*Response*  
json  
{  
  "success": true,  
  "program_id": "string",  
  "completed_date": "2026-07-12"  
}  
2.5 Get Active Program (GET /programs/active)  
*Response*  
json  
{  
  "program_id": "string",  
  "name": "string",  
  "current_week": 3,  
  "current_day": 2,  
  "progress_percent": 42  
}  
## 3. Validation Rules
**Program List**
- User must be authenticated
- Only return programs marked as active/published

**Program Detail**
- Program must exist
- Program must be active

**Start Program**
- User must not already have an active program
- Program must exist
- Create user_program record
- Set start date = today
- Reset any previous incomplete program (optional rule)

**Complete Program**
- User must have an active program
- Program must match the active program
- Mark user_program as completed
- Log event: Program Completed

**Active Program**
- If no active program → return { "program_id": null }

## 4. Business Rules
**Program List**  
- Sorted by recommended order or name
- Includes image for UI card display

**Program Detail**  
- Does not include workouts
- Used for the Program Overview screen

**Start Program**  
- Logs event: *Program Started* 
- Dashboard uses this to show:
 - current week
 - current day
 - next workout

**Complete Program**  
- Logs event: *Program Completed*
- Triggers:
 - Notification
 - Dashboard refresh
 - Achievement (future enhancement)

**Active Program**  
- Used by:
 - Dashboard
 - Program Detail
 - Workout Logging

## 5. Error Model
| HTTP Code | Error Code | Message | Description |
| --- | --- | --- | --- |
| 400 | ``INVALID_REQUEST`` | Missing or invalid fields | Validation failure |
| 401 | ``UNAUTHORIZED`` | Invalid or missing token | Auth required |
| 404 | ``PROGRAM_NOT_FOUND`` | Program not found | Invalid ID |
| 409 | ``PROGRAM_ALREADY_ACTIVE`` | User already has active program | Start blocked |
| 409 | ``NO_ACTIVE_PROGRAM`` | No active program | Complete blocked |
| 500 | ``SERVER_ERROR`` | Internal error | Unexpected failure |

## 6. Example Responses
**Program List Example**  
json  
{  
  "programs": [  
    {  
      "program_id": "P001",  
      "name": "8‑Week Strength",  
      "description": "A progressive strength program.",  
      "duration_weeks": 8,  
      "workout_days_per_week": 4,  
      "image_url": "/img/programs/strength8.png"  
    }  
  ]  
}  
**Start Program Example**  
json  
{  
  "success": true,  
  "program_id": "P001",  
  "start_date": "2026-05-18"  
}  

## 7. Notes / Edge Cases
- A user can have only one active program
- Starting a new program may:
 - archive the previous one
 - or require explicit completion (your BR allows either)
- Program detail is intentionally high‑level
- Program Detail API (next) will handle:
 - weeks
 - days
 - workouts
 - exercises