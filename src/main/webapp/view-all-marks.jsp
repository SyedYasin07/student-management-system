<%@page import="com.pst.smms.DTO.MarksDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View All Student Marks</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: linear-gradient(135deg, #d9afd9, #97d9e1);
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 40px;
            flex-direction: column;
        }
        h1 {
            color: #4b0082;
            text-align: center;
            margin-bottom: 20px;
        }
        .table {
            border: 2px solid black;
            width: 95%;
            background-color: white;
            box-shadow: 0 0 10px rgba(0,0,0,0.3);
            border-radius: 10px;
            overflow: hidden;
        }
        th, td {
            padding: 10px 15px;
            text-align: center;
            border-bottom: 1px solid #ccc;
        }
        th {
            background-color: #f6d365;
            color: #333;
        }
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>View All Student Marks</h1>
        <table class="table">
            <tr>
                <th>RollNumber</th>
                <th>FullName</th>
                <th>ExamType</th>
                <th>ExamYear</th>
                <th>sub1</th>
                <th>sub2</th>
                <th>sub3</th>
                <th>sub4</th>
                <th>sub5</th>
                <th>sub6</th>
                <th>Total_marks</th>
                <th>Percentage</th>
                <th>Grade</th>
                <th>Result</th>
            </tr>

            <%
                List<MarksDto> list = (List<MarksDto>) request.getAttribute("marksList");
                if (list != null && !list.isEmpty()) {
                    for (MarksDto mark : list) {
            %>
                        <tr>
                            <td><%= mark.getRollNumber() %></td>
                            <td><%= mark.getFullName() %></td>
                            <td><%= mark.getExamType() %></td>
                            <td><%= mark.getExamYear() %></td>
                            <td><%= mark.getSub1() %></td>
                            <td><%= mark.getSub2() %></td>
                            <td><%= mark.getSub3() %></td>
                            <td><%= mark.getSub4() %></td>
                            <td><%= mark.getSub5() %></td>
                            <td><%= mark.getSub6() %></td>
                            <td><%= mark.getTotal_marks() %></td>
                            <td><%= mark.getPercentage() %></td>
                            <td><%= mark.getGrade() %></td>
                            <td><%= mark.getResult() %></td>
                        </tr>
            <%
                    }
                } else {
            %>
                    <tr>
                        <td colspan="14">Marks Not Found.</td>
                    </tr>
            <%
                }
            %>
        </table>
    </div>
</body>
</html>
