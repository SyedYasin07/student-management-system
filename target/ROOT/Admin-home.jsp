<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <link rel="icon" type="image/png" href="icons/smms.png">
  <title>Admin Home - Student Marks Management</title>
  <link href="bootstrap/bootstrap.css" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
  <style>
    body {
      margin: 0;
      padding: 0;
      font-family: 'Poppins', sans-serif;
      background: linear-gradient(to right, #f8f9fa, #e2e6ea);
      display: flex;
      flex-direction: column;
      min-height: 100vh;
    }

    .main-container {
      flex: 1;
      display: flex;
      justify-content: center;
      align-items: center;
      padding: 50px 20px;
    }

    .card-box {
      text-align: center;
      backdrop-filter: blur(10px);
      background: linear-gradient(145deg, #fddb92, #d1fdff);
      padding: 40px;
      border-radius: 25px;
      box-shadow: 0 0 15px rgba(0, 0, 0, 0.3);
      width: 100%;
      max-width: 450px;
    }

   .btn-action {
  display: flex;
  align-items: center;
  justify-content: center;
  border-radius: 25px;
  width: 100%;
  max-width: 300px;
  height: 55px;
  font-size: 1.1rem;
  font-weight: 600;
  margin: 15px auto;
  color: white;
  background-color: #0d6efd;
  border: none;
  transition: transform 0.3s ease-in-out, background-color 0.3s ease-in-out;
  text-transform: uppercase;
  gap: 8px;
}

.btn-action:hover {
  background-color: #198754;
  transform: translateX(10px) scale(1.05); /* 👈 Slide + Grow */
}


    .btn-icon {
      font-size: 1.4rem;
    }

    @media (max-width: 576px) {
      .card-box {
        padding: 30px 20px;
      }

      .btn-action {
        font-size: 1rem;
        height: 50px;
      }
    }
  </style>
</head>
<body>

  <%@ include file="header.html" %>
  <%@ include file="Navbar.html" %>

  <div class="main-container">
    <div class="card-box animate__animated animate__fadeInLeft">
      <button class="btn-action" onclick="addMarks()">
        <span class="btn-icon">➕</span> Add New Student 
      </button>
      <button class="btn-action" onclick="viewMarks()">
        <span class="btn-icon">📄</span> View All Marks
      </button>
    </div>
  </div>

  <script>
    function addMarks() {
      window.location.href = "New_student.jsp";
    }

    function viewMarks() {
      window.location.href = "./ViewAllStudentMarks";
    }
  </script>

  <%@ include file="footer.html" %>

</body>
</html>
