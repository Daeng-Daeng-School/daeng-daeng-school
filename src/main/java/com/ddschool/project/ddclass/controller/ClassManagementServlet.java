package com.ddschool.project.ddclass.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import com.ddschool.project.ddclass.model.dto.ClassDTO;
import com.ddschool.project.ddclass.model.service.ClassService;

@WebServlet("/class/management")
public class ClassManagementServlet extends HttpServlet {

	// 모든 반 정보 조회
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		List<ClassDTO> classList = new ClassService().getClassList();
		request.setAttribute("classList", classList);
		
		request.getRequestDispatcher("/WEB-INF/views/ddclass/masterClassManagement.jsp").forward(request, response);
	}

	// 반 조회 페이지에서 활성상태 변경
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		int classCode = Integer.parseInt(request.getParameter("classCode"));
		boolean status = Boolean.parseBoolean(request.getParameter("status"));
		
		int result = new ClassService().updateClassStatus(classCode, status);
		
		response.setContentType("application/json");
		PrintWriter out = response.getWriter();
		
		if (result > 0) {
			System.out.println("변경 성공!");
            out.print("{\"status\":\"success\"}");
        } else {
        	System.out.println("변경 실패!");
            out.print("{\"status\":\"error\"}");
        }
		
        out.flush();
	}
}
