# UC‑LW‑02 — Edit Workout Log
Use Case ID  
UC‑LW‑02
Use Case Name  
Edit Workout Log
Module  
Workout Logging

## Purpose
To allow a user to modify previously logged workout entries, ensuring accuracy of recorded sets, reps, weight, duration, and other exercise‑specific metrics. Edits must update historical data, analytics, and progress indicators while maintaining data integrity.

## Primary Actor
End User

## Stakeholders & Interests
• User — wants the ability to correct mistakes or update logged values.
• System — must validate edits and maintain accurate historical records.
• Product Owner — wants a simple, intuitive editing experience.
• Analytics Team — requires updated data to reflect accurate trends and summaries.
• Coaching/Program Logic — depends on accurate logs for progress tracking and recommendations.

## Preconditions
• User is authenticated.
• A workout log exists for the selected date.
• System is online and accessible.
• User has permission to edit their own workout logs.

## Postconditions
### Success  
• Updated workout log is saved.
• Dashboard metrics, streaks, and analytics reflect the updated values.
• Confirmation message is displayed.

### Failure  
• No changes are saved.
• System displays appropriate error messaging.
• User remains on the Edit Log screen.

### Trigger
User selects “Edit Log” from a previously logged workout.

Main Success Scenario (Basic Flow)
User selects a previously logged workout to edit.
(BR‑LW‑20)

System retrieves the existing workout log for the selected date.
(BR‑LW‑21)

System displays the logged exercises with their previously entered metrics.
(BR‑LW‑22)

User updates sets, reps, weight, duration, or other metrics.
(BR‑LW‑23)

System validates that all required fields remain populated.
(BR‑LW‑24)

System validates that updated numeric values are within acceptable ranges.
(BR‑LW‑25)

User submits the updated workout log.
(BR‑LW‑23)

System saves the updated workout log.
(BR‑LW‑26)

System recalculates dashboard metrics, streaks, and analytics based on updated values.
(BR‑LW‑27)

System logs the edit event for analytics.
(Analytics requirement)

System displays a confirmation message.
(BR‑LW‑28)

### Alternate Flows
A1 — Missing Required Fields
• Step 5 fails.
• System highlights missing fields and displays a “Required fields missing” message.
(BR‑LW‑24)
• User corrects the data and resubmits.

A2 — Invalid Numeric Values
• Step 6 fails.
• System displays an “Invalid value” message for the affected fields.
(BR‑LW‑25)
• User corrects the values and resubmits.

A3 — User Cancels Edit
• User selects “Cancel” instead of saving.
• System discards changes and returns to the workout history or detail view.
(BR‑LW‑29)

### Exception Flows
E1 — Log Not Found
• Step 2 fails due to missing or corrupted log data.
• System displays an error message.
(BR‑LW‑30)
• User is returned to workout history.

E2 — System Error During Save
• Step 8 fails due to backend or database issue.
• System displays a generic error message.
(BR‑LW‑31 fallback)
• No changes are saved.
• User remains on the Edit Log screen.

E3 — Network Failure
• Submission fails due to connectivity issues.
• System displays a “Network error” message.
• User may retry once connection is restored.

## Non‑Functional Requirements
• Performance: Edits must save quickly.
• Usability: Editing interface must be intuitive and easy to navigate.
• Accessibility: Must support keyboard navigation and screen readers. (SRS‑A11Y‑01)
• Reliability: Edited logs must be stored with high consistency.
• Auditability: System must track edit events for analytics.

## Related UI Screens
• UIS‑LW‑02 — Edit Workout Log Page  
• UIS‑LW‑01 — Log Workout Page  
• UIS‑HISTORY‑01 — Workout History  
• UIS‑GLOBAL‑HEADER‑01  
• UIS‑GLOBAL‑FOOTER‑01

## Flowchart TD

%% Entry
A[User Selects Logged Workout to Edit] --> B[Retrieve Existing Workout Log]

%% Data Load
B --> C{Log Found?}
C -->|No| E1[Display Log Not Found Error]

%% Display Form
C -->|Yes| D[Display Logged Metrics]

%% User Input
D --> E[User Updates Metrics]
E --> F{Required Fields Populated?}
F -->|No| A1[Display Missing Fields Error]

%% Value Validation
F -->|Yes| G{Values Valid?}
G -->|No| A2[Display Invalid Value Error]

%% Save
G -->|Yes| H[Save Updated Workout Log]
H --> I{Save Successful?}
I -->|No| E2[Display System Error]

%% Update & Confirm
I -->|Yes| J[Recalculate Dashboard & Analytics]
J --> K[Log Edit Event]
K --> L[Display Confirmation Message]

%% End
L --> END[Workout Log Updated]
