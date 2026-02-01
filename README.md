# Blog CMS Platform - Capstone Project

This project is a comprehensive **Blog Content Management System (CMS)** developed as a final project for the Java Web Development course at **[Cubes School](https://cubes.edu.rs/)** (Belgrade, Serbia).

The application is designed for a team of content writers, providing a robust administrative backend to manage posts, categories, tags, and user interactions.

## 🛠 Tech Stack
- **Language:** Java 11
- **Framework:** Spring MVC (Spring 5.x)
- **Persistence:** Hibernate (JPA)
- **Security:** Spring Security (JDBC-based authentication)
- **Database:** MySQL
- **Template Engine:** JSP (JavaServer Pages) & JSTL
- **Frontend Admin Theme:** AdminLTE 3
- **File Handling:** Commons-fileupload for image management

## 🚀 Key Features (Implemented)
- **Post Administration:** Complete CRUD for blog posts with integrated image uploads and tag management.
- **Category & Tag System:** Hierarchical organization of content with SEO-friendly URL logic.
- **Role-Based Access Control (RBAC):** Secured routes for Admin and Editor roles using Spring Security.
- **Interactive Modules:** - Comment moderation system (approve/delete).
    - Contact message management with unread counters.
- **UI/UX Enhancements:** Dynamic sidebar notifications (unread badges) and slider management for the homepage.

## 💡 Engineering Highlights
During development, I focused on solving common enterprise-level challenges:
- **Hibernate Session Management:** Resolved `TransientObjectException` by ensuring proper entity state management before persistence.
- **Data Integrity:** Fixed issues related to Many-to-Many mapping and NULL value overwrites during updates.
- **Custom Conversion:** Implemented `@InitBinder` in controllers for seamless String-to-Object conversion (Tags).

## 🏁 Future Roadmap
- [ ] User Profile Management & Password Change.
- [ ] Public-facing Web Application (Frontend list and details).
- [ ] Advanced search and filtering via REST or Spring MVC.

---
*Developed by Danilo Gomanjuk as part of the Cubes School Java Full-Stack curriculum.*
