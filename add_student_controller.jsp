<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body style="text-align: center";>


<%
String INSERT_STUDENT ="insert into student values(?, ?, ?, ?, ?)";

String rNumber=request.getParameter("rollnumber");
int Roll_Number=Integer.parseInt(rNumber);
String name=request.getParameter("studentname");
String course=request.getParameter("course");
String gender=request.getParameter("gender");
String mobile=request.getParameter("phnumber");
Long phonenumber=Long.parseLong(mobile);

try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "sms", "sms");
	PreparedStatement ps=con.prepareStatement(INSERT_STUDENT);
	ps.setInt(1,Roll_Number);
	ps.setString(2,name);
	ps.setString(3,course);
	ps.setString(4,gender);
	ps.setLong(5,phonenumber);
	int i=ps.executeUpdate();
	ps.setInt(1,Roll_Number);
	if(i>0)
	{%>
		<h1>Student added Successfully....</h1>
		
	<%}else{
		out.println("Student insertion failed...");
	}
	
}catch(Exception e){
	e.printStackTrace();
	
}
%>
<a href="add_Student.html">Click Here</a> to go back
<a href="Home.html">Click Here</a> to go home
</body>
</html>