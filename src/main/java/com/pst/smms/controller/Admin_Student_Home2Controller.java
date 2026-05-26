package com.pst.smms.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import com.pst.smms.DTO.StudentDto;
import com.pst.smms.Vo.StudentVo;
import com.pst.smms.service.StudentService;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/Admin_Student_Home2Controller")
public class Admin_Student_Home2Controller extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private StudentService studentService;

    @Override
   
   
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	
    	StudentService studentService=new StudentService();
    	List<StudentDto> studentList = studentService.retrieveAllStudents();

    	
        request.setAttribute("studentList", studentList);

		
		RequestDispatcher dispatcher=request.getRequestDispatcher("./admin_student_home2.jsp");
		dispatcher.forward(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	StudentVo vo=null;
    	String message = "";
    	String color = "";
    	int i=0;
    	RequestDispatcher dispatcher;
    	int rollNumber=Integer.parseInt(req.getParameter("rollNumber"));
    	String fullName=req.getParameter("name");
    	String gender=req.getParameter("gender");
    	String dob=req.getParameter("dob");
    	String mobile=req.getParameter("mobile");
    	String email=req.getParameter("email");
    	String password=req.getParameter("password");
    	vo=new StudentVo(rollNumber,fullName,gender,dob,mobile, email,password);
    	
    	
    	StudentService studentService=new StudentService();
    	
    	studentService=new StudentService();
    	try {
    		
			i=studentService.saveStudent(vo);
		} catch (ClassNotFoundException e) {
			
			e.printStackTrace();
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
    	  if (i > 0) {
    	        message = "Student added successfully";
    	        color ="green";
    	    } else {
    	        message = "Failed to add student";
    	        color = "red";
    	    }

    	    req.setAttribute("message", message);
    	    req.setAttribute("color", color);

    	    dispatcher = req.getRequestDispatcher("./New_student.jsp");
    	    dispatcher.forward(req, resp);
    	}
     
}
