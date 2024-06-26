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
	
		String month = request.getParameter("month");
		int memberCode = Integer.parseInt(request.getParameter("memberCode"));
		
		ClassbookService classbookService = new ClassbookService();
		List<Map<String, Object>> dogClassbookList = classbookService.getDogClassbookList(memberCode, month);
		
		request.setAttribute("dogClassbookList", dogClassbookList);
		
		
		
		
		String path="/WEB-INF/views/classbook/classbookPageMember.jsp";
		
		request.getRequestDispatcher(path).forward(request, response);
		
		
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
