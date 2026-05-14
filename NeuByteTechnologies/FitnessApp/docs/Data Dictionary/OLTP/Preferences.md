# DATA DICTIONARY — MODULE 4: PREFERENCES & UNITS
This module defines all entities related to user‑level preferences, system‑defined preference metadata, unit types, and notification delivery preferences.

All definitions below are directly derived from your SQL Server DDL.

## Table: user
(Included here because it is referenced by user_preference and user_notification_preference)

**Description:**  
Stores core user identity and authentication metadata.

| Column | Type | Null | Description |
|--------|------|------|-------------|
| user_id |INT (IDENTITY) | NO | Primary key.|
| user_type_id | TINYINT | NO | FK → user_type.|
| first_name | VARCHAR(100) | NO | User’s first name.|
| last_name | VARCHAR(100) | NO | User’s last name.|
| hash_pass | BINARY(256) | NO | Password hash.|
| last_update | DATETIME2 | NO | Timestamp of last update.|

**Foreign Keys:**

user_type_id → user_type.user_type_id

## Table: preference
**Description:**  
Defines system‑level preference types. Each preference may have a default value and/or a default unit type.

Examples:

- weight_unit
- distance_unit
- theme
- language

| Column | Type | Null | Description |
|--------|------|------|-------------|
preference_id	TINYINT	NO	Primary key.
preference_name	VARCHAR(50)	NO	Name of the preference.
default_unit_type_id	TINYINT	YES	FK → unit_type. Default unit for this preference.
default_value	VARCHAR(50)	YES	Default value if no unit is required.

**Foreign Keys:**

default_unit_type_id → unit_type.unit_type_id

**Business Rules:**

A preference may use either a default value or a default unit type.

Preferences are system‑defined and rarely change.

## Table: unit_type
**Description:**  
Defines measurement units used throughout the system (weight, distance, time, etc.).
Includes conversion factors for normalization.

| Column | Type | Null | Description |
|--------|------|------|-------------|
|unit_type_id | TINYINT (IDENTITY) | NO | Primary key.|
|unit_category | VARCHAR(20) | NO | Category (e.g., “Weight”, “Distance”).|
|unit_name | VARCHAR(50) | NO| Full unit name (e.g., “Pounds”).|
|unit_abbreviation | VARCHAR(10) | NO | Abbreviation (e.g., “lb”).|
|conversion_factor | DECIMAL(18,8) | NO | Conversion factor to base unit.|

**Business Rules:**
- Conversion factor is used to normalize values across units.
- Unit categories group related units (e.g., lb/kg, mi/km).

## Table: user_preference
**Description:**  
Stores user‑specific overrides for system‑defined preferences.
A preference may be stored as a value or a unit, depending on the preference type.

| Column | Type | Null | Description|
|--------|------|------|-------------|
|user_preference_id | INT (IDENTITY) | NO | Primary key.|
|user_id | INT | NO | FK → user.|
|preference_id | TINYINT | NO | FK → preference.|
|preference_value | VARCHAR(50) | YES | User‑defined value (if applicable).|
|unit_type_id | TINYINT | YES | FK → unit_type. User‑selected unit (if applicable).|

**Foreign Keys:**
- user_id → user.user_id
- preference_id → preference.preference_id
- unit_type_id → unit_type.unit_type_id

**Business Rules:**
- A preference may use either preference_value or unit_type_id, depending on the preference definition.
- If the preference is unit‑based, unit_type_id must be provided.
- If the preference is value‑based, preference_value must be provided.
- Users may override system defaults.

## Table: notification_type
**Description:**  
Defines the types of notifications the system can send (e.g., “Workout Reminder”, “Weekly Summary”).

| Column | Type | Null | Description |
|--------|------|------|-------------|
|notification_type_id | TINYINT	| NO | Primary key.|
|notification_type_description | VARCHAR(50) | NO | Description of the notification type.|
|default_delivery_type_id | TINYINT | NO | FK → notification_delivery_type. Default delivery channel.|


## Table: notification_delivery_type
**Description:**  
Defines the delivery channels available for notifications.

Examples:

In‑App

Email

SMS

| Column | Type | Null | Description |
|--------|------|------|-------------|
|notification_delivery_type_id | TINYINT (IDENTITY) | NO | Primary key. |
|delivery_type_description | VARCHAR(50) | NO | Delivery channel description. |


## Table: user_notification_preference
**Description:**  
Stores user‑specific notification delivery preferences.
Each combination of user + notification type + delivery type is unique.

| Column | Type | Null | Description |
|--------|------|------|-------------|
| user_notification_preference_id | INT (IDENTITY) | NO | Primary key.|
| user_id | INT | NO | FK → user.|
| notification_type_id | TINYINT | NO | FK → notification_type.|
| notification_delivery_type_id | TINYINT | NO | FK → notification_delivery_type.|
| is_enabled | BIT	NO | Whether this delivery method is enabled. Default = 1.|

**Foreign Keys:**

- user_id → user.user_id
- notification_type_id → notification_type.notification_type_id
- notification_delivery_type_id → notification_delivery_type.notification_delivery_type_id

**Constraints:**

- Unique constraint on (user_id, notification_type_id, notification_delivery_type_id)  
- Ensures no duplicate preference rows.

**Business Rules:**

- Users may enable multiple delivery channels per notification type.
- If no user preference exists, system uses default_delivery_type_id.