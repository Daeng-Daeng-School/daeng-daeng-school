package com.ddschool.project.classbook.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Map;

import com.ddschool.project.classbook.model.service.ClassbookService;

@WebServlet("/classbook/regist")
public class ClassbookInsertServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		// postId(날짜), 출석 및 결석 데이터 가져오기
		  String selectedDay = request.getParameter("day");
		  String[] attendanceValues = request.getParameterValues("attendance");
		  String[] absenceValues = request.getParameterValues("absence");
		  String month = request.getParameter("month");
		  int classCode = Integer.parseInt(request.getParameter("classCode"));
		  
		// 받은 데이터 출력 (테스트 용도)
	        System.out.println("여긴 서블릿 Selected Day: " + selectedDay);
	        System.out.println("Attendance Values: ");
	        if (attendanceValues != null) {
	            for (String value : attendanceValues) {
	                System.out.println(value);
	            }
	        }
	        System.out.println("Absence Values: ");
	        if (absenceValues != null) {
	            for (String value : absenceValues) {
	                System.out.println(value);
	            }
	        }
	        
	        String[] status;
	        status = new String[attendanceValues.length];
	        
	        for(int i=0; i<attendanceValues.length; i++) {
	        	if(attendanceValues[i] == "" && absenceValues[i] != "") {
	        		status[i]=absenceValues[i];
	        		
	        	}else if(attendanceValues[i] != "" && absenceValues[i] == "") {
	        		status[i]=attendanceValues[i];
	        	}else {
	        		break;
	        	}
	        }
	        
	        System.out.println(status);
	        
	        
	       // ClassbookService classbookService = new ClassbookService();
	       // List<Map<String, Object>> adminClassbookList = classbookService.getAdminClassbookList(selectedDay, status, month, classCode);
	        
	        
			/*	    // 응답 보내기 (예: JSON 형태로 응답)
				    response.setContentType("application/json");
				    response.setCharacterEncoding("UTF-8");
				    String jsonResponse = "{ \"message\": \"등록이 완료되었습니다.\" }";
				    response.getWriter().write(jsonResponse);*/
		  
		
			/*// 예시: 등록 후 JSON 응답
			   JSONObject jsonResponse = new JSONObject();
			   jsonResponse.put("status", "success");
			   jsonResponse.put("message", "등록이 완료되었습니다.");
			
			   response.setContentType("application/json");
			   response.setCharacterEncoding("UTF-8");
			   response.getWriter().write(jsonResponse.toString());*/
		
	
	        
	        
	        
	        
			/*      새로고침 없이 테이블 업데이트
			 *   / 예시: Java Servlet에서의 응답 생성
			    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			        // 출석 및 결석 데이터 가져오기
			        String[] attendanceValues = request.getParameterValues("attendance");
			        String[] absenceValues = request.getParameterValues("absence");
			
			        // 데이터베이스에 등록 후 등록된 데이터 조회 (예시로 간단하게 생성)
			        JSONObject newData = new JSONObject();
			        newData.put("name", "강아지 이름"); // 새로 추가된 데이터 정보
			        newData.put("attendance", attendanceValues);
			        newData.put("absence", absenceValues);
			
			        // JSON 형태로 응답 전송
			        response.setContentType("application/json");
			        response.setCharacterEncoding("UTF-8");
			        response.getWriter().write(newData.toString());
			    }*/
	}

}
