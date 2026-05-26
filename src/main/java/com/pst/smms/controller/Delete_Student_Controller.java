package com.pst.smms.controller;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;

import com.pst.smms.Common.SmmsConstants;
import com.pst.smms.Vo.StudentVo;
import com.pst.smms.service.StudentService;

@WebServlet("/Delete_Student_Controller")
public class Delete_Student_Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    
	    StudentService service = new StudentService(); // ✅ Initialize it here
	    int i = 0;
	    String message = "";
	    String messageClass = "";

	    int rollNumber = Integer.parseInt(request.getParameter("rollNumber"));
	    
	    // Perform deletion
	    try {
			i = service.deleteStudentByRollNumber(rollNumber);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	    if (i > 0) {
	        messageClass = "text-success";
	        message = SmmsConstants.delete_Marks_Success_Message;
	    } else {
	        messageClass = "text-danger";
	        message = SmmsConstants.delete_Marks_Failure_Message;
	    }
	    
	    response.sendRedirect("./Admin_Student_HomeController?msg=" + message + "&messageClass=" + messageClass);
	}

}