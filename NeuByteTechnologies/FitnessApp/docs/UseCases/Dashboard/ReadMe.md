# Dashboard — Use Case Overview
The Dashboard module contains use cases that define how authenticated users view, interact with, and navigate from the main landing page of the application. These use cases describe how the system retrieves, displays, and updates personalized fitness data, recent activity, notifications, and quick‑action workflows.
The Dashboard serves as the central hub for the user experience and integrates with multiple subsystems including workouts, programs, weight tracking, and notifications.


## Purpose of This Module
The Dashboard module provides:
- 	A centralized view of the user’s current fitness status
- 	A consistent landing page after login
- 	A foundation for future enhancements such as:
- 	Interactive progress cards
- 	Personalized recommendations
- 	Notification center expansion
- 	Quick‑action shortcuts
- 	A traceability anchor for BR‑DASH‑01 → BR‑DASH‑15 and related functional/UI specifications
- 	A clear separation of concerns between display logic, data retrieval, and user actions

## Dashboard Use Cases (UC‑DASH‑01 → UC‑DASH‑04)
### [UC‑DASH‑01 — View Dashboard](/NeuByteTechnologies/FitnessApp/docs/UseCases/Dashboard/UC-DASH-01_ViewDashboard.md)  
Displays the user’s personalized dashboard including identity, program status, weight trends, today’s workout summary, recent activity, and progress metrics.

### [UC‑DASH‑02 — Start Workout  ](/NeuByteTechnologies/FitnessApp/docs/UseCases/Dashboard/UC-DASH-02_StartWorkout.md)
Allows the user to begin the workout logging workflow directly from the Dashboard.

### [UC‑DASH‑03 — View/Edit Activity](/NeuByteTechnologies/FitnessApp/docs/UseCases/Dashboard/UC-DASH-03_ViewEditActivity.md)
Enables users to view details of recent workouts and edit logged activity from the Dashboard.

### [UC‑DASH‑04 — View Notifications](/NeuByteTechnologies/FitnessApp/docs/UseCases/Dashboard/UC-DASH-04_ViewNotifications.md)
Displays system‑generated notifications and allows users to navigate to the Notification Center.
(Additional Dashboard UCs will be added here as the module expands.)

## Relationship to Other Modules
The Dashboard module interacts with:
Login Module
- 	Redirect after successful authentication
- 	Session validation (UC‑LOGIN‑04 Access Protected Page)
- 	Session timeout and logout flows
Exercise Programs Module
- 	Displays selected program
- 	Shows current week/day
- 	Links to program detail and workout logging
Workout Logging Module
- 	Displays recent activity
- 	Shows today’s workout summary
- 	Provides quick access to Start Workout
Weight Tracking Module
- 	Displays current weight
- 	Calculates weight trend
Notifications Module
- 	Displays unread notifications
- 	Links to notification detail pages

## Document Conventions
- 	All files follow the naming pattern: UC-DASH-<Name>.md
- 	All UCs include:
- 	Purpose
- 	Preconditions
- 	Postconditions
- 	Main Flow
- 	Alternate Flows
- 	Exception Flows
- 	Non‑Functional Requirements
- 	Related UI Screens
- 	Mermaid Flow Diagram
- 	Traceability Table
- 	Markdown is optimized for GitHub readability.
- 	Each UC is modular and self‑contained.
- 	This folder is structured for reviewer accessibility and traceability across BRs, FS, UI Specs, and Test Cases.