<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View All Students</title>
</head>
<style>

body{
	background-color:"green";

}

</style>
<body style="text-align:center;">
<h1> <font color="brown" size="30px" >Student Management System</font></h1>
	
		
<h2><u>View All Students</u></h2>

<%

String viewAllStudents="select *from student";

try
{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "sms", "sms");
	PreparedStatement ps=con.prepareStatement(viewAllStudents);
	ResultSet rs=ps.executeQuery(); %>
	<center>
	<table border="2px" style="border-collapse:collapse; width=100%">
	<tr>
	<th>ROLL NUMBER</th>
	<th>STUDENT NAME</th>
	<th>COURSE</th>
	<th>GENDER</th>
	<th>MOBILE NUMBER</th>
	</tr>
	
	<%while(rs.next()) {%>
	<tr>
	<td><%=rs.getInt(1) %></td>
	<td><%=rs.getString(2) %></td>
	<td><%=rs.getString(3) %></td>
	<td><%=rs.getString(4) %></td>
	<td><%=rs.getLong(5) %></td>
	</tr>
	<%}%>
	</table>
	</center>
	<% con.close();
}catch(Exception e)
{
	e.printStackTrace();
	}
%>

</body>
</html>