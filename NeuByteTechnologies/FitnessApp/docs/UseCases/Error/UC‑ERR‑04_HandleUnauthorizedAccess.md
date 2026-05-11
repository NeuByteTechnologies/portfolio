# UC‑ERR‑04 — Handle Unauthorized Access

## Purpose: 
Redirect user to Login when session is invalid or expired.  

## Includes:
- 	Session check
- 	Redirect
- 	Logging  

## Primary Actors
| Actor      | Type       | Description |
|------------|------------|-------------|
| App User   | Primary    | Interacts with the UI and receives appropriate errors |
| App Admin  | Secondary  | reviews and uses logs through backend/admin tools for bugs to work on the next release|