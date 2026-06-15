package com.pst.smms.controller;

import java.io.IOException;
import java.sql.SQLException;

import com.pst.smms.Common.SmmsConstants;
import com.pst.smms.DTO.MarksDto;
import com.pst.smms.Vo.MarksVo;
import com.pst.smms.service.MarksService;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet("/MarksController")
public class MarksController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	

	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	MarksDto dto=null;
	RequestDispatcher dispatcher =null;
		
		int rollNumber=Integer.parseInt(req.getParameter("rollNumber"));
		String examType=req.getParameter("examType");
		String action=req.getParameter("action");
		MarksService service =new MarksService();
		try {
			dto=service.getStudentMarks(rollNumber,examType);
		} catch (ClassNotFoundException e) {
			
			e.printStackTrace();
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		req.setAttribute("marksDto", dto);
		if(action.equals("view")) {
			dispatcher=req.getRequestDispatcher("./view_markssheet.jsp");
		}else if(action.equals("update")) {
			dispatcher=req.getRequestDispatcher("./Update_Student_Marks.jsp");
		}
		
		dispatcher.forward(req, resp); 
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int i=0;
		String message="";
		String messageClass="";
		String rNo=request.getParameter("rollNumber");
		
		int rollNumber=Integer.parseInt(rNo);
		String examType=request.getParameter("examType");
		String yr=request.getParameter("year");
		int year=Integer.parseInt(yr);
		
		int sub1=Integer.parseInt(request.getParameter("sub1"));
		int sub2=Integer.parseInt(request.getParameter("sub2"));
		int sub3=Integer.parseInt(request.getParameter("sub3"));
		int sub4=Integer.parseInt(request.getParameter("sub4"));
		int sub5=Integer.parseInt(request.getParameter("sub5"));
		int sub6=Integer.parseInt(request.getParameter("sub6"));
		
		
		MarksVo vo=new MarksVo();
		vo.setRollNumber(rollNumber);
		vo.setExamType(examType);
		vo.setYear(year);
		vo.setSub1(sub1);
		vo.setSub2(sub2);
		vo.setSub3(sub3);
		vo.setSub4(sub4);
		vo.setSub5(sub5);
		vo.setSub6(sub6);
		
		System.out.println(vo);
		
		MarksService service =new MarksService();
		
		try {
			i=service.addStudentMarks(vo);
		}catch(ClassNotFoundException e) {
			System.out.println("Driver class not available in class path:"+e.getMessage());
		}catch( SQLException e) {
			System.out.println("Error occured in database,Error:"+e.getMessage());
		}
		 catch(Exception e) {
			System.out.println("Internal Server Error...Error Message:"+e.getMessage());
			e.printStackTrace();
		}
		if(i > 0) {
		    messageClass = "text-success";
		    message = SmmsConstants.Add_Marks_Success_Message;
		} else {
		    messageClass = "text-danger";
		    message = SmmsConstants.Add_Marks_Failure_Message;
		}

		request.setAttribute("message", message);
		request.setAttribute("messageClass", messageClass);

		RequestDispatcher dispatcher = request.getRequestDispatcher("add_marks.jsp");
		dispatcher.forward(request, response);

	}
}
