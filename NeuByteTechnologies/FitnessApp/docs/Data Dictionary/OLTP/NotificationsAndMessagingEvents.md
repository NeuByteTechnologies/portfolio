# DATA DICTIONARY — MODULE 5: NOTIFICATIONS
This module defines the entities that support notification types, delivery channels, user‑specific preferences, and system‑defined events that trigger notifications.

All definitions are based on your SQL Server schema plus the newly added notification_event.

## Table: notification_type
**Description:**
Defines the categories of notifications the system can send.
Each type has a default delivery method.

|Column | Type | Null | Description |
|-------|------|------|-------------|
|notification_type_id | TINYINT | NO | Primary key.|
|notification_type_description | VARCHAR(50) | NO | Human‑readable description of the notification type.|
|default_delivery_type_id | TINYINT	NO | FK → notification_delivery_type. Default delivery channel.|

**Foreign Keys:**

default_delivery_type_id → notification_delivery_type.notification_delivery_type_id

**Business Rules:**
- Each notification type must have a default delivery method.
 - Users may override defaults via user_notification_preference.

## Table: notification_delivery_type
**Description:**
- Defines the available delivery channels for notifications.

**Examples:**
- In‑App
- Email
 - SMS

|Column | Type | Null | Description |
|-------|------|------|-------------|
|notification_delivery_type_id | TINYINT (IDENTITY) | NO | Primary key.|
|delivery_type_description | VARCHAR(50) | NO | Delivery channel name.|

**Business Rules:**

Delivery types are system‑defined and rarely change.

## Table: user_notification_preference
**Description:**
Stores user‑specific notification delivery preferences.
Each combination of user + notification type + delivery type is unique.

|Column | Type | Null | Description |
|-------|------|------|-------------|
|user_notification_preference_id | INT (IDENTITY) | NO | Primary key.|
|user_id | INT | NO | FK → user.|
|notification_type_id | TINYINT | NO | FK → notification_type.|
|notification_delivery_type_id | TINYINT	NO | FK → notification_delivery_type.|
|is_enabled | BIT | NO | Whether this delivery method is enabled. Default = 1.|

**Foreign Keys:**
 - user_id → user.user_id
- notification_type_id → notification_type.notification_type_id
 - notification_delivery_type_id → notification_delivery_type.notification_delivery_type_id

**Constraints:**
- Unique constraint on (user_id, notification_type_id, notification_delivery_type_id)  
- Ensures no duplicate preference rows.

**Business Rules:**
- If no user preference exists, system uses the default delivery type.
- Users may enable multiple delivery channels per notification type.
 - is_enabled defaults to 1 (enabled).

## Table: notification_event
**Description:**
Defines system events that can trigger notifications.
This table does not store messages or templates — only event metadata.

|Column	| Type | Null | Description |
|-------|------|------|-------------|
|notification_event_id | TINYINT (IDENTITY)	| NO | Primary key.|
|notification_type_id | TINYINT | NO | FK → notification_type.|
|event_name	| VARCHAR(50) | NO | Name of the event (e.g., “New User Created”).|
|event_description | VARCHAR(255) | YES | Description of the event and its purpose.|

**Foreign Keys:**

- notification_type_id → notification_type.notification_type_id

**Business Rules:**
These rules describe when each event is triggered.
They are implemented in the application layer, not SQL.

- Event: New User Created
 - Trigger: A new record is inserted into dbo.user.
 - Purpose: Send welcome notification.

- Event: Weigh‑In Due
 - Trigger: DATEDIFF(day, last weigh‑in date, GETDATE()) >= 7  
 - Purpose: Encourage weekly weigh‑ins.

- Event: Get to the Gym
 - Trigger: User’s last workout date is later than the expected program workout day.
 - Purpose: Encourage program adherence.

- Event: Weight Goal Approaching
 - Trigger: ABS(current_weight - goal_weight) <= X  (X = threshold, e.g., 5 lbs)
 - Purpose: Motivate user as they near their goal.

- Event: Program Completed
 - Trigger: User logs the final workout in the program.
 - Purpose: Celebrate completion and prompt next program selection.
<!---
Optional Future Events (Not Required)
These are realistic but not required for your portfolio:

Program Day Missed

Streak Achieved

Inactivity Warning

New Program Available

You can add them later if desired.
-->