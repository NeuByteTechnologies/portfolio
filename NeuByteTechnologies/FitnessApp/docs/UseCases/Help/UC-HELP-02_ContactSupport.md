# UC‑HELP‑02 — Contact Support

Use Case ID
UC‑HELP‑02
Use Case Name
Contact Support
Module
Help / Support

## Purpose
To allow a user to contact the support team by accessing the support email address from the Help page. This use case ensures users can quickly reach out for assistance when FAQs or self‑service guidance do not resolve their issue.

## Primary Actor

| Actor(s) | Notes |
| --- | --- | 
| App User | User opens Help, views FAQs, contacts support. Admin does not interact with Help UI. |

## Stakeholders & Interests
-	User — wants a simple, reliable way to contact support when they need help.
-	Support Team — wants users to reach the correct support channel with clear context.
-	Product Owner — wants a lightweight support workflow without phone/chat overhead.
-	Security Team — requires that no sensitive data is exposed in the support process.
-	System — must display accurate support contact information.

## Preconditions
-	User is on the Help page (UC‑HELP‑01).
-	System has access to the support email address.
-	User has an email client installed (external dependency).

## Postconditions
Success
-	User’s email client opens with the support email address pre‑filled.
-	User may compose and send a support request.
Failure
-	No email client opens.
-	System displays fallback instructions (e.g., “Please email us at support@neubyte.com”).

## Trigger
User selects the Support Email link on the Help page.

Main Success Scenario (Basic Flow)
1. 	User selects the Support Email link.
(BR‑HELP‑04)
2. 	System retrieves the configured support email address.
(BR‑HELP‑04)
3. 	System attempts to open the user’s default email client with:
-	“To” field pre‑filled
-	Optional subject line (e.g., “NeuByte Support Request”)
(FS‑HELP‑SUPPORT‑01)
4. 	User’s email client opens successfully.
5. 	User composes their message.
6. 	User sends the email to support.
7. 	System logs the support contact event for analytics.
(Analytics requirement)

## Alternate Flows
A1 — User Cancels Email Composition
-	Steps 1–4 occur.
-	User closes the email client without sending.
-	No support request is submitted.
A2 — User Copies Email Address Instead
-	User long‑presses or right‑clicks the email address.
-	System copies the email address to clipboard.
-	User manually pastes it into their email client.

## Exception Flows
E1 — No Email Client Available
-	Step 3 fails.
-	System displays fallback instructions:
“Please email us at support@neubyte.com.”
(BR‑HELP‑04)
E2 — Support Email Not Configured
-	Step 2 fails.
-	System displays an error message.
(BR‑HELP‑06)
-	User remains on the Help page.

## Non‑Functional Requirements
-	Accessibility: Support email link must support keyboard navigation and screen readers. (SRS‑A11Y‑01)
-	Performance: Email link must respond instantly.
-	Responsiveness: Support section must render correctly on all device sizes.
-	Security: No sensitive data is displayed or transmitted by the app. (BR‑HELP‑07)
-	Analytics: Support contact events must be logged.

## Related UI Screens
-	UIS‑HELP‑01 — Help Page Layout
-	UIS‑HELP‑03 — Support Information
-	UIS‑GLOBAL‑HEADER‑01
-	UIS‑GLOBAL‑FOOTER‑01

## Flowchart TD

    %% Entry
    A[User Clicks Support Email Link] --> B[Retrieve Support Email Address]

    %% Email Launch
    B --> C{Email Client Available?}
    C -->|No| E1[Display Fallback Instructions]
    C -->|Yes| D[Open Email Client with Pre‑Filled Address]

    %% User Interaction
    D --> E{User Sends Email?}
    E -->|No| F[User Cancels → End]
    E -->|Yes| G[Email Sent to Support]

    %% Analytics
    G --> H[Log Support Contact Event]

    %% End
    H --> END[Support Contact Completed]