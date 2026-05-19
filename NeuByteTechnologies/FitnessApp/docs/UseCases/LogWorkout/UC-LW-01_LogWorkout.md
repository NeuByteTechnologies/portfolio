# UC‑LW‑01 — Log Workout
Use Case ID  
UC‑LW‑01
Use Case Name  
Log Workout
Module  
Workout Logging

## Purpose
To allow a user to record workout activity for the current day’s assigned exercise program, ensuring accurate tracking of sets, reps, weight, duration, and other exercise‑specific metrics. Logged workouts update progress indicators, streaks, and analytics.

## Primary Actor
End User

Stakeholders & Interests
• User — wants a fast, intuitive way to log exercises and track progress.
• System — must validate workout entries and store them reliably.
• Product Owner — wants a smooth logging experience with minimal friction.
• Analytics Team — needs accurate workout data for charts, summaries, and trends.
• Coaching/Program Logic — requires logged data to update streaks, progress, and recommendations.

## Preconditions
• User is authenticated.
• User has an active exercise program.
• Daily exercise list is available for the current date.
• System is online and accessible.

## Postconditions
### Success  
• Workout log is saved to the user’s workout history.
• Dashboard metrics, streaks, and progress indicators are updated.
• Confirmation message is displayed.

### Failure  
• No workout data is saved.
• System displays appropriate error messaging.
• User remains on the Log Workout screen.

### Trigger
User selects “Start Workout” or navigates to the Log Workout screen.

### Main Success Scenario (Basic Flow)
1. User navigates to the Log Workout screen.
(BR‑LW‑01)
2. System retrieves the exercises scheduled for the current day.
(BR‑LW‑02)
3. System displays the exercise list with input fields for sets, reps, weight, duration, or other metrics.
(BR‑LW‑03)
4. User enters metrics for each exercise performed.
(BR‑LW‑04)
5. System validates that all required fields for each exercise are populated.
(BR‑LW‑05)
6. System validates that numeric values (sets, reps, weight, duration) are within acceptable ranges.
(BR‑LW‑06)
7. User submits the workout log.
(BR‑LW‑04)
8. System saves the workout log to the user’s workout history.
(BR‑LW‑07)
9. System updates dashboard metrics, streaks, and progress indicators.
(BR‑LW‑08)
10. System logs the successful workout event for analytics.
(Analytics requirement)
11. System displays a confirmation message.
(BR‑LW‑09)

### Alternate Flows
A1 — Missing Required Fields
• Step 5 fails.
• System highlights missing fields and displays a “Required fields missing” message.
(BR‑LW‑05)
• User corrects the data and resubmits.

A2 — Invalid Numeric Values
• Step 6 fails.
• System displays an “Invalid value” message for the affected fields.
(BR‑LW‑06)
• User corrects the values and resubmits.

A3 — Partial Workout Logging
• User chooses to log only some exercises.
• System saves partial data and marks remaining exercises as incomplete.
(BR‑LW‑10)

### Exception Flows
E1 — No Program Data Available
• Step 2 fails due to missing or corrupted program data.
• System displays an error message and suggests refreshing or checking program settings.
(BR‑LW‑11)
• User remains on the Log Workout screen.

E2 — System Error During Save
• Step 8 fails due to backend or database issue.
• System displays a generic error message.
(BR‑LW‑12 fallback)
• No data is saved.
• User remains on the Log Workout screen.

E3 — Network Failure
• Submission fails due to connectivity issues.
• System displays a “Network error” message.
• User may retry once connection is restored.

## Non‑Functional Requirements
• Performance: Workout logging must complete quickly.
• Usability: Input fields must be easy to navigate and edit.
• Accessibility: Logging interface must support keyboard navigation and screen readers. (SRS‑A11Y‑01)
• Reliability: Workout logs must be stored with high consistency.
• Analytics: Workout events must be logged for trend analysis.

## Related UI Screens
• UIS‑LW‑01 — Log Workout Page  
• UIS‑DASH‑01 — Dashboard  
• UIS‑PROGRAM‑01 — Program Overview  
• UIS‑GLOBAL‑HEADER‑01  
• UIS‑GLOBAL‑FOOTER‑01

## Flowchart TD

%% Entry
A[User Navigates to Log Workout] --> B[Retrieve Today's Exercises]

%% Data Load
B --> C{Exercises Available?}
C -->|No| E1[Display Program Data Error]

%% Display Form
C -->|Yes| D[Display Exercise List & Input Fields]

%% User Input
D --> E[User Enters Metrics]
E --> F{Required Fields Populated?}
F -->|No| A1[Display Missing Fields Error]

%% Value Validation
F -->|Yes| G{Values Valid?}
G -->|No| A2[Display Invalid Value Error]

%% Save
G -->|Yes| H[Save Workout Log]
H --> I{Save Successful?}
I -->|No| E2[Display System Error]

%% Update & Confirm
I -->|Yes| J[Update Dashboard & Streaks]
J --> K[Log Workout Event]
K --> L[Display Confirmation Message]

%% End
L --> END[Workout Logged]