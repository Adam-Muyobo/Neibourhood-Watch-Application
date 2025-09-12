# Neighborhood Watch Application  

## 📌 Overview  
The **Neighborhood Watch Application** is a community security system designed to monitor patrols conducted by security officers, support neighborhood watch members, and provide administrators with full oversight.  
It includes both a **web application** (for administrators) and a **mobile application** (for officers and members).  

The system enhances **safety, transparency, and accountability** by integrating QR code patrol tracking, subscription payments, community interaction, and emergency alerts.  

<img width="300" height="300" alt="image" src="https://github.com/user-attachments/assets/b0917746-6330-4f58-af34-228b6772093c" />

---

## 👥 Users and Roles  

### 1. Administrators (Web + Mobile)
- Approve/reject self-registered accounts.  
- Suspend, block, or delete users.  
- Add/remove houses for monitoring.  
- Configure and maintain the system.  
- Manage officer suspensions and reinstatements.  
- Generate reports (weekly, monthly, yearly).  

### 2. Security Officers (Mobile Only)
- Self-register through the app (requires admin approval).  
- Log patrols by scanning QR codes.  
- Add contextual comments during patrols.  
- View personal patrol history.  
- Work offline and sync later.  

### 3. Neighborhood Watch Members (Mobile Only)
- Self-register (requires admin approval).  
- Pay monthly subscription fees.  
- View patrol statistics for their area.  
- Participate in community discussions.  
- Raise **emergency alerts**.  
- Receive automated notifications for patrol anomalies.  

---

## 📲 Features  

- **QR Code Patrol Logging** – Every gate/house has a unique QR code to verify officer patrols.  
- **Emergency Alerts** – Members can raise urgent alerts, instantly notifying officers and admins.  
- **Community Interaction** – Members can post updates, share safety tips, and engage in discussions.  
- **Subscription Management** – Automated suspension for missed payments; reinstatement upon payment.  
- **Offline Support** – Patrols and alerts are logged offline and synced once connectivity is restored.  
- **Reporting** – Weekly, monthly, and yearly reports on patrol compliance, anomalies, and payments.  

---

## 🔐 Non-Functional Requirements  

- **Security**  
  - Two-factor authentication (2FA) for admins.  
  - End-to-end encryption of sensitive data.  
  - PCI-DSS compliant payment gateway integration.  

- **Scalability**  
  - Cloud-hosted backend with load balancers.  
  - Scalable databases to handle growing user numbers.  

- **Performance**  
  - API response time ≤ 300ms.  
  - Emergency alert dispatch ≤ 5 seconds.  

- **Reliability & Recovery**  
  - 99.9% uptime.  
  - Automated backups.  
  - Disaster recovery (RPO ≤ 15 min, RTO ≤ 60 min).  

- **Usability**  
  - Simple, intuitive UI for officers and members.  
  - Administrator dashboards with statistics and controls.  
  - Support for **English** and **Setswana**.  

---

## 🎨 Branding & Logo  

- **Colors**: Black, White, and Blue (Botswana flag blue).  
- **Logo Concept**:  
  - A **stylized eye** integrated with a **house/roof** to symbolize *watchfulness and community*.  
  - Surrounded by a thin **blue protective circle** representing unity and safety.  
  - Text “Neighborhood Watch”:  
    - “Neighborhood” in black.  
    - “Watch” in blue.  

---

## 🚀 Technology Stack (Proposed)  

- **Mobile App**: Flutter (cross-platform, offline-first).  
- **Backend**: Spring Boot / Node.js (secure, scalable).  
- **Database**: PostgreSQL (with replicas), Redis (caching).  
- **Authentication**: Email OTP, Two-Factor Authentication.  
- **Notifications**: Push (Firebase/APNs), SMS, Email.  
- **Payments**: Stripe or Botswana-based mobile money/card gateways.  

---

## 📊 Example Use Cases  

- **UC-1: Officer Patrol Logging**  
  An officer scans a gate’s QR code → system records officer ID, time, and location → members see updated patrol stats.  

- **UC-2: Member Emergency Alert**  
  A member presses “Emergency Alert” → all officers are instantly notified → admins receive incident reports.  

- **UC-3: Admin Suspends Officer**  
  If an officer scans < X% checkpoints → system suspends officer provisionally → admin investigates and finalizes action.  

---

## 📝 License  
This project is for educational and community security purposes under CSI473 – Software Design Projects.  

