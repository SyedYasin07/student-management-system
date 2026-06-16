<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" type="image/png" href="icons/smms.png">
<title>Login - Student Marks Management System</title>
<link rel="icon" type="image/png" href="icons/smms.png">

<link href="bootstrap/bootstrap.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css">
<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:'Poppins',sans-serif;
}

body{
    min-height:100vh;
    display:flex;
    justify-content:center;
    align-items:center;
    background:linear-gradient(135deg,#0f172a,#1e293b,#334155);
}

.login-container{
    width:100%;
    max-width:450px;
    padding:20px;
}

.login-card{
    background:rgba(255,255,255,0.08);
    backdrop-filter:blur(15px);
    border:1px solid rgba(255,255,255,0.15);
    border-radius:25px;
    padding:40px;
    box-shadow:0 8px 30px rgba(0,0,0,0.35);
}

.logo{
    text-align:center;
    font-size:55px;
    margin-bottom:10px;
}

.title{
    text-align:center;
    color:white;
    font-weight:700;
    margin-bottom:5px;
}

.subtitle{
    text-align:center;
    color:#cbd5e1;
    margin-bottom:30px;
    font-size:14px;
}

.form-label{
    color:white;
    font-weight:500;
}

.form-control,
.form-select{
    height:50px;
    border-radius:12px;
}

.form-control:focus,
.form-select:focus{
    box-shadow:none;
    border-color:#3b82f6;
}

.btn-login{
    width:100%;
    height:52px;
    border:none;
    border-radius:12px;
    background:linear-gradient(135deg,#2563eb,#06b6d4);
    color:white;
    font-weight:600;
    font-size:16px;
    transition:.3s;
}

.btn-login:hover{
    transform:translateY(-3px);
}

.footer-text{
    text-align:center;
    color:#cbd5e1;
    margin-top:20px;
    font-size:13px;
}

</style>

</head>
<body>

<div class="login-container">

    <div class="login-card">

        <div class="logo">🎓</div>

        <h2 class="title">
            Student Marks Management System
        </h2>

        <p class="subtitle">
            Secure Login Portal
        </p>

        <form action="./LoginController" method="post">

            <div class="mb-3">
                <label class="form-label">
                    Login As
                </label>

                <select name="role" class="form-select">
                    <option value="admin">Admin</option>
                    <option value="student">Student</option>
                </select>
            </div>

            <div class="mb-3">
                <label class="form-label">
                    User ID
                </label>

                <input
                    type="text"
                    name="userid"
                    class="form-control"
                    placeholder="Enter User ID"
                    required>
            </div>

            <div class="mb-4">
                <label class="form-label">
                    Password
                </label>

                <input
                    type="password"
                    name="password"
                    class="form-control"
                    placeholder="Enter Password"
                    required>
            </div>

            <button type="submit" class="btn-login">
                Login
            </button>

        </form>

        <div class="footer-text">
            © 2026 Student Marks Management System
        </div>

    </div>

</div>

</body>
</html>