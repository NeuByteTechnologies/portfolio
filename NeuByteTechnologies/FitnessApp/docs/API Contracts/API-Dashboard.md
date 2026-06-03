# API Contract — Dashboard
## 1. Endpoint Summary
Endpoint	Method	Purpose	Authentication	Notes
/dashboard	GET	Returns full dashboard summary	Required	Composite response containing all dashboard sections


## 2. Response Schema
The Dashboard returns a single JSON object containing all sections needed for the UI.  
  
json  
{  
  "user_info": {  
    "first_name": "string",  
    "last_name": "string",  
    "email": "string",  
    "last_login": "2026-05-18T06:30:00Z"  
  },  
  "weight_summary": {  
    "current_weight": 185.2,  
    "unit": "lb",  
    "trend": "decrease",  
    "last_logged": "2026-05-17"  
  },  
  "program_summary": {  
    "program_id": "string",  
    "program_name": "string",  
    "current_week": 3,  
    "current_day": 2,  
    "next_workout": {  
      "workout_id": "string",  
      "name": "Upper Body Strength",  
      "estimated_duration": 42  
    }  
  },  
  "today_workout_summary": {  
    "workout_id": "string",  
    "exercise_count": 8,  
    "estimated_duration": 42  
  },  
  "recent_activity": [  
    {  
      "date": "2026-05-16",  
      "workout_name": "Lower Body Strength",  
      "completed": true  
    }  
  ],  
  "progress_cards": {  
    "weekly": {  
      "workouts_completed": 3,  
      "workouts_planned": 4  
    },  
    "monthly": {  
      "workouts_completed": 12,  
      "workouts_planned": 16  
    },  
    "streak": {  
      "days": 5  
    }  
  },  
  "notifications": [  
    {  
      "notification_id": "string",  
      "type": "Reminder",  
      "message": "Don't forget today's workout!",  
      "created_at": "2026-05-18T07:00:00Z",  
      "read": false  
    }  
  ]  
}  
## 3. Section‑by‑Section Breakdown
### 3.1 User Info
Matches BR‑DASH‑02 and BR‑DASH‑03.  
- Name
- Email
- Last login timestamp

### 3.2 Weight Summary
Matches BR‑DASH‑06 and BR‑DASH‑07.  
- Most recent weight
- Unit (lb/kg)
- Trend (increase/decrease/no change)
- Last logged date
- Trend is calculated from the last two entries.

### 3.3 Program Summary
Matches BR‑DASH‑04 and BR‑DASH‑05.  
- Current program
- Current week/day
- Next workout (derived from program + workout log)

### 3.4 Today’s Workout Summary
Matches BR‑DASH‑08.  
- Workout ID
- Exercise count
- Estimated duration

###  3.5 Recent Activity
Matches BR‑DASH‑10 and BR‑DASH‑11.  
- Last 3–5 workouts
- Date
- Completion status

### 3.6 Progress Summary Cards
Matches BR‑DASH‑12. - 
- Weekly progress
- Monthly progress
- Streak metrics

### 3.7 Notifications  
Matches BR‑DASH‑13.  
- Latest unread notifications
- Type
- Message
- Timestamp
- Read/unread

## 4. Validation Rules
- Session token required
- User must exist and be active
- Program summary only returned if user has an active program
- Weight summary only returned if user has logged weight
- Recent activity limited to 3–5 items
- Notifications limited to 10 most recent

## 5. Business Rules
**Composite Endpoint**  
The Dashboard endpoint aggregates data from:  

- User
- Weight tracking
- Program + workout log
- Notifications
- Reports subsystem

**Data Refresh**  
Matches BR‑DASH‑15.  
- Dashboard recalculates data on each request
- Cached values may be used for performance (future enhancement)

**Program Logic**  
- “Next workout” is derived from:
 - Program definition
 - Completed workouts
 - Current date

**Weight Trend**
- Trend is based on last two weight entries
- If only one entry exists → trend = "no_change"

## 6. Error Model
| HTTP Code | Error Code | Message | Description |
| --- | --- | --- | --- |
| 401 | ``UNAUTHORIZED`` | Invalid or missing token | Auth required |
| 404 | ``USER_NOT_FOUND`` | User not found | Invalid session |
| 500 | ``SERVER_ERROR`` | Internal error | Unexpected failure |


## 7. Example Response
json
{  
  "user_info": {  
    "name": "Gordon",  
    "email": "gordon@example.com",  
    "last_login": "2026-05-18T06:30:00Z"  
  },  
  "weight_summary": {  
    "current_weight": 185.2,  
    "unit": "lb",  
    "trend": "decrease",  
    "last_logged": "2026-05-17"  
  },  
  "program_summary": {  
    "program_id": "P001",  
    "program_name": "8‑Week Strength",  
    "current_week": 3,  
    "current_day": 2,  
    "next_workout": {  
      "workout_id": "W045",  
      "name": "Upper Body Strength",  
      "estimated_duration": 42  
    }  
  },  
  "today_workout_summary": {  
    "workout_id": "W045",  
    "exercise_count": 8,  
    "estimated_duration": 42  
  },  
  "recent_activity": [  
    {  
      "date": "2026-05-16",  
      "workout_name": "Lower Body Strength",  
      "completed": true  
    }  
  ],  
  "progress_cards": {  
    "weekly": {  
      "workouts_completed": 3,  
      "workouts_planned": 4  
    },  
    "monthly": {  
      "workouts_completed": 12,  
      "workouts_planned": 16  
    },  
    "streak": {  
      "days": 5  
    }  
  },  
  "notifications": [  
    {  
      "notification_id": "N123",  
      "type": "Reminder",  
      "message": "Don't forget today's workout!",  
      "created_at": "2026-05-18T07:00:00Z",  
      "read": false  
    }  
  ]  
}  