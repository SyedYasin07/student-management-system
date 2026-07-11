# 🎓 Student Management System

![Java](https://img.shields.io/badge/Java-17-orange)
![JSP](https://img.shields.io/badge/JSP-Servlets-blue)
![MySQL](https://img.shields.io/badge/MySQL-Database-green)
![Maven](https://img.shields.io/badge/Maven-Build-red)
![Docker](https://img.shields.io/badge/Docker-Containerization-2496ED)

A full-stack **Student Management System** developed using **Java, JSP, Servlets, JDBC, MySQL, Maven, and Docker**. The application provides a centralized platform for managing student records, academic performance, authentication, and administrative operations through secure role-based access.

---

# 🌐 Live Demo

🔗 **Application URL**

https://student-management-system-wcja.onrender.com/Admin_Student_Login.jsp

---

# 📖 Project Overview

The **Student Management System (SMS)** is designed to streamline academic record management by providing separate interfaces for **Students** and **Administrators**.

Students can securely access their profiles, marksheets, and academic records, while administrators can efficiently manage student information, marks, and reports.

The project follows a layered architecture using:

* Controller Layer
* Service Layer
* DAO Layer
* DTO Layer
* VO Layer

This architecture improves maintainability, scalability, and code reusability.

---

# ✨ Features

## 👨‍🎓 Student Features

### 🔐 Authentication

* Student Login
* Session Management
* Secure Access Control

### 📚 Academic Services

* View Student Profile
* View Marks Sheet
* Download Marks Sheet
* View Academic Records

---

## 👨‍💼 Admin Features

### 🔐 Authentication

* Admin Login
* Session Management

### 👨‍🎓 Student Management

* Add New Student
* View Student Details
* Search Student by ID
* Update Student Information
* Delete Student Records

### 📝 Marks Management

* Add Student Marks
* Update Marks
* View All Marks
* Generate Marks Reports

---

## 📊 Academic Management

* Student Record Maintenance
* Marks Management
* Search Functionality
* Data Validation
* Academic Performance Tracking

---

# 🏗️ System Architecture

```text
          Admin / Student
                 │
                 ▼
           JSP Frontend
      (HTML + CSS + JS)
                 │
                 ▼
             Servlets
                 │
                 ▼
          Service Layer
                 │
                 ▼
             DAO Layer
                 │
                 ▼
               JDBC
                 │
                 ▼
          MySQL Database
```

---

# 📂 Project Structure

```text
student-management-system/
│
├── src/
│   └── main/
│       ├── java/
│       │   └── com/pst/smms/
│       │       ├── controller/
│       │       ├── service/
│       │       ├── dao/
│       │       ├── dto/
│       │       ├── vo/
│       │       ├── bo/
│       │       └── common/
│       │
│       └── webapp/
│           ├── WEB-INF/
│           ├── META-INF/
│           ├── Styles/
│           └── JSP Pages
│
├── smms.sql
├── pom.xml
├── Dockerfile
└── README.md
```

---

# 🖼️ Project Screenshots

## 🔐 Authentication

### Admin Login

![Admin Login](Project%20Screenshots/Admin-login.png)

### Student Login

![Student Login](Project%20Screenshots/Student%20login.png)

---

## 👨‍💼 Admin Dashboard

### Admin Home

![Admin Dashboard](Project%20Screenshots/Admin-home.png)

### Add Student

![Adding Student](Project%20Screenshots/Adding.png)

### Student Added Successfully

![Add Student Success](Project%20Screenshots/Add%20success.png)

### Search Student By ID

![Search Student](Project%20Screenshots/search%20by%20id.png)

### Update Student

![Update Student](Project%20Screenshots/update%20student.png)

### Update Success

![Update Student Success](Project%20Screenshots/update%20success.png)

### Delete Student

![Delete Student](Project%20Screenshots/delete.png)

---

## 📚 Marks Management

### Add Marks

![Add Marks](Project%20Screenshots/Add%20marks.png)

### Marks Added Successfully

![Marks Added Successfully](Project%20Screenshots/marks%20add%20success.png)

### Update Marks

![Update Marks](Project%20Screenshots/update%20marks.png)

---

## 👨‍🎓 Student Module

### Student Home

![Student Home](Project%20Screenshots/student%20home.png)

### Student Details

![Student Details](Project%20Screenshots/Student%20details.png)

### Student Marksheet

![Student Marksheet](Project%20Screenshots/student%20view.png)

### Download Marksheet

![Download Marksheet](Project%20Screenshots/download%20sheet.png)

---

## ℹ️ Additional Pages

### About Page

![About Page](Project%20Screenshots/About.png)

### Contact Page

![Contact Page](Project%20Screenshots/contact.png)

### Success Page

![Success Page](Project%20Screenshots/success.png)

---

# ⚙️ Technology Stack

## Frontend

* HTML5
* CSS3
* Bootstrap
* JavaScript
* JSP

## Backend

* Java
* Servlets
* JDBC

## Database

* MySQL

## Build Tool

* Maven

## Deployment

* Docker
* Apache Tomcat
* Render

---

# 🚀 Installation Guide

## 1️⃣ Clone Repository

```bash
git clone https://github.com/SyedYasin07/student-management-system.git
```

## 2️⃣ Navigate to Project

```bash
cd student-management-system
```

## 3️⃣ Configure Database

Create Database:

```sql
CREATE DATABASE smms;
```

Import SQL Script:

```sql
smms.sql
```

---

## 4️⃣ Configure Database Connection

Update database credentials inside your JDBC configuration file.

```java
String url = "jdbc:mysql://localhost:3306/smms";
String username = "root";
String password = "your_password";
```

---

## 5️⃣ Build Project

```bash
mvn clean install
```

---

## 6️⃣ Run Application

Deploy the generated WAR file on Apache Tomcat.

Example:

```text
http://localhost:8080/student-management-system
```

---

# 🐳 Docker Deployment

Build Docker Image:

```bash
docker build -t student-management-system .
```

Run Container:

```bash
docker run -p 8080:8080 student-management-system
```

---

# 📈 Future Enhancements

* Role-Based Authorization
* Email Notifications
* PDF Report Generation
* Student Attendance Management
* REST API Development
* Spring Boot Migration
* Spring Security Integration
* Dashboard Analytics & Charts

---

# 👨‍💻 Author

**Syed Yasin**

GitHub: https://github.com/SyedYasin07

Live Project:

https://student-management-system-wcja.onrender.com/Admin_Student_Login.jsp

---

# 🤝 Contributing

Contributions, issues, and feature requests are welcome.

Feel free to fork the repository and submit a pull request.

---

# ⭐ Support

If you found this project useful, consider giving it a **Star ⭐** on GitHub.
