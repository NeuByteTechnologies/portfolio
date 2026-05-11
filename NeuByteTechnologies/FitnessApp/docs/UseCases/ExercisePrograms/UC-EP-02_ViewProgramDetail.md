# UC‑EP‑02 — View Program Detail

Use Case ID
UC‑EP‑02
Use Case Name
View Program Detail
Module
Exercise Programs

## Purpose
To allow an authenticated user to view detailed information about a selected exercise program, including goals, duration, weekly structure, and daily workout breakdown. This use case enables users to evaluate whether a program fits their fitness objectives before activating it.

## Primary Actor

| Actor      | Type       | Description |
|------------|------------|-------------|
| App User   | Primary    | Interacts with the UI and views a given program detail |

## Stakeholders & Interests
- 	User — wants to understand what a program includes before committing to it.
- 	System — must retrieve accurate program details and present them clearly.
- 	Product Owner — wants an intuitive, informative program detail experience.
- 	Security Team — requires that only authenticated users can view program data.
- 	Analytics Team — needs to track program detail views.

## Preconditions
- 	User is authenticated.
- 	User selected a program from the Program List (UC‑EP‑01).
- 	System can retrieve program detail data (weeks, days, exercises).

## Postconditions
Success
- 	System displays the selected program’s full details.
- 	User may choose to activate the program (UC‑EP‑03).
Failure
- 	System displays an error message if program details cannot be retrieved.
- 	User remains on the Program Detail page.

## Trigger
User selects a program from the Exercise Programs list.

## Main Success Scenario (Basic Flow)
1. 	User selects a program from the Program List.
(BR‑EP‑03)
2. 	System verifies that the user is authenticated.
(BR‑EP‑05)
3. 	System retrieves the selected program’s metadata:
- 	Program name
- 	Duration (weeks)
- 	Goals
- 	Difficulty level
(BR‑EP‑02)
4. 	System retrieves the program’s weekly structure.
(BR‑EP‑02)
5. 	System retrieves the daily workout breakdown for each week.
(BR‑EP‑02)
6. 	System displays the Program Detail page with:
- 	Program overview
- 	Weekly layout
- 	Daily workout previews
(BR‑EP‑02)
7. 	System displays an Activate Program button.
(BR‑EP‑04)
8. 	User may choose to activate the program (UC‑EP‑03).
(BR‑EP‑04)
9. 	System logs the program detail view event.
(Analytics requirement)

## Alternate Flows
A1 — User Views Program Detail but Does Not Activate
- 	Steps 1–6 occur.
- 	User leaves the page or navigates elsewhere.
- 	No activation occurs.

## Exception Flows
E1 — Authentication Failure
- 	Step 2 fails.
- 	System redirects user to Login page.
(BR‑EP‑05)
E2 — Program Detail Retrieval Error
- 	Step 3, 4, or 5 fails due to system/database issue.
- 	System displays an error message.
(BR‑EP‑01 fallback)
- 	User remains on the Program Detail page.

## Non‑Functional Requirements
- 	Security: Only authenticated users may view program details. (BR‑EP‑05)
- 	Performance: Program detail must load quickly.
- 	Responsive UI: Program detail layout must render correctly on all device sizes.
- 	Accessibility: All program detail elements must support keyboard navigation and screen readers. (SRS‑A11Y‑01)
- 	Analytics: Program detail view events must be logged.

## Related UI Screens
- 	UIS‑EP‑03 — Program Detail Page
- 	UIS‑EP‑04 — Weekly Layout
- 	UIS‑EP‑05 — Daily Workout Preview
- 	UIS‑GLOBAL‑HEADER‑01
- 	UIS‑GLOBAL‑FOOTER‑01

## flowchart TD

    %% Entry
    A[User Selects Program from List] --> B{Authenticated?}

    %% Auth Check
    B -->|No| Z1[Redirect to Login Page]
    B -->|Yes| C[Retrieve Program Metadata]

    %% Metadata Retrieval
    C --> D{Metadata Retrieved?}
    D -->|No| E1[Display Error Message]
    D -->|Yes| E[Retrieve Weekly Structure]

    %% Weekly Structure
    E --> F{Weekly Data Retrieved?}
    F -->|No| E1[Display Error Message]
    F -->|Yes| G[Retrieve Daily Workout Previews]

    %% Daily Workouts
    G --> H{Daily Data Retrieved?}
    H -->|No| E1[Display Error Message]
    H -->|Yes| I[Display Program Detail Page]

    %% User Decision
    I --> J{User Activates Program?}
    J -->|No| K[User Leaves Page → End]
    J -->|Yes| L[Navigate to Activate Program (UC‑EP‑03)]

    %% Analytics
    I --> M[Log Program Detail View Event]

    %% End
    L --> END[Program Activation Flow Begins]
    M --> END
