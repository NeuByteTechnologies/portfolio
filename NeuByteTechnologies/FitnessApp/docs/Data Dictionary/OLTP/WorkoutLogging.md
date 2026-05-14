# DATA DICTIONARY — MODULE 2: WORKOUT LOGGING
This module defines all entities related to recording, editing, and retrieving workout execution data, including sets, intervals, notes, and historical logs.

It represents the core transactional engine of the FitnessApp.

## Table: workout_log
**Description:**
Represents a single workout session performed by a user on a specific date. This is the parent entity for all logged sets and intervals.

| Column | Type | Null | Description |
| --- | --- | --- | --- |
| workout_log_id | INT | NO | Primary key. |
| user_id | INT | NO | FK → user. Owner of the workout. |
| workout_date | DATE | NO | The date the workout was performed. |
| program_id | INT | YES | FK → exercise_program. Optional link if workout came from a program. |
| notes | VARCHAR(500) | YES | User-entered notes for the workout. |
| created_at | DATETIME | NO | Timestamp when the log was created. |
| updated_at | DATETIME | YES | Timestamp when the log was last modified. |


**Foreign Keys:**
- user_id → user.user_id
- program_id → exercise_program.program_id

**Business Rules:**
- A user may have multiple workouts per day.
- Notes are optional.
- If the workout is free-form (not from a program), program_id is NULL.

## Table: workout_log_exercise
**Description:** 
Represents a specific exercise performed within a workout session. Parent to sets and intervals.

| Column | Type | Null | Description |
| --- | --- | --- | --- |
| workout_log_exercise_id | INT | NO | Primary key. |
| workout_log_id | INT | NO | FK → workout_log. |
| exercise_id | INT | NO | FK → exercise. |
| sequence_order | SMALLINT | NO | Order of the exercise within the workout. |
| notes | VARCHAR(500) | YES | Optional notes for this exercise. |


**Foreign Keys:**
- workout_log_id → workout_log.workout_log_id
- exercise_id → exercise.exercise_id

**Business Rules:**
- Exercises must be ordered sequentially.
- Notes apply only to this exercise, not the entire workout.

## Table: workout_log_set
**Description:**
Represents a single set performed for an exercise, including reps, weight, and optional time-based metrics.

| Column | Type | Null | Description |
| --- | --- | --- | --- |
| workout_log_set_id | INT | NO | Primary key. |
| workout_log_exercise_id | INT | NO | FK → workout_log_exercise. |
| set_number | SMALLINT | NO | Sequential set number. |
| reps | SMALLINT | YES | Number of repetitions performed. |
| weight | DECIMAL(6,2) | YES | Weight used for the set. |
| unit_type_id | TINYINT | YES | FK → unit_type. Weight unit. |
| duration_seconds | INT | YES | Duration of the set (if time-based). |

**Foreign Keys:**
- workout_log_exercise_id → workout_log_exercise.workout_log_exercise_id
- unit_type_id → unit_type.unit_type_id

**Business Rules:**
- Either reps/weight OR duration may be used depending on exercise type.
- RPE is optional.
- Weight must use a valid unit type.

## Table: workout_log_interval
**Description:**  
Represents interval-based exercises (e.g., running, rowing, cycling) with distance, time, and pace metrics.

| Column | Type | Null | Description |
| --- | --- | --- | --- |
| workout_log_interval_id | INT | NO | Primary key. |
| workout_log_exercise_id | INT | NO | FK → workout_log_exercise. |
| interval_number | SMALLINT | NO | Sequential interval number. |
| distance | DECIMAL(6,2) | YES | Distance covered. |
| distance_unit_type_id | TINYINT | YES | FK → unit_type. |
| duration_seconds | INT | YES | Time taken for the interval. |
| avg_heart_rate | SMALLINT | YES | Average HR for the interval. |

**Foreign Keys:**
- workout_log_exercise_id → workout_log_exercise.workout_log_exercise_id
- distance_unit_type_id → unit_type.unit_type_id

**Business Rules:**
- Distance and duration must be positive if provided.
- Intervals must be sequential.

## Table: workout_log_superset
**Description:**
Represents a grouping of exercises performed as a superset or circuit.

| Column | Type | Null | Description |
| --- | --- | --- | --- |
| workout_log_superset_id | INT | NO | Primary key. |
| workout_log_id | INT | NO | FK → workout_log. |
| name | VARCHAR(100) | YES | Optional name (e.g., “Circuit A”). |
| sequence_order | SMALLINT | NO | Order of the superset within the workout. |

**Foreign Keys:**
- workout_log_id → workout_log.workout_log_id

## Table: workout_log_superset_item
**Description:**
Links exercises to a superset in a specific order.

| Column | Type | Null | Description |
| --- | --- | --- | --- |
| workout_log_superset_item_id | INT | NO | Primary key. |
| workout_log_superset_id | INT | NO | FK → workout_log_superset. |
| workout_log_exercise_id | INT | NO | FK → workout_log_exercise. |
| sequence_order | SMALLINT | NO | Order of the exercise within the superset. |

**Foreign Keys:**
- workout_log_superset_id → workout_log_superset.workout_log_superset_id
- workout_log_exercise_id → workout_log_exercise.workout_log_exercise_id

## Table: user_weight
**Description:**
Stores historical bodyweight entries for the user.

| Column | Type | Null | Description |
| --- | --- | --- | --- |
| workout_type_id | TINYINT | NO | Primary key. |
| name | VARCHAR(50) | NO | Workout type name. |
| description | VARCHAR(255) | YES | Optional description. |

**Business Rules:**
- Weight must be positive.
- Unit type must be valid.

## Table: workout_type
**Description:**
Defines categories of workouts (e.g., Strength, Cardio, HIIT).

| Column | Type | Null | Description |
| --- | --- | --- | --- |
| workout_type_id | TINYINT | NO | Primary key. |
| name | VARCHAR(50) | NO | Workout type name. |
| description | VARCHAR(255) | YES | Optional description. |