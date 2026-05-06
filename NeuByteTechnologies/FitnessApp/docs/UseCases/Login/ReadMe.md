# Login — Use Case Overview
The Login module contains the atomic use cases that define how users authenticate, navigate to related authentication flows, and access protected areas of the application. These use cases describe the core behaviors of credential entry, session handling, navigation to account creation and password reset, and access control.
This module forms the foundation of the authentication subsystem and is referenced by multiple flow‑level use cases.

## Purpose of This Module
The Login module provides:
- 	A clear definition of core authentication behaviors
- 	A foundation for higher‑level flows such as:
- 	Login Sequence
- 	Password Reset Sequence
- 	MFA Enrollment Sequence
- 	Logout + Timeout Sequence
- 	A traceability anchor for BR‑LOGIN‑01 → BR‑LOGIN‑22 and related functional/UI specifications
- 	A clean separation between atomic authentication actions and flow‑level sequences

---

## Login Use Cases (UC-LOGIN-01 → UC-LOGIN-06)

### **[UC‑LOGIN‑01 — User Login](/NeuByteTechnologies/FitnessApp/docs/UseCases/Login/UC-LOGIN-01_UserLogin.md)**
Handles credential entry, validation, authentication, and error handling.  

### **[UC‑LOGIN‑02 — Session Timeout](/NeuByteTechnologies/FitnessApp/docs/UseCases/Login/UC-LOGIN-02_SessionTimeout.md)**
Defines how the system handles user inactivity and session expiration.

### **[UC‑LOGIN‑03 — Logout](/NeuByteTechnologies/FitnessApp/docs/UseCases/Login/UC-LOGIN-03_Logout.md)**
Allows users to explicitly end their session and return to the Login page.  

### **[UC‑LOGIN‑04 — Access Protected Page](/NeuByteTechnologies/FitnessApp/docs/UseCases/Login/UC-LOGIN-04_AccessProtectedPage.md)**
Ensures only authenticated users can access protected routes; redirects unauthenticated users to Login.  

### **[UC‑LOGIN‑05 — Navigate to Create Account](/NeuByteTechnologies/FitnessApp/docs/UseCases/Login/UC-LOGIN-05_NavigateCreateAccount.md)**
Allows users without an account to navigate from Login to the Create Account page.  

### **[UC‑LOGIN‑06 — Navigate to Reset Password](/NeuByteTechnologies/FitnessApp/docs/UseCases/Login/UC-LOGIN-06_NavigateResetPassword.md)**
Allows users to navigate from Login to the Reset Password workflow.
(Additional Login UCs will be added here as the module expands — e.g., Remember Me, Device Recognition, Login Rate Limiting.)

## This module is essential for:
- 	Security reviews
- 	QA test planning
- 	Architecture validation
- 	Portfolio reviewers evaluating your system design maturity

## Relationship to Other Modules
The Login module interacts with:
## LoginFlow Module
- 	Flow‑level UCs orchestrate these atomic UCs
- 	Includes Login Sequence, Password Reset Sequence, MFA Enrollment, Logout/Timeout
## Create Account Module
- 	Navigation from Login to Create Account
- 	Shared validation patterns (email, password rules)
## Password Reset Module
- 	Navigation to Reset Password
- 	Shared identity verification logic
## MFA Module
- 	MFA verification during login
- 	MFA enrollment after login
## Dashboard Module
- 	Redirect after successful authentication
- 	Access control for protected pages

## Document Conventions
- 	All files follow the naming pattern: UC-LOGIN-XX_<Name>.md

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
- 	This folder is structured for reviewer accessibility, traceability, and clean separation of concerns.