# Test Plan (ISTQB Foundation Level Aligned)

## 1. Document Control

| Field               | Value                           |
| ------------------- | ------------------------------- |
| Project             | Campsite Management             |
| Release / Iteration | R1                              |
| Version             | 0.1 (Draft)                     |
| Owner               | QA Team                         |
| Date                | 2026-05-06                      |
| Status              | Draft / Under Review / Approved |
| Approvers           | Product Owner, Dev Lead         |

### Revision History

| Version | Date       | Author   | Changes       |
| :-----: | ---------- | -------- | ------------- |
|   0.1   | 2026-05-06 | QA Team  | Initial draft |

---

## 2. Introduction

### 2.1 Purpose

This test plan covers the **Campsite Form** feature, which allows users to create new campsite records with validation for required fields, cross-field business rules, and proper error handling.

### 2.2 Test Objectives

| Objective                      | Description                               | Success Criteria        |
| ------------------------------ | ----------------------------------------- | ----------------------- |
| Verify happy path submission   | All required fields filled, successful save | Campsite saved, redirect to list with success message |
| Validate required field rules  | Name, Location, Price, Capacity, Type fields | Inline errors shown for missing/ invalid fields |
| Validate cross-field rules     | Business logic combinations               | Appropriate errors shown for invalid combinations |
| Verify optional field handling | Description, Amenities, Image URL         | No errors when omitted unless cross-field rule requires |
| Verify cancellation           | Cancel button functionality               | Redirect to list without saving |

### 2.3 Test Basis

| Source                             | Location           | Version          |
| ---------------------------------- | ------------------ | ---------------- |
| Acceptance Criteria                | This document      | R1               |
| User stories / Acceptance criteria | Provided by user   | Current          |

### 2.4 Definitions and Abbreviations

| Term     | Definition                                                     |
| -------- | -------------------------------------------------------------- |
| TC       | Test Case                                                      |
| EP       | Equivalence Partitioning                                       |
| BVA      | Boundary Value Analysis                                        |
| P0/P1/P2 | Priority levels (P0=Critical, P1=High, P2=Medium, P3=Low)     |

---

## 3. Scope

### 3.1 In Scope

| Feature/Area | Test Level  | Test Types              | Notes |
| ------------ | ----------- | ----------------------- | ----- |
| Campsite Form - Happy Path | System | Functional | All required fields, successful submission |
| Campsite Form - Required Field Validation | System | Functional | Name, Location, Price, Capacity, Type fields |
| Campsite Form - Cross-field Validation | System | Functional | Business rule combinations |
| Campsite Form - Optional Fields | System | Functional | Description, Amenities, Image URL |
| Campsite Form - Cancellation | System | Functional | Cancel button behavior |

### 3.2 Out of Scope

| Feature/Area    | Reason                   | Alternative          |
| --------------- | ------------------------ | -------------------- |
| Editing existing campsites | Not part of this story | Separate user story |
| Deleting campsites | Not part of this story | Separate user story |
| Image upload | Image URL only, no upload | Future enhancement |

### 3.3 Test Items

| Item            | Version   | Build Location           |
| --------------- | --------- | ------------------------ |
| Campsite Form UI | R1 | [App URL] |

### 3.4 Platform Coverage

| Platform        | Versions         | Priority |
| --------------- | ---------------- | :------: |
| Chrome          | Latest |    P1    |
| Firefox         | Latest |    P2    |
| Safari          | Latest |    P1    |

---

## 4. Test Approach (Strategy)

### 4.1 Test Levels

| Level       | Scope                        | Responsibility | Environment |
| ----------- | ---------------------------- | -------------- | ----------- |
| System      | Complete campsite form       | QA Team        | QA/Staging  |
| Acceptance  | Business validation          | PO/Users       | UAT         |

### 4.2 Test Types

| Type          | Applicable | Approach                            |
| ------------- | :--------: | ----------------------------------- |
| Functional    |    Yes     | Black-box testing per acceptance criteria |
| Regression    |    Yes     | Manual + automated suite |
| Smoke         |    Yes     | Happy path verification |
| Usability     |    Yes     | Form validation UX |
| Compatibility |    Yes     | Cross-browser |

### 4.3 Test Design Techniques

| Technique                | When to Apply                 | Coverage Target        |
| ------------------------ | ----------------------------- | ---------------------- |
| Equivalence Partitioning | Required field validation (valid/invalid) | All partitions |
| Boundary Value Analysis  | Price per Night (≥0), Capacity (≥1), Capacity (>20) | All boundaries |
| Decision Tables          | Cross-field validation rules | All rule combinations |
| Use Case Testing         | Happy path end-to-end | Main flow |

