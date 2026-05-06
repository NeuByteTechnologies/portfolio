# Analytics Module  
Cross‑Module Event Logging Framework & Application Telemetry

The **Analytics module** defines all cross‑cutting event‑logging behaviors used across the NeuByte Fitness application. These analytics events are not business intelligence (BI) reports and not Power BI logic — they are **application‑level telemetry** that records user behavior, navigation, performance, and system events.

Analytics ensures:
- Consistent event logging across all modules  
- A unified event schema for all telemetry  
- Clear insight into user behavior and feature usage  
- Support for performance monitoring  
- Support for error analytics  
- Clean separation from Error Handling and Reports modules  

Analytics is conceptually similar to Google Analytics, but implemented **inside the app**, not through a web tracker.

---

## Purpose of the Analytics Module
The Analytics module captures all system‑wide event‑logging behaviors that appear across multiple modules but must be defined once at the architectural level.

This includes:
- Page load events  
- Navigation events  
- User action events  
- Data entry events  
- Authentication events  
- Notification interactions  
- Performance metrics  
- Error events  
- First‑time user events  

These events appear across Dashboard, Login, Programs, Log Workout, Weight Tracking, Reports, Notifications, and more — but are not owned by any single module.

---

## Analytics Use Cases (UC‑ANL‑01 → UC‑ANL‑10)

### **UC‑ANL‑01 — Log Page Load Events**
Logs when a user opens any major screen (Dashboard, Login, Programs, Reports).

### **UC‑ANL‑02 — Log Navigation Events**
Logs transitions between screens or modules (Menu → Dashboard, Dashboard → Program).

### **UC‑ANL‑03 — Log User Action Events**
Logs meaningful interactions (program selected, workout logged, weight entry added).

### **UC‑ANL‑04 — Log Authentication Events**
Logs login success, login failure, logout, and password reset completion.

### **UC‑ANL‑05 — Log Data Entry Events**
Logs creation or modification of user data (weight entries, workouts).

### **UC‑ANL‑06 — Log Feature Usage**
Logs which features users interact with (Reports viewed, Help accessed).

### **UC‑ANL‑07 — Log Notification Interactions**
Logs notification opens, dismissals, and read status changes.

### **UC‑ANL‑08 — Log Performance Metrics**
Logs performance‑related events (page load time, API latency, cache hit/miss).

### **UC‑ANL‑09 — Log Error Events**
Logs error occurrences for analytics and debugging (ties into Error Handling).

### **UC‑ANL‑10 — Log First‑Time User Events**
Logs onboarding‑related events (first weight entry, first workout, first program selection).

---

## Architectural Role
The Analytics module provides the **system‑wide telemetry framework** used by all feature modules. It defines:

- **Unified event schema**  
- **Event logging rules**  
- **Event categories**  
- **Cross‑module triggers**  
- **Integration with Error Handling**  
- **Integration with Performance**  
- **Integration with Empty States**  

This ensures that each module can focus on business logic while relying on a consistent, centralized analytics pipeline.

---

## Unified Event Schema (Recommended)
All analytics events follow a single, consistent structure:
