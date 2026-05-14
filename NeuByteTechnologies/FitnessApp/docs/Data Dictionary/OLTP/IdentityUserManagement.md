# DATA DICTIONARY — MODULE 1: IDENTITY & USER MANAGEMENT
This module defines all entities related to user identity, authentication, authorization, and contact information within the FitnessApp OLTP system.

## Table: user
**Description:**
Stores core identity, authentication, and account lifecycle metadata for FitnessApp users.

| Column | Type | Null | Description |
| --- | --- | --- | --- |
| user_id | INT | NO | Primary key (identity). |
| user_type_id | TINYINT | NO | FK → user_type. Defines role (standard, admin, etc.). |
| email | VARCHAR(255) | NO | Unique email address for login. |
| password_hash | VARBINARY | NO | Securely hashed password. |
| password_salt | VARBINARY | NO | Salt used for hashing. |
| is_active | BIT | NO | Indicates if the account is active. |
| created_at | DATETIME | NO | Timestamp of account creation. |
| updated_at | DATETIME | YES | Timestamp of last update. |

**Foreign Keys:**
- user_type_id → user_type.user_type_id

**Business Rules:**
- Email must be unique.
- Password must be stored as a salted hash.
- Deactivation does not delete the user.

## Table: user_type
**Description:**
Defines the classification of users within the system.

| Column | Type | Null | Description |
| --- | --- | --- | --- |
| user_type_id | TINYINT | NO | Primary key. |
| name | VARCHAR(50) | NO | Role name (e.g., “Standard”, “Admin”). |
| description | VARCHAR(255) | YES | Optional description. |

**Business Rules:**
- User types are system‑defined and rarely change.

## Table: user_contact
**Description:**  
Stores user contact information such as phone numbers and email types.

| Column | Type | Null | Description |
| --- | --- | --- | --- |
| user_contact_id | INT | NO | Primary key. |
| user_id | INT | NO | FK → user. |
| contact_type_id | TINYINT | NO | FK → contact_type. |
| contact_value | VARCHAR(255) | NO | Email address or phone number. |
| is_primary | BIT | NO | Indicates primary contact method. |

**Foreign Keys:**
- user_id → user.user_id
- contact_type_id → contact_type.contact_type_id

**Business Rules:**
- A user may have multiple contact methods.
- Only one contact method per type may be primary.

## Table: contact_type
**Description:**
Defines the types of contact methods available.

| Column | Type | Null | Description |
| --- | --- | --- | --- |
| contact_type_id | TINYINT | NO | Primary key. |
| name | VARCHAR(50) | NO | Contact type (e.g., “Email”, “Mobile”). |


## Table: user_mfa
**Description:**
Stores multi‑factor authentication enrollment and verification data.

| Column | Type | Null | Description |
| --- | --- | --- | --- |
| user_mfa_id | INT | NO | Primary key. |
| user_id | INT | NO | FK → user. |
| mfa_type_id | TINYINT | NO | FK → mfa_type. |
| secret | VARCHAR(255) | YES | MFA secret (e.g., TOTP seed). |
| is_enabled | BIT | NO | Whether MFA is active. |
| enrolled_at | DATETIME | YES | Enrollment timestamp. |


**Foreign Keys:**
- user_id → user.user_id
- mfa_type_id → mfa_type.mfa_type_id

## Table: mfa_type
**Description:**
Defines supported MFA mechanisms.

| Column | Type | Null | Description |
| --- | --- | --- | --- |
| mfa_type_id | TINYINT | NO | Primary key. |
| name | VARCHAR(50) | NO | MFA type (e.g., “TOTP”, “SMS”). |


## Table: user_session
**Description:**
Tracks active and historical user sessions for security and analytics.

| Column | Type | Null | Description |
| --- | --- | --- | --- |
| user_session_id | INT | NO | Primary key. |
| user_id | INT | NO | FK → user. |
| session_token | CHAR(64) | NO | Unique session identifier. |
| created_at | DATETIME | NO | Session creation timestamp. |
| expires_at | DATETIME | NO | Session expiration timestamp. |
| revoked_at | DATETIME | YES | Timestamp if session was revoked. |


**Business Rules:**
- Session tokens must be unique.
- Revoked sessions cannot be reused.