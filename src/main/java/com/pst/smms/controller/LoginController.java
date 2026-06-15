package com.pst.smms.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.pst.smms.DTO.StudentDto;
import com.pst.smms.service.StudentService;


@WebServlet("/LoginController")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	

	    protected void doPost(
	            HttpServletRequest request,
	            HttpServletResponse response)
	            throws ServletException, IOException {
	    


	        String role =
	                request.getParameter("role");

	        String userid =
	                request.getParameter("userid");

	        String password =
	                request.getParameter("password");

	        HttpSession session =
	                request.getSession();

	        if(role.equals("admin")) {

	            if(userid.equals("admin")
	                    && password.equals("admin123")) {

	                session.setAttribute(
	                        "role",
	                        "admin");

	                response.sendRedirect(
	                        "Admin-home.jsp");

	            } else {

	                response.sendRedirect(
	                        "Admin_Student_Login.jsp");
	            }

	        } else {

	            StudentService service =
	                    new StudentService();

	            StudentDto dto =
	                    service.loginStudent(
	                            Integer.parseInt(userid),
	                            password);
	            System.out.println("Role : " + role);
	            System.out.println("UserId : " + userid);
	            System.out.println("Password : " + password);
	            System.out.println("DTO : " + dto);

	            if(dto != null) {

	                session.setAttribute(
	                        "role",
	                        "student");

	                session.setAttribute(
	                        "student",
	                        dto);

	                response.sendRedirect(
	                        "admin_student_home2.jsp");

	            } else {

	                response.sendRedirect(
	                        "Admin_Student_Login.jsp");
	            }
	        }
	    }
	}