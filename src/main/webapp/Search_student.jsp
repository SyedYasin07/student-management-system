<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <link rel="icon" type="image/png" href="icons/smms.png">
  <title>Search Student</title>
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
      width: 500px;
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
  </style>
</head>
<body>

<%
    String msg = request.getAttribute("message") == null ? "" : (String) request.getAttribute("message");
    String msgClass = request.getAttribute("messageClass") == null ? "black" : (String) request.getAttribute("messageClass");
%>
<% if (msg != null && !msg.isEmpty()) { %>
    <div class="text-center">
         <p class="message <%= msgClass %> fw-bold fs-4 m-0"><%= msg %></p>
    </div>
<% } %>

<%@ include file="header.html"%>
<%@ include file="NavBar3.html"%>

<div class="form-card">
  <h3 class="form-title">Search Student</h3>
  <%-- <p style="color:<%=  %>; font-weight:bold; text-align:center;">
    <%= msg %>
  </p> --%>

  <form action="./Search_Student_Controller2" method="post">
    <div class="mb-4">
      <label class="form-label">Enter Roll Number</label>
      <div class="input-group">
        <span class="input-group-text"><i class="bi bi-search"></i></span>
        <input type="text" class="form-control" placeholder="Enter Roll Number" name="rollNumber" id="rollNumber" required>
      </div>
    </div>
   
    

    <div class="d-grid">
      <button type="submit" class="btn btn-primary btn-lg">
        <i class="bi bi-search"></i> Search Student
      </button>
    </div>
  </form>
</div>

<%@ include file="footer.html"%>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
