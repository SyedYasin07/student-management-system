<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Contact Us - SMMS</title>

<link href="bootstrap/bootstrap.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">

<style>
body{
    background: linear-gradient(135deg,#0f172a,#1e293b);
    font-family: 'Segoe UI', sans-serif;
    min-height: 100vh;
}

.contact-card{
    background: rgba(255,255,255,0.08);
    backdrop-filter: blur(12px);
    border-radius: 25px;
    padding: 40px;
    color: white;
    box-shadow: 0 8px 30px rgba(0,0,0,0.3);
}

.contact-icon{
    width:70px;
    height:70px;
    border-radius:50%;
    background: linear-gradient(45deg,#0d6efd,#00d4ff);
    display:flex;
    justify-content:center;
    align-items:center;
    margin:auto;
    font-size:30px;
    color:white;
}

.info-box{
    background: rgba(255,255,255,0.12);
    border-radius:15px;
    padding:15px;
    margin-bottom:15px;
    transition:0.3s;
}

.info-box:hover{
    transform:translateY(-5px);
    background: rgba(255,255,255,0.18);
}

.info-title{
    font-size:14px;
    color:#cbd5e1;
    margin-bottom:5px;
}

.info-value{
    font-size:18px;
    font-weight:600;
    color:white;
}

.social-links a{
    text-decoration:none;
    color:white;
    font-size:22px;
    margin:0 10px;
    transition:0.3s;
}

.social-links a:hover{
    color:#00d4ff;
}

.page-title{
    color:white;
    font-weight:700;
}

.page-subtitle{
    color:#cbd5e1;
}
</style>

</head>
<body>

<div class="container py-5">

    <div class="row justify-content-center">

        <div class="col-lg-8">

            <div class="contact-card text-center">

                <div class="contact-icon mb-3">
                    <i class="bi bi-person-lines-fill"></i>
                </div>

                <h1 class="page-title">Contact Us</h1>

                <p class="page-subtitle mb-4">
                    Feel free to contact for project discussion,
                    feedback, suggestions, or collaboration.
                </p>

                <div class="info-box">
                    <div class="info-title">Developer</div>
                    <div class="info-value">Syed Yasin</div>
                </div>

                <div class="info-box">
                    <div class="info-title">Email Address</div>
                    <div class="info-value">
                        syedyasin075@gmail.com
                    </div>
                </div>

                <div class="info-box">
                    <div class="info-title">Phone Number</div>
                    <div class="info-value">
                        +91 6303834758
                    </div>
                </div>

                <div class="info-box">
                    <div class="info-title">Project</div>
                    <div class="info-value">
                        Student Marks Management System
                    </div>
                </div>

                <hr class="text-light my-4">

                <h5 class="mb-3">Connect With Me</h5>

                <div class="social-links">

                    <a href="https://linkedin.com/in/syed-yasin-296a49348">
                        <i class="bi bi-linkedin"></i>
                    </a>

                    <a href="https://github.com/SyedYasin07">
                        <i class="bi bi-github"></i>
                    </a>

                    <a href="#">
                        <i class="bi bi-envelope-fill"></i>
                    </a>

                </div>

            </div>

        </div>

    </div>

</div>

</body>
</html>