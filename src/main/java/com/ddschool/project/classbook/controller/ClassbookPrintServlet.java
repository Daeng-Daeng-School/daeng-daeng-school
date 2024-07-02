package com.ddschool.project.classbook.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ddschool.project.classbook.model.dto.ClassbookDTO;
import com.ddschool.project.classbook.model.service.ClassbookService;
import com.google.gson.Gson;

@WebServlet("/classbook/print")
public class ClassbookPrintServlet extends HttpServlet {

	// 강아지의 출석 정보를 달력에 제공
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int dogCode = Integer.parseInt(request.getParameter("dogCode"));
		String yearMonth = request.getParameter("yearMonth");
		
		List<ClassbookDTO> attendanceList = new ClassbookService().getAttendanceByDogCode(dogCode, yearMonth);
		
		System.out.println(attendanceList);
		
		Gson gson = new Gson();
        String json = gson.toJson(attendanceList);

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(json);
	}

}
