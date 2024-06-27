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

@WebServlet("/classbook/member")
public class ClassbookSelectListMemberServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		/*
		 * String month = request.getParameter("month"); int memberCode =
		 * Integer.parseInt(request.getParameter("memberCode"));
		 * 
		 * ClassbookService classbookService = new ClassbookService(); List<Map<String,
		 * Object>> dogClassbookList = classbookService.getDogClassbookList(memberCode,
		 * month);
		 * 
		 * request.setAttribute("dogClassbookList", dogClassbookList);
		 */
		
		
		// 현재 연도-월 구하기
				/*
				 * LocalDate currentDate = LocalDate.now(); 
				 * DateTimeFormatter.ofPattern("yyyy-MM"); 
				 * currentDate.format(formatter);
				 */

				String month = request.getParameter("month");
				System.out.println("여긴 서블릿"+month);
				
		        // 데이터베이스에서 출결 정보 조회
		        ClassbookService classbookService = new ClassbookService();
		        List<Map<String, Object>> dogClassbookList = classbookService.getDogClassbookList(month); // 마이바티스를 사용하여 구현

		        // 조회된 데이터를 request에 저장
		        request.setAttribute("dogClassbookList", dogClassbookList);
		        System.out.println("서블릿 값"+dogClassbookList);
		        
				
				/*  // 데이터를 JSON 형식으로 변환 
				Gson gson = new Gson(); 
				String jsonData = gson.toJson(dogClassbookList);
				  
				  
				  // JSON 데이터를 응답으로 전송 
				response.setContentType("application/json");
				response.setCharacterEncoding("UTF-8"); 
				PrintWriter out = response.getWriter();
				out.print(jsonData); out.flush();
				 */
		        
				
				// JSP 페이지로 포워딩 
		       request.getRequestDispatcher("/WEB-INF/views/classbook/classbookPageMember.jsp").forward(request, response);
				 
				
		
		/*
		 * String month = request.getParameter("month");
		 * 
		 * List<Integer> dayList = new ArrayList<>(); for (int i = 1; i <= 31; i++) {
		 * dayList.add(i); }
		 * 
		 * Map<String, Object> params = new HashMap<>(); params.put("month", month);
		 * params.put("dayList", dayList);
		 * 
		 * 
		 * System.out.println(month); System.out.println(dayList);
		 * 
		 * ClassbookService classbookService = new ClassbookService();
		 * List<ClassbookDTO> resultList = classbookService.getDogClassbookList(params);
		 * System.out.println("cnf");
		 * response.setContentType("application/json; charset=UTF-8"); Gson gson = new
		 * Gson(); String jsonData = gson.toJson(resultList);
		 * 
		 * PrintWriter out = response.getWriter(); System.out.println(resultList);
		 * out.print(jsonData); out.close();
		 */
	}
	
}
