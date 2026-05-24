<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Student</title>
<style>
    .centered-form {
        margin: 0 auto;
        width: 50%;
        text-align: left;
    }
    table {
        margin: 0 auto;
    }
</style>
</head>
<body style="text-align:center;">

<h1><font color="violet" size="30px">Student Management System</font></h1>
<h2><u>Update Student</u></h2>

<%
    String updateStudent = "UPDATE student SET student_name=?, course=?, gender=?, mobile=? WHERE roll_number=?";
    
    // Retrieve form parameters
    String rNumber = request.getParameter("rollnumber");
    String name = request.getParameter("name");
    String course = request.getParameter("course");
    String gender = request.getParameter("gender");
    String mobile = request.getParameter("phnumber");

    boolean showError = false;
    String errorMessage = "";

    Long phonenumber = null;
    
    // Check if mobile number is provided
    if (mobile != null && !mobile.trim().isEmpty()) {
        try {
            phonenumber = Long.parseLong(mobile);
        } catch (NumberFormatException e) {
            showError = true;
            errorMessage = "Invalid mobile number format. Please enter a valid number.";
        }
    }

    // Proceed with database update if all data is valid
    if (!showError && rNumber != null && !rNumber.trim().isEmpty() && name != null && !name.trim().isEmpty() && 
        course != null && !course.trim().isEmpty() && gender != null && !gender.trim().isEmpty() && 
        mobile != null && !mobile.trim().isEmpty()) {
        try {
            int Roll_Number = Integer.parseInt(rNumber);
            
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "sms", "sms");
            PreparedStatement ps = con.prepareStatement(updateStudent);
            ps.setString(1, name);
            ps.setString(2, course);
            ps.setString(3, gender);

            if (phonenumber != null) {
                ps.setLong(4, phonenumber);
            } else {
                ps.setNull(4, java.sql.Types.BIGINT);
            }

            ps.setInt(5, Roll_Number);

            int i = ps.executeUpdate();
            if (i > 0) {
                showError = false;
                errorMessage = "Student updated successfully!";
            } else {
                showError = true;
                errorMessage = "Student update failed. Please check the roll number.";
            }

            ps.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
            showError = true;
            errorMessage = "An error occurred while updating the student. Please try again later.";
        }
    }
%>

<%-- Error or success message display --%>
<%
    if (showError && !errorMessage.isEmpty()) {
%>
        <h3 style="color:red;"><%= errorMessage %></h3>
<%
    } else if (!errorMessage.isEmpty()) {
%>
        <h1><font color="green"><%= errorMessage %></font></h1>
<%
    }
%>

<!-- Display form to update student information -->
<form action="Student_update_controller.jsp" method="post" class="centered-form">
    <table>
        <tr>
            <td><label>Student Roll Number:*</label></td>
            <td><input type="text" name="rollnumber" value="<%= rNumber != null ? rNumber : "" %>" placeholder="Enter the RollNo" required></td>
        </tr>
        <tr>
            <td><label>Student Name:*</label></td>
            <td><input type="text" name="name" value="<%= name != null ? name : "" %>" placeholder="Enter the name" required></td>
        </tr>
        <tr>
            <td><label>Student Course:*</label></td>
            <td>
                <select name="course" required>
                    <option value="">Select</option>
                    <option value="Python" <%= course != null && course.equals("Python") ? "selected" : "" %>>Python</option>
                    <option value="Html" <%= course != null && course.equals("Html") ? "selected" : "" %>>Html</option>
                    <option value="Angular" <%= course != null && course.equals("Angular") ? "selected" : "" %>>Angular</option>
                    <option value="Java" <%= course != null && course.equals("Java") ? "selected" : "" %>>Java</option>
                    <option value="C++" <%= course != null && course.equals("C++") ? "selected" : "" %>>C++</option>
                </select>
            </td>
        </tr>
        <tr>
            <td><label>Student Gender:*</label></td>
            <td>
                <input type="radio" name="gender" value="male" <%= gender != null && gender.equals("male") ? "checked" : "" %>> Male
                <input type="radio" name="gender" value="female" <%= gender != null && gender.equals("female") ? "checked" : "" %>> Female
            </td>
        </tr>
        <tr>
            <td><label>Mobile Number:*</label></td>
            <td><input type="text" name="phnumber" value="<%= mobile != null ? mobile : "" %>" placeholder="Enter the number" required></td>
        </tr>
        <tr>
            <td><input type="submit" value="Update Student"></td>
            <td><input type="reset" value="Clear"></td>
        </tr>
    </table>
</form>
<a href="Student_Update_search.html">Click Here</a> to go back
<a href="Home.html">Click Here</a> to go home


</body>
</html>