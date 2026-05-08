| Field | Type | Required | Description |
| --- | --- | --- | --- |
| **user_id** | UUID | Yes | Primary key. Unique identifier for each user. |
| **email** | VARCHAR(255) | Yes | User’s login identifier. Must be unique. |
| **password_hash** | VARBINARY(255) | Yes | Secure hash of the user’s password. No plaintext storage. |
| **first_name** | VARCHAR(100) | No | Optional profile detail. |
| **last_name** | VARCHAR(100) | No | Optional profile detail. |
| **created_at** | DATETIME | Yes | Timestamp when the account was created. |
| **updated_at** | DATETIME | Yes | Timestamp of last profile update. |
| **last_login_at** | DATETIME | No | Timestamp of last successful login. |
| **is_active** | BOOLEAN | Yes | Indicates whether the account is active. |
| **auth_provider** | VARCHAR(50) | No | “local”, “google”, “apple”, etc. Supports future SSO. |
| **failed_login_attempts** | INT | No | Used for lockout policy. |
| **locked_until** | DATETIME | No | Account temporarily locked after repeated failures. |