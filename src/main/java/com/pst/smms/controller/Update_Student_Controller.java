package com.pst.smms.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.List;

import com.pst.smms.Bo.StudentBo;
import com.pst.smms.DTO.StudentDto;
import com.pst.smms.Vo.StudentVo;
import com.pst.smms.dao.StudentDao;
import com.pst.smms.service.StudentService;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/Update_Student_Controller")
public class Update_Student_Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private StudentService service;

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int roll = Integer.parseInt(req.getParameter("rollNumber"));
        try {
        	StudentService service = new StudentService();
        	StudentDto dto = service.getStudentByRoll(roll);  // ✅ now using service layer

              req.setAttribute("student", dto);
              RequestDispatcher rd = req.getRequestDispatcher("Update_Student.jsp");
              rd.forward(req, resp);

          } catch (Exception e) {
              e.printStackTrace();
          }
      }
    
	@Override
	
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {

	    try {
	        // ✅ Extract parameters from form
	        int roll = Integer.parseInt(request.getParameter("rollNumber"));
	        String name = request.getParameter("name");
	        String gender = request.getParameter("gender");
	        String dob = request.getParameter("dob");  // keep as String for service layer to parse
	        String mobile = request.getParameter("mobile");
	        String email = request.getParameter("email");
	        String password = request.getParameter("password");

	        // ✅ Prepare VO (you delegate to Service to convert VO -> BO)
	        StudentVo vo = new StudentVo(roll, name, gender, dob, mobile, email, password);

	        // ✅ Call service to update_home
	        StudentService service = new StudentService();
	        int rows = service.updateStudent(vo);

	        // ✅ Set message and color for JSP
	        String message = (rows > 0) ? "Student updated successfully!" : "Failed to update student.";
	        String messageClass = (rows > 0) ? "text-success" : "text-danger";

	        request.setAttribute("message", message);
	        request.setAttribute("messageClass", messageClass);

	        // ✅ Load updated list using service and forward to JSP
	        List<StudentDto> studentList = service.retrieveAllStudents();
	        request.setAttribute("studentList", studentList);

	        request.getRequestDispatcher("admin_student_home.jsp").forward(request, response);

	    } catch (Exception e) {
	        e.printStackTrace();
	        request.setAttribute("message", "Exception occurred: " + e.getMessage());
	        request.setAttribute("messageClass", "text-danger");
	        request.getRequestDispatcher("admin_student_home.jsp").forward(request, response);
	    }
	}
}
