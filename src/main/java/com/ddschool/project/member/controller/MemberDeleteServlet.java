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

@WebServlet("/member/delete")
public class MemberDeleteServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	
		// 현재 로그인된 회원 확인하기
		HttpSession session = request.getSession();
		MemberDTO deleteMember = (MemberDTO) session.getAttribute("loginMember");
		
		// 해당 회원의 status false 로 변경하기
		deleteMember.setStatus(false);
		
		int deleteMemberCode = deleteMember.getMemberCode();
		boolean deleteMemberSatus = deleteMember.isStatus();
		
		// 디비에 저장하기
		int deleteResult = new MemberService().deleteMember(deleteMemberCode, deleteMemberSatus);
		
		if(deleteResult > 0) {
			System.out.println("status 변경 성공!");
			request.getSession().invalidate(); // 세션 만료 시키기
			response.sendRedirect(request.getContextPath()); // 메인 페이지 복귀
			
			
		} else {
			System.out.println("status 변경 실패!");
			// 탈퇴 실패 alert 띄워주기
			// 회원정보 조회 페이지 그대로 유지
			
		}
	}
}
