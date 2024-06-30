package com.ddschool.project.classbook.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import com.ddschool.project.classbook.model.service.ClassbookService;
import com.google.gson.Gson;


@WebServlet("/classbook/admin")
public class ClassbookSelectListAdminServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		
		/*	HttpSession session = request.getSession();
		
		int memberCode = (int) session.getAttribute("memberCode");*/


		
	String month = request.getParameter("month");
	int classCode = Integer.parseInt(request.getParameter("classCode"));
	
	System.out.println("여긴 서블릿" + month + " " + classCode);

	// 데이터베이스에서 출결 정보 조회
	ClassbookService classbookService = new ClassbookService();
	List<Map<String, Object>> classbookList = classbookService.getClassbookList(month, classCode); // 마이바티스를 사용하여 구현
	/*
			// 조회된 데이터를 request에 저장
			request.setAttribute("classbookList", classbookList);
			
	*/
	System.out.println("서블릿 값" + classbookList);
	
	
	List<Map<String, Object>> results = new ArrayList<>();
	for(Map<String, Object> classbook : classbookList) {
		Map<String, Object> result = new LinkedHashMap<>();
		result.put("CHECK_DATE", classbook.get("CHECK_DATE")); //날짜 정보 유지
		
		//강아지 이름과 출결 정보 분리
		String dogStatus = (String)classbook.get("dogClassbook");
		System.out.println(dogStatus);
		if(dogStatus != null) {
			String[] parts = dogStatus.split(", ");
			for(String part : parts) {
				String[] pair = part.split(": ");
				result.put(pair[0], pair[1]); //강아지 이름과 출결 정보 추가
			}
		}
		
		System.out.println(result);
		results.add(result);
		
	}
	
	System.out.println(results);

				// 데이터를 JSON 형식으로 변환 
				Gson gson = new Gson();
				String jsonData = gson.toJson(results);

				System.out.println(results);
				
							// JSON 데이터를 응답으로 전송 
							response.setContentType("application/json");
							response.setCharacterEncoding("UTF-8");
							PrintWriter out = response.getWriter();
							out.print(jsonData);
							out.flush();

	/*// JSP 페이지로 포워딩 
	request.getRequestDispatcher("/WEB-INF/views/classbook/classbookPageAdmin.jsp").forward(request, response);
	*/
		
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
