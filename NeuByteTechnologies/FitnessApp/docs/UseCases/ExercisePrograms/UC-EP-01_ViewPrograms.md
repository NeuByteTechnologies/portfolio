# UC‑EP‑01 — View Programs

## Use Case ID
UC‑EP‑01
Use Case Name
View Programs
Module
Exercise Programs
Primary Actor
Authenticated User

## Purpose
To allow an authenticated user to view all available exercise programs in a centralized list, enabling them to browse, compare, and select a program to activate or review. This use case provides the entry point into the Exercise Program module and ensures users can easily discover structured workout plans.

## Primary Actor

| Actor      | Type       | Description |
|------------|------------|-------------|
| App User   | Primary    | Interacts with the UI and views a given program detail |

## Stakeholders & Interests
- 	User — wants to browse available exercise programs and choose one that fits their goals.
- 	System — must retrieve accurate program metadata and present it consistently.
- 	Product Owner — wants a clean, intuitive program discovery experience.
- 	Security Team — requires that only authenticated users can view program data.
- 	Analytics Team — needs to track program list views and selections.

## Preconditions
- 	User is authenticated.
- 	User is on the Exercise Programs page or navigates to it from the Dashboard.
- 	System can retrieve program metadata (name, duration, goals, difficulty).

## Postconditions
Success
- 	System displays a list of available exercise programs.
- 	User may select a program to view details (UC‑EP‑02).
Failure
- 	System displays an empty state or error message if programs cannot be retrieved.
- 	User remains on the Exercise Programs page.

## Trigger
User navigates to the Exercise Programs page from the Dashboard or global menu.

## Main Success Scenario (Basic Flow)
1. 	User navigates to the Exercise Programs page.
(BR‑EP‑01)
2. 	System verifies that the user is authenticated.
(BR‑EP‑05)
3. 	System retrieves the list of available exercise programs.
(BR‑EP‑01)
4. 	System displays each program with:
- 	Program name
- 	Duration (weeks)
- 	High‑level goals
- 	Difficulty level
(BR‑EP‑02)
5. 	System displays an option to select a program.
(BR‑EP‑03)
6. 	User selects a program from the list.
7. 	System navigates the user to the Program Detail page (UC‑EP‑02).
(BR‑EP‑04)
8. 	System logs the program list view event.
(Analytics requirement)

## Alternate Flows
A1 — No Programs Available
- 	Step 3 returns zero results.
- 	System displays an empty state message.
(BR‑EP‑01 fallback)
A2 — User Views List but Does Not Select a Program
- 	Steps 1–5 occur.
- 	User leaves the page or navigates elsewhere.
- 	No further action is taken.

## Exception Flows
E1 — Authentication Failure
- 	Step 2 fails.
- 	System redirects user to Login page.
(BR‑EP‑05)
E2 — Program Retrieval Error
- 	Step 3 fails due to system/database issue.
- 	System displays an error message.
(BR‑EP‑01 fallback)
- 	User remains on the Exercise Programs page.

## Non‑Functional Requirements
- 	Security: Only authenticated users may view programs. (BR‑EP‑05)
- 	Performance: Program list must load quickly.
- 	Responsive UI: Program cards must render correctly on all device sizes.
- 	Accessibility: Program list must support keyboard navigation and screen readers. (SRS‑A11Y‑01)
- 	Analytics: Program list view events must be logged.

## Related UI Screens
- 	UIS‑EP‑01 — Program List Page
- 	UIS‑EP‑02 — Program Card Layout
- 	UIS‑GLOBAL‑HEADER‑01
- 	UIS‑GLOBAL‑FOOTER‑01

## flowchart TD

    %% Entry
    A[User Navigates to Exercise Programs Page] --> B{Authenticated?}

    %% Auth Check
    B -->|No| Z1[Redirect to Login Page]
    B -->|Yes| C[Retrieve Program List]

    %% Data Retrieval
    C --> D{Programs Found?}
    D -->|No| A1[Display Empty State]
    D -->|Yes| E[Display Program List]

    %% User Interaction
    E --> F{User Selects a Program?}
    F -->|No| G[User Leaves Page → End]
    F -->|Yes| H[Navigate to Program Detail]

    %% Analytics
    H --> I[Log Program List View Event]

    %% End
    I --> END[Program Detail Displayed]

    %% Exception Flow
    C -->|System Error| E1[Display Retrieval Error]
    
## Actors
| Actor      | Type       | Description |
|------------|------------|-------------|
| App User   | Primary    | Interacts with the UI and views or selects a given program |