package com.pst.smms.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import com.pst.smms.DTO.MarksDto;
import com.pst.smms.service.MarksService;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/ViewAllStudentMarks")
public class ViewAllStudentMarks extends HttpServlet {
	private static final long serialVersionUID = 1L;

		private MarksService marksService;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<MarksDto>marksList=null;
		marksService= new MarksService();
		try {
			marksList=marksService.getAllMarks();
		} catch (ClassNotFoundException e) {
			
			e.printStackTrace();
		} catch (SQLException e) {
		
			e.printStackTrace();
		}
		
		
		String message=request.getParameter("msg")== null?"":request.getParameter("msg");
		String messageClass =request.getParameter("messageClass")== null?"":request.getParameter("messageClass");
		request.setAttribute("marksList",marksList);
		request.setAttribute("msg", message);
		request.setAttribute("msgClass", messageClass);
		
//		RequestDispatcher dispatcher=request.getRequestDispatcher("view-all-marks.jsp");
		RequestDispatcher dispatcher=request.getRequestDispatcher("Admin_Student_Marks_home2.jsp");
		dispatcher.forward(request, response);
		
	}

}
