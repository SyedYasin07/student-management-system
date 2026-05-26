package com.pst.smms.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

import com.pst.smms.Common.SmmsConstants;
import com.pst.smms.Vo.MarksVo;
import com.pst.smms.service.MarksService;


@WebServlet("/Ud_Student_Marks_Controller")
public class Ud_Student_Marks_Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		MarksService service=null;
		int i=0;
		String message="";
		String messageClass="";
		int rollNumber=Integer.parseInt(req.getParameter("rollNumber"));
		String examType=req.getParameter("examType");
		service=new MarksService();
		try {
			i=service.deleteStudentMarks(rollNumber, examType);
		} catch (ClassNotFoundException e) {
			
			e.printStackTrace();
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		if(i > 0) {
		    messageClass = "text-success";
		    message = SmmsConstants. delete_Marks_Success_Message;
		} else {
		    messageClass = "text-danger";
		    message = SmmsConstants.delete_Marks_Failure_Message;
		}
		resp.sendRedirect("./ViewAllStudentMarks?msg="+message+"&messageClass="+messageClass);
	}
       
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		MarksService service=null;
		int i=0;
		String message="";
		String messageClass="";
		int rollNumber=Integer.parseInt(request.getParameter("rollNumber"));
		int student_id=Integer.parseInt(request.getParameter("marksId"));
		String examType=request.getParameter("examType");
	
		int year=Integer.parseInt(request.getParameter("year"));
		
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
		service =new MarksService();
		try {
			i=service.UpdateStudent(student_id,vo);
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
		    message = SmmsConstants. update_Marks_Success_Message;
		} else {
		    messageClass = "text-danger";
		    message = SmmsConstants.update_Marks_Failure_Message;
		}

		/*
		 * request.setAttribute("message", message);
		 * request.setAttribute("messageClass", messageClass);
		 */
		 
		response.sendRedirect("./ViewAllStudentMarks?msg="+message+"&messageClass="+messageClass);
		 
		/*
		 * response.sendRedirect("./ViewAllStudentMarks?msg=" + message +
		 * "&messageClass=" + messageClass);
		 */


	}

}
