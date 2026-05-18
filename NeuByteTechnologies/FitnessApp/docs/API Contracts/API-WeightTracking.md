# API Contract — Weight Tracking
## 1. Endpoint Summary
| Endpoint | Method | Purpose | Authentication | Notes |
| --- | --- | --- | --- | --- |
| ``/weight`` | GET | Get weight history | Required | Supports date filtering |
| ``/weight/latest`` | GET | Get latest weight entry | Required | Used by Dashboard |
| ``/weight`` | POST | Add a new weight entry | Required | Creates weight_log record |
| ``/weight/{weight_id}`` | PUT | Edit a weight entry | Required | UC‑WT‑05 |
| ``/weight/{weight_id}`` | DELETE | Delete a weight entry | Required | UC‑WT‑06 |
| ``/weight/trend`` | GET | Get weight trend summary | Required | Used by Dashboard |

## 2. Request & Response Schemas
### 2.1 Get Weight History (GET /weight)
**Query Parameters**  
| Parameter | Type | Required | Description |
| --- | --- | --- | --- |
| ``start_date`` | date | No | Filter from date |
| ``end_date`` | date | No | Filter to date |
| ``limit`` | int | No | Default 30 entries |

**Response**  
json  
{  
  "weights": [  
    {  
      "weight_id": "string",  
      "date": "2026-05-17",  
      "weight": 185.2,  
      "unit": "lb"  
    }  
  ]  
}  
## 2.2 Get Latest Weight (GET /weight/latest)
**Response**  
json  
{  
  "weight_id": "string",  
  "date": "2026-05-17",  
  "weight": 185.2,  
  "unit": "lb"  
}  
### 2.3 Add Weight Entry (POST /weight)
**Request**  
json  
{  
  "date": "2026-05-18",  
  "weight": 184.8,  
  "unit_type_id": 1  
}  
**Response**  
json  
{  
  "success": true,  
  "weight_id": "string",  
  "date": "2026-05-18",  
  "weight": 184.8,  
  "unit": "lb"  
}  
### 2.4 Edit Weight Entry (PUT /weight/{weight_id})
**Request**  
json  
{  
  "date": "2026-05-18",  
  "weight": 184.8,  
  "unit_type_id": 1  
}  
**Response**  
json  
{  
  "success": true,  
  "weight_id": "string"  
}  
### 2.5 Delete Weight Entry (DELETE /weight/{weight_id})
**Response**  
json  
{  
  "success": true,  
  "weight_id": "string"  
}  
### 2.6 Get Weight Trend (GET /weight/trend)
**Response**  
json  
{  
  "current_weight": 185.2,  
  "previous_weight": 186.0,  
  "trend": "decrease",  
  "last_logged": "2026-05-17"  
}  
Trend values:  
- "increase"
- "decrease"
- "no_change"
 -"insufficient_data"

## 3. Validation Rules
**Add/Edit Weight**
- weight must be > 0
- date must be valid
- unit_type_id must exist in unit_type
- Only one entry per date allowed (optional BR)

**Delete Weight**  
- Weight entry must belong to the user  

**Trend**  
If fewer than 2 entries → trend = "insufficient_data"  

**History**  
- If no filters → return last 30 entries  
- Sorted by date descending

## 4. Business Rules
**Unit Conversion**  
- Stored weight is always in the user’s preferred unit  
- If user changes unit preference:
 - historical values are NOT converted
 - only display conversion happens client‑side

**Dashboard Integration**  
Dashboard uses:  
- /weight/latest
- /weight/trend

To populate:  
- Current weight
- Trend arrow
- Last logged date

**Editing & Deleting**  
Matches UC‑WT‑05 and UC‑WT‑06:  
- Editing updates the existing record
- Deleting removes the record
- Trend recalculates automatically

**Weight Goal (future enhancement)**
- Not part of this API
- Will be separate under Goals module

## 5. Error Model
| HTTP Code | Error Code | Message | Description |
| --- | --- | --- | --- |
| 400 | ``INVALID_REQUEST`` | Missing or invalid fields | Validation failure |
| 401 | ``UNAUTHORIZED`` | Invalid or missing token | Auth required |
| 404 | ``WEIGHT_NOT_FOUND`` | Weight entry not found | Invalid ID |
| 403 | ``FORBIDDEN`` | Weight entry does not belong to user | Ownership violation |
| 500 | ``SERVER_ERROR`` | Internal error | Unexpected failure |

## 6. Example Responses
**Add Weight Example**  
json  
{  
  "success": true,  
  "weight_id": "W123",  
  "date": "2026-05-18",  
  "weight": 184.8,  
  "unit": "lb"  
}  
**Trend Example**  
json  
{  
  "current_weight": 185.2,  
  "previous_weight": 186.0,  
  "trend": "decrease",  
  "last_logged": "2026-05-17"  
}  
## 7. Notes / Edge Cases
- If user logs multiple entries on same day → last one wins (optional rule)  
- Trend uses the last two chronological entries
- Weight history is not paginated (simple list)
- Unit type is always returned as abbreviation (lb, kg)
- Weight entries are immutable except for edit/delete