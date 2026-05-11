# UC‑CA‑01 — Create Account

Use Case ID
UC‑CA‑01
Use Case Name
Create Account
Module
Create Account
## Purpose
This Use Case defines the steps required for a new user to create an account in the NeuByte Fitness App, ensuring secure credential handling and a smooth onboarding experience.

## Primary Actors

| Actor      | Type       | Description |
|------------|------------|-------------|
| App User   | Primary    | Creates their own account through the app UI |
| App Admin  | Secondary  | Creates or manages accounts through backend/admin tools

## Stakeholders & Interests
• 	New User — wants to quickly and securely create an account to access the app.
• 	System — must validate inputs, prevent duplicates, and securely store credentials.
• 	Security Team — requires password hashing, HTTPS transport, and input validation.
• 	Product Owner — wants a smooth onboarding experience with clear error messaging.

## Preconditions
• 	User is not authenticated.
• 	User is on the Create Account page.
• 	System is online and able to access the user database.

## Postconditions
Success
• 	A new user account is created.
• 	Password is securely hashed and stored.
• 	User is redirected to the Login page.
Failure
• 	No account is created.
• 	User remains on the Create Account page with error messaging.

## Trigger
User selects “Create Account” from the Login page or navigates directly to the Create Account screen.

Main Success Scenario (Basic Flow)
1. 	System displays the Create Account page with fields for Email, Password, and Confirm Password.
(BR‑Create‑01)
2. 	System displays the application header.
(BR‑Create‑02)
3. 	User enters Email, Password, and Confirm Password.
4. 	User selects “Create Account”.
5. 	System validates that all required fields are populated.
(BR‑Create‑03)
6. 	System validates email format.
(BR‑Create‑04)
7. 	System validates password complexity (8 chars, 1 number, 1 special char).
(BR‑Create‑05)
8. 	System validates that Password and Confirm Password match.
(BR‑Create‑06)
9. 	System checks whether the email already exists.
(BR‑Create‑08)
10. 	System hashes the password using secure hashing.
(BR‑Create‑09)
11. 	System creates a new user record in the database.
(BR‑Create‑10)
12. 	System redirects the user to the Login page.
(BR‑Create‑12)

## Alternate Flows
A1 — Required Fields Missing
• 	Step 5 fails.
• 	System displays field‑level validation errors.
(BR‑Create‑07)
• 	User corrects inputs and retries.

A2 — Invalid Email Format
• 	Step 6 fails.
• 	System displays email format error.
(BR‑Create‑04, BR‑Create‑07)
• 	User corrects email and retries.

A3 — Password Complexity Failure
• 	Step 7 fails.
• 	System displays password complexity error.
(BR‑Create‑05, BR‑Create‑07)
• 	User corrects password and retries.

A4 — Passwords Do Not Match
• 	Step 8 fails.
• 	System displays mismatch error.
(BR‑Create‑06, BR‑Create‑07)
• 	User corrects Confirm Password and retries.

A5 — Duplicate Email
• 	Step 9 fails.
• 	System displays duplicate email error.
(BR‑Create‑08)
• 	User enters a different email and retries.

## Exception Flows
E1 — System/Database Error
• 	Step 11 fails due to system or database issue.
• 	System displays a system error message.
(BR‑Create‑11)
• 	No account is created.

## Non‑Functional Requirements
• 	Transport Security: All data transmitted over HTTPS. (BR‑Create‑14)
• 	Password Masking: Password fields mask characters. (BR‑Create‑13)
• 	Accessibility:
• 	Accessible labels for all fields. (BR‑Create‑15)
• 	Keyboard‑only navigation. (BR‑Create‑16)
• 	Responsive UI: Page must render correctly on all device sizes. (BR‑Create‑01, BR‑Create‑02)

## Related UI Screens
• 	Create Account Page (UIS‑CA‑01)
• 	Error Banner (UIS‑CA‑02)
• 	Global Header (UIS‑GLOBAL‑HEADER‑01)

## flowchart TD
    A[User Opens Create Account Page] --> B[Enter Email, Password, Confirm Password]
    B --> C[Submit Create Account]
    C --> D{Validations Pass?}
    D -->|No| E[Show Validation Errors]
    D -->|Yes| F[Check Duplicate Email]
    F -->|Exists| G[Show Duplicate Email Error]
    F -->|New| H[Hash Password]
    H --> I[Create User Record]
    I --> J[Redirect to Login Page]
