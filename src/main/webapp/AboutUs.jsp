<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>About Us - SMMS</title>

<link href="bootstrap/bootstrap.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">
<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:'Poppins',sans-serif;
}

body{
    background:linear-gradient(135deg,#0f172a,#1e293b,#334155);
    min-height:100vh;
}

.about-section{
    padding:80px 20px;
}

.about-card{
    max-width:1000px;
    margin:auto;

    background:rgba(255,255,255,0.08);
    backdrop-filter:blur(15px);

    border:1px solid rgba(255,255,255,0.15);

    border-radius:25px;

    padding:50px;

    box-shadow:0 8px 30px rgba(0,0,0,0.4);
}

.main-title{
    text-align:center;
    color:white;
    font-size:2.5rem;
    font-weight:700;
    margin-bottom:20px;
}

.subtitle{
    text-align:center;
    color:#cbd5e1;
    margin-bottom:40px;
}

.info-text{
    color:#e2e8f0;
    line-height:1.9;
    font-size:1.05rem;
    text-align:justify;
}

.feature-box{
    background:rgba(255,255,255,0.08);
    border-radius:15px;
    padding:20px;
    margin-top:20px;
    color:white;
    transition:.3s;
}

.feature-box:hover{
    transform:translateY(-5px);
}

.feature-title{
    font-weight:600;
    margin-bottom:10px;
}

.developer-section{
    margin-top:40px;
    text-align:center;
}

.developer-name{
    color:#38bdf8;
    font-size:1.5rem;
    font-weight:700;
}

.footer-note{
    margin-top:15px;
    color:#cbd5e1;
}

</style>

</head>
<body>

<div class="about-section">

    <div class="about-card">

        <h1 class="main-title">
            About Student Marks Management System
        </h1>

        <p class="subtitle">
            Academic Performance Management Platform
        </p>

        <p class="info-text">
            Student Marks Management System (SMMS) is a web-based application
            developed to simplify student information and marks management.
            The system enables administrators to efficiently manage student
            records, update marks, monitor academic performance, and generate
            reports. Students can securely access their personal details and
            view their marks through an authenticated login system.
        </p>

        <div class="row mt-4">

            <div class="col-md-4">
    <div class="feature-box">
        <div class="feature-title">
            <i class="bi bi-people-fill me-2"></i>
            Student Management
        </div>
        Manage student records with ease.
    </div>
</div>

<div class="col-md-4">
    <div class="feature-box">
        <div class="feature-title">
            <i class="bi bi-bar-chart-fill me-2"></i>
            Marks Management
        </div>
        Store and track academic performance.
    </div>
</div>

<div class="col-md-4">
    <div class="feature-box">
        <div class="feature-title">
            <i class="bi bi-shield-lock-fill me-2"></i>
            Secure Access
        </div>
        
        Role-based authentication and secure login.
    </div>
</div>
               

        <div class="developer-section">

            <h3 class="text-white">
                Developed By
            </h3>

            <div class="developer-name">
                Syed Yasin
            </div>

            <div class="footer-note">
                Full Stack Java Developer
            </div>

            <div class="footer-note">
                Technologies Used:
                Java • JSP • Servlets • JDBC • MySQL • Bootstrap
            </div>

        </div>

    </div>

</div>

</body>
</html>