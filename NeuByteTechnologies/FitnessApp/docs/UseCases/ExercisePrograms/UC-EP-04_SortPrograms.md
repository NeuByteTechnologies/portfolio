# UC‑EP‑04 — Sort Programs

Use Case ID
UC‑EP‑04
Use Case Name
Sort Programs
Module
Exercise Programs

## Purpose
To allow an authenticated user to sort the list of available exercise programs by criteria such as difficulty, duration, alphabetical order, or popularity. This use case helps users quickly organize programs in a meaningful way, improving discoverability and reducing cognitive load when browsing.

## Primary Actor
Authenticated User
## Stakeholders & Interests
- 	User — wants to easily reorder programs to find the most relevant options.
- 	System — must apply sorting accurately and efficiently.
- 	Product Owner — wants a smooth, intuitive sorting experience that complements filtering.
- 	Analytics Team — needs to track sorting behavior to understand user preferences.
- 	Security Team — requires that only authenticated users can view program data.

## Preconditions
- 	User is authenticated.
- 	User is on the Exercise Programs page (UC‑EP‑01).
- 	System has available program metadata (difficulty, duration, name, popularity).

## Postconditions
Success
- 	System displays the program list sorted according to the selected criteria.
Failure
- 	System displays an error message if sorting fails.
- 	User remains on the Exercise Programs page.

## Trigger
User selects a Sort By option (e.g., Difficulty, Duration, A–Z, Popularity).

Main Success Scenario (Basic Flow)
1. 	User selects a sorting option from the Sort control.
(BR‑EP‑07)
2. 	System verifies that the user is authenticated.
(BR‑EP‑05)
3. 	System applies the selected sorting logic to the program list.
(BR‑EP‑07)
4. 	System retrieves the sorted program list.
(BR‑EP‑07)
5. 	System displays the sorted list of programs.
(BR‑EP‑07)
6. 	User may select a program from the sorted list to view details (UC‑EP‑02).
(BR‑EP‑03)
7. 	System logs the sorting event for analytics.
(Analytics requirement)

Alternate Flows
A1 — User Changes Sorting Option
- 	User selects a different sort option.
- 	System reapplies sorting and updates the list.
A2 — User Clears Sorting
- 	User selects Reset or Default Sort.
- 	System restores the default program order.

Exception Flows
E1 — Authentication Failure
- 	Step 2 fails.
- 	System redirects user to Login page.
(BR‑EP‑05)
E2 — Sorting Error
- 	Step 3 or 4 fails due to system/database issue.
- 	System displays an error message.
(BR‑EP‑01 fallback)
- 	User remains on the Exercise Programs page.

Non‑Functional Requirements
- 	Security: Only authenticated users may sort programs. (BR‑EP‑05)
- 	Performance: Sorting must occur instantly or near‑instantly.
- 	Responsive UI: Sort controls must render correctly on all device sizes.
- 	Accessibility: Sort controls must support keyboard navigation and screen readers. (SRS‑A11Y‑01)
- 	Analytics: Sorting events must be logged.

Related UI Screens
- 	UIS‑EP‑01 — Program List Page
- 	UIS‑EP‑07 — Sort Controls
- 	UIS‑EP‑02 — Program Card Layout
- 	UIS‑GLOBAL‑HEADER‑01
- 	UIS‑GLOBAL‑FOOTER‑01

## flowchart TD

    %% Entry
    A[User Selects Sort Option] --> B{Authenticated?}

    %% Auth Check
    B -->|No| Z1[Redirect to Login Page]
    B -->|Yes| C[Apply Sorting Logic]

    %% Sorting
    C --> D[Retrieve Sorted Program List]
    D --> E{Programs Retrieved?}

    %% Results
    E -->|No| E1[Display Sorting Error]
    E -->|Yes| F[Display Sorted Program List]

    %% User Interaction
    F --> G{User Selects Program?}
    G -->|No| H[User Changes or Clears Sort]
    G -->|Yes| I[Navigate to Program Detail (UC‑EP‑02)]

    %% Analytics
    F --> J[Log Sorting Event]

    %% End
    I --> END[Program Detail Displayed]
    J --> END
    
## Actors
| Actor      | Type       | Description |
|------------|------------|-------------|
| App User   | Primary    | Interacts with the UI and sorts the list of programs |