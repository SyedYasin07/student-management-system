<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Adding Students and Marks</title>
    <link rel="stylesheet" href="bootstrap/bootstrap.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
    
</head>
<style>
        
    body {
        background: linear-gradient(135deg, #d4a1f3, #a1d4f3);
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    }

    .container,.marks {
    	
        text-align: center;
        margin: 30px auto;
        padding: 25px;
        border-radius: 16px;
        box-shadow: 0 10px 25px rgba(0, 0, 0, 0.2);
        background: linear-gradient(to right, #eef2f3, #8ec5fc);
        width: 85%;
        max-width: 850px;
        opacity: 0;
        transform: translateX(-100px);
        animation: slideRight 0.8s ease-out forwards;
    }
   

    .marks {
        animation-delay: 0.5s;
    }

    @keyframes slideRight {
        to {
            opacity: 1;
            transform: translateX(0);
        }
    }

    h3 {
        font-size: 1.8rem;
        font-weight: bold;
        margin-bottom: 20px;
        text-align: center;
        color: #6610f2;
    }

    fieldset {
        border: 2px solid #ccc;
        border-radius: 12px;
        padding: 20px;
        margin: 15px 0;
        background: rgba(255, 255, 255, 0.6);
        box-shadow: inset 0 0 10px rgba(0, 0, 0, 0.05);
    }

    label {
        font-weight: 600;
        display: block;
        margin: 12px 0 6px;
        color: #333;
    }

    input[type="text"],
    input[type="number"],
    select {
        padding: 10px;
        width: 240px;
        border-radius: 10px;
        border: 1px solid #aaa;
        background: #fff;
        transition: all 0.3s ease;
    }

    input[type="text"]:focus,
    input[type="number"]:focus,
    select:focus {
        border-color: #6610f2;
        box-shadow: 0 0 5px rgba(102, 16, 242, 0.4);
        outline: none;
    }

    input[type="button"] {
        background: linear-gradient(to right, #fc466b, #3f5efb);
        border: none;
        padding: 10px 20px;
        border-radius: 20px;
        font-weight: bold;
        color: white;
        cursor: pointer;
        transition: transform 0.2s;
        margin-left: 10px;
    }

    input[type="button"]:hover {
        transform: scale(1.05);
    }

    .button {
        display: flex;
        justify-content: center;
        gap: 20px;
        margin-top: 20px;
    }

    .submit input[type="submit"],
    .reset input[type="reset"] {
        padding: 12px 24px;
        font-weight: bold;
        border: none;
        border-radius: 25px;
        color: #fff;
        cursor: pointer;
        transition: 0.3s ease-in-out;
    }

    .submit input[type="submit"] {
        background: linear-gradient(to right, #11998e, #38ef7d);
    }

    .reset input[type="reset"] {
        background: linear-gradient(to right, #f85032, #e73827);
    }

    .submit input[type="submit"]:hover,
    .reset input[type="reset"]:hover {
        transform: translateY(-2px);
        box-shadow: 0 8px 15px rgba(0,0,0,0.1);
    }

    p.message {
    text-align: center;
    font-weight: bold;
    font-size: 16px;
    margin: 15px;
}

.text-danger {
    color: red;
}

.text-success {
    color: green;
}
p.message {
    transition: all 0.4s ease;
    opacity: 0;
    animation: fadeInMsg 0.6s forwards;
}

@keyframes fadeInMsg {
    to {
        opacity: 1;
    }
}

</style>

<body>

   <% 
    String msg = request.getAttribute("message") == null ? "" : (String)request.getAttribute("message");
    String msgClass = request.getAttribute("messageClass") == null ? "" : (String)request.getAttribute("messageClass");
%>



    <%@ include file="header.html" %>
    <%@ include file="Navbar.html" %>

   <p class="<%= msgClass %> message fw-bold message"><%= msg %></p>

    <form action="./MarksController" method="post">
        <div class="container">
            <h3 style=" color: #6610f2">Add Student</h3>
            <fieldset>
                <label>Enter Roll Number:*</label>
                <input type="number" name="rollNumber" placeholder="Enter the rollnumber" required>
                <input type="button" value="Check Student">
            </fieldset><br>

            <fieldset>
                <label>Student Name:*</label>
                <input type="text" name="studentName" disabled="disabled" value="Testing" required>
                <label>Student Course:</label>
                <input type="text" name="course" disabled="disabled" value="CSE" required>
            </fieldset>
        </div>

	<div class="marks">
  <h3 style="color: #6610f2;">Add Student Marks</h3>

  <div class="form-row">
    <label for="examType">Enter the Exam Type:*</label>
    <select name="examType" id="examType" required>
      <option value="">---Select---</option>
      <option value="sem1">SEMESTER 1</option>
      <option value="sem2">SEMESTER 2</option>
      <option value="sem3">SEMESTER 3</option>
      <option value="sem4">SEMESTER 4</option>
    </select>
  

  <div class="form-row">
    <label for="year">Enter Year:*</label>
    <input type="number" id="year" name="year" required>
  </div>
		<table>
                <tr>
                    <td><label>Enter subject 1 marks:</label> <input type="number" name="sub1" required></td>
                    <td><label>Enter subject 2 marks:</label> <input type="number" name="sub2" required></td>
                </tr>
                <tr>
                    <td><label>Enter subject 3 marks:</label> <input type="number" name="sub3" required></td>
                    <td><label>Enter subject 4 marks:</label> <input type="number" name="sub4" required></td>
                </tr>
                <tr>
                    <td><label>Enter subject 5 marks:</label> <input type="number" name="sub5" required></td>
                    <td><label>Enter subject 6 marks:</label> <input type="number" name="sub6" required></td>
                </tr>
            </table>

            <div class="button">
                <div class="submit">
                    <input type="submit" value="Add Marks">
                </div>
                <div class="reset">
                    <input type="reset" value="Clear">
                </div>
            </div>
        </div>
        </div>
    </form>

    <%@ include file="footer.html" %>

</body>
</html>
