# DATA DICTIONARY — MODULE 7: REFERENCE TABLES
Reference tables provide controlled vocabularies used throughout the FitnessApp OLTP model. They ensure consistency, enforce domain rules, and support filtering, categorization, and user preferences.

These tables are system‑defined and rarely change.

## Table: user_type
**Description:**  
Defines the classification of users within the system (e.g., standard user, admin).

| Column | Type | Null | Description |
|--------|------|------|-------------|
| user_type_id | TINYINT | NO | Primary key. |
| user_type_description	| VARCHAR(50)	| NO | Description of the user type. |


**Business Rules::**

User types are system‑defined.

Used by user to determine access level or role.

Table: workout_type
**Description:**  
Defines the type or structure of an exercise (e.g., strength, interval, cardio).
Determines which target fields are relevant in exercise_program_item.

| Column | Type | Null | Description|
|--------|------|------|-------------|
| workout_type_id | TINYINT (IDENTITY) | NO | Primary key. |
workout_type_description | VARCHAR(50) | NO | Description of the workout type. |


**Business Rules::**

Exercises reference workout types to determine their structure.

System‑defined and rarely modified.

Table: unit_type
**Description:**  
Defines measurement units used throughout the system (weight, distance, time, etc.).
Includes conversion factors for normalization.

| Column | Type | Null | Description|
|--------|------|------|-------------|
| unit_type_id | TINYINT (IDENTITY)	| NO | Primary key. |
| unit_category | VARCHAR(20) | NO | Category (e.g., “Weight”, “Distance”). |
| unit_name	VARCHAR(50) | NO | Full unit name (e.g., “Pounds”). |
| unit_abbreviation	| VARCHAR(10) | NO | Abbreviation (e.g., “lb”). |
| conversion_factor	| DECIMAL(18,8) | NO | Conversion factor to base unit. |


**Business Rules::**

Conversion factor normalizes values across units.

Unit categories group related units (e.g., lb/kg, mi/km).

Table: preference
**Description:**  
Defines system‑level preference types.
Each preference may have a default value and/or a default unit type.

| Column | Type | Null | Description|
|--------|------|------|-------------|
| preference_id | TINYINT | NO | Primary key. |
preference_name | VARCHAR(50)	| NO | Name of the preference. |
default_unit_type_id | TINYINT	| YES | FK → unit_type. Default unit for this preference. |
default_value | VARCHAR(50)	| YES | Default value if no unit is required. |


**Foreign Keys:**

default_unit_type_id → unit_type.unit_type_id

**Business Rules::**

Preferences define the structure for user‑level overrides.

A preference may use either a default value or a default unit type.

Table: notification_type
**Description:**  
Defines the categories of notifications the system can send.

| Column | Type | Null | Description |
|--------|------|------|-------------|
|notification_type_id | TINYINT | NO | Primary key. |
|notification_type_description | VARCHAR(50) | NO | Description of the notification type. |
|default_delivery_type_id | TINYINT	| NO | FK → notification_delivery_type. Default delivery channel. |


**Business Rules::**

Each notification type must have a default delivery method.

Used by notification_event and user_notification_preference.

Table: notification_delivery_type
**Description:**  
Defines the available delivery channels for notifications.

Examples:

In‑App

Email

SMS

| Column | Type | Null | Description |
|--------|------|------|-------------|
|notification_delivery_type_id |TINYINT (IDENTITY) | NO | Primary key.|
|delivery_type_description | VARCHAR(50) | NO | Delivery channel name.|


**Business Rules::**

Delivery types are system‑defined.

Used by both notification_type and user_notification_preference.