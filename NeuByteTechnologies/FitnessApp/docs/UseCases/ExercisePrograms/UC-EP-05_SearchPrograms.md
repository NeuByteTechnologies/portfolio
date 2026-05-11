# UC‑EP‑05 — Activate Program

Use Case ID
UC‑EP‑05
Use Case Name
Activate Program
Module
Exercise Programs

## Purpose
To allow an authenticated user to activate a selected exercise program, making it their current program and initializing program progress tracking. This use case ensures the user can commit to a structured workout plan and that the system correctly sets up the program’s starting point.

## Primary Actor

| Actor      | Type       | Description |
|------------|------------|-------------|
| App User   | Primary    | Interacts with the UI and views or selects a given program |

## Stakeholders & Interests
- 	User — wants to begin a structured program and track progress from day one.
- 	System — must correctly assign the program, initialize progress, and prevent conflicts.
- 	Product Owner — wants a smooth, confident activation experience with clear confirmation.
- 	Analytics Team — needs to track program activation events.
- 	Security Team — requires that only authenticated users can activate programs.

## Preconditions
- 	User is authenticated.
- 	User is viewing a Program Detail page (UC‑EP‑02).
- 	System can retrieve and update user program assignment data.
- 	User does not already have an active program OR system supports mid‑cycle switching (UC‑EP‑06).

## Postconditions
Success
- 	The selected program becomes the user’s active program.
- 	Program progress is initialized (Week 1, Day 1).
- 	User is redirected to the Dashboard or Program Overview.
Failure
- 	No program is activated.
- 	System displays an error message.
- 	User remains on the Program Detail page.

## Trigger
User selects the Activate Program button on the Program Detail page.

## Main Success Scenario (Basic Flow)
1. 	User selects Activate Program.
(BR‑EP‑04)
2. 	System verifies that the user is authenticated.
(BR‑EP‑05)
3. 	System checks whether the user currently has an active program.
(BR‑EP‑08)
4. 	System retrieves the selected program’s structure (weeks, days).
(BR‑EP‑02)
5. 	System initializes program progress for the user:
- 	Set active program ID
- 	Set Week = 1
- 	Set Day = 1
(BR‑EP‑04)
6. 	System saves the user’s new active program assignment.
(DATA‑ProgramProgress.*)
7. 	System displays a confirmation message.
(BR‑EP‑04)
8. 	System redirects the user to the Dashboard or Program Overview.
(FS‑EP‑NAV‑02)
9. 	System logs the program activation event.
(Analytics requirement)

## Alternate Flows
A1 — User Already Has an Active Program
- 	Step 3 detects an existing active program.
- 	System displays a message:
“Activating this program will replace your current program.”
(BR‑EP‑08)
- 	User confirms activation.
- 	System continues at Step 4.
A2 — User Cancels Activation
- 	User declines the confirmation prompt.
- 	No changes are made.
- 	User remains on the Program Detail page.

## Exception Flows
E1 — Authentication Failure
- 	Step 2 fails.
- 	System redirects user to Login page.
(BR‑EP‑05)
E2 — Program Initialization Error
- 	Step 5 or 6 fails due to system/database issue.
- 	System displays an error message.
(BR‑EP‑01 fallback)
- 	No program is activated.

## Non‑Functional Requirements
- 	Security: Only authenticated users may activate programs. (BR‑EP‑05)
- 	Performance: Activation must complete quickly.
- 	Responsive UI: Activation button and confirmation modal must render correctly on all device sizes.
- 	Accessibility: Activation controls must support keyboard navigation and screen readers. (SRS‑A11Y‑01)
- 	Analytics: Program activation events must be logged.

## Related UI Screens
- 	UIS‑EP‑03 — Program Detail Page
- 	UIS‑EP‑08 — Activation Confirmation Modal
- 	UIS‑DASH‑01 — Dashboard
- 	UIS‑GLOBAL‑HEADER‑01
- 	UIS‑GLOBAL‑FOOTER‑01

## flowchart TD

    %% Entry
    A[User Clicks Activate Program] --> B{Authenticated?}

    %% Auth Check
    B -->|No| Z1[Redirect to Login Page]
    B -->|Yes| C[Check for Existing Active Program]

    %% Active Program Check
    C --> D{Active Program Exists?}
    D -->|Yes| E[Show Replace Program Confirmation]
    E --> F{User Confirms?}
    F -->|No| G[Cancel Activation → End]
    F -->|Yes| H[Retrieve Program Structure]

    D -->|No| H[Retrieve Program Structure]

    %% Initialization
    H --> I[Initialize Program Progress (Week 1, Day 1)]
    I --> J[Save Active Program Assignment]

    %% Save Check
    J --> K{Save Successful?}
    K -->|No| E1[Display Error Message]
    K -->|Yes| L[Show Activation Confirmation]

    %% Redirect + Analytics
    L --> M[Redirect to Dashboard or Program Overview]
    M --> N[Log Activation Event]

    %% End
    N --> END[Program Activated]