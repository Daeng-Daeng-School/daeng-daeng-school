package com.ddschool.project.classbook.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.ddschool.project.classbook.model.service.ClassbookService;

@WebServlet("/classbook/delete")
public class ClassbookDeleteServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		int dogCode = Integer.parseInt(request.getParameter("dogCode"));
        String checkDate = request.getParameter("checkDate");

        boolean result = new ClassbookService().deleteAttendanceRecord(dogCode, checkDate);

        if(result) {
            response.setStatus(HttpServletResponse.SC_OK);
        } else {
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
	
	}

}
