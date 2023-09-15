# Firestore Structure

- []: collection
- {}: document

## Ideal - For multi otomos and users conversations

```json
{
  "[versions]": {
    "{version}": {
      "[users]": {
        "{user_id}": {
          // profile information
        }
      },
      "[otomos]": {
        "{otomo_id}": {
          "id": "string",
          "memory": {
            "summary": "string"
          }
          //   profile information
        }
      },
      "[chats]": {
        "users": ["user_id"],
        "otomos": ["otomo_id"],
        "[messages]": {
          "id": "string",
          "client_id": "string",
          "text": "string",
          "sender": {
            "role": "string",
            "id": "string"
          },
          "sent_at": "Timestamp"
        }
      }
    }
  }
}
```
