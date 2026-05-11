# UC‑ERR‑02 — Handle Network Connectivity Loss

## Purpose: 
Detect offline state and display offline UI.

## Includes:
- 	Offline banner
- 	Retry when connection returns
- 	Prevent destructive actions

## Primary Actors
| Actor      | Type       | Description |
|------------|------------|-------------|
| App User   | Primary    | Interacts with the UI and receives appropriate errors |
| App Admin  | Secondary  | reviews and uses logs through backend/admin tools for bugs to work on the next release|