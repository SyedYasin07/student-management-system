<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body style="text-align:center";>

<h1> <font color="cyan" size="30px" >Student Management System</font></h1>
	
		
<h2><u>Delete Student</u></h2>


<%


String DELETE_STUDENT ="DELETE from student where roll_number = ?";

String rollNum=request.getParameter("rollnumber");
int Roll_Number=Integer.parseInt(rollNum);

try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "sms", "sms");
	PreparedStatement ps=con.prepareStatement(DELETE_STUDENT);
	ps.setInt(1,Roll_Number);
	int i=ps.executeUpdate();
	if(i>0)
	{%>
		<h1><font color="green">Student deleted Successfully....</font></h1>
		
	<%}else{%>
	<h1><font color="green">Student deletion failed....</font></h1>
		
	<%}
	
	}
catch(Exception e){

	e.printStackTrace();
	
}

%>
<a href="Delete_Student.html">Click Here</a> to go back
<a href="Home.html">Click Here</a> to go home

</body>
</html>