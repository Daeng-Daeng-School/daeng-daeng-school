package com.ddschool.project.member.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.ddschool.project.member.model.dto.MemberDTO;
import com.ddschool.project.member.model.service.MemberService;

@WebServlet("/member/regist")
public class MemberRegistServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.getRequestDispatcher("/WEB-INF/views/member/memberRegist.jsp").forward(request, response);
		
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		// 폼데이터에서 넘어온 파라미터 정보를 꺼낸다
		String memberId = request.getParameter("memberId");
		String memberPwd = request.getParameter("memberPwd");
		String memberName = request.getParameter("memberName");
		String memberBirth = request.getParameter("memberBirth");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		System.out.println(address);
		
				
		// 꺼낸 정보를 Dto 객체에 담는다
		MemberDTO registMember = new MemberDTO();
		registMember.setMemberId(memberId);
		registMember.setMemberPwd(memberPwd);
		registMember.setMemberName(memberName);
		registMember.setMemberBirth(memberBirth);
		registMember.setPhone(phone);
		registMember.setAddress(address);
		System.out.println(registMember);
				
		// MemberService 호출해 db 저장하여 가입 처리 후 성공여부 반환
		int result = new MemberService().registMember(registMember);
				
		if(result > 0) {
			System.out.println("가입 성공!");
			// 성공 시 메인화면으로 리다이렉트 (성공 alert 출력)
			request.getSession().setAttribute("message", "가입이 성공적으로 완료되었습니다. 로그인해 주세요.");
			response.sendRedirect(request.getContextPath());
		} else {
			System.out.println("가입 실패!");
			// 실패 시 에러 메시지 설정 후 회원가입 폼 페이지로 포워드 (실패 alert 출력)
			request.setAttribute("errorMessage", "회원가입에 실패했습니다. 다시 시도해 주세요.");
			request.getRequestDispatcher("memberRegist.jsp").forward(request, response);
		}
		
	}

}
