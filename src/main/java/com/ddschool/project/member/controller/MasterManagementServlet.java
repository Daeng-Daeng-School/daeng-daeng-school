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
	
		int page = 1; // 현재 페이지 번호 (기본값 : 1)
		int pageSize =10; // 한 페이지에 표시할 항목 수 (기본값 : 10)
		String sortOrder = "memberCode"; // 기본 정렬 기준
		
		// 사용자가 요청한 페이지 값 가져오기
		if(request.getParameter("page") != null) { 
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		// 사용자가 요청한 정렬 기준 가져오기
		if(request.getParameter("sortOrder") != null) {
			sortOrder = request.getParameter("sortOrder");
		}
		
		// 이곳에서 선생님 목록을 조회하여 화면으로 전달
		List<MemberDTO> teacherList = new MemberService().selectTeacherList(page, pageSize, sortOrder);
		System.out.println("서블릿에서 선생님 목록 출력: " + teacherList);
		
		int totalTeachers = new MemberService().getTeacherCount(); // 전체 항목 수
		int totalPages = (int) Math.ceil(totalTeachers / pageSize); // 총 몇 페이지가 필요한지 계산 (ceil : 소수점 -> 정수)
		
		// request 에 선생님 리스트 담기
		request.setAttribute("teacherList", teacherList);
		request.setAttribute("currentPage", page);
		request.setAttribute("totalPages", totalPages);
		request.setAttribute("sortOrder", sortOrder);
		
		// masterAdminManagement.jsp 로 포워드
		request.getRequestDispatcher("/WEB-INF/views/member/masterAdminManagement.jsp").forward(request, response);
	
	}

}
