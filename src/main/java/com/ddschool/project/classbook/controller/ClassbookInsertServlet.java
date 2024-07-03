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

@WebServlet("/classbook/regist")
public class ClassbookInsertServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		int dogCode = Integer.parseInt(request.getParameter("dogCode"));
        String checkDate = request.getParameter("checkDate");
        String checkStatus = request.getParameter("checkStatus");
        int memberCode = new DogService().getMemberIdByDogCode(dogCode);
        
        // 빈 문자열을 null로 변환
        if (checkStatus != null && checkStatus.isEmpty()) {
            checkStatus = null;
        }

        ClassbookDTO classbookDTO = new ClassbookDTO();
        classbookDTO.setMemberCode(memberCode);
        classbookDTO.setDogCode(dogCode);
        classbookDTO.setCheckDate(checkDate);
        classbookDTO.setCheckStatus(checkStatus);

        int result = new ClassbookService().insertAttendanceRecord(classbookDTO);

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write("{\"success\": " + (result > 0) + "}");
	
	}

}
