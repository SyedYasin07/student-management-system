<%@page import="com.pst.smms.DTO.MarksDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="bootstrap/bootstrap.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js"></script>
<title>Admin Student Home</title>
</head>
<body>

	<%
	List<MarksDto> marksList = (List<MarksDto>) request.getAttribute("marksList");
	String msg = (String) request.getAttribute("msg");
	String msgClass = (String) request.getAttribute("msgClass");
	System.out.println("msg:" + msg);
	System.out.println("msgCls:" + msgClass);
	%>

	<%@ include file="header.html"%>
	<%@ include file="NavBar2.html"%>

	<%
	if (!msg.equals("") && !msgClass.equals("")) {
		System.out.println("inside if condition");
	%>
	<div class="toast-container position-fixed top-0 end-0 p-3">
		<div class="toast fade show" role="alert" aria-live="assertive"
			aria-atomic="true">
			<div class="toast-header">
				<strong class="me-auto">Information</strong> <small><%=new java.util.Date().toString()%></small>
				<button type="button" class="btn-close" data-bs-dismiss="toast"
					aria-label="Close"></button>
			</div>
			<div class="toast-body  <%=msgClass%>"><%=msg%></div>
		</div>
	</div>
	<%
	}
	%>

	<div class="container text-center">
		<h4 style="color: #6610f2">Student Marks</h4>

		<div class="text-end mb-3">
			<button class="btn btn-warning" onclick="New()">Add Marks</button>
		</div>

		<div class="tableContainer">
			<table class="table table-striped">
				<thead class="table-dark">
					<tr>
						<th scope="col">ROLL NUMBER</th>
						<th scope="col">NAME</th>
						<th scope="col">TYPE</th>
						<th scope="col">YEAR</th>
						<th scope="col">TOTAL</th>
						<th scope="col">RESULT</th>
						<th scope="col">ACTIONS</th>
					</tr>
				</thead>
				<tbody>
					<%
					if (marksList != null && !marksList.isEmpty()) {
						for (MarksDto dto : marksList) {
					%>
					<tr>
						<th scope="row"><%=dto.getRollNumber()%></th>
						<td><%=dto.getFullName()%></td>
						<td><%=dto.getExamType()%></td>
						<td><%=dto.getExamYear()%></td>
						<td><%=dto.getTotal_marks()%></td>
						<td><%=dto.getResult()%></td>
						<td><a
							href="./MarksController?rollNumber=<%=dto.getRollNumber()%>&examType=<%=dto.getExamType()%>&action=view"
							class="text-info mx-1" data-bs-toggle="tooltip"
							data-bs-placement="top"  title="View Details"> <i class="bi bi-eye-fill fs-5"></i>
						</a> <a
							href="./MarksController?rollNumber=<%=dto.getRollNumber()%>&examType=<%=dto.getExamType()%>&action=update"
							class="btn btn-link p-0 m-1" data-bs-toggle="tooltip"
							data-bs-placement="right" title="Edit Record"><i class="bi bi-pencil-square fs-5"></i>
						</a><a
							href="./Ud_Student_Marks_Controller?rollNumber=<%=dto.getRollNumber()%>&examType=<%=dto.getExamType()%>"
							class="btn btn-link p-0 m-1 text-danger" data-bs-toggle="tooltip"
							data-bs-placement="bottom" title="Delete Record">
								 <i class="bi bi-trash-fill fs-5"></i>
						</a></td>
					</tr>
					<%
					}
					} else {
					%>
					<tr>
						<td colspan="7" class="text-center text-danger">No marks data
							available!</td>
					</tr>
					<%
					}
					%>
				</tbody>
			</table>
		</div>
	</div>

	<script>
		function New() {
			window.location.href = "add_marks.jsp";
		}
	</script>

	<%@ include file="footer.html"%>
</body>
</html>
