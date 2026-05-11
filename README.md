# Portfolio
This is a repository I will be using to show off my skills with GitHub Projects, Python, Web, MySQL, Azure, and Power BI

## Reasoning for Fitness App
Over the past eight or more years I have been on the weight loss fitness track. Over that time, I have used Fitbit, Samsung Health, and others to track both nutrition and fitness routines. Because of long term use of these types of applications, it made sense to use it as the basis for this portfolio. There are so many aspects of my experience over the years that align with this design.

### GitHub Foundations
Utilizing GitHub for the repository and project management of the project allows me to expand on the basics of project management and planning. 

the fact that documentation has evolved quite a bit over the years from mostly Microsoft Office Documents (*.docx, *.xlsx) to the use of Markdown files ( *.md). This allowed me to upgrade my knowledge in these areas. 

From the source control side if GitHub, I have used multiple Source Control software versions from Visual Source Safe to Team Foundation Server to Subversion and Azure Dev OPs and GitHub. This portfolio allows me to get further practice with GitHub Source Control.

### Python
As I have been a heavy SQL Server Integration Services programmer Python came into the mix. As such, the plan is to use Python for the APIs behind the Fitness App to be the interface between the Front End and the Azure hosted MySQL database.

### Azure
Azure has so many possibilities starting with the Hosting of a MySQL database. Because this is a portfolio project I went with the lower cost database instead of staying with my comfort zone and the Azure SQL Database. 
Azure has so many possibilities starting with the Hosting of a MySQL database. Because this is a portfolio project I went with the lower cost database instead of staying with my comfort zone and the Azure SQL Database. 

The APIs will be hosted in Azure because direct database access poses problems.

Reporting Models that support Power BI reports will have Pipelines to refresh the data on a schedule set to daily for now.

### Modern Web User Interface
With a long history of web development before I was in data heavy positions, I want to update my skills a bit to provide a working front end. The plan is to use components that have minimal cost and are not JavaScript heavy to support browsers that limit JavaScript and or Http Cookies.

### C# 
The backend support for the website it makes sense to update from my previous experience with C# .Net MVC applications to Razor and Node. 

### Power BI Reports
To round out the full cycle reports will provide the platform to transform OLTP data to Star Schema for optimized reporting.

## Documentation Samples (Reviewer-Friendly)

This project includes full enterprise-grade documentation across Business Requirements,
Functional Specifications, UI Specifications, API Contracts, Data Dictionary, Test Cases,
Use Cases, and System Diagrams.

For reviewer convenience, curated Markdown samples are provided:

### UI Specification Samples
[User  Interface Specification Sample Section](/NeuByteTechnologies/FitnessApp/docs/UserInterfaceSpecs/UserInterfaceLogWorkout.md)

### Functional Specification Samples
[Account Functional Specification](/NeuByteTechnologies/FitnessApp/docs/FunctionalSpecs/Account/AccountFS.md)

### API Contract Samples
- Create Account
- Login
- MFA Enrollment

### Data Dictionary Samples
- [Users Table](/NeuByteTechnologies/FitnessApp/docs/DataSpecs/users.md)
- [WeightEntries Table](/NeuByteTechnologies/FitnessApp/docs/DataSpecs/weight-entries.md)



### Test Case Samples
- Positive / Negative / Edge / Integration

### Use Case Samples
- [UC-LOGIN-01_UserLogin](/NeuByteTechnologies/FitnessApp/docs/UseCases/Login/UC-LOGIN-01_UserLogin.md)
- [UC-MENU-03_NavigateDashboard](/NeuByteTechnologies/FitnessApp/docs/UseCases/Menu/UC-MENU-03_NavigateDashboard.md)
- [UC-EP-02_ViewProgramDetail](/NeuByteTechnologies/FitnessApp/docs/UseCases/ExercisePrograms/UC-EP-02_ViewProgramDetail.md)
- [UC-LW-01_LogWorkout](/NeuByteTechnologies/FitnessApp/docs/UseCases/LogWorkout/UC-LW-01_LogWorkout.md)
- [UC‑ANL‑06_LogFeatureUsage](/NeuByteTechnologies/FitnessApp/docs/UseCases/Analytics/UC‑ANL‑06_LogFeatureUsage.md)

### System Diagram Samples
- Context Diagram
- Sequence Diagram
- Data Flow Diagram
- Domain Model

Full documents (PDF , DOCX, XLSX) are available in [`/docs/`](/NeuByteTechnologies/FitnessApp/docs/)

## User Roles
The Fitness App supports two primary system roles. These roles define how different actors interact with the application and determine the permissions, responsibilities, and system behaviors associated with each user type.  

### 1. App User (Primary Role)
The App User is the core consumer of the Fitness App. This role represents individuals who use the application to track and improve their personal fitness journey.

**Responsibilities:**

- Create and manage their user profile
- Log workouts and daily activity
- Track progress over time
- View personalized analytics and insights
- Manage personal settings and preferences

**Characteristics:**

- Primary actor for all functional use cases
- Interacts exclusively through the mobile or web UI
- Has no administrative or system‑level permissions

### 2. App Admin (Operational Role)
The App Admin is responsible for maintaining the operational integrity of the system. This role does not represent a typical end‑user but an internal system operator.  

**Responsibilities:**

- Manage user accounts (create, disable, reset passwords)
- Monitor system logs and error events
- Oversee data integrity and system health
- Perform administrative tasks through backend tools or APIs

**Characteristics:**

- Does not use the app for fitness tracking
- No dedicated UI in scope for this project
- Exists to support RBAC, logging, and system governance requirements