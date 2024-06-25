package com.ddschool.project.member.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.ddschool.project.member.model.dto.MemberDTO;
import com.ddschool.project.member.model.service.MemberService;

@WebServlet("/member/login")
public class MemberLoginServlet extends HttpServlet {
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.getRequestDispatcher("/WEB-INF/views/member/memberLogin.jsp").forward(request, response);
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
				// request 에서 parameter 정보를 꺼낸
				String memberId = request.getParameter("memberId");
				String memberPwd = request.getParameter("memberPwd");
				
				System.out.println("[MemberLoginServlet] memberId : " + memberId);
				System.out.println("[MemberLoginServlet] memberPwd : " + memberPwd);
				
				// MemberDTO 객체를 생성해서 회원에게 받은 정보를 set 해준다
				MemberDTO requestMember = new MemberDTO();
				requestMember.setMemberId(memberId);
				requestMember.setMemberPwd(memberPwd);
				
				// 로그인 요청 정보로 service 의 loginCheck 메서드를 통해 일치여부 확인
				MemberDTO loginMember = new MemberService().loginCheck(requestMember);
				System.out.println("[MemberLoginServlet] loginMember : " + loginMember);
				
				// 로그인한 회원정보가 넘어왔다면 성공한거니까 세션에담고
				if(loginMember != null) {
					HttpSession session = request.getSession();
					session.setAttribute("loginMember", loginMember);
					
					// 메인페이지로 리다이렉트
					response.sendRedirect(request.getContextPath());
					
				} else { // 로그인한 회원정보가 넘어오지 않았다면 로그인 페이지로
					request.setAttribute("loginFailMessage", "로그인에 실패하셨습니다.");
					request.getRequestDispatcher("/WEB-INF/views/member/memberLogin.jsp").forward(request, response);
				}
	
	}

}
