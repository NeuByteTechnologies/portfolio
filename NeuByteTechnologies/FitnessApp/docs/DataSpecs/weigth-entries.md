| Field | Type | Required | Description |
| --- | --- | --- | --- |
| **entry_id** | UUID | Yes | Primary key for each weight entry. |
| **user_id** | UUID | Yes | FK → Users.user_id. Only the owner can view/edit/delete. |
| **weight_value** | DECIMAL(5,2) | Yes | The weight in user’s selected unit (lbs/kg). |
| **unit** | VARCHAR(10) | Yes | “lbs” or “kg”. Future‑proof for other units. |
| **entry_date** | DATE | Yes | The date the weight applies to (not timestamp). |
| **created_at** | DATETIME | Yes | When the entry was created. |
| **updated_at** | DATETIME | No | When the entry was last edited. |
| **source** | VARCHAR(50) | No | “manual”, “imported”, “synced” (you currently only use “manual”). |
| **is_deleted** | BOOLEAN | No | Soft delete flag (optional but recommended). |