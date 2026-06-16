🎓 Student Management System
A full-stack Student Management System built using Java, JSP, Servlets, JDBC, MySQL, Maven, and Docker. The application provides a complete platform for managing student records, marks, authentication, and administrative operations with role-based access for students and administrators.

🌐 Live Demo
Add your deployed URL here if available.

https://student-management-system-wcja.onrender.com/Admin_Student_Login.jsp

📖 Project Overview
The Student Management System is designed to simplify academic record management. It allows administrators to manage student information, maintain marks records, update data, and generate reports, while students can securely access their profiles and academic performance.
The application follows a layered architecture using Controller, Service, DAO, DTO, and VO design patterns for better maintainability and scalability.

✨ Key Features

👨‍🎓 Student Features

Authentication
Student Login
Session Management
Secure Access
Student Operations
View Student Profile
View Marks Sheet
Download Marks Sheet
View Academic Records

👨‍💼 Admin Features

Authentication
Admin Login
Session Management
Student Management
Add New Student
View Student Details
Search Student By ID
Update Student Information
Delete Student Records
Marks Management
Add Student Marks
Update Marks
View All Marks
Generate Marks Reports
📊 Academic Management
Student Record Maintenance
Marks Management
Search Functionality
Data Validation
Academic Performance Tracking

📂 Application Modules
Student Module
Student Login
View Profile
View Marks
Download Marksheet
Admin Module
Admin Login
Student Registration
Student Management
Marks Management
Student Search
Student Update
Student Deletion
Reporting Module
View Marksheet
Download Reports
Student Records

🏗️ System Architecture
Plain text
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
 
📁 Project Structure
student-management-system/

├── src/
│   └── main/
│       ├── java/
│       │   └── com/pst/smms/
│       │       ├── controller/
│       │       ├── service/
│       │       ├── dao/
│       │       ├── dto/
│       │       ├── vo/
│       │       ├── common/
│       │       └── bo/
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
Plain text

## 🖼️ Project Screenshots

### Admin Login
![Admin Login](Project%20Screenshots/Admin-login.png)

### Admin Dashboard
![Admin Dashboard](Project%20Screenshots/Admin-home.png)

### Student Login
![Student Login](Project%20Screenshots/Student%20login.png)

### Student Home
![Student Home](Project%20Screenshots/student%20home.png)

### Student Details
![Student Details](Project%20Screenshots/Student%20details.png)

### Add Marks
![Add Marks](Project%20Screenshots/Add%20marks.png)

### Add Student Success
![Add Student Success](Project%20Screenshots/Add%20success.png)

### Adding Student
![Adding Student](Project%20Screenshots/Adding.png)

### Contact Page
![Contact Page](Project%20Screenshots/contact.png)

### Search Student By ID
![Search Student](Project%20Screenshots/search%20by%20id.png)

### Update Student
![Update Student](Project%20Screenshots/update%20student.png)

### Update Student Success
![Update Student Success](Project%20Screenshots/update%20success.png)

### Update Marks
![Update Marks](Project%20Screenshots/update%20marks.png)

### Delete Student
![Delete Student](Project%20Screenshots/delete.png)

### Student Marksheet
![Student Marksheet](Project%20Screenshots/student%20view.png)

### Download Marksheet
![Download Marksheet](Project%20Screenshots/download%20sheet.png)

### Marks Added Successfully
![Marks Added Successfully](Project%20Screenshots/marks%20add%20success.png)

### Success Page
![Success Page](Project%20Screenshots/success.png)

### About Page
![About Page](Project%20Screenshots/About.png)
⚙️ Tech Stack

Frontend
HTML5
CSS3
Bootstrap
JavaScript
JSP
Backend
Java
Servlets
JDBC
Database
MySQL
Build Tool
Maven
Deployment
Docker

🚀 Installation Guide

Clone Repository
Bash
git clone https://github.com/SyedYasin07/student-management-system.git
Navigate To Project
Bash
cd student-management-system
Configure Database
Create MySQL Database:
SQL
CREATE DATABASE smms;
Import:
SQL
smms.sql
Build Project
Bash
mvn clean install
Run Application
Deploy the generated WAR file to Apache Tomcat.

📈 Future Enhancements

Role-Based Authorization
Email Notifications
PDF Report Generation
Student Attendance Module
REST APIs
Spring Boot Migration


👨‍💻 Author
Syed Yasin
GitHub: https://github.com/SyedYasin07
⁠
Live Project:
https://student-management-system-wcja.onrender.com/Admin_Student_Login.jsp

---

⭐ If you found this project useful, consider giving it a star.


