# Reset Password — Use Case Overview
The Reset Password module contains use cases related to requesting, validating, and completing a secure password reset. These use cases define how users initiate a reset, receive a tokenized link, validate that token, create a new password, and receive confirmation or failure messaging.
This module provides the account recovery framework that ensures users can regain access securely and reliably while maintaining strong security and audit controls.

## Purpose of This Module
The Reset Password module provides:
- A secure, token‑based password reset workflow
- A clear definition of how users recover access to their accounts
- Strong validation and error‑handling patterns
- A foundation for future enhancements such as:
- Multi‑factor verification
- Device‑based reset flows
- Password strength scoring
- Reset attempt rate limiting
- A traceability anchor for BR‑RP‑01 → BR‑RP‑20 and related functional/UI specifications
- A clean separation between token generation, token validation, password update, and user messaging
This module is essential for maintaining account security and user trust.

## Reset Password Use Cases (UC-RP-01 → UC-RPT-05)

### **[UC‑RP‑01 — Request Reset](/NeuByteTechnologies/FitnessApp/docs/UseCases/Reports/UC-RPT-01_ViewReportList.md)**
Allows the user to request a password reset by entering their email address.
### **[UC‑RP‑02 — Validate Reset Token](/NeuByteTechnologies/FitnessApp/docs/UseCases/Reports/UC-RPT-02_SelectReport.md)**
Validates the reset token from the email link and determines whether the user may proceed.
### **[UC‑RP‑03 — Reset Password](/NeuByteTechnologies/FitnessApp/docs/UseCases/Reports/UC‑RPT‑03_ViewReportDetail.md)**
Allows the user to enter and confirm a new password after token validation.
### **[UC‑RP‑04 — Reset Success](/NeuByteTechnologies/FitnessApp/docs/UseCases/Reports/UC‑RPT‑04_ReportUnavailable.md)**
Displays confirmation that the password has been successfully updated.
### **[UC‑RP‑05 — Reset Failure](/NeuByteTechnologies/FitnessApp/docs/UseCases/Reports/UC‑RPT‑05_ReportAccessDenied.md)**
Handles all failure conditions such as expired tokens, invalid tokens, or system errors.
(Additional Reset Password UCs may be added as the module expands — e.g., Multi‑Factor Reset, Password Reset via SMS, Password Reset Rate Limiting.)


## Relationship to Other Modules
Login Module
- Provides entry point for “Forgot Password”
- Redirects users to login after successful reset
- Handles session invalidation after password change
Account Module
- Stores password hashes and reset token metadata
- Enforces password complexity and reuse policies
Notifications / Email Delivery Module
- Sends password reset emails containing secure tokens
- Logs delivery events and failures
Security Module
- Enforces token expiration, tamper detection, and rate limiting
- Logs security‑sensitive events
Dashboard Module
- Not directly connected, but becomes accessible after successful login

## Document Conventions
- All files follow the naming pattern: UC-RP-XX_<Name>.md

- All UCs include:
- Purpose
- Preconditions
- Postconditions
- Main Flow
- Alternate Flows
- Exception Flows
- Non‑Functional Requirements
- Related UI Screens
- Mermaid Flow Diagram
- Traceability Table
- Markdown is optimized for GitHub readability.
- Each UC is modular and self‑contained.
- This folder is structured for reviewer accessibility, traceability, and clean separation of concerns.