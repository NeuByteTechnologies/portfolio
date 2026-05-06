# Program Detail — Use Case Overview
The Program Detail module contains use cases related to viewing, navigating, and selecting exercise programs. These use cases define how users explore program metadata, browse weekly and daily structures, preview exercises, and activate a program for their fitness journey.
This module provides the core program exploration and selection experience, connecting the Dashboard, Exercise Programs list, Workout execution, and Reports modules.

## Purpose of This Module
The Program Detail module provides:
- A structured, intuitive way for users to explore exercise programs
- A clear definition of how users navigate weeks and days
- A foundation for program activation and downstream workout execution
- A consistent presentation of program metadata and structure
- A traceability anchor for BR‑PROG‑01 → BR‑PROG‑22 and related functional/UI specifications
- A clean separation between program browsing, program selection, and workout logging
This module is central to the user’s fitness journey, enabling informed decision‑making before committing to a program.

## Program Detail Use Cases (UC‑PROG‑01 → UC‑PROG‑05)

### **[UC‑PROG‑01 — View Program Detail](/NeuByteTechnologies/FitnessApp/docs/UseCases/ProgramDetail/UC-PROG-01_ViewProgramDetail.md)**
Displays full program information including description, duration, difficulty, weekly structure, and daily breakdown.

### **[UC‑PROG‑02 — Navigate Program Weeks](/NeuByteTechnologies/FitnessApp/docs/UseCases/ProgramDetail/UC-PROG-02_SelectWeek.md)**
Allows the user to switch between weeks within a multi‑week program.

### **[UC‑PROG‑03 — View Day Preview]()**
Displays the exercises and structure for a specific day within the program.

### **[UC‑PROG‑04 — Select Program]**
Allows the user to activate a program, making it their current active training plan.

### **[UC‑PROG‑05 — View Daily Workout Summary](/NeuByteTechnologies/FitnessApp/docs/UseCases/ProgramDetail/UC-PROG-03_SelectDay.md)**
Displays the list of exercises for the selected day, including summary‑level information (name, category, equipment, and sets/reps/duration preview).
(Additional Program Detail UCs may be added as the module expands — e.g., Bookmark Program, Compare Programs, Program Recommendations.)

## Relationship to Other Modules
Dashboard Module
- Provides entry point to the user’s active program
- Displays program progress summary
Exercise Programs Module
- Lists all available programs
- Links directly into Program Detail
Workout Execution Module
- Uses the selected program’s structure to drive daily workouts
- Pulls exercise lists and instructions from Program Detail
Reports Module
- Uses program metadata for progress summaries
- Displays completion metrics and adherence trends
Notifications Module
- Sends alerts for program milestones, week transitions, or missed days
Account Module
- Stores the user’s active program selection
- Persists program progress across sessions and devices

## Document Conventions
- All files follow the naming pattern: 
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
