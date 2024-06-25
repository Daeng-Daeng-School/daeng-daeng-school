package com.ddschool.project.member.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import com.ddschool.project.member.model.dto.MemberDTO;
import com.ddschool.project.member.model.service.MemberService;

@WebServlet("/master/management")
public class MasterManagementServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		// 이곳에서 선생님 목록을 조회하여 화면으로 전달
		List<MemberDTO> teacherList = new MemberService().selectTeacherList();
		System.out.println("서블릿에서 선생님 목록 출력: " + teacherList);
		
		// request 에 선생님 리스트 담기
		request.setAttribute("teacherList", teacherList);
		
		// masterAdminManagement.jsp 로 포워드
		request.getRequestDispatcher("/WEB-INF/views/member/masterAdminManagement.jsp").forward(request, response);
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	
	}

}
