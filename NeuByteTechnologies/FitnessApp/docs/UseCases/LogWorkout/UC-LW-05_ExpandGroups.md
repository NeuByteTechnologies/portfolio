## UC‑LW‑05 — Expand Exercise Groups
Use Case ID  
UC‑LW‑05
Use Case Name  
Expand Exercise Groups

## Module  
Workout Logging

## Purpose
To allow a user to expand or collapse grouped exercises (such as supersets, circuits, or grouped movements) within the Log Workout interface. This improves navigation, reduces visual clutter, and enables users to focus on one group at a time while logging their workout.

## Primary Actor
End User

## Stakeholders & Interests
• User — wants a clean, organized workout logging interface that avoids overwhelming scrolling.
• System — must correctly load and display grouped exercises.
• Product Owner — wants intuitive UI behavior for grouped exercise structures.
• Coaching/Program Logic — depends on accurate grouping to reflect program design.
• Analytics Team — requires consistent grouping metadata for reporting.

## Preconditions
• User is authenticated.
• User is on the Log Workout screen.
• The current workout contains at least one exercise group (e.g., superset, circuit).
• System is online and accessible.

## Postconditions
### Success  
• The selected exercise group expands or collapses.
• Exercises within the group become visible or hidden accordingly.

### Failure  
• No UI change occurs.
• System displays an appropriate error message (rare).

### Trigger
User selects an exercise group header (e.g., “Superset A”) to expand or collapse it.

Main Success Scenario (Basic Flow)
User navigates to the Log Workout screen.
(BR‑LW‑80)

System displays the list of exercises, including grouped exercises.
(BR‑LW‑81)

User selects an exercise group header.
(BR‑LW‑82)

System determines whether the group is currently expanded or collapsed.
(BR‑LW‑83)

System toggles the group state (expand → collapse or collapse → expand).
(BR‑LW‑84)

System displays or hides the exercises within the group accordingly.
(BR‑LW‑85)

### Alternate Flows
A1 — Group Contains No Exercises
• Step 2 loads a group with zero exercises (data issue).
• System displays an empty‑state message within the group.
(BR‑LW‑86)
• User may collapse the group or continue logging other exercises.

A2 — User Collapses All Groups
• User collapses all exercise groups for a simplified view.
• System maintains collapsed state until user expands a group.
(BR‑LW‑87)

### Exception Flows
E1 — Group Toggle Fails
• Step 5 fails due to UI or data error.
• System displays a generic error message.
(BR‑LW‑88 fallback)
• Group remains in its previous state.

E2 — Network Failure (Remote Data Refresh)
• If group metadata requires a refresh and the network fails:
• System displays a “Network error” message.
• Previously loaded state remains visible.

## Non‑Functional Requirements
• Performance: Group toggling must occur instantly.
• Usability: Group headers must be clearly identifiable and easy to tap/click.
• Accessibility: Expand/collapse controls must support keyboard navigation and screen readers. (SRS‑A11Y‑01)
• Reliability: Group state must remain consistent during the session.
• Visual Clarity: Expanded groups must clearly show child exercises.

## Related UI Screens
• UIS‑LW‑01 — Log Workout Page  
• UIS‑GLOBAL‑HEADER‑01  
• UIS‑GLOBAL‑FOOTER‑01

## Flowchart TD

%% Entry
A[User on Log Workout Screen] --> B[Display Exercises with Groups]

%% User Action
B --> C[User Selects Group Header]

%% Determine State
C --> D{Group Expanded?}

%% Collapse
D -->|Yes| E[Collapse Group]
E --> F[Hide Child Exercises]
F --> END[Group Collapsed]

%% Expand
D -->|No| G[Expand Group]
G --> H[Display Child Exercises]
H --> END[Group Expanded]

%% Exception
C -->|Error| E1[Display Toggle Error]