# UC‑ERR‑09 — Handle Rate Limiting (429)

## Purpose: 
Provide user feedback when too many requests are made.  

## Includes:
- 	Cooldown messaging
- 	Retry timer
- 	Logging  

## Actors
| Actor      | Type       | Description |
|------------|------------|-------------|
| App User   | Primary    | Interacts with the UI and receives appropriate errors |
| App Admin  | Secondary  | reviews and uses logs through backend/admin tools for bugs to work on the next release|