package com.ddschool.project.classbook.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.ddschool.project.classbook.model.dto.ClassbookDTO;
import com.ddschool.project.classbook.model.service.ClassbookService;
import com.ddschool.project.dog.model.service.DogService;

@WebServlet("/classbook/delete")
public class ClassbookDeleteServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int dogCode = Integer.parseInt(request.getParameter("dogCode"));
		String checkDate = request.getParameter("checkDate");
		String checkStatus = request.getParameter("checkStatus");
		
		ClassbookDTO classbookDTO = new ClassbookDTO();
		classbookDTO.setDogCode(dogCode);
		classbookDTO.setCheckDate(checkDate);
		classbookDTO.setCheckStatus(checkStatus);
		
		int result = new ClassbookService().deleteAttendanceRecord(classbookDTO);
		
		response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write("{\"success\": " + (result > 0) + "}");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int dogCode = Integer.parseInt(request.getParameter("dogCode"));
		String checkDate = request.getParameter("checkDate");
		String checkStatus = request.getParameter("checkStatus");
		
		ClassbookDTO classbookDTO = new ClassbookDTO();
		classbookDTO.setDogCode(dogCode);
		classbookDTO.setCheckDate(checkDate);
		classbookDTO.setCheckStatus(checkStatus);
		
		int result = new ClassbookService().deleteAttendanceRecord(classbookDTO);
		
		response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write("{\"success\": " + (result > 0) + "}");
	}

}
