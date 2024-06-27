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
	
		String memberId = request.getParameter("memberId");
		System.out.println("서블릿에서 확인한 memberId 쿼리스트링은 : " + memberId);
		MemberDTO deleteMember = null;
		
		// 만약 memberId 가 넘어온게 있다면 탈퇴진행
		// 아니라면 세션 정보의 로그인 회원을 탈퇴진행
		
		if (memberId != null && !memberId.isEmpty()) {
            
			deleteMember = new MemberService().selectTeacherInfo(memberId);
			System.out.println("선생님 탈퇴 진행할게!");
			
			
        } else {
            // 세션에서 로그인된 회원 정보를 가져옴
            HttpSession session = request.getSession();
            deleteMember = (MemberDTO) session.getAttribute("loginMember");
        }
		
		// 해당 회원의 status false 로 변경하기
		deleteMember.setStatus(false);
		
		int deleteMemberCode = deleteMember.getMemberCode();
		boolean deleteMemberSatus = deleteMember.isStatus();
		
		// 디비에 저장하기
		int deleteResult = new MemberService().deleteMember(deleteMemberCode, deleteMemberSatus);
		
		if(deleteResult > 0) {
			System.out.println("status 변경 성공!");
			
		} else {
			System.out.println("status 변경 실패!");
			
		}
		
		if (memberId != null && !memberId.isEmpty()) {
			
			response.sendRedirect(request.getContextPath()+"/master/management");
			
		} else {
			request.getSession().invalidate(); // 세션 만료 시키기
			response.sendRedirect(request.getContextPath()); // 메인 페이지 복귀
		}
	}
}
