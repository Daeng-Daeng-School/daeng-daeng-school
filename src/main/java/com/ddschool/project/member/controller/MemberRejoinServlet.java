package com.ddschool.project.member.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

import com.ddschool.project.member.model.dto.MemberDTO;
import com.ddschool.project.member.model.service.MemberService;

@WebServlet("/member/rejoin")
public class MemberRejoinServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		// 활성화시킬 회원을 쿼리스트링에서 추출
		String memberId = request.getParameter("memberId");
		MemberDTO rejoinMember = new MemberService().selectTeacherInfo(memberId);
		
		// 해당 회원의 status 를 true 로 수정 
		int result = new MemberService().rejoinMember(memberId);
		
		response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
		
		// 성공/실패 결과 jsp 로 전송
		if(result > 0) {
			System.out.println("rejoin 성공!");
			response.sendRedirect(request.getContextPath() + "/master/management?status=success");
			
		} else {
			System.out.println("rejoin 실패!");
			response.sendRedirect(request.getContextPath() + "/master/management?status=fail");
		}
	}
}
