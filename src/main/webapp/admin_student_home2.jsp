

 
 
 
 <%@page import="com.pst.smms.DTO.StudentDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.pst.smms.DTO.StudentDto"%>

<%
StudentDto dto =
(StudentDto)session.getAttribute("student");

if(dto == null){
    response.sendRedirect("Admin_Student_Login.jsp");
    return;
}
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="icon" type="image/png" href="icons/smms.png">
    <title> Student Home</title>
    <link href="bootstrap/bootstrap.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>


<%@ include file="header.html" %>
<%@ include file="NavBar3.html" %>

<%-- <% 
    String msg = (String) request.getAttribute("message");
    String messageClass = (String) request.getAttribute("messageClass");
    if (msg != null && !msg.isEmpty()) {
%>
    <p class="message <%= messageClass %>"><%= msg %></p>
<%
    }
%>  --%>
<%-- <%
    String msg = request.getParameter("msg");
    String messageClass = request.getParameter("messageClass");
    if (msg != null && !msg.isEmpty()) {
%>
    <p class="message <%= messageClass %>"><%= msg %></p>
<%
    }
%> --%>
<%
    String msg = request.getParameter("msg");
    String messageClass = request.getParameter("messageClass");

    if ((msg == null || msg.isEmpty()) && request.getAttribute("message") != null) {
        msg = (String) request.getAttribute("message");
        messageClass = (String) request.getAttribute("messageClass");
    }

    if (msg != null && !msg.isEmpty()) {
%>
    <p class="message  fw-bold fs-3 <%= messageClass %>"><%= msg %></p>
<%
    }
%>




<div class="container text-center mt-4">
    <h4 class="text-primary mb-3"> Student Home</h4>

  <div class="row mb-4">
  <div class="col-md-3 text-start">
    <button class="btn btn-warning w-100" onclick="window.location.href='Search_student.jsp'">Search</button>
  </div>
 <!--  <div class="col-md-6 text-end">
    <button class="btn btn-warning w-100" onclick="window.location.href='New_student.jsp'">Add New Student</button>
  </div> -->
</div>




    <div class="table-responsive">
        <table class="table table-bordered table-hover">
            <thead class="table-dark">
                <tr>
                    <th>Roll Number</th>
                    <th>Full Name</th>
                    <th>Gender</th>
                    <th>Date of Birth</th>
                    <th>Mobile</th>
                    <th>Email</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
          

        <tr>
            <td><%= dto.getRollNumber() %></td>
            <td><%= dto.getFullName() %></td>
            <td><%= dto.getGender() %></td>
            <td><%= dto.getDateofbirth() %></td>
            <td><%= dto.getMobileNumber() %></td>
            <td><%= dto.getEmail() %></td>
            <td>
                <!-- View Icon -->
                <a href="View_Student_Controller?rollNumber=<%=dto.getRollNumber()%>" class="text-info mx-1" title="View">
                    <i class="bi bi-eye-fill fs-5"></i>
                </a> 
                <!-- Edit Icon -->
               <%--  <a href="Update_Student_Controller?rollNumber=<%=dto.getRollNumber()%>" class="text-primary mx-1" title="Edit">
                    <i class="bi bi-pencil-square fs-5"></i>
                </a>
                <!-- Delete Icon -->
                <a href="Delete_Student_Controller?rollNumber=<%=dto.getRollNumber()%>" class="text-danger mx-1" title="Delete" onclick="return confirm('Are you sure you want to delete this student?');">
                    <i class="bi bi-trash-fill fs-5"></i>
                </a> --%>
            </td>
        </tr>
        </tbody>
        </table>
    </div>
    
</div>

<%@ include file="footer.html" %>
</body>
</html> 
 