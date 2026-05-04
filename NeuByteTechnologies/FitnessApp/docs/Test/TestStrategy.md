# Test Strategy

**Project:** Portfolio Project
**Version:** 1.0
**Status:** Draft
**Last Updated:** 2026-05-04
**Author:** Gordon

---

## 1. Scope

This document defines the test strategy for the portfolio project. It governs all testing activities from unit-level verification through acceptance, covering application logic, API contracts, UI behavior, and non-functional requirements.

**In Scope**
- Application business logic and domain layer
- REST API endpoints and data contracts
- UI components and user flows
- Integration points with external services
- Performance and accessibility baselines

**Out of Scope**
- Third-party service internals
- Infrastructure and network-layer security audits
- Load testing beyond defined performance thresholds

---

## 2. Objectives

| # | Objective |
|---|-----------|
| 1 | Validate that all features meet defined acceptance criteria |
| 2 | Detect defects as early as possible in the development cycle |
| 3 | Ensure regression coverage is maintained across all releases |
| 4 | Demonstrate code quality and engineering discipline for portfolio review |
| 5 | Maintain a living test suite that serves as executable documentation |

---

## 3. Testing Levels

### 3.1 Unit Testing
- **Target:** Individual functions, classes, and modules
- **Ownership:** Developer
- **Coverage Goal:** ≥ 80% line and branch coverage
- **Execution:** On every commit via CI

### 3.2 Integration Testing
- **Target:** Module interactions, database operations, API clients
- **Ownership:** Developer / QA
- **Scope:** Service-to-service contracts; repository and data-layer behavior
- **Execution:** On every pull request via CI

### 3.3 System Testing
- **Target:** End-to-end user flows across the full application stack
- **Ownership:** QA
- **Scope:** Critical user journeys, edge cases, error handling
- **Execution:** On merge to `main`; nightly on staging

### 3.4 Acceptance Testing (UAT)
- **Target:** Business requirements and user stories
- **Ownership:** Stakeholder / Product Owner
- **Scope:** Happy paths and primary failure scenarios per feature
- **Execution:** Pre-release gate

### 3.5 Non-Functional Testing
| Type | Tool | Threshold |
|---|---|---|
| Performance | k6 | P95 response < 500 ms under 100 concurrent users |
| Accessibility | axe-core | Zero critical WCAG 2.1 AA violations |
| Security (SAST) | CodeQL | Zero high-severity findings on merge |

---

## 4. TDD Approach

Test-Driven Development is the default practice for all business logic and API development.

**Cycle**
1. **Red** — Write a failing test that specifies the desired behavior
2. **Green** — Write the minimum code required to pass the test
3. **Refactor** — Improve structure and clarity without changing behavior

**Guidelines**
- Tests are written before implementation code; no feature is merged without a corresponding test
- Each test targets a single behavior; test names are written as full sentences describing intent
- Mocks and stubs are used only at defined boundaries (external APIs, third-party SDKs)
- Tests serve as living documentation and are kept in sync with the codebase at all times

---

## 5. Tools & Frameworks

| Layer | Tool | Purpose |
|---|---|---|
| Unit / Integration | Jest | JavaScript/TypeScript test runner and assertion library |
| Unit / Integration | Vitest | Vite-native unit testing with ESM support |
| E2E | Playwright | Browser automation and end-to-end test execution |
| API Testing | Supertest | HTTP assertion against Express/Node API layer |
| Coverage | Istanbul / nyc | Code coverage instrumentation and reporting |
| Performance | k6 | Load and stress testing |
| Accessibility | axe-core | Automated WCAG compliance scanning |
| Static Analysis | ESLint + CodeQL | Code quality and security scanning |
| CI/CD | GitHub Actions | Pipeline automation and test gate enforcement |
| Reporting | Allure | Test results aggregation and history tracking |

---

## 6. Test Environments

| Environment | Purpose | Data | Deployment Trigger |
|---|---|---|---|
| Local | Developer TDD cycle and debugging | Seeded mock data | Manual |
| CI | Automated unit and integration gates | Isolated test fixtures | Every push / PR |
| Staging | System and regression testing | Anonymized production-like data | Merge to `main` |
| UAT | Acceptance and stakeholder review | Controlled scenario data | Release candidate tag |
| Production | Smoke tests post-deployment only | Live data (read-only probes) | Post-deploy hook |

---

## 7. Roles & Responsibilities

| Role | Responsibility |
|---|---|
| Developer | Authors unit and integration tests; maintains TDD discipline; fixes test failures blocking CI |
| QA Engineer | Designs and maintains system and E2E test suites; manages defect lifecycle |
| Product Owner | Defines and reviews acceptance criteria; approves UAT sign-off |
| DevOps | Maintains CI/CD pipeline; manages environment provisioning and stability |
| Project Lead | Owns test strategy; resolves scope and priority conflicts |

---

## 8. Entry & Exit Criteria

### 8.1 Entry Criteria
- Feature branch has a linked ticket with defined acceptance criteria
- Unit tests written and passing locally before PR is opened
- Feature branch is up to date with `main`; no unresolved merge conflicts
- Environment is stable and accessible

### 8.2 Exit Criteria
- All planned test cases executed
- Unit test coverage meets or exceeds the 80% threshold
- Zero open critical or high-severity defects
- All blocking defects resolved or formally deferred with documented rationale
- Test results reviewed and signed off by QA
- UAT sign-off obtained from Product Owner prior to release

---

## 9. Defect Management

**Severity Classification**

| Severity | Definition | Target Resolution |
|---|---|---|
| Critical | System unusable; data loss or corruption | Immediate — blocks release |
| High | Core functionality broken; no viable workaround | Before next release |
| Medium | Feature degraded; workaround available | Within current sprint |
| Low | Minor cosmetic or UX issue | Backlog; prioritized at planning |

**Lifecycle**

```
New → Assigned → In Progress → In Review → Resolved → Verified → Closed
                                                    ↘ Reopened (if verification fails)
```

**Process**
- All defects are logged in the project issue tracker with steps to reproduce, expected vs. actual behavior, environment, and severity
- Critical and High defects block the CI/CD pipeline until resolved or formally deferred
- Deferred defects require documented stakeholder approval and a target resolution sprint
- Defects discovered in production trigger a root-cause analysis and a corresponding regression test

---

## 10. Requirements Traceability Matrix

| Requirement ID | Description | Test Level | Test Case ID | Status |
|---|---|---|---|---|
| REQ-001 | User authentication flow | System | TC-AUTH-001 – 005 | ✅ Covered |
| REQ-002 | Data input validation | Unit | TC-VAL-001 – 012 | ✅ Covered |
| REQ-003 | API response contracts | Integration | TC-API-001 – 008 | ✅ Covered |
| REQ-004 | Dashboard data rendering | System | TC-UI-001 – 004 | 🔄 In Progress |
| REQ-005 | Export functionality | Acceptance | TC-UAT-001 – 003 | ⏳ Planned |
| REQ-006 | P95 response ≤ 500 ms | Performance | TC-PERF-001 | ⏳ Planned |
| REQ-007 | WCAG 2.1 AA compliance | Accessibility | TC-A11Y-001 | ⏳ Planned |

> **Note:** This matrix is a living document. Requirement IDs and test case IDs are updated as features are defined and tests are authored. Full traceability is maintained in the project issue tracker.

---

## Revision History

| Version | Date | Author | Changes |
|---|---|---|---|
| 1.0 | 2026-05-04 | Gordon | Initial draft |
