package com.ddschool.project.member.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

import com.ddschool.project.member.model.service.MemberService;

@WebServlet("/checkId")
public class MemberCheckIdServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 있는 아이디인지 확인 로직
		String memberId = request.getParameter("memberId");
		boolean exists = new MemberService().isMemberIdExists(memberId);
		System.out.println("아이디 존재 여부 : " + exists);
		
		// ajax 로 보내줄 응답 구성
		response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        
        PrintWriter out = response.getWriter();
        out.print("{\"exists\": " + exists + "}");
        out.flush();
	
	}

}
