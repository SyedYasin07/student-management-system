<%@page import="com.pst.smms.DTO.MarksDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Student Marksheet</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf-autotable/3.5.29/jspdf.plugin.autotable.min.js"></script>

    <style>
        body {
            background: linear-gradient(135deg, #dce35b, #45b649);
            font-family: 'Segoe UI', sans-serif;
        }

        .marksheet-container {
            width: 794px;
            background-color: white;
            padding: 30px;
            margin: 40px auto;
            border-radius: 15px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
            color: black;
        }

        h2 {
            color: #3b3b98;
            text-align: center;
            margin-bottom: 30px;
        }

        .info-label {
            font-weight: 600;
            color: #2f3640;
        }

        .table-bordered th, .table-bordered td {
            text-align: center;
        }

        #downloadBtn {
            background-color: #3b3b98;
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 8px;
        }

        #downloadBtn:hover {
            background-color: #2f2fa2;
        }

        @media print {
            body {
                zoom: 75%;
            }
        }
    </style>
</head>
<body>
<%
    com.pst.smms.DTO.MarksDto dto = (com.pst.smms.DTO.MarksDto) request.getAttribute("dto");
    if (dto != null) {
%>
<div class="marksheet-container">
    <h2>Student Marksheet</h2>

    <div class="row mb-3">
        <div class="col-md-4"><span class="info-label">Roll Number:</span> <%=dto.getRollNumber() %></div>
        <div class="col-md-4"><span class="info-label">Full Name:</span> <%=dto.getFullName() %></div>
        
    </div>

    <div class="row mb-3">
        
       <%--  <div class="col-md-4"><span class="info-label">Email:</span> <%=dto.getEmail() %></div> --%>
        <div class="col-md-2"><span class="info-label">Exam:</span> <%=dto.getExamType() %></div>
        <div class="col-md-2"><span class="info-label">Year:</span> <%=dto.getExamYear() %></div>
    </div>

    <table class="table table-bordered table-striped mt-4">
        <thead style="background-color: #dee2e6;">
        <tr>
            <th>Subject</th>
            <th>Marks</th>
        </tr>
        </thead>
        <tbody>
        <tr><td>Subject 1</td><td><%=dto.getSub1() %></td></tr>
        <tr><td>Subject 2</td><td><%=dto.getSub2() %></td></tr>
        <tr><td>Subject 3</td><td><%=dto.getSub3() %></td></tr>
        <tr><td>Subject 4</td><td><%=dto.getSub4() %></td></tr>
        <tr><td>Subject 5</td><td><%=dto.getSub5() %></td></tr>
        <tr><td>Subject 6</td><td><%=dto.getSub6() %></td></tr>
        </tbody>
        <tfoot>
        <tr style="background-color: #d4edda;">
            <th>Total Marks</th>
            <td><%=dto.getTotal_marks() %></td>
        </tr>
        <tr style="background-color: #d1ecf1;">
            <th>Percentage</th>
            <td><%=dto.getPercentage() %>%</td>
        </tr>
        <tr style="background-color: #fff3cd;">
            <th>Grade</th>
            <td><%=dto.getGrade() %></td>
        </tr>
        <tr style="background-color: #cce5ff;">
            <th>Result</th>
            <td><%=dto.getResult() %></td>
        </tr>
        </tfoot>
    </table>

    <div class="text-center mt-4">
        <button id="downloadBtn" onclick="downloadPDF()">Download PDF</button>
    </div>
</div>

<script>
    async function downloadPDF() {
        const { jsPDF } = window.jspdf;
        const doc = new jsPDF();

        const studentInfo = [
            ["Roll Number", "<%=dto.getRollNumber()%>"],
            ["Full Name", "<%=dto.getFullName()%>"],
            ["Exam Type", "<%=dto.getExamType()%>"],
            ["Exam Year", "<%=dto.getExamYear()%>"]
        ];

        const marks = [
            ["Subject 1", "<%=dto.getSub1()%>"],
            ["Subject 2", "<%=dto.getSub2()%>"],
            ["Subject 3", "<%=dto.getSub3()%>"],
            ["Subject 4", "<%=dto.getSub4()%>"],
            ["Subject 5", "<%=dto.getSub5()%>"],
            ["Subject 6", "<%=dto.getSub6()%>"]
        ];

        const summary = [
            ["Total Marks", "<%=dto.getTotal_marks()%>"],
            ["Percentage", "<%=dto.getPercentage()%>%"],
            ["Grade", "<%=dto.getGrade()%>"],
            ["Result", "<%=dto.getResult()%>"]
        ];

        doc.setFontSize(18);
        doc.text("Student Marksheet", 105, 15, null, null, "center");

        doc.autoTable({
            head: [["Student Information", "Details"]],
            body: studentInfo,
            startY: 25,
            theme: 'grid'
        });

        doc.autoTable({
            head: [["Subject", "Marks"]],
            body: marks,
            startY: doc.lastAutoTable.finalY + 10,
            theme: 'striped'
        });

        doc.autoTable({
            head: [["Summary", "Value"]],
            body: summary,
            startY: doc.lastAutoTable.finalY + 10,
            theme: 'grid',
            styles: { fillColor: [220, 220, 255] }
        });

        doc.save("student_marksheet.pdf");
    }
</script>

<% } else { %>
    <div class="container text-center mt-5">
        <h4 class="text-danger">Student data not available.</h4>
    </div>
<% } %>
</body>
</html>
