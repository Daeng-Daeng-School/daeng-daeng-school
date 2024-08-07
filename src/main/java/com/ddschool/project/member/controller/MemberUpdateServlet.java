package com.ddschool.project.member.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;

import com.ddschool.project.member.model.dto.MemberDTO;
import com.ddschool.project.member.model.service.MemberService;


@WebServlet("/member/update")
public class MemberUpdateServlet extends HttpServlet {

	// 마스터가 선생님 정보 수정할 때
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String memberId = request.getParameter("memberId");
		
		MemberDTO updateTeacher = new MemberService().selectTeacherInfo(memberId);
		int requestMemberCode = updateTeacher.getMemberCode();
		
		// 회원이 수정을 요청한 입력값을 불러오기
		String changePhone = (String) request.getParameter("phone");
		String changeAddress = (String) request.getParameter("address");
		Integer changeClassCode = Integer.parseInt(request.getParameter("classCode"));
		
		// db 정보 업데이트 
		int updateResult = new MemberService().updateTeacher(requestMemberCode, changePhone, changeAddress, changeClassCode);
		
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
		
		if(updateResult > 0) {
			System.out.println("업데이트 성공!");
			out.write("{\"status\":\"success\"}");
			
		} else {
			System.out.println("업데이트 실패!");
			out.write("{\"status\":\"fail\"}");
		}
	
	}

	// 회원이 자신의 정보를 수정할 때
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		// 누가 요청한건지 세션에서 pk 추출
		HttpSession session = request.getSession();
		MemberDTO loginMember = (MemberDTO) session.getAttribute("loginMember");
		int requestMemberCode = loginMember.getMemberCode();
		System.out.println(requestMemberCode);
		
		// 회원이 수정을 요청한 입력값을 불러오기
		String changePhone = request.getParameter("phone");
		String changeAddress = request.getParameter("address");
		
		// db 정보 업데이트 
		int updateResult = new MemberService().updateMember(requestMemberCode, changePhone, changeAddress);
		
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
		
		if(updateResult > 0) {
			System.out.println("업데이트 성공!");
			
			// 세션에 있는 로그인 유저정보도 업데이트
			MemberDTO updateLoginMember = new MemberService().selectTeacherInfo(loginMember.getMemberId());
			session.setAttribute("loginMember", updateLoginMember);
			out.write("{\"status\":\"success\"}");
			
		} else {
			System.out.println("업데이트 실패!");
			out.write("{\"status\":\"fail\"}");
		}
	
	}

}