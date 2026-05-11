# UC‑EP‑03 — Filter Programs

Use Case ID
UC‑EP‑03
Use Case Name
Filter Programs
Module
Exercise Programs
Primary Actor
Authenticated User
## Purpose
To allow an authenticated user to filter the list of available exercise programs based on criteria such as difficulty, duration, and fitness goals. This use case helps users quickly narrow down programs that match their preferences, improving discoverability and reducing decision friction.

## Stakeholders & Interests
- 	User — wants to quickly find programs that match their fitness level, goals, and available time.
- 	System — must apply filters accurately and efficiently.
- 	Product Owner — wants a smooth, intuitive filtering experience to improve program discovery.
- 	Analytics Team — needs to track filter usage patterns.
- 	Security Team — requires that only authenticated users can view program data.

## Preconditions
- 	User is authenticated.
- 	User is on the Exercise Programs page (UC‑EP‑01).
- 	System has available program metadata (difficulty, duration, goals).

## Postconditions
Success
- 	System displays a filtered list of programs based on user‑selected criteria.
Failure
- 	System displays an empty state if no programs match the filters.
- 	User remains on the Exercise Programs page.

## Trigger
User selects one or more filter options (e.g., difficulty, duration, goals) on the Exercise Programs page.

## Main Success Scenario (Basic Flow)
1. 	User selects one or more filter criteria (e.g., Beginner, 4‑week programs, Strength).
(BR‑EP‑06)
2. 	System verifies that the user is authenticated.
(BR‑EP‑05)
3. 	System applies the selected filters to the program list.
(BR‑EP‑06)
4. 	System retrieves programs that match the selected criteria.
(BR‑EP‑06)
5. 	System displays the filtered list of programs.
(BR‑EP‑06)
6. 	User may select a program from the filtered list to view details (UC‑EP‑02).
(BR‑EP‑03)
7. 	System logs the filter usage event.
(Analytics requirement)

## Alternate Flows
A1 — No Programs Match Filter Criteria
- 	Step 4 returns zero results.
- 	System displays an empty state message.
(BR‑EP‑06 fallback)
A2 — User Clears Filters
- 	User selects Clear Filters.
- 	System resets the program list to show all programs.
(BR‑EP‑06)
A3 — User Changes Filter Criteria
- 	User modifies filter selections.
- 	System reapplies filters and updates the list.

## Exception Flows
E1 — Authentication Failure
- 	Step 2 fails.
- 	System redirects user to Login page.
(BR‑EP‑05)
E2 — Filter Processing Error
- 	Step 3 or 4 fails due to system/database issue.
- 	System displays an error message.
(BR‑EP‑01 fallback)
- 	User remains on the Exercise Programs page.

## Non‑Functional Requirements
- 	Security: Only authenticated users may filter programs. (BR‑EP‑05)
- 	Performance: Filter results must update quickly.
- 	Responsive UI: Filter controls and results must render correctly on all device sizes.
- 	Accessibility: Filter controls must support keyboard navigation and screen readers. (SRS‑A11Y‑01)
- 	Analytics: Filter usage events must be logged.

## Related UI Screens
- 	UIS‑EP‑01 — Program List Page
- 	UIS‑EP‑06 — Filter Controls
- 	UIS‑EP‑02 — Program Card Layout
- 	UIS‑GLOBAL‑HEADER‑01
- 	UIS‑GLOBAL‑FOOTER‑01

## flowchart TD

    %% Entry
    A[User Selects Filter Criteria] --> B{Authenticated?}

    %% Auth Check
    B -->|No| Z1[Redirect to Login Page]
    B -->|Yes| C[Apply Filters]

    %% Filter Processing
    C --> D[Retrieve Matching Programs]
    D --> E{Programs Found?}

    %% Results
    E -->|No| A1[Display Empty State]
    E -->|Yes| F[Display Filtered Program List]

    %% User Interaction
    F --> G{User Selects Program?}
    G -->|No| H[User Modifies or Clears Filters]
    G -->|Yes| I[Navigate to Program Detail (UC‑EP‑02)]

    %% Analytics
    F --> J[Log Filter Usage Event]

    %% End
    I --> END[Program Detail Displayed]
    J --> END

## Actors
| Actor      | Type       | Description |
|------------|------------|-------------|
| App User   | Primary    | Interacts with the UI and views filters the list of programs |