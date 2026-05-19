# UC‑LW‑03 — View Workout History
Use Case ID  
UC‑LW‑03
Use Case Name  
View Workout History

## Module  
Workout Logging

## Purpose
To allow a user to view their historical workout logs, including dates, exercises performed, and recorded metrics. This enables users to track progress over time, review past performance, and access detailed workout entries.

## Primary Actor
End User

## Stakeholders & Interests
• User — wants quick access to past workouts and detailed logs.
• System — must retrieve and display historical data efficiently.
• Product Owner — wants a clean, intuitive history interface.
• Analytics Team — relies on historical logs for charts, trends, and summaries.
• Coaching/Program Logic — uses historical data to inform recommendations and progress tracking.

## Preconditions
• User is authenticated.
• At least one workout log exists (or system must handle empty state).
• System is online and accessible.

## Postconditions
### Success  
• User views a list of past workout logs.
• User may select a specific log for detailed viewing.

### Failure  
• No history is displayed.
• System displays appropriate error messaging.

### Trigger
User selects “Workout History” from the Dashboard or navigation menu.

Main Success Scenario (Basic Flow)
User navigates to the Workout History screen.
(BR‑LW‑40)

System retrieves the list of past workout logs for the user.
(BR‑LW‑41)

System displays the workout history list, including dates and summary metrics.
(BR‑LW‑42)

User scrolls or navigates through the list.
(BR‑LW‑43)

User selects a specific workout entry.
(BR‑LW‑44)

System retrieves the detailed workout log for the selected date.
(BR‑LW‑45)

System displays the detailed log, including exercises, sets, reps, weight, duration, and notes.
(BR‑LW‑46)

## Alternate Flows
A1 — No Workout History Exists
• Step 2 returns an empty result.
• System displays an empty‑state message such as “No workouts logged yet.”
(BR‑LW‑47)
• User may navigate back or begin logging workouts.

A2 — User Filters or Sorts History
• User applies filters (e.g., date range, program, exercise type).
• System updates the history list accordingly.
(BR‑LW‑48)

A3 — User Cancels Detail View
• User selects “Back” from the detailed log view.
• System returns to the history list.
(BR‑LW‑49)

## Exception Flows
E1 — History Retrieval Failure
• Step 2 fails due to backend or database issue.
• System displays a generic error message.
(BR‑LW‑50 fallback)
• User remains on the Workout History screen.

E2 — Detail Retrieval Failure
• Step 6 fails due to missing or corrupted log data.
• System displays an error message.
(BR‑LW‑51)
• User is returned to the history list.

E3 — Network Failure
• Retrieval fails due to connectivity issues.
• System displays a “Network error” message.
• User may retry once connection is restored.

## Non‑Functional Requirements
• Performance: History list must load quickly.
• Usability: History must be easy to navigate and scan.
• Accessibility: Must support keyboard navigation and screen readers. (SRS‑A11Y‑01)
• Reliability: History data must be retrieved consistently.
• Scalability: Must support large volumes of historical logs.

## Related UI Screens
• UIS‑HISTORY‑01 — Workout History List  
• UIS‑HISTORY‑02 — Workout Detail View  
• UIS‑DASH‑01 — Dashboard  
• UIS‑GLOBAL‑HEADER‑01  
• UIS‑GLOBAL‑FOOTER‑01

## Flowchart TD

%% Entry
A[User Navigates to Workout History] --> B[Retrieve Workout History]

%% Data Load
B --> C{History Exists?}
C -->|No| A1[Display Empty State]

%% Display List
C -->|Yes| D[Display History List]

%% User Interaction
D --> E[User Selects Workout Entry]
E --> F[Retrieve Detailed Log]

%% Detail Retrieval
F --> G{Detail Found?}
G -->|No| E2[Display Detail Retrieval Error]

%% Display Detail
G -->|Yes| H[Display Detailed Workout Log]

%% End
H --> END[History Viewed]