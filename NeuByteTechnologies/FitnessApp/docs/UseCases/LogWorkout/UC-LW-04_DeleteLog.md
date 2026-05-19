# UC‑LW‑04 — Delete Workout Log
Use Case ID  
UC‑LW‑04
Use Case Name  
Delete Workout Log
Module  
Workout Logging

## Purpose
To allow a user to permanently delete a previously logged workout entry. This ensures users can remove incorrect or unwanted logs while maintaining data integrity across analytics, streaks, and progress indicators.

## Primary Actor
End User

## Stakeholders & Interests
• User — wants the ability to remove incorrect or duplicate workout logs.
• System — must ensure safe deletion and maintain historical data consistency.
• Product Owner — wants a clear, safe deletion workflow with confirmation.
• Analytics Team — requires accurate historical data after deletions.
• Coaching/Program Logic — depends on accurate logs for progress tracking.

## Preconditions
• User is authenticated.
• A workout log exists for the selected date.
• User has permission to delete their own workout logs.
• System is online and accessible.

## Postconditions
### Success  
• Workout log is permanently deleted.
• Dashboard metrics, streaks, and analytics are recalculated.
• Confirmation message is displayed.

### Failure  
• No data is deleted.
• System displays appropriate error messaging.
• User remains on the Workout History or Log Detail screen.

### Trigger
User selects “Delete Log” from a previously logged workout.

Main Success Scenario (Basic Flow)
User selects a previously logged workout to delete.
(BR‑LW‑60)

System retrieves the workout log for the selected date.
(BR‑LW‑61)

System displays the workout details along with a Delete Log option.
(BR‑LW‑62)

User selects Delete Log.
(BR‑LW‑63)

System displays a confirmation prompt (e.g., “Are you sure you want to delete this workout?”).
(BR‑LW‑64)

User confirms deletion.
(BR‑LW‑63)

System deletes the workout log from the user’s history.
(BR‑LW‑65)

System recalculates dashboard metrics, streaks, and analytics.
(BR‑LW‑66)

System logs the deletion event for analytics.
(Analytics requirement)

System displays a confirmation message.
(BR‑LW‑67)

## Alternate Flows
A1 — User Cancels Deletion
• Step 6: User selects “Cancel.”
• System closes the confirmation prompt.
• No data is deleted.
• User remains on the workout detail view.
(BR‑LW‑68)

A2 — Log Already Deleted or Missing
• Step 2 fails because the log no longer exists.
• System displays a “Log not found” message.
(BR‑LW‑69)
• User is returned to the Workout History screen.

## Exception Flows
E1 — System Error During Deletion
• Step 7 fails due to backend or database issue.
• System displays a generic error message.
(BR‑LW‑70 fallback)
• No data is deleted.
• User remains on the workout detail view.

E2 — Network Failure
• Deletion request fails due to connectivity issues.
• System displays a “Network error” message.
• User may retry once connection is restored.

## Non‑Functional Requirements
• Safety: Deletion must require explicit user confirmation.
• Performance: Deletion must complete quickly.
• Usability: Confirmation prompt must be clear and unambiguous.
• Accessibility: Must support keyboard navigation and screen readers. (SRS‑A11Y‑01)
• Auditability: System must track deletion events for analytics.

## Related UI Screens
• UIS‑HISTORY‑02 — Workout Detail View  
• UIS‑HISTORY‑01 — Workout History List  
• UIS‑GLOBAL‑HEADER‑01  
• UIS‑GLOBAL‑FOOTER‑01

## Flowchart TD

%% Entry
A[User Selects Logged Workout to Delete] --> B[Retrieve Workout Log]

%% Data Load
B --> C{Log Found?}
C -->|No| A2[Display Log Not Found Error]

%% Display Detail
C -->|Yes| D[Display Workout Detail & Delete Option]

%% User Action
D --> E[User Selects Delete Log]
E --> F[Display Confirmation Prompt]

%% Confirmation
F --> G{User Confirms?}
G -->|No| A1[Cancel Deletion]

%% Delete
G -->|Yes| H[Delete Workout Log]
H --> I{Delete Successful?}
I -->|No| E1[Display System Error]

%% Update & Confirm
I -->|Yes| J[Recalculate Dashboard & Analytics]
J --> K[Log Deletion Event]
K --> L[Display Confirmation Message]

%% End
L --> END[Workout Log Deleted]