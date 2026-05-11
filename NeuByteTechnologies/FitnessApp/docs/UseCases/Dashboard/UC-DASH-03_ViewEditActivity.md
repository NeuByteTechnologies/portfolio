# UC‑DASH‑03 — View/Edit Activity
Use Case ID
UC‑DASH‑03
Use Case Name
View/Edit Activity
Module
Dashboard

## Purpose
To allow an authenticated user to view details of a previously logged workout from the Dashboard’s Recent Activity list and optionally edit that workout entry, ensuring accurate historical workout data and a seamless transition into the Edit Log workflow

## Primary Actor

| Actor      | Type       | Description |
|------------|------------|-------------|
| App User   | Primary    | Creates their own account through the app UI |

## Stakeholders & Interests
- 	User — wants to quickly review or correct previously logged workout entries.
- 	System — must retrieve accurate workout log data and allow safe editing.
- 	Product Owner — wants a smooth, intuitive drill‑down experience from Dashboard → Activity Detail → Edit Log.
- 	Analytics Team — needs to track activity drill‑down events.
- 	Security Team — requires access control and data integrity.

## Preconditions
- 	User is authenticated.
- 	User is on the Dashboard page.
- 	At least one workout entry exists in Recent Activity (or fallback messaging is available).
- 	System can retrieve workout log details.

## Postconditions
Success
- 	User views the selected workout’s details.
- 	User may optionally edit the workout entry via UC‑LW‑02 (Edit Log).
Failure
- 	User remains on the Dashboard.
- 	System displays an error message if the workout entry cannot be retrieved.

## Trigger
User selects a workout entry from the Recent Activity list on the Dashboard.

## Main Success Scenario (Basic Flow)
1. 	User selects a workout entry from the Recent Activity list.
(BR‑DASH‑11)
2. 	System verifies that the user is authenticated.
(BR‑DASH‑22)
3. 	System retrieves the selected workout log details.
(DATA‑WorkoutLog.*)
4. 	System displays the Activity Detail view, including:
- 	Date
- 	Exercises
- 	Sets, reps, weight, duration
- 	Total volume and duration
(FS‑DASH‑ACT‑02)
5. 	System provides an Edit option for the workout entry.
(BR‑DASH‑11)
6. 	User selects Edit.
7. 	System navigates the user to the Edit Log workflow (UC‑LW‑02).
(FS‑LW‑EDIT‑01)
8. 	System loads the Edit Log modal/page with the selected workout’s data pre‑populated.
9. 	System logs the activity drill‑down event for analytics.
(BR‑DASH‑23)

## Alternate Flows
A1 — No Recent Activity Available
- 	Step 1 cannot occur.
- 	System displays an empty state message.
(BR‑DASH‑10 fallback)
A2 — User Views Activity but Does Not Edit
- 	Steps 1–4 occur.
- 	User closes the Activity Detail view.
- 	System returns user to the Dashboard.

## Exception Flows
E1 — Authentication Failure
- 	Step 2 fails.
- 	System redirects user to Login page.
(BR‑DASH‑22)
E2 — Workout Log Retrieval Error
- 	Step 3 fails due to missing/corrupted data or system error.
- 	System displays an error message.
(BR‑DASH‑18)
- 	User remains on the Dashboard.

## Non‑Functional Requirements
- 	Security: Only authenticated users may view or edit activity. (BR‑DASH‑22)
- 	Performance: Activity detail must load quickly to maintain user flow.
- 	Responsive UI: Activity detail and edit options must render correctly on all device sizes. (BR‑DASH‑14)
- 	Accessibility: Activity list and detail view must support keyboard navigation and screen readers. (SRS‑A11Y‑01)
- 	Analytics: Activity drill‑down events must be logged. (BR‑DASH‑23)

## Related UI Screens
- 	UIS‑DASH‑06 — Recent Activity List
- 	UIS‑LW‑03 — Edit Log Modal
- 	UIS‑GLOBAL‑HEADER‑01
- 	UIS‑GLOBAL‑FOOTER‑01

## flowchart TD

    %% Entry
    A[User Selects Recent Activity Entry] --> B{Authenticated?}

    %% Auth Check
    B -->|No| Z1[Redirect to Login Page]
    B -->|Yes| C[Retrieve Workout Log Details]

    %% Data Retrieval
    C --> D{Data Retrieved?}
    D -->|No| E1[Display Error Message]
    D -->|Yes| E[Display Activity Detail View]

    %% User Decision
    E --> F{User Chooses to Edit?}
    F -->|No| G[Close Detail View → Return to Dashboard]
    F -->|Yes| H[Navigate to Edit Log Workflow]

    %% Edit Log
    H --> I[Load Edit Log with Pre‑Populated Data]
    I --> J[Log Drill‑Down Event]

    %% End
    J --> END[Activity Viewed/Edited]

    %% Alternate Flow
    A -->|No Recent Activity| A1[Display Empty State]