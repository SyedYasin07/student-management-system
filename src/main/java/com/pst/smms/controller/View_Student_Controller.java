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

@WebServlet("/View_Student_Controller")
public class View_Student_Controller extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private MarksService marksService;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String rollNumber = request.getParameter("rollNumber");

        MarksDto dto = null;
        marksService = new MarksService();

        try {
            List<MarksDto> marksList = marksService.getRollNumber(rollNumber);
            if (marksList != null && !marksList.isEmpty()) {
                dto = marksList.get(0); // use first result
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

        String message = request.getParameter("msg") == null ? "" : request.getParameter("msg");
        String messageClass = request.getParameter("messageClass") == null ? "" : request.getParameter("messageClass");

        request.setAttribute("dto", dto);
        request.setAttribute("msg", message);
        request.setAttribute("msgClass", messageClass);

        RequestDispatcher dispatcher = request.getRequestDispatcher("View_student.jsp");
        dispatcher.forward(request, response);
    }
}
