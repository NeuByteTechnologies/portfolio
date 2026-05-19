UC‑ANL‑10 — Log First‑Time User Events
Use Case ID
UC‑ANL‑10

Use Case Name
Log First‑Time User Events

Module
Analytics

Purpose
Capture analytics events when a user completes a first‑time milestone (e.g., first login, first workout logged, first program started). These events support onboarding analysis, user activation metrics, and early‑stage engagement insights — while ensuring each milestone is logged exactly once per user.

Primary Actor
Actor	Description
App User	Any authenticated user completing a first‑time milestone


Stakeholders & Interests
Stakeholder	Interest
Product Team	Measure onboarding effectiveness and activation rates
UX	Identify friction points in early user experience
Engineering	Ensure milestone detection is accurate and non‑blocking
Data/BI	Build onboarding funnels and activation dashboards
QA	Validate that first‑time events fire exactly once


Preconditions
The application is running.

The user is authenticated.

The user performs an action that qualifies as a first‑time milestone.

The analytics subsystem is initialized.

Postconditions
A FirstTimeUserEvent is recorded with required metadata.

The milestone is marked as completed for the user.

If offline, the event is queued for later sync.

If online, the event is transmitted to the analytics service.

Trigger
The user completes a first‑time milestone (e.g., first login, first data entry, first workout logged).

Main Success Scenario (Basic Flow)
User performs an action that may qualify as a first‑time milestone.

System checks whether the milestone has been completed before.

System determines this is the first occurrence.

System identifies the milestone (milestone_name).

System captures metadata (timestamp, device, app version, user ID).

System constructs a FirstTimeUserEvent analytics event.

System transmits the event to the analytics service.

System receives confirmation of successful receipt.

System marks the milestone as completed for the user.

System logs success locally for debugging and traceability.

Alternate Flows
A1 — Milestone Already Completed
Steps 1–2 as normal.

System determines the milestone has already been completed.

System does not log a duplicate event.

System continues normal workflow.

A2 — Device Offline
Steps 1–6 as normal.

System detects no network connectivity.

System stores the event in the offline queue.

System marks the milestone as completed.

System syncs queued events when connectivity is restored.

A3 — Analytics Service Unavailable
Steps 1–6 as normal.

System attempts to transmit event.

System detects analytics service is unreachable.

System writes the event to the offline queue.

System marks the event for retry.

System marks the milestone as completed.

A4 — Invalid Milestone Identifier
Steps 1–2 as normal.

System cannot resolve milestone_name.

System logs a local non‑blocking error.

System does not transmit the malformed event.

System continues normal workflow.

Business Rules (Sequential)
Continuing from UC‑ANL‑09 (ending at BR‑ANL‑46):

ID	Rule
BR‑ANL‑47	First‑time events must fire exactly once per user per milestone.
BR‑ANL‑48	Milestones must be uniquely identifiable and consistently named.
BR‑ANL‑49	First‑time events must be logged immediately upon milestone completion.
BR‑ANL‑50	First‑time event logging must not block user workflows.
BR‑ANL‑51	All first‑time events must include a UTC timestamp in ISO‑8601 format.


Data Elements Logged
Field	Description
event_id	Unique identifier for the event
event_type	Always "FirstTimeUserEvent"
milestone_name	Name of the milestone completed
timestamp_utc	ISO‑8601 timestamp
user_id	Authenticated user ID
device_type	iOS, Android, Web
os_version	Operating system version
app_version	Application version number
network_status	Online / Offline
session_id	Current session identifier


Non‑Functional Requirements
Logging must complete within 50 ms.

Milestone checks must be efficient and cached when possible.

Offline queue must support at least 500 events.

Event transmission must use HTTPS.

Logging must not degrade onboarding performance.

Acceptance Criteria
Each milestone logs exactly one event per user.

Duplicate events are never logged.

Events are queued when offline and synced later.

No user‑entered values or sensitive data are logged.

No user‑visible errors occur if analytics fails.

QA can verify events in the analytics dashboard.

Flow Diagram (Description)
User Completes Milestone →

Check If First‑Time →

If already completed → Do Not Log

If first‑time → Construct Event →

If online → Send Event → Success

If offline → Queue Event → Sync Later

Mark Milestone Completed