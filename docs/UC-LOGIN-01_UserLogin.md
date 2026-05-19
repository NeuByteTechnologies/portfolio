# UC‑LOGIN‑01 — User Login
Use Case ID
UC‑LOGIN‑01
Use Case Name
User Login
Module
Login / Authentication

## Purpose
To allow a user to securely authenticate into the application using valid credentials, ensuring only authorized users gain access to protected features such as the Dashboard, Workout Logging, and Program Management.
## Primary Actor
End User
## Stakeholders & Interests
• 	User — wants fast, secure access to their account.
• 	System — must validate credentials, enforce security rules, and create a secure session.
• 	Security Team — requires strong authentication, error handling, and protection against brute‑force attacks.
• 	Product Owner — wants a smooth login experience with clear error messaging.
• 	Analytics Team — needs to track successful logins and failed attempts.

## Preconditions
• 	User has an existing account.
• 	System is online and accessible.
• 	User is on the Login page.

## Postconditions
Success
• 	User is authenticated.
• 	A secure session token is created and stored in an HTTP‑only cookie.
• 	User is redirected to the Dashboard.
## Failure
• 	User remains on the Login page.
• 	System displays appropriate error messaging.

## Trigger
User enters their email and password and selects Log In.

## Main Success Scenario (Basic Flow)
1. 	User navigates to the Login page.
(BR‑Login‑01)
2. 	System displays the Login form with email and password fields.
(BR‑Login‑01)
3. 	User enters email and password.
(BR‑Login‑02)
4. 	System validates that both fields are populated.
(BR‑Login‑02)
5. 	System validates that the email format is correct.
(BR‑Login‑03)
6. 	System authenticates the credentials against stored values.
(BR‑Login‑04)
7. 	System verifies the password using secure hashing.
(BR‑Login‑05)
8. 	System checks whether the account is active (not locked, disabled, or inactive).
(BR‑Login‑13)
9. 	System creates a secure session token.
(BR‑Login‑08)
10. 	System stores the session token in an HTTP‑only cookie.
(BR‑Login‑09)
11. 	System redirects the user to the Dashboard.
(BR‑Login‑07)
12. 	System logs the successful login event.
(Analytics requirement)

## Alternate Flows
A1 — Invalid Credentials
• 	Step 6 fails.
• 	System displays an authentication error message.
(BR‑Login‑06)
• 	User remains on the Login page.
A2 — Missing Required Fields
• 	Step 4 fails.
• 	System displays a “Required fields missing” message.
(BR‑Login‑02)
A3 — Invalid Email Format
• 	Step 5 fails.
• 	System displays an “Invalid email format” message.
(BR‑Login‑03)

## Exception Flows
E1 — Account Locked or Disabled
• 	Step 8 fails.
• 	System displays a specific error message.
(BR‑Login‑13)
• 	User remains on the Login page.
E2 — Too Many Failed Attempts
• 	System detects repeated failed logins.
(BR‑Login‑14)
• 	System temporarily locks the account.
• 	System displays a lockout message.
E3 — System Error During Authentication
• 	Step 6 or 7 fails due to backend or database issue.
• 	System displays a generic error message.
(BR‑Login‑20 fallback)
• 	User remains on the Login page.

## Non‑Functional Requirements
• 	Security: All credentials must be transmitted over HTTPS. (BR‑Login‑15)
• 	Performance: Authentication must complete quickly.
• 	Accessibility: Login form must support keyboard navigation and screen readers. (SRS‑A11Y‑01)
• 	Usability: Error messages must be clear and actionable.
• 	Analytics: Login attempts (success/failure) must be logged.

## Related UI Screens
• 	UIS‑LOGIN‑01 — Login Page
• 	UIS‑GLOBAL‑HEADER‑01
• 	UIS‑GLOBAL‑FOOTER‑01

## Flowchart TD

    %% Entry
    A[User Navigates to Login Page] --> B[Display Login Form]

    %% User Input
    B --> C[User Enters Email & Password]
    C --> D{Fields Populated?}
    D -->|No| A1[Display Required Fields Error]

    %% Email Format
    D -->|Yes| E{Valid Email Format?}
    E -->|No| A2[Display Invalid Email Format]

    %% Authentication
    E -->|Yes| F[Authenticate Credentials]
    F --> G{Credentials Valid?}
    G -->|No| A3[Display Invalid Credentials Error]

    %% Account Status
    G -->|Yes| H{Account Active?}
    H -->|No| E1[Display Account Locked/Disabled]

    %% Session Creation
    H --> I[Create Secure Session Token]
    I --> J[Store Token in HTTP‑Only Cookie]

    %% Redirect
    J --> K[Redirect to Dashboard]
    K --> L[Log Successful Login Event]

    %% End
    L --> END[User Authenticated]

    %% Exception
    F -->|System Error| E2[Display System Error Message]