# FS‑ACCT — Account Management Functional Specification
## 1.   Purpose  
The Account module defines all functionality required for users to create, manage, and maintain their NeuByte account.   This includes account creation, authentication prerequisites, profile initialization, validation rules, and system behaviors related to onboarding.  
This module is foundational and interacts with Authentication, User Profile, Notifications, and Analytics.  

## 2.   Scope  
**This FS covers:**  
-	Account creation
-	Required fields and validation
-	Email verification trigger
-	Initial profile setup
-	Error handling
-	Accessibility requirements
-	Security and data integrity rules
This module does not include login, logout, or session management — those are defined in the Authentication FS.  

## 3.   References  
-	Business Requirements: BR‑ACCT‑01 → BR‑ACCT‑12
-	Use Cases: UC‑ACCT‑01 (Create Account), UC‑ACCT‑02 (Resend Verification), UC‑ACCT‑03 (Account Validation Errors)
-	RTM: Account Module Rows
-	FS‑AUTH (Authentication)
-	FS‑PROFILE (User Profile)

## 4.   Functional Requirements  
**FR‑ACCT‑01 — Display Create Account Form**   
**Description:**  
The system shall display the Create Account form with all required fields.    
**Fields:**  
-	First Name
-	Last Name
-	Email
-	Password
-	Confirm Password
-	Optional: Referral Code
Maps to: BR‑ACCT‑01, UC‑ACCT‑01  

**FR‑ACCT‑02 — Validate Required Fields**  
**Description:**  
All required fields must be validated before submission.    
**Rules:**  
-	First/Last Name: alphabetic, 2–50 chars 
-	Email: valid email format
-	Password: must meet password policy (see FR‑ACCT‑03)
-	Confirm Password: must match Password
Maps to: BR‑ACCT‑02, UC‑ACCT‑01

**FR‑ACCT‑03 — Enforce Password Policy**  
**Description:**  
The system shall enforce the NeuByte password policy.  
**Rules:**  
-	Minimum 8 characters
-	At least one uppercase letter
-	At least one number
-	At least one special character
-	No spaces
Maps to: BR‑ACCT‑03, UC‑ACCT‑01

**FR‑ACCT‑04 — Prevent Duplicate Accounts**  
**Description:**  
The system shall prevent account creation using an email address already in use.    
**Behavior:**  
-	Display error message
-	Provide link to Login
-	Provide link to Reset Password
Maps to: BR‑ACCT‑04, UC‑ACCT‑03

**FR‑ACCT‑05 — Create Account Record**  
**Description:**  
Upon successful validation, the system shall create a new user account record.  
**Details:**  
-	Store hashed password
-	Store email in lowercase
-	Set account status = “Pending Verification”
-	Generate verification token
Maps to: BR‑ACCT‑05, UC‑ACCT‑01

**FR‑ACCT‑06 — Trigger Email Verification**  
**Description:**  
The system shall send a verification email after account creation.  
Details:
-	Email includes verification link with token
-	Token expires in 24 hours
-	Email is logged in Notification History
Maps to: BR‑ACCT‑06, UC‑ACCT‑01

**FR‑ACCT‑07 — Resend Verification Email**  
**Description:**  
Users may request a new verification email.  
**Rules:**  
-	Limit: 3 resend attempts per hour
-	New token invalidates previous token
-	Display confirmation message
Maps to: BR‑ACCT‑07, UC‑ACCT‑02

**FR‑ACCT‑08 — Handle Expired or Invalid Tokens**  
**Description:**  
The system shall detect invalid or expired verification tokens.  
**Behavior:**  
-	Display error message
-	Provide “Resend Verification Email” option
-	Log event for security monitoring
Maps to: BR‑ACCT‑08, UC‑ACCT‑03

**FR‑ACCT‑09 — Complete Verification**  
**Description:**  
When a valid token is used, the system shall activate the user account.  
**Details:**  
-	Set account status = “Active”
-	Redirect user to onboarding
-	Trigger welcome notification
Maps to: BR‑ACCT‑09, UC‑ACCT‑01

**FR‑ACCT‑10 — Initialize User Profile**  
**Description:**  
Upon account activation, the system shall create a default User Profile record.  
Defaults:
-	Units: US Standard
-	Notifications: Enabled
-	Empty program list
-	Empty weight history
Maps to: BR‑ACCT‑10, UC‑ACCT‑01

**FR‑ACCT‑11 — Accessibility Requirements**  
**Description:**  
The Create Account flow must comply with Accessibility FS.    
**Requirements:**  
-	All fields have labels
-	Errors announced via ARIA live region
-	Keyboard-only navigation supported
-	Focus moves to first error on submit
Maps to: BR‑ACCT‑11, UC‑A11Y‑01 → UC‑A11Y‑10

**FR‑ACCT‑12 — Security Requirements**  
**Description:**  
The Create Account process must follow security best practices.    
**Rules:**  
-	Passwords hashed using PBKDF2 or bcrypt
-	Tokens must be single‑use
-	Rate limiting on account creation attempts
-	Log all suspicious activity
Maps to: BR‑ACCT‑12, UC‑ACCT‑03

## 5.   Non‑Functional Requirements  
-	Must complete account creation in < 3 seconds
-	Must support high‑latency networks
-	Must support mobile and desktop
-	Must not expose internal error details
-	Must log all account creation events

## 6.   Dependencies
-	Notification Service
-	Authentication Service
-	User Profile Service
-	Email Provider
-	Security Token Generator

## 7.   Acceptance Criteria
-	All required fields validated
-	Duplicate emails blocked
-	Password policy enforced
-	Verification email sent
-	Token validation works
-	Account activates successfully
-	Profile initializes correctly
-	Errors are accessible and announced
(These will be expanded into Test Cases later.  )

## 8.   Open Questions
-	Should we allow social login in future phases?
-	Should we enforce email domain restrictions?
-	Should we support phone‑based verification later