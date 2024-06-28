package com.ddschool.project.ddclass.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import com.ddschool.project.ddclass.model.dto.ClassDTO;
import com.ddschool.project.ddclass.model.service.ClassService;

@WebServlet("/class/management")
public class ClassManagementServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		// 모든 반 정보 조회
		List<ClassDTO> classList = new ClassService().getClassList();
		request.setAttribute("classList", classList);
		System.out.println("서블릿에서 확인한 classList : " + classList);
		
		
		request.getRequestDispatcher("/WEB-INF/views/ddclass/masterClassManagement.jsp").forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	
	}

}
