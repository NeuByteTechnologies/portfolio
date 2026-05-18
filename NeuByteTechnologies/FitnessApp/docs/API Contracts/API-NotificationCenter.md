# API Contract — Notification Center
## 1. Endpoint Summary
| Endpoint | Method | Purpose | Authentication | Notes |
| --- | --- | --- | --- | --- |
| ``/notifications`` | GET | Get list of notifications | Required | Supports filtering + pagination |
| ``/notifications/unread_count`` | GET | Get unread notification count | Required | Used for badge on bell icon |
| ``/notifications/{notification_id}/read`` | POST | Mark a notification as read | Required | Updates read flag |
| ``/notifications/read_all`` | POST | Mark all notifications as read | Required | Used by “Mark All Read” |
| ``/notifications/{notification_id}`` | DELETE | Delete a notification | Required | Optional (depends on BR) |

## 2. Request & Response Schemas
### 2.1 Get Notifications (GET /notifications)
**Query Parameters**
| Parameter | Type | Required | Description |
| --- | --- | --- | --- |
| ``page`` | int | No | Default 1 |
| ``page_size`` | int | No | Default 20 |
| ``type`` | int | No | Filter by notification_type_id |
| ``read`` | bool | No | Filter by read/unread |

**Response**  
json  
{  
  "notifications": [  
    {  
      "notification_id": "string",  
      "type_id": 1,  
      "type_name": "Reminder",  
      "message": "Don't forget today's workout!",  
      "created_at": "2026-05-18T07:00:00Z",  
      "read": false  
    }  
  ],  
  "pagination": {  
    "page": 1,  
    "page_size": 20,  
    "total": 42  
  }  
}  
### 2.2 Get Unread Count (GET /notifications/unread_count)
**Response**  
json  
  {
  "unread_count": 3  
}  
### 2.3 Mark Notification as Read (POST /notifications/{notification_id}/read)
**Request**  
json  
{  
  "session_token": "string"  
}  
**Response**  
json  
{  
  "success": true,  
  "notification_id": "string",  
  "read": true  
}  
### 2.4 Mark All Notifications as Read (POST /notifications/read_all)
**Request**  
json  
{  
  "session_token": "string"  
}  
**Response**  
json  
{  
  "success": true,  
  "updated_count": 12  
}  
### 2.5 Delete Notification (DELETE /notifications/{notification_id})
(Optional — your BRs allow it but do not require it. You can keep or remove this depending on your UI decision.)  
  
**Response**  
json  
{  
  "success": true,  
  "notification_id": "string"  
}  
## 3. Validation Rules
**Get Notifications**  
- User must be authenticated
- Pagination defaults applied if missing
- type must match a valid notification_type_id
- read must be boolean

**Unread Count**  
- User must be authenticated

**Mark as Read**
- Notification must belong to the user
- Notification must exist

**Mark All Read**  
- Only updates notifications belonging to the user

**Delete Notification**
- Notification must belong to the user
- Notification must exist

## 4. Business Rules
**Notification  Center Behavior**
Matches BR‑N‑01 through BR‑N‑16 and BR‑NOTE‑33 through BR‑NOTE‑38:  
- Notifications are stored in notification table
- Each notification has:
 - type
 - message
 - timestamp
 - read/unread flag
- Sorted by created_at DESC
- Unread count displayed on bell icon
- Clicking bell icon opens Notification Center
- Marking as read updates read = true
- “Mark All Read” updates all unread notifications

**Notification Types**
Pulled from notification_type metadata:  
- Reminder
- Achievement
- System
- Program Update
- Weight Reminder
- etc.

**Deletion (Optional)**
If enabled:  
- Deleting a notification removes it from the list
- Does not affect unread count if already read

## 5. Error Model
| HTTP Code | Error Code | Message | Description |
| --- | --- | --- | --- |
| 400 | ``INVALID_REQUEST`` | Missing or invalid fields | Validation failure |
| 401 | ``UNAUTHORIZED`` | Invalid or missing token | Auth required |
| 404 | ``NOTIFICATION_NOT_FOUND`` | Notification not found | Invalid ID |
| 403 | ``FORBIDDEN`` | Notification does not belong to user | Ownership violation |
| 500 | ``SERVER_ERROR`` | Internal error | Unexpected failure |

## 6. Example Responses
**Get Notifications Example**
json  
{  
  "notifications": [  
    {  
      "notification_id": "N123",  
      "type_id": 1,  
      "type_name": "Reminder",  
      "message": "Don't forget today's workout!",  
      "created_at": "2026-05-18T07:00:00Z",  
      "read": false  
    }  
  ],  
  "pagination": {  
    "page": 1,  
    "page_size": 20,  
    "total": 42  
  }  
}  
**Mark All Read Example**
json  
{  
  "success": true,  
  "updated_count": 12  
}  
## 7. Notes / Edge Cases
- Unread count is recalculated after each read action
- Notifications older than X days may be auto‑archived (future enhancement)
- Notification Center does not create notifications — only displays them
- Notification creation happens in:
- Workout logging
- Program completion
- Weight reminders
- Account events