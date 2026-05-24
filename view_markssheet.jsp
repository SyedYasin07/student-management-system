<%@ page import="com.pst.smms.DTO.MarksDto" %>
<%
    MarksDto dto = (MarksDto) request.getAttribute("marksDto");
%>

<% if (dto == null) { %>
<!DOCTYPE html>
<html>
<head>
    <title>No Data Found</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <div class="alert alert-danger text-center">No data found for the given student.</div>
    </div>
</body>
</html>
<% } else { %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Student Marksheet</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        #marksheet {
            padding: 20px;
            background-color: #fff;
        }

        table th, table td {
            text-align: center;
            vertical-align: middle;
        }
    </style>
</head>
<body class="bg-light">

<div class="container mt-4" id="marksheet">
    <h2 class="text-center mb-4">Student Marksheet</h2>

    <table class="table table-bordered table-striped">
        <tbody>
            <tr>
                <th>Roll Number</th>
                <td><%= dto.getRollNumber() %></td>
                <th>Full Name</th>
                <td><%= dto.getFullName() %></td>
            </tr>
            <tr>
                <th>Gender</th>
                <td><%= dto.getGender() %></td>
                <th>Date of Birth</th>
                <td><%= dto.getDob() %></td>
            </tr>
            <tr>
                <th>Email</th>
                <td colspan="3"><%= dto.getEmail() %></td>
            </tr>
        </tbody>
    </table>

    <h4 class="mt-4">Subject Marks</h4>
    <table class="table table-bordered">
        <thead class="table-dark">
            <tr>
                <th>Subject 1</th>
                <th>Subject 2</th>
                <th>Subject 3</th>
                <th>Subject 4</th>
                <th>Subject 5</th>
                <th>Subject 6</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td><%= dto.getSub1() %></td>
                <td><%= dto.getSub2() %></td>
                <td><%= dto.getSub3() %></td>
                <td><%= dto.getSub4() %></td>
                <td><%= dto.getSub5() %></td>
                <td><%= dto.getSub6() %></td>
            </tr>
        </tbody>
    </table>

    <table class="table table-bordered">
        <tbody>
            <tr>
                <th>Total Marks</th>
                <td><%= dto.getTotal_marks() %></td>
                <th>Percentage</th>
                <td><%= dto.getPercentage() %>%</td>
            </tr>
            <tr>
                <th>Grade</th>
                <td><%= dto.getGrade() %></td>
                <th>Result</th>
                <td><%= dto.getResult() %></td>
            </tr>
        </tbody>
    </table>

    <div class="text-center mt-4">
        <button id="download" class="btn btn-primary">Download PDF</button>
    </div>
</div>

<!-- jsPDF and html2pdf for PDF download -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.9.2/html2pdf.bundle.min.js"></script>
<script>
    document.getElementById("download").addEventListener("click", function () {
        const element = document.getElementById("marksheet");

        const opt = {
            margin:       0.2,
            filename:     'Student_Marksheet_<%= dto.getRollNumber() %>.pdf',
            image:        { type: 'jpeg', quality: 0.98 },
            html2canvas:  { scale: 2 },
            jsPDF:        { unit: 'in', format: 'letter', orientation: 'portrait' }
        };

        html2pdf().set(opt).from(element).save();
    });
</script>

</body>
</html>
<% } %>
