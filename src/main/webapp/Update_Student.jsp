<%@page import="com.pst.smms.DTO.StudentDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Student Details</title>
    <link rel="stylesheet" href="bootstrap/bootstrap.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background: linear-gradient(to right, #a1c4fd, #c2e9fb);
            font-family: 'Segoe UI', sans-serif;
        }

        .form-container {
            max-width: 800px;
            margin: 50px auto;
            background: white;
            padding: 30px;
            border-radius: 16px;
            box-shadow: 0 8px 24px rgba(0, 0, 0, 0.2);
            animation: fadeIn 0.6s ease-out forwards;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .form-title {
            color: #007bff;
            font-size: 1.8rem;
            font-weight: bold;
            margin-bottom: 25px;
        }

        label {
            font-weight: 600;
            color: #333;
        }

        input[type="text"],
        input[type="number"],
        input[type="email"],
        input[type="date"],
        input[type="password"],
        select {
            width: 100%;
            padding: 10px;
            border-radius: 8px;
            border: 1px solid #ccc;
            margin-top: 5px;
            margin-bottom: 15px;
        }

        .btn-submit {
            background: linear-gradient(to right, #00b09b, #96c93d);
            color: white;
            border: none;
            padding: 12px 24px;
            border-radius: 30px;
            font-weight: bold;
            transition: 0.3s ease-in-out;
        }

        .btn-reset {
            background: linear-gradient(to right, #ff416c, #ff4b2b);
            color: white;
            border: none;
            padding: 12px 24px;
            border-radius: 30px;
            font-weight: bold;
            transition: 0.3s ease-in-out;
        }

        .btn-submit:hover,
        .btn-reset:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 15px rgba(0, 0, 0, 0.1);
        }

        .message {
            font-weight: bold;
            font-size: 16px;
            margin-bottom: 15px;
        }

        .text-danger { color: red; }
        .text-success { color: green; }

    </style>
</head>
<body>

<%@ include file="header.html" %>
<%@ include file="NavBar3.html" %>

<%
    String msg = request.getAttribute("message") == null ? "" : (String) request.getAttribute("message");
    String msgClass = request.getAttribute("messageClass") == null ? "text-danger" : (String) request.getAttribute("messageClass");
    StudentDto dto = (StudentDto) request.getAttribute("student");
%>

<% if (msg != null && !msg.isEmpty()) { %>
    <div class="text-center">
         <p class="message <%= msgClass %> fw-bold fs-4 m-0"><%= msg %></p>
    </div>
<% } %>

<% if (dto != null) { %>
    <form action="Update_Student_Controller" method="post">
        <div class="form-container">
            <h2 class="text-center form-title">Update Student Details</h2>

            <div class="row">
                <div class="col-md-6">
                    <label>Roll Number:</label>
                    <input type="number" name="rollNumber" readonly value="<%= dto.getRollNumber() %>">
                </div>

                <div class="col-md-6">
                    <label>Full Name:</label>
                    <input type="text" name="name" required value="<%= dto.getFullName() %>">
                </div>

                <div class="col-md-6">
                    <label>Gender:</label>
                    <select name="gender" class="form-control">
                        <option <%= dto.getGender().equalsIgnoreCase("Male") ? "selected" : "" %>>Male</option>
                        <option <%= dto.getGender().equalsIgnoreCase("Female") ? "selected" : "" %>>Female</option>
                        <option <%= dto.getGender().equalsIgnoreCase("Other") ? "selected" : "" %>>Other</option>
                    </select>
                </div>

                <div class="col-md-6">
                    <label>Date of Birth:</label>
                       <input type="date" name="dob"
       value="<%= dto.getDateofbirth().toString() %>">
                </div>

                <div class="col-md-6">
                    <label>Mobile Number:</label>
                    <input type="text" name="mobile" required value="<%= dto.getMobileNumber() %>">
                </div>

                <div class="col-md-6">
                    <label>Email:</label>
                    <input type="email" name="email" required value="<%= dto.getEmail() %>">
                </div>

                <div class="col-md-12">
                    <label>Password:</label>
                    <input type="password" name="password" required value="<%= dto.getPassword() %>">
                </div>
            </div>

            <div class="text-center mt-4">
                <input type="submit" class="btn-submit" value="Update Student">
                <input type="reset" class="btn-reset" value="Clear">
            </div>
        </div>
    </form>
<% } else { %>
    <div class="container">
        <p class="message text-danger text-center">❌ No student data found for update.</p>
    </div>
<% } %>

<%@ include file="footer.html" %>

</body>
</html>
