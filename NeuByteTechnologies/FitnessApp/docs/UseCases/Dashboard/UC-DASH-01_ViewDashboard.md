# UC‑DASH‑01 — View Dashboard

Use Case ID
UC‑DASH‑01
Use Case Name
View Dashboard
Module
Dashboard

## Primary Actor

| Actor      | Type       | Description |
|------------|------------|-------------|
| App User   | Primary    | Creates their own account through the app UI |

## Stakeholders & Interests
- 	User — wants immediate access to personalized fitness information after login.
- 	System — must retrieve and display accurate, up‑to‑date dashboard data.
- 	Product Owner — wants a clean, responsive, engaging dashboard experience.
- 	Analytics Team — requires dashboard load events for usage tracking.
- 	Security Team — requires access control and secure data handling.

## Preconditions
- 	User is authenticated.
- 	User has a valid session token.
- 	Required user, program, and workout data exists (or appropriate fallbacks are available).
- 	System is online and able to retrieve dashboard data.

## Postconditions
Success
- 	Dashboard is displayed with all available user‑specific data.
- 	Dashboard load event is logged.
Failure
- 	Dashboard displays fallback values or error messages where data is missing.
- 	User remains on the Dashboard page.

## Trigger
User successfully logs in or navigates to the Dashboard from the global menu.

## Main Success Scenario (Basic Flow)
1. 	System verifies that the user is authenticated.
(BR‑DASH‑22)
2. 	System loads the Dashboard layout.
(BR‑DASH‑01)
3. 	System displays the global header (logo, notifications, menu).
(BR‑DASH‑16)
4. 	System displays the logged‑in user’s email address.
(BR‑DASH‑02)
5. 	System displays the user’s last login timestamp.
(BR‑DASH‑03)
6. 	System retrieves and displays the user’s selected exercise program name.
(BR‑DASH‑04)
7. 	System displays the user’s current week/day in the program.
(BR‑DASH‑05)
8. 	System retrieves and displays the user’s most recent recorded weight.
(BR‑DASH‑06)
9. 	System calculates and displays the user’s weight trend.
(BR‑DASH‑07)
10. System retrieves and displays today’s workout summary (exercise count, estimated duration).
(BR‑DASH‑08)
11. System displays a “Start Workout” button.
(BR‑DASH‑09)
12. System retrieves and displays the user’s most recent 3–5 logged workouts.
(BR‑DASH‑10)
13. System allows the user to select a recent activity entry to view/edit details.
(BR‑DASH‑11)
14. System displays progress summary cards (weekly, monthly, streaks).
(BR‑DASH‑12)
15. System retrieves and displays system‑generated notifications.
(BR‑DASH‑13)
16. System renders the dashboard in a responsive layout for all device sizes.
(BR‑DASH‑14)
17. System refreshes dashboard data on page load.
(BR‑DASH‑15)
18. System logs the dashboard load event.
(BR‑DASH‑23)

## Alternate Flows
A1 — Missing or Corrupted User Data
- 	Occurs during steps 4–15.
- 	System displays fallback values.
(BR‑DASH‑18, BR‑DASH‑19)
A2 — Workout Summary Unavailable
- 	Step 10 fails.
- 	System displays a workout summary error message.
(BR‑DASH‑20)
A3 — Notifications Unavailable
- 	Step 15 fails.
- 	System displays an empty state or error message.
(BR‑DASH‑13)

## Exception Flows
E1 — Authentication Failure
- 	Step 1 fails.
- 	System redirects user to Login page.
(BR‑DASH‑22)
E2 — Data Retrieval Failure
- 	Any data retrieval step fails due to system/database error.
- 	System displays error messaging or fallback values.
(BR‑DASH‑18, BR‑DASH‑20)

## Non‑Functional Requirements
- 	Responsive UI: Dashboard must render correctly on mobile, tablet, and desktop. (BR‑DASH‑14)
- 	Performance: Dashboard data must load quickly and refresh efficiently. (BR‑DASH‑15)
- 	Security: Only authenticated users may access the dashboard. (BR‑DASH‑22)
- 	Analytics: Dashboard load events must be logged. (BR‑DASH‑23)
- 	Accessibility: All dashboard elements must support keyboard navigation and screen readers. (SRS‑A11Y‑01)

## Related UI Screens
- 	UIS‑DASH‑01 — Dashboard Layout
- 	UIS‑DASH‑02 — Header Section
- 	UIS‑DASH‑03 — Program Summary
- 	UIS‑DASH‑04 — Weight Summary
- 	UIS‑DASH‑05 — Today’s Workout Card
- 	UIS‑DASH‑06 — Recent Activity List
- 	UIS‑DASH‑07 — Progress Cards
- 	UIS‑DASH‑08 — Notification Panel
- 	UIS‑GLOBAL‑HEADER‑01
- 	UIS‑GLOBAL‑FOOTER‑01

## flowchart TD
    %% Entry Point
    A[User Navigates to Dashboard] --> B{Authenticated?}

    %% Authentication Check
    B -->|No| Z1[Redirect to Login Page]
    B -->|Yes| C[Load Dashboard Layout]

    %% Header + Identity
    C --> D[Display Global Header]
    D --> E[Display User Email]
    E --> F[Display Last Login Timestamp]

    %% Program Summary
    F --> G[Retrieve Program Name]
    G --> H[Display Program Name]
    H --> I[Display Current Week/Day]

    %% Weight Summary
    I --> J[Retrieve Most Recent Weight]
    J --> K[Display Current Weight]
    K --> L[Calculate Weight Trend]
    L --> M[Display Weight Trend]

    %% Today's Workout
    M --> N[Retrieve Today's Workout Summary]
    N --> O[Display Workout Summary]
    O --> P[Display Start Workout Button]

    %% Recent Activity
    P --> Q[Retrieve Recent Activity Logs]
    Q --> R[Display Recent Activity List]
    R --> S[Enable Activity Drilldown]

    %% Progress Cards
    S --> T[Retrieve Progress Metrics]
    T --> U[Display Progress Cards]

    %% Notifications
    U --> V[Retrieve Notifications]
    V --> W[Display Notifications]

    %% Responsive Layout + Refresh
    W --> X[Render Responsive Layout]
    X --> Y[Refresh Dashboard Data]

    %% Analytics
    Y --> Z[Log Dashboard Load Event]

    %% Alternate Flows
    J -->|Missing Data| A1[Display Fallback Weight]
    N -->|Error| A2[Display Workout Summary Error]
    Q -->|Error| A3[Display Empty Activity State]
    V -->|Error| A4[Display Notification Error]

    %% End
    Z --> END[Dashboard Fully Displayed]
