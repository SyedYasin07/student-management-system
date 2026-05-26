package com.pst.smms.controller;
import java.io.IOException;

import com.pst.smms.Common.SmmsConstants;
import com.pst.smms.Vo.MarksVo;
import com.pst.smms.service.MarksService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/Delete_MarksController")
public class Delete_MarksController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		MarksService service=null;
		int i=0;
		String message="";
		String messageClass="";
		int rollNumber=Integer.parseInt(request.getParameter("rollNumber"));
		String  fullName=request.getParameter(" fullName");
	
		int year=Integer.parseInt(request.getParameter("year"));
		
		int sub1=Integer.parseInt(request.getParameter("sub1"));
		int sub2=Integer.parseInt(request.getParameter("sub2"));
		int sub3=Integer.parseInt(request.getParameter("sub3"));
		int sub4=Integer.parseInt(request.getParameter("sub4"));
		int sub5=Integer.parseInt(request.getParameter("sub5"));
		int sub6=Integer.parseInt(request.getParameter("sub6"));
		
		MarksVo vo=new MarksVo();
		vo.setRollNumber(rollNumber);
		vo.setFullName( fullName);
		vo.setYear(year);
		vo.setSub1(sub1);
		vo.setSub2(sub2);
		vo.setSub3(sub3);
		vo.setSub4(sub4);
		vo.setSub5(sub5);
		vo.setSub6(sub6);
		service =new MarksService();

		if (i > 0) {
			messageClass = "text-success";
			message = SmmsConstants.delete_Marks_Success_Message;
		} else {
			messageClass = "text-danger";
			message = SmmsConstants.delete_Marks_Failure_Message;
		}
		response.sendRedirect("./View_Student_Controller?msg=" + message + "&messageClass=" + messageClass);
	}
}