### 4.4 Test Data Strategy

| Aspect          | Approach                                            |
| --------------- | --------------------------------------------------- |
| Data source     | Synthetic test data |
| Data management | Created per test case, cleaned up after |
| Sensitive data  | N/A for this feature |

### 4.5 Automation Strategy

| Category       | Automation Approach        |
| -------------- | -------------------------- |
| UI smoke tests | Happy path, critical validations |
| UI regression  | Stable validation scenarios |

**Automation candidates:**
- Happy path submission
- Required field validation
- Cross-field validation rules

---

## 5. Entry and Exit Criteria

### 5.1 Entry Criteria

| Criterion                             | Required | Verification            |
| ------------------------------------- | :------: | ----------------------- |
| Test environment available and stable |   Yes    | Smoke test passes       |
| Build deployed to test environment    |   Yes    | Deployment verified     |
| Test cases reviewed and approved      |   Yes    | Sign-off recorded       |

### 5.2 Exit Criteria

| Criterion                      |  Target  | Measurement         |
| ------------------------------ | :------: | ------------------- |
| Test case execution            |   100%   | Executed / Planned  |
| Test case pass rate            |  >= 95%  | Passed / Executed   |
| Critical defects open          |    0     | Jira filter         |
| High-risk requirements covered |   100%   | Traceability matrix |

---

## 6. Test Deliverables

| Deliverable         | Format          | Frequency               | Audience         |
| ------------------- | --------------- | ----------------------- | ---------------- |
| Test plan           | Markdown | Once, updated as needed | All stakeholders |
| Test cases          | CSV | Before execution | QA Team |
| Bug reports         | Jira | As found | Dev, QA, PO |
| Test summary report | Markdown | End of cycle | All stakeholders |

---

## 7. Schedule and Milestones

| Milestone          | Start Date | End Date | Duration | Dependencies            |
| ------------------ | ---------- | -------- | :------: | ----------------------- |
| Test design        | 2026-05-06 |          |          | Acceptance criteria     |
| Test execution     |            |          |          | Entry criteria met      |
| Bug fix verification |          |          |          | Defects fixed |

---

## 8. Roles and Responsibilities

| Role                | Name      | Responsibilities                        |
| ------------------- | --------- | --------------------------------------- |
| QA Engineer         | QA Team   | Design, execute, report defects         |
| Product Owner       | [Name]    | Clarify requirements, accept features   |
| Developer           | [Name]    | Fix defects, support triage |

---

## 9. Test Environment and Tools

### 9.1 Environments

| Environment | Purpose                   | URL   | Data           |
| ----------- | ------------------------- | ----- | -------------- |
| QA          | QA team testing           | [URL] | Test data      |
| Staging     | Pre-production validation | [URL] | Prod-like data |

### 9.2 Tools

| Category        | Tool                     | Purpose                  |
| --------------- | ------------------------ | ------------------------ |
| Test Management | CSV / Markdown           | Test case management     |
| Automation      | Playwright               | UI automation            |
| CI/CD           | [GitHub Actions]         | Automated test execution |
| Defect Tracking | [Jira]                   | Bug reporting            |

---

## 10. Risks and Mitigation

| ID  | Risk                           | Likelihood | Impact | Exposure | Mitigation                    | Owner  |
| --- | ------------------------------ | :--------: | :----: | :------: | ----------------------------- | ------ |
| R1  | Cross-field validation complexity | Medium | High | High | Decision table testing, thorough coverage | QA |
| R2  | Requirements ambiguity | Low | Medium | Medium | Early PO review, examples | PO |
| R3  | Browser compatibility issues | Medium | Medium | Medium | Cross-browser testing | QA |

---

## 11. Monitoring, Control, and Reporting

### 11.1 Metrics

| Metric                | Definition         | Target     | Frequency |
| --------------------- | ------------------ | ---------- | --------- |
| Execution progress    | Executed / Planned | 100%       | Daily     |
| Pass rate             | Passed / Executed  | >= 95%     | Daily     |
| Defect find rate      | Defects / Day      | Trend down | Daily     |
| Requirements coverage | Covered / Total    | 100%       | Weekly    |

---

## 12. Configuration Management

| Item               | Storage        | Versioning         |
| ------------------ | -------------- | ------------------ |
| Test plan          | Git repository | Tagged releases    |
| Test cases         | Git repository | Version controlled |

---

## 13. Approvals

| Role             | Name | Date | Signature |
| ---------------- | ---- | ---- | --------- |
| Test Lead        |      |      |           |
| Product Owner    |      |      |           |
| Dev Lead         |      |      |           |
