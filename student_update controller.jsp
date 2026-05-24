<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Driver"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body style="text-align:center;">
<h1> <font color="red" size="30px" >Student Management System</font></h1>
	
		
<h2><u>Update Student</u></h2>

<%

String searchStudent="select *from student where roll_number=?";

String rNumber=request.getParameter("rollnumber");
int Roll_Number=Integer.parseInt(rNumber);




try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "sms", "sms");
	PreparedStatement ps=con.prepareStatement(searchStudent);
	ps.setInt(1,Roll_Number);
	ResultSet rs=ps.executeQuery();
	if(rs.next())
	{ %>
	<form action="Student_update_controller.jsp" method="post">
	<center>
	<table>
	
	<tr>
	<td><label>Student Roll Number:</label></td>
	<td><input type="text" name="rollnumber" value="<%=rs.getInt(1)%>"/></td>
	</tr>
	
	<tr>
	<td><label>Student Name:</label></td>
	<td><input type="text" name="name" value="<%=rs.getString(2)%>"/></td>
	</tr>
	
	<tr>
	<td><label>Student Course:</label></td>
	<td><input type="text" name="course" value="<%=rs.getString(3)%>"/></td>
	</tr>
	
	<tr>
	<td><label>Gender:</label></td>
	<td><input type="text" name="gender" value="<%=rs.getString(4)%>"/></td>
	</tr>
	
	<tr>
	<td><label>Mobile Number:</label></td>
	<td><input type="text" name="phnumber" value="<%=rs.getLong(5)%>"/></td>
	</tr>
	
	<tr>
	<td><input type="submit" value="Update Student"/></td>
	<td><input type="reset" value="clear"/></td>
	</tr>
	
	</table>
	</form>
	</center>
<% 	}
	con.close();
}
catch(Exception e){

	e.printStackTrace();
	
}

%>

</body>
</html>