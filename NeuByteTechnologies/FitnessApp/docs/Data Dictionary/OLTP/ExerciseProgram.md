# DATA DICTIONARY — MODULE 3: EXERCISE PROGRAM (ACCURATE TO YOUR SCHEMA)
This module documents the entities that define structured workout programs, the exercises included in them, and the metadata required to prescribe sets, reps, intervals, and superset logic.

## Table: workout_type
**Description:**
Defines the type/category of an exercise or workout structure (e.g., strength, interval, EMOM, AMRAP).

|Column	| Type | Null | Description |
|-------|------|------|-------------|
| workout_type_id | TINYINT (IDENTITY) |NO | Primary key.|
| workout_type_description | VARCHAR(50) | NO |Describes the workout type. |

**Business Rules:**

Used by exercise to determine how the exercise is structured (sets, intervals, distance, etc.).

## Table: exercise
**Description:**
Master list of exercises available in the system. Each exercise is associated with a workout type that determines how it is performed/logged.

|Column | Type | Null | Description |
|-------|------|------|-------------|
|exercise_id | INT (IDENTITY) | NO | Primary key.|
|exercise_name | VARCHAR(50) | NO | Name of the exercise.|
|exersise_description | VARCHAR(1000) | NO | Description or instructions.|
|workout_type_id | TINYINT	NO | FK → workout_type. Determines exercise structure.|

**Foreign Keys:**
 - workout_type_id → workout_type.workout_type_id
 - Business Rules:
 - Exercise names should be unique.
 - Workout type determines which target fields are relevant in program items.

## Table: exercise_program
**Description:**
Defines a structured workout program consisting of multiple weeks and days.

|Column | Type | Null | Description |
|-------|------|------|-------------|
|exercise_program_id | INT (IDENTITY) | NO | Primary key.|
|exercise_program_name | VARCHAR(50) | NO |	Program name.|
|weeks_in_program | TINYINT | NO |Total number of weeks.|
|workout_days |TINYINT	NO | Number of workout days per week.|
|rest_day_interval | TINYINT	NO | Frequency of rest days.|


**Business Rules:**
- Programs must define weekly structure.
- Rest day interval determines how often rest days appear.

## Table: exercise_program_item
**Description:**
Represents a single programmed exercise or rest day within a program.
This table is the heart of your programming model, supporting:

- Sets
- Reps
- Weight
- Distance
- Duration
- Intervals
 - Supersets
- Rest days

|Column | Type | Null | Description |
|-------|------|------|-------------|
|exercise_program_item_id | INT (IDENTITY) | NO | Primary key.|
|exercise_program_id | INT | NO | FK → exercise_program.|
|program_week | TINYINT | NO | Week number within the program.|
|program_day | TINYINT | NO | Day number within the week.|
|rest_day_flag | BIT | NO | 1 = rest day, 0 = workout day.|
|superset_group_id | TINYINT | YES | Group identifier for supersets.|
|superset_order | TINYINT | YES | Order of exercises within a superset.|
|superset_rounds | TINYINT | YES | Number of rounds for the superset.|
|superset_rest_duration | TIME | YES | Rest between superset rounds.|
|target_sets | TINYINT | YES | Prescribed sets.|
|target_reps | INT | YES | Prescribed reps.|
|target_weight | INT | YES | Prescribed weight.|
|target_distance_value | DECIMAL(10,2) | YES | Prescribed distance.|
|target_distance_unit | TINYINT | YES | Unit of distance.|
|target_duration | TIME | YES | Prescribed duration.|
|interval_work_duration | TIME | YES | Work interval duration.|
|interval_rest_duration | TIME | YES | Rest interval duration.|
|interval_rounds | TINYINT | YES | Number of interval rounds.|
|target_machine_calories | INT | YES | Prescribed calories (machine‑based).|
|exercise_id | INT | YES | FK → exercise. Null when rest_day_flag = 1.|
|exercise_order | TINYINT | YES | Order of exercises within the day.|


**Foreign Keys:**
- exercise_program_id → exercise_program.exercise_program_id
- exercise_id → exercise.exercise_id

**Business Rules:**
- If rest_day_flag = 1, exercise_id must be NULL.
- Superset fields apply only when superset_group_id is not NULL.
- Interval fields apply only when workout_type indicates interval‑based exercise.
- Distance, duration, sets, reps, and weight fields are optional depending on exercise type.
- exercise_order determines the sequence of exercises for the day.