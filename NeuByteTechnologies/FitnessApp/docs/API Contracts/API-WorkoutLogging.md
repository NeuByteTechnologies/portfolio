# API Contract — Workout Logging
## 1. Endpoint Summary
| Endpoint | Method | Purpose | Authentication | Notes |
| --- | --- | --- | --- | --- |
| ``/workout/start`` | POST | Start a workout session | Required | Creates workout_log |
| ``/workout/{workout_log_id}`` | GET | Get workout log detail | Required | Used for resume + UI load |
| ``/workout/{workout_log_id}/set`` | POST | Add a logged set | Required | Strength or cardio |
| ``/workout/set/{set_id}`` | PUT | Edit a logged set | Required | UC‑LW‑07 |
| ``/workout/set/{set_id}`` | DELETE | Delete a logged set | Required | UC‑LW‑08 |
| ``/workout/{workout_log_id}/complete`` | POST | Complete workout | Required | Sets status = Completed |
| ``/workout/{workout_log_id}/abandon`` | POST | Abandon workout | Required | Sets status = Abandoned |
| ``/workout/active`` | GET | Get active (in‑progress) workout | Required | Used by Dashboard |

## 2. Request & Response Schemas
### 2.1 Start Workout (POST /workout/start)
**Request**  
json  
{  
  "program_day_id": "string",  
  "workout_id": "string"  
}  
**Response**  
json  
{  
  "success": true,  
  "workout_log_id": "string",  
  "status": "Started",  
  "start_time": "2026-05-18T14:32:00Z"  
}  
### 2.2 Get Workout Log Detail (GET /workout/{workout_log_id})
**Response**
json  
{  
  "workout_log_id": "string",  
  "workout_id": "string",  
  "program_day_id": "string",  
  "status": "Started",  
  "start_time": "2026-05-18T14:32:00Z",  
  "end_time": null,  
  "exercises": [  
    {  
      "exercise_id": "string",  
      "name": "Bench Press",  
      "type": "Strength",  
      "sets": [  
        {  
          "set_id": "string",  
          "set_number": 1,  
          "weight": 135,  
          "reps": 8,  
          "duration_seconds": null  
        }  
      ]  
    }  
  ]  
}  
### 2.3 Add Logged Set (POST /workout/{workout_log_id}/set)
**Request**  
json  
{  
  "exercise_id": "string",  
  "set_number": 1,  
  "weight": 135,  
  "reps": 8,  
  "duration_seconds": null  
}  
**Response**  
json  
{  
  "success": true,  
  "set_id": "string"  
}  
### 2.4 Edit Logged Set (PUT /workout/set/{set_id})
**Request**  
json  
{  
  "weight": 140,  
  "reps": 8,  
  "duration_seconds": null  
}  
**Response**  
json  
{  
  "success": true,  
  "set_id": "string"  
}  
### 2.5 Delete Logged Set (DELETE /workout/set/{set_id})
**Response**  
json  
{  
  "success": true,  
  "set_id": "string"  
}  
### 2.6 Complete Workout (POST /workout/{workout_log_id}/complete)
**Request**  
json  
{  
  "end_time": "2026-05-18T15:12:00Z"  
}  
**Response**  
json  
{  
  "success": true,  
  "workout_log_id": "string",  
  "status": "Completed"  
}  
### 2.7 Abandon Workout (POST /workout/{workout_log_id}/abandon)
**Response**  
json  
{  
  "success": true,  
  "workout_log_id": "string",  
  "status": "Abandoned"  
}  
### 2.8 Get Active Workout (GET /workout/active)
**Response**  
json  
{  
  "workout_log_id": "string",  
  "workout_id": "string",  
  "program_day_id": "string",  
  "status": "Started",  
  "start_time": "2026-05-18T14:32:00Z"  
}  
**If no active workout:**  
json  
{  
  "workout_log_id": null  
}  
## 3. Validation Rules
**Start Workout**  
- User must not have an active workout  
- program_day_id must match the user’s active program
- workout_id must exist

**Add/Edit/Delete Set**  
- Set must belong to the workout_log
- Workout must be in Started status
- Strength sets require:
 - weight
 - reps
- Cardio sets require:
 - duration_seconds

**Complete Workout**  
- Workout must be in Started status  
- Must have at least one logged set (optional BR)

**Abandon Workout**  
- Workout must be in Started status

**Get Active Workout**  
- Return the most recent workout with status = Started

## 4. Business Rules
**Workout Status**  
Uses metadata:  
- Started
- Completed
- Abandoned
- Draft (auto‑save)

**Auto‑Save**  
- Every set creation/edit updates updated_at
- If user closes app:
- workout remains in Started
- UI resumes via /workout/active

**Completion**  
- Sets end_time
- Sets status = Completed
- Triggers:
 - Notification: “Workout Completed”
 - Dashboard refresh

**Abandon**  
- Sets status = Abandoned
- Does not trigger notifications

**Editing Sets**  
- Allowed only while workout is in progress
- Editing a completed workout is not allowed

**Deleting Sets**  
- If last set of an exercise is deleted → exercise remains but empty  

## 5. Error Model
| HTTP Code | Error Code | Message | Description |
| --- | --- | --- | --- |
| 400 | ``INVALID_REQUEST`` | Missing or invalid fields | Validation failure |
| 401 | ``UNAUTHORIZED`` | Invalid or missing token | Auth required |
| 404 | ``WORKOUT_NOT_FOUND`` | Workout not found | Invalid ID |
| 404 | ``SET_NOT_FOUND`` | Set not found | Invalid ID |
| 409 | ``WORKOUT_ALREADY_ACTIVE`` | User already has active workout | Start blocked |
| 409 | ``WORKOUT_NOT_ACTIVE`` | Workout not in Started status | Edit/complete blocked |
| 403 | ``FORBIDDEN`` | Workout or set does not belong to user | Ownership violation |
| 500 | ``SERVER_ERROR`` | Internal error | Unexpected failure |

## 6. Example Responses
**Start Workout Example**  
json  
{  
  "success": true,  
  "workout_log_id": "WL123",  
  "status": "Started",  
  "start_time": "2026-05-18T14:32:00Z"  
}  
**Complete Workout Example**  
json  
{  
  "success": true,  
  "workout_log_id": "WL123",  
  "status": "Completed"  
}  
## 7. Notes / Edge Cases
- If user starts a workout and logs no sets → completing is allowed or disallowed based on BR (your BR allows it)
- If user switches programs mid‑workout → workout remains tied to original program_day_id
- Auto‑save does not create a separate status — it just updates timestamps
- Workout logs are immutable after completion