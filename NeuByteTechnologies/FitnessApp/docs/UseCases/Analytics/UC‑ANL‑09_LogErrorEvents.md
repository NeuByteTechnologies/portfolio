UC‑ANL‑09 — Log Error Events
Use Case ID
UC‑ANL‑09

Use Case Name
Log Error Events

Module
Analytics

Purpose
Capture analytics events whenever the application encounters an error, exception, or crash. This enables engineering teams to diagnose issues, track error frequency, identify stability problems, and improve overall application reliability — while ensuring that no sensitive data is ever included in error logs.

Primary Actor
Actor	Description
System	Internal system processes detecting and reporting errors


Stakeholders & Interests
Stakeholder	Interest
Engineering	Diagnose issues, track error frequency, and improve stability
QA	Validate error handling and ensure proper logging
Product Team	Understand stability issues affecting user experience
Security	Ensure error logs do not expose sensitive data
Data/BI	Build error dashboards and reliability metrics


Preconditions
The application is running.

The analytics subsystem is initialized.

The system encounters an error, exception, or crash condition.

Postconditions
An ErrorEvent is recorded with required metadata.

Sensitive data is sanitized.

If offline, the event is queued for later sync.

If online, the event is transmitted to the analytics service.

Trigger
The system detects an error, exception, or crash.

Main Success Scenario (Basic Flow)
System detects an error or exception.

System captures the error type (error_type).

System captures the error message (error_message).

System captures a sanitized stack trace (stack_trace).

System captures metadata (timestamp, device, app version, user ID if available).

System constructs an ErrorEvent analytics event.

System transmits the event to the analytics service.

System receives confirmation of successful receipt.

System logs success locally for debugging and traceability.

Alternate Flows
A1 — Fatal Error or Crash
System detects a fatal error.

System immediately constructs an ErrorEvent (high priority).

System attempts to transmit event before shutdown.

If transmission fails, system writes event to crash‑safe local storage.

Event is synced on next app launch.

A2 — Sensitive Data Detected
Steps 1–3 as normal.

System detects sensitive content in the error message or stack trace.

System sanitizes payload per BR‑ANL‑46.

System constructs sanitized event.

System transmits or queues event.

A3 — Device Offline
Steps 1–5 as normal.

System detects no network connectivity.

System stores the event in the offline queue.

System syncs queued events when connectivity is restored.

A4 — Analytics Service Unavailable
Steps 1–5 as normal.

System attempts to transmit event.

System detects analytics service is unreachable.

System writes the event to the offline queue.

System marks the event for retry.

A5 — Invalid Error Payload
Steps 1–3 as normal.

System detects malformed or incomplete error data.

System logs a local non‑blocking error.

System does not transmit the malformed event.

System continues execution or shutdown sequence.

Business Rules (Sequential)
Continuing from UC‑ANL‑08 (ending at BR‑ANL‑41):

ID	Rule
BR‑ANL‑42	Error logs must exclude all PII and sensitive data.
BR‑ANL‑43	Fatal errors must be logged immediately before shutdown.
BR‑ANL‑44	Stack traces must be sanitized to remove file paths, tokens, or sensitive values.
BR‑ANL‑45	Error events must include error_type, error_message, and sanitized stack_trace.
BR‑ANL‑46	All error events must include a UTC timestamp in ISO‑8601 format.


Data Elements Logged
Field	Description
event_id	Unique identifier for the event
event_type	Always "ErrorEvent"
error_type	Type of error (Exception, Crash, NetworkError, etc.)
error_message	Sanitized error message
stack_trace	Sanitized stack trace
timestamp_utc	ISO‑8601 timestamp
user_id	Authenticated user ID (if available)
device_type	iOS, Android, Web
os_version	Operating system version
app_version	Application version number
network_status	Online / Offline
session_id	Current session identifier


Non‑Functional Requirements
Logging must complete within 50 ms for non‑fatal errors.

Fatal error logging must occur within 5 ms before shutdown.

Offline queue must support at least 500 events.

Event transmission must use HTTPS.

Logging must not expose sensitive data.

Logging must not degrade application stability.

Acceptance Criteria
Every error logs exactly one ErrorEvent.

Fatal errors are logged before shutdown.

No sensitive data appears in the event payload.

Events are queued when offline and synced later.

No user‑visible errors occur if analytics fails.

QA can verify events in the analytics dashboard.

Flow Diagram (Description)
System Detects Error →

Sanitize Error Data →

Construct Event →

If online → Send Event → Success

If offline → Queue Event → Sync Later

If Fatal → Attempt Immediate Send → Persist Locally if Needed