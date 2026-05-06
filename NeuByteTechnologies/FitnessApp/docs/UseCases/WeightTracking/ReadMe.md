# Weight Tracking — Use Case Overview
The Weight Tracking module contains use cases related to recording, viewing, and managing a user’s body‑weight history. These use cases define how users enter weight, set goals, view trends, and maintain accurate historical data.
This module supports progress monitoring, analytics, and personalized insights across the fitness experience.

## Purpose of This Module
The Weight Tracking module provides:
- A simple, reliable way for users to record and monitor weight
- A clear definition of how users view trends and insights
- A foundation for progress analytics and personalized recommendations
- A consistent presentation of weight history and goals
- A traceability anchor for BR‑WT‑01 → BR‑WT‑26 and related functional/UI specifications
- A clean separation between weight entry, goal setting, and insights
This module is central to progress tracking and long‑term fitness adherence.

---

## Weight Tracking Use Cases (UC-WT-01 → UC-WT-06)
### **[UC‑WT‑01 — Track Body Weight](/NeuByteTechnologies/FitnessApp/docs/UseCases/WeightTracking/UC-WT-01_TrackBodyWeight.md)**
Allows the user to enter today’s weight and save it to their history.

### **[UC‑WT‑02 — Set Weight Goal](/NeuByteTechnologies/FitnessApp/docs/UseCases/WeightTracking/UC-WT-02_SetWeightGoal.md)**
Allows the user to define a target weight and track progress toward it.

### **[UC‑WT‑03 — View Weight Trend](/NeuByteTechnologies/FitnessApp/docs/UseCases/WeightTracking/UC-WT-03_ViewWeightTrend.md)**
Displays historical weight entries and a trend graph over time.

### **[UC‑WT‑04 — Analyze Weight Insights](/NeuByteTechnologies/FitnessApp/docs/UseCases/WeightTracking/UC-WT-04_AnalyzeWeightInsights.md)
Provides insights such as average weekly change, progress toward goal, and trend classification.

### **[UC‑WT‑05 — Edit Weight Entry](/NeuByteTechnologies/FitnessApp/docs/UseCases/WeightTracking/UC-WT-05_EditWeightEntry.md)**
Allows the user to modify a previously recorded weight entry.

### **[UC‑WT‑06 — Delete Weight Entry](/NeuByteTechnologies/FitnessApp/docs/UseCases/WeightTracking/UC-WT-06-DeleteWeightEntry.md)
Allows the user to remove a previously recorded weight entry, with confirmation.
(Additional Weight Tracking UCs may be added as the module expands — e.g., Body Composition, Device Sync, Multi‑Metric Tracking.)

## Relationship to Other Modules
Dashboard Module
- Displays current weight, goal progress, and trend summary
Analytics Module
- Logs weight entry events
- Generates insights and trend classifications
Reports Module
- Uses weight history for long‑term progress charts
Notifications Module
- Sends reminders for weigh‑ins
- Alerts users when they hit milestones
Account Module
- Stores user profile data including weight goals

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