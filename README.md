# 🖋️ Java Blog CMS Platform - Full-Stack Project

This is a professional **Content Management System (CMS)** designed for multi-author blog environments. Developed as a final project for the Java Web Development course at **Cubes School**, this application provides a robust backend for content creators and a dynamic, SEO-optimized frontend for readers.

## 🚀 Project Status: COMPLETED
The project is fully functional, meeting all client specifications, including secure administration, content management, and an interactive user interface.

## 🛠️ Tech Stack & Configuration
- **Language:** Java 11
- **Framework:** Spring MVC (Spring 5.x)
- **Configuration:** XML-based setup (`web.xml`, `spring-servlet.xml`)
- **Persistence:** Hibernate 5 (JPA)
- **Security:** Spring Security (JDBC Authentication with BCrypt)
- **Database:** MySQL
- **Template Engine:** JSP (JavaServer Pages) & JSTL
- **Admin Theme:** AdminLTE 3
- **Server:** Apache Tomcat 9

## 🌟 Key Features

### 1. Administration & Security
- **Blogger Management:** Admin capability to create, edit, or ban users (blocking login access).
- **My Account:** Authors can update their personal information (name, phone, photo) and change passwords securely.
- **Login:** Secured with Spring Security and BCrypt password encryption.

### 2. Homepage & Slider Management
- **Dynamic Sliders:** Full CRUD for sliders (Image, Title, Button Text, URL). Supports both internal and external links.
- **Visibility Control:** Ability to disable/enable sliders and set their display order.
- **Intro Posts:** Automatic display of the 3 latest "Important" marked posts on the index page.

### 3. Blog & Content Engine
- **Post Management:** Advanced CRUD with image uploads, SEO-friendly slug generation, and multiple tag association.
- **Search:** Global search functionality (Title, Description, and Content).
- **Pagination:** Clean post listing with 12 items per page.
- **Sidebar Widgets:** - Top 3 most visited posts from the last 30 days.
    - Category list with dynamic post counters, sorted by manual order.
    - Tag cloud sorted by usage frequency.

### 4. Interactions
- **Comment System:** Moderation panel to enable/disable visitor comments.
- **Contact Messages:** Contact form with an "Unread" notification badge system in the admin sidebar.

## 🧠 Engineering Highlights
- **Legacy XML Mastery:** Fully configured application context and servlet mapping via `web.xml` and `spring-servlet.xml`.
- **N+1 Problem Optimization:** Used `LEFT JOIN FETCH` in HQL to optimize database performance and reduce query overhead.
- **SEO Friendly Architecture:** Implemented logic for unique, URL-safe slugs for posts, categories, and authors.
- **Database Automation:** Utilized Hibernate's `import.sql` for automated initial data population.

## 📦 How to Run & Initial Setup

1. **Manual Database Creation:**
   Create a database in MySQL:
   ```sql
   CREATE DATABASE blog_db CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;