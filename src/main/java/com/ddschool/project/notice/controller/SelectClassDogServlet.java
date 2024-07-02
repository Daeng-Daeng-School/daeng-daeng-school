package com.ddschool.project.notice.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import com.ddschool.project.ddclass.model.dto.ClassDTO;
import com.ddschool.project.dog.model.dto.DogDTO;
import com.ddschool.project.notice.model.service.NoticeService;
import com.google.gson.Gson;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/notice/selectClassDog")
public class SelectClassDogServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String classCodeStr = request.getParameter("classCode");

		if (classCodeStr == null || classCodeStr.isEmpty()) {
			// Fetch all classes
			List<ClassDTO> classList = NoticeService.selectClassList();
			System.out.println("classList"+classList);
			sendJsonResponse(response, classList);
		} else {
			// Fetch dogs by class code
			int classCode = Integer.parseInt(classCodeStr);
			List<DogDTO> dogList = NoticeService.selectDogsByClass(classCode);
			sendJsonResponse(response, dogList);
		}
	}

	private void sendJsonResponse(HttpServletResponse response, Object data) throws IOException {
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		out.print(new Gson().toJson(data));
		out.flush();
	}
}