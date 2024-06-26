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

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		System.out.println("ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ");
		
		String memberId = request.getParameter("memberId");
		System.out.println("서블릿에서 확인한 memberId 쿼리스트링은 : " + memberId);
		
		MemberDTO updateTeacher = new MemberService().selectTeacherInfo(memberId);
		int requestMemberCode = updateTeacher.getMemberCode();
		
		// 회원이 수정을 요청한 입력값을 불러오기
		String changePhone = (String) request.getParameter("phone");
		String changeAddress = (String) request.getParameter("address");
		Integer changeClassCode = Integer.parseInt(request.getParameter("classCode"));
		
		// 잘 넘어왔는지 로그 확인
		System.out.println("MemberMypageServlet 의 changePhone : " + changePhone);
		System.out.println("MemberMypageServlet 의 changeAddress : " + changeAddress);
		System.out.println("MemberMypageServlet 의 changeClassCode : " + changeClassCode);
		
		// db 정보 업데이트 
		int updateResult = new MemberService().updateMember(requestMemberCode, changePhone, changeAddress, changeClassCode);
		
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

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		// 누가 요청한건지 세션에서 pk 추출
		HttpSession session = request.getSession();
		MemberDTO loginMember = (MemberDTO) session.getAttribute("loginMember");
		int requestMemberCode = loginMember.getMemberCode();
		
		// 회원이 수정을 요청한 입력값을 불러오기
		String changePhone = (String) request.getParameter("phone");
		String changeAddress = (String) request.getParameter("address");
		Integer changeClassCode = Integer.parseInt(request.getParameter("classCode"));
		
		// 잘 넘어왔는지 로그 확인
		System.out.println("MemberMypageServlet 의 changePhone : " + changePhone);
		System.out.println("MemberMypageServlet 의 changeAddress : " + changeAddress);
		System.out.println("MemberMypageServlet 의 changeClassCode : " + changeClassCode);
		
		// db 정보 업데이트 
		int updateResult = new MemberService().updateMember(requestMemberCode, changePhone, changeAddress, changeClassCode);
		
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

}
