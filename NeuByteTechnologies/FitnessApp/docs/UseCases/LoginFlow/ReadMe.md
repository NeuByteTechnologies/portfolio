# Login Flow — Use Case Overview
The Login Flow module contains multi‑step, end‑to‑end authentication sequences that orchestrate multiple atomic Login UCs (e.g., CAPTCHA, MFA, credential validation, session creation, logout, timeout).
These flow‑level UCs describe the complete user journey across multiple screens, components, and security layers.
Flow‑level UCs do not replace atomic UCs — they reference them to show how the system behaves holistically.


## Purpose of This Module
The Login Flow module provides:
- 	A holistic view of authentication behavior
- 	A narrative sequence that spans multiple atomic UCs
- 	A security‑focused perspective on how authentication components interact
- 	A reviewer‑friendly map of the entire login lifecycle
- 	A traceability anchor for BRs, FS, UI Specs, and Test Cases
These flow‑level UCs are especially useful for:
- 	Architects
- 	Security reviewers
- 	QA teams
- 	Hiring managers reviewing your portfolio
- 	Anyone validating end‑to‑end behavior

---

## Login Flow Use Cases (UC-LOGIN-FLOW-01 → UC-LOGIN-FLOW-04)

### **[UC‑LOGIN‑FLOW‑01 — Login Sequence](/NeuByteTechnologies/FitnessApp/docs/UseCases/LoginFlow/UC-LOGIN-FLOW-01_LoginSequence.md)**
Full authentication journey including CAPTCHA → Credentials → MFA → Session → Redirect.  

###	**[UC‑LOGIN‑FLOW‑02 — Password Reset Sequence](/NeuByteTechnologies/FitnessApp/docs/UseCases/LoginFlow/UC‑LOGIN‑FLOW‑02_PasswordResetSequence.md)**
End‑to‑end password recovery including email submission → token → new password → confirmation.  

### **[UC‑LOGIN‑FLOW‑03 — MFA Enrollment Sequence](/NeuByteTechnologies/FitnessApp/docs/UseCases/LoginFlow/UC-LOGIN-FLOW-03_AuthEventLogging.md)**
First‑time MFA setup including TOTP secret generation → QR code → verification → activation.  

### **[UC‑LOGIN‑FLOW‑04 — Logout + Timeout Sequence](/NeuByteTechnologies/FitnessApp/docs/UseCases/LoginFlow/UC‑LOGIN‑FLOW‑04_LogoutTimeoutSequence.md)**
Complete session termination lifecycle including explicit logout, passive timeout, and multi‑tab behavior.

## Relationship to Other Modules
Flow‑level UCs reference atomic UCs in:
## Login Module
- 	UC‑LOGIN‑01 User Login
- 	UC‑LOGIN‑02 Session Timeout
- 	UC‑LOGIN‑03 Logout
- 	UC‑LOGIN‑04 Access Protected Page
- 	UC‑LOGIN‑05 Navigate Create Account
- 	UC‑LOGIN‑06 Navigate Reset Password
## CAPTCHA Module
- 	UC‑LOGIN‑CAPTCHA‑01 CAPTCHA Validation
## MFA Module
- 	UC‑LOGIN‑MFA‑01 MFA Verification
- 	UC‑LOGIN‑MFA‑02 MFA Enrollment
Flow‑level UCs compose these atomic UCs into complete authentication journeys.

## Document Conventions
- 	All files follow the naming pattern:

- 	All UCs include:
- 	Purpose
- 	Preconditions
- 	Postconditions
- 	Main Flow
- 	Alternate Flows
- 	Exception Flows
- 	NFRs
- 	Related UI Screens
- 	Mermaid Flow Diagram
- 	Traceability Table
- 	Markdown is optimized for GitHub readability.
- 	No monolithic documents — each UC is modular and self‑contained.