package com.ddschool.project.member.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.ddschool.project.member.model.dto.MemberDTO;
import com.ddschool.project.member.model.service.MemberService;

@WebServlet("/master/teacherInfo")
public class MasterGetTeacherInfoServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String memberId = (String) request.getParameter("memberId");
		
		MemberDTO teacherInfo = new MemberService().selectTeacherInfo(memberId);
		
		request.setAttribute("teacherInfo", teacherInfo);
		
		request.getRequestDispatcher("/WEB-INF/views/member/masterGetTeacherInfo.jsp").forward(request, response);
	
	}

}