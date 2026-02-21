# 🖋️ Java Blog CMS Platform - Full-Stack Capstone Project

This is a professional, production-ready **Content Management System (CMS)** designed for multi-author blog environments. Developed as a final project for the Java Web Development course at **Cubes School**, this application provides a robust backend for content creators and a dynamic, SEO-optimized frontend for readers.

## 🚀 Project Status: COMPLETED
The project is fully functional and meets all complex client specifications. The backend was built from scratch integrating the **AdminLTE 3** template, while the frontend utilizes a custom-provided theme, fully wired up to the dynamic Java backend.

## 🛠️ Tech Stack & Configuration
- **Language:** Java 11
- **Framework:** Spring MVC (Spring 5.x)
- **Configuration:** Legacy XML-based setup (`web.xml`, `spring-servlet.xml`)
- **Persistence:** Hibernate 5 (JPA)
- **Security:** Spring Security (JDBC Authentication with BCrypt & RBAC)
- **Database:** MySQL
- **Template Engine:** JSP (JavaServer Pages) & JSTL
- **File Handling:** CommonsMultipartResolver
- **Server:** Apache Tomcat 9

---

## 🌟 Key Features

### 1. Administration & Security
- **Blogger Management:** Admin capability to create, edit, or ban users (blocking login access instantly).
- **My Account:** Authors can update their personal information and change passwords securely (BCrypt validation).
- **Advanced Filtering:** Admin post lists feature complex filtering by Title, Category, Author, and Status.

### 2. Homepage & Slider Management
- **Dynamic Main Slider:** Full CRUD for sliders. Supports internal and external URL redirection, display order sorting, and enable/disable toggles.
- **Intro Posts:** Automatic display of the 3 latest "Important" marked posts on the index page.
- **Latest Posts Slider:** A dynamic carousel showcasing the 12 most recently published articles.

### 3. Blog & Content Engine
- **Post Management:** Advanced CRUD with image uploads, mandatory character limits, and multiple tag selection.
- **SEO & Navigation:** Unique, URL-safe slugs for posts, categories, and authors. Automatically calculated **Previous/Next post links** on single post pages.
- **View Tracker:** Automatic incrementation of view counts per post visit.
- **Sidebar Widgets:** - Top 3 most visited posts from the *last 30 days*.
  - Category list with dynamic post counters, sorted by manual admin order.
  - Tag cloud sorted by actual usage frequency in posts.

### 4. User Interactions
- **Comment Moderation:** Admin panel to approve or disable visitor comments. Only comments linked to the specific post are displayed, sorted newest first.
- **Contact Messages:** Contact form with an "Unread" notification badge system directly in the admin sidebar.

---

## 🧠 Engineering Highlights & Problem Solving

During the development of this project, I tackled several advanced engineering challenges:

### 1. Taming the N+1 Problem & Memory Issues
Initially, I used `LEFT JOIN FETCH` in my HQL queries to load Posts with their Categories and Tags. However, using `JOIN FETCH` alongside pagination (`setMaxResults()`) forces Hibernate to perform pagination *in memory*, leading to massive performance overhead. 
**Solution:** I refactored the fetch strategy. I queried the base entities first and strategically used `Hibernate.initialize()` within the Service layer to load proxies only when absolutely necessary, keeping DB queries lightning-fast.

### 2. Hibernate Session Management & Data Integrity
Encountered the `TransientObjectException` and `NonUniqueObjectException` when saving posts with existing tags or updating categories. Tag names were occasionally overwritten with `NULL` values during post updates.
**Solution:** I optimized the persistence layer by ensuring full entity fetching before updates and refactored the DAO layer to use `session.merge()` instead of `saveOrUpdate()` to correctly handle detached entities coming from frontend forms.

### 3. Database Automation & Parsing Quirks
To make the project plug-and-play, I utilized Hibernate's `import.sql` for initial data seeding. However, MySQL Workbench exported boolean values as `_binary`, causing a `Data truncation` error.
**Solution:** I mapped all booleans to explicit `true`/`false` literals and formatted the entire SQL dump into strict, single-line statements to accommodate Hibernate’s line-by-line parsing mechanism.

### 4. Custom Data Binding (@InitBinder)
To keep the controller logic clean when handling multi-select forms (like selecting multiple Tags for a Post), I implemented `@InitBinder`. This handled the automatic, seamless conversion of Tag IDs (Strings from the HTTP request) into concrete Java Objects before they even hit the controller method.

### 5. Smart Sorting Algorithm & Complex Aggregations
- **Sorting:** Developed a custom Display Order system for Categories and Sliders that handles reordering (shifting items up/down) and automatically fills "gaps" in the sequence when an item is deleted.
- **Aggregations:** Wrote optimized HQL queries using `DATE_SUB` and `ORDER BY view_count DESC` for UI widgets (like trending posts) to let the database do the heavy lifting instead of filtering in Java.

---

## 📦 How to Run & Initial Setup

1. **Manual Database Creation:**
   Create a database in your local MySQL instance:
   ```sql
   CREATE DATABASE blog_db CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
   
