# API Contracts
This folder contains the **design‑time API Contracts** for the FitnessApp system.
Each contract defines the service interface for a specific module, including endpoints, payload schemas, validation rules, and error models.  
These documents serve as the authoritative reference for backend implementation and integration.  

Version: **1.1**    
Last Updated: **2026‑05‑18**  

**Revision History**
| Version | Last Updated | Description |
| --- | --- | --- |
| 1.1 | 2026‑05‑18 | Added full set of API Contracts for all system modules |
| 1.0 | 2026‑05‑13 | Initial creation of API Contracts folder README |

**Purpose of This Folder**  
- Provide a centralized, structured location for all API Contracts.
- Define the exact interface between the UI and backend services.
- Ensure consistency across modules through standardized request/response schemas.
- Support traceability from Functional Specs and UI Specs into implementation.
- Enable reviewers to quickly understand service boundaries and data flows.
- Represent the complete API layer for the FitnessApp system.

**What an API Contract Includes**   
Each API Contract follows a consistent structure:
- Endpoint Summary
- Method & Route
- Purpose
- Authentication / Authorization Requirements
- Request Schema
- Response Schema
- Validation Rules
- Error Model
- Examples (Request / Response)
- Notes & Business Rules (if applicable)

This structure ensures clarity, consistency, and reviewer‑safe navigation.  

**How This Folder Is Organized**   
Each module has its own API Contract file using the naming convention:

API-<ModuleName>.md

Examples include:
- API-Authentication.md
- API-User.md
- API-MFA.md
- API-Dashboard.md
- API-ExercisePrograms.md
- API-ProgramDetail.md
- API-HelpSupport.md
- API-Metadata.md
- API-NotificationCenter.md
- API-NotificationPreferences.md
- API-Preferences.md
- API-WeightTracking.md
- API-WorkoutLogging.md

The **APIIndex.md** file provides navigation across all contracts.  

**Traceability Expectations**  
API Contracts map directly to:

- **Functional Specs** (FS‑XXX‑##)
- **UI Specifications** (UIS‑XXX‑##)
- **Data Dictionary** (field definitions, constraints, types)
- **Test Cases** (TC‑XXX‑##)

Traceability is maintained in the system‑level RTM.

**Conventions**
- API Contracts define interface behavior, not implementation details.
- All payloads must be:
 - Explicit
 - Validated
 - Version‑safe
 - Globally compatible (e.g., email max 254 chars, name fields max 100 chars)
- No business logic is embedded here — only rules that affect the interface.
- All examples must be realistic and syntactically correct.
- Contracts are written in GitHub‑native Markdown for readability and version control clarity.

**Relationship to Runtime Documentation**
These Markdown API Contracts represent **design‑time documentation.**
Runtime documentation (e.g., Swagger / OpenAPI) may be generated later from implementation, but does not replace these contracts.

**Related Documents**
- APIIndex.md — navigation list of all API Contracts
- /functional-specs — defines system behavior
- /ui-specs — defines UI‑level data needs
- /data-dictionary — defines field‑level constraints
- /test-cases — defines validation coverage
- /architecture — defines service patterns and integration points