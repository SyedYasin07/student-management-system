<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>New Student</title>
  <link rel="stylesheet" href="bootstrap/bootstrap.css">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
  <style>
    body {
      background: linear-gradient(135deg, #6a11cb, #2575fc);
      font-family: 'Segoe UI', sans-serif;
      overflow-x: hidden;
    }

    @keyframes slideInFromLeft {
      0% {
        opacity: 0;
        transform: translateX(-100px);
      }
      100% {
        opacity: 1;
        transform: translateX(0);
      }
    }

    .form-card {
      animation: slideInFromLeft 1s ease-out;
      background: rgba(255, 255, 255, 0.95);
      border-radius: 16px;
      padding: 30px;
      width: 500px; /* Reduced from 600px */
      margin: 50px auto;
      box-shadow: 0 10px 25px rgba(0, 0, 0, 0.15);
    }

    .form-title {
      text-align: center;
      font-weight: bold;
      margin-bottom: 25px;
      color: #4b0082;
    }

    .form-control:focus {
      border-color: #6a11cb;
      box-shadow: 0 0 0 0.2rem rgba(106, 17, 203, 0.25);
    }

    .btn-primary {
      background-color: #6a11cb;
      border: none;
    }

    .btn-primary:hover {
      background-color: #5011a1;
    }

    .gender-radio-group {
      display: flex;
      justify-content: space-around;
      align-items: center;
      width: 100%;
      padding: 8px 0;
      border: 1px solid #ced4da;
      border-radius: 0.375rem;
      background-color: #fff;
    }

    .gender-radio-group .form-check {
      margin-bottom: 0;
    }

    .gender-radio-group .form-check-input:checked {
      background-color: #6a11cb;
      border-color: #6a11cb;
    }

    .gender-radio-group .form-check-label {
      margin-left: 4px;
      font-weight: 500;
      color: #333;
    }
  </style>
</head>
<body>

<%
    String msg = request.getAttribute("message") == null ? "" : (String) request.getAttribute("message");
    String color = request.getAttribute("color") == null ? "black" : (String) request.getAttribute("color");
%>

<%@ include file="header.html"%>
<%@ include file="Navbar.html"%>

<div class="form-card">
  <h3 class="form-title">Add New Student</h3>
  <p style="color:<%= color %>; font-weight:bold; text-align:center;">
    <%= msg %>
  </p>

  <form action="./Admin_Student_HomeController" method="post">
    <div class="mb-3">
      <label class="form-label">Roll Number</label>
      <div class="input-group">
        <span class="input-group-text"><i class="bi bi-person-vcard"></i></span>
        <input type="text" class="form-control" placeholder="Enter Roll Number" id="rollnumber" name="rollNumber" required>
      </div>
    </div>

    <div class="mb-3">
      <label class="form-label">Full Name</label>
      <div class="input-group">
        <span class="input-group-text"><i class="bi bi-person-fill"></i></span>
        <input type="text" class="form-control" placeholder="Enter Full Name" id="name" name="name" required>
      </div>
    </div>

    <div class="mb-3">
      <label class="form-label d-block">Gender</label>
      <div class="input-group">
        <span class="input-group-text"><i class="bi bi-gender-ambiguous"></i></span>
        <div class="gender-radio-group w-100">
          <div class="form-check form-check-inline">
            <input class="form-check-input" type="radio" name="gender" id="genderMale" value="male" required>
            <label class="form-check-label" for="genderMale">Male</label>
          </div>
          <div class="form-check form-check-inline">
            <input class="form-check-input" type="radio" name="gender" id="genderFemale" value="female">
            <label class="form-check-label" for="genderFemale">Female</label>
          </div>
          <div class="form-check form-check-inline">
            <input class="form-check-input" type="radio" name="gender" id="genderOther" value="Other">
            <label class="form-check-label" for="genderOther">Other</label>
          </div>
        </div>
      </div>
    </div>

    <div class="mb-3">
      <label class="form-label">Date of Birth</label>
      <div class="input-group">
        <span class="input-group-text"><i class="bi bi-calendar-date"></i></span>
        <input type="date" class="form-control" name="dob" id="dob" required>
      </div>
    </div>

    <div class="mb-3">
      <label class="form-label">Mobile Number</label>
      <div class="input-group">
        <span class="input-group-text"><i class="bi bi-phone"></i></span>
        <input type="tel" class="form-control" placeholder="Enter Mobile Number" name="mobile" id="mobile" required>
      </div>
    </div>

    <div class="mb-3">
      <label class="form-label">Email</label>
      <div class="input-group">
        <span class="input-group-text"><i class="bi bi-envelope-at-fill"></i></span>
        <input type="email" class="form-control" placeholder="Enter Email Address" name="email" id="email" required>
      </div>
    </div>

    <div class="mb-4">
      <label class="form-label">Password</label>
      <div class="input-group">
        <span class="input-group-text"><i class="bi bi-lock-fill"></i></span>
        <input type="password" class="form-control" placeholder="Enter Password" id="password" name="password" required>
      </div>
    </div>

    <div class="d-grid">
      <button type="submit" class="btn btn-primary btn-lg">
        <i class="bi bi-check-circle"></i> Add Student
      </button>
    </div>
  </form>
</div>

<%@ include file="footer.html"%>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
