package com.ddschool.project.member.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import com.ddschool.project.ddclass.model.dto.ClassDTO;
import com.ddschool.project.ddclass.model.service.ClassService;
import com.ddschool.project.member.model.dto.MemberDTO;
import com.ddschool.project.member.model.service.MemberService;

@WebServlet("/master/management")
public class MasterManagementServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		// 반 목록 가져오기
		List<ClassDTO> classList = new ClassService().getClassList();
        request.setAttribute("classList", classList);
		
		int page = 1; // 현재 페이지 번호 (기본값 : 1)
		int pageSize =10; // 한 페이지에 표시할 항목 수 (기본값 : 10)
		
		String sortOrder = "joinDate"; // 기본 정렬 기준
		String classFilter = ""; // 반 필터 기준
		String startDate = ""; // 날짜 필터 : 시작일
		String endDate = ""; // 날짜 필터 : 종료일
		
		// 사용자가 요청한 페이지 값 가져오기
		if(request.getParameter("page") != null) { 
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		// 사용자가 요청한 정렬 기준 가져오기
		if(request.getParameter("sortOrder") != null) {
			sortOrder = request.getParameter("sortOrder");
		}
		
		// 사용자가 요청한 반 필터 기준 가져오기
		if(request.getParameter("classFilter") != null) {
			classFilter = request.getParameter("classFilter");
		}
		
		// 사용자가 요청한 날짜 필터 시작일 가져오기
		if (request.getParameter("startDate") != null) {
			startDate = request.getParameter("startDate");
			System.out.println(startDate);
		}
		
		// 사용자가 요청한 날짜 필터 종료일 가져오기
		if (request.getParameter("endDate") != null) {
            endDate = request.getParameter("endDate");
            System.out.println(endDate);
        }
		
		// 이곳에서 선생님 목록을 조회하여 화면으로 전달
		List<MemberDTO> teacherList = new MemberService().selectTeacherList(page, pageSize, sortOrder, classFilter, startDate, endDate);
		System.out.println("서블릿에서 선생님 목록 출력: " + teacherList);
		
		int totalTeachers = new MemberService().getTeacherCount(classFilter, startDate, endDate); // 전체 항목 수
		System.out.println(totalTeachers);
		int totalPages = (int) Math.ceil(totalTeachers / pageSize) + 1; // 총 몇 페이지가 필요한지 계산 (ceil : 소수점 -> 정수)
		System.out.println(totalPages);
		
		// request 에 선생님 리스트 담기
		request.setAttribute("teacherList", teacherList);
		request.setAttribute("currentPage", page);
		request.setAttribute("totalPages", totalPages);
		request.setAttribute("sortOrder", sortOrder);
		request.setAttribute("classFilter", classFilter);
		request.setAttribute("startDate", startDate);
        request.setAttribute("endDate", endDate);
		
		// masterAdminManagement.jsp 로 포워드
		request.getRequestDispatcher("/WEB-INF/views/member/masterAdminManagement.jsp").forward(request, response);
	
	}

}
