# API Contract — Help / Support
## 1. Endpoint Summary

| Endpoint | Method | Purpose | Authentication | Notes |
| --- | --- | --- | --- | --- |
| ``/help/categories`` | GET | Get list of help categories | None | Used to build Help menu |
| ``/help/articles`` | GET | Get list of help articles (optionally filtered by category) | None | Used by Help screen |
| ``/help/articles/{article_id}`` | GET | Get full help article content | None | Static content |

## 2. Request & Response Schemas
## 2.1 Get Help Categories (GET /help/categories)
**Response**  
json  
{  
  "categories": [  
    {  
      "category_id": 1,  
      "name": "Account",  
      "description": "Managing your account and profile"  
    }  
  ]  
}  
## 2.2 Get Help Articles (GET /help/articles?category_id=1)
**Response**  
json  
{  
  "articles": [  
    {  
      "article_id": 101,  
      "title": "How to reset your password",  
      "category_id": 1,  
      "summary": "Steps to reset your password if you forget it."  
    }  
  ]  
}  
## 2.3 Get Help Article Detail (GET /help/articles/{article_id})
**Response**  
json  
{  
  "article_id": 101,  
  "title": "How to reset your password",  
  "category_id": 1,  
  "content": "Full article text in Markdown or HTML",  
  "last_updated": "2026-05-01"  
}
## 3. Validation Rules
**Help Categories**  
- Only return categories marked as active
- No authentication required

**Help Articles**  
- If category_id provided → must be valid
- Only return published articles

**Help Article Detail**  
- Article must exist
- Article must be published

## 4. Business Rules
**Help Categories**
- Categories are defined in help_category_type
- Used to group articles in UI

**Help Articles**
- Articles stored in database or static content store
- Summary is used for preview cards
- Content may be Markdown or HTML

**Contact Support**
- Sends email to support inbox (SMTP or SendGrid)

## 5. Error Model

| HTTP Code | Error Code | Message | Description |
| --- | --- | --- | --- |
| 400 | ``INVALID_REQUEST`` | Missing or invalid fields | Validation failure |
| 404 | ``ARTICLE_NOT_FOUND`` | Article not found | Invalid ID |
| 500 | ``SERVER_ERROR`` | Internal error | Unexpected failure |

## 6. Example Responses
**Help Categories Example**  
json  
{  
  "categories": [  
    {  
      "category_id": 1,  
      "name": "Account",  
      "description": "Managing your account and profile"  
    },  
    {  
      "category_id": 2,  
      "name": "Programs",  
      "description": "Understanding exercise programs"  
    }  
  ]  
}  
**Help Article Detail Example**  
json  
{  
  "article_id": 101,  
  "title": "How to reset your password",  
  "category_id": 1,  
  "content": "To reset your password, go to the Login screen and tap *Forgot Password*...",  
  "last_updated": "2026-05-01"  
}  
## 7. Notes / Edge Cases
**Help content is static — no versioning needed**  
- Articles may include images (hosted in CDN)
- Contact Support does not return email content for security reasons
- Support email may include:
 - user_id
 - email
 - device info (future)
 - app version (future)