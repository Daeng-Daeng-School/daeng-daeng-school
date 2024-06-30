package com.ddschool.project.classbook.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/classbook")
public class ClassbookServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		/*	String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		// 로그인 처리 후 세션 설정
		if (username.equals("admin") && password.equals("admin")) {
		    HttpSession session = request.getSession();
		    session.setAttribute("role", 1); // 관리자
		    response.sendRedirect("admin_page.jsp");
		} else if (username.equals("teacher") && password.equals("teacher")) {
		    HttpSession session = request.getSession();
		    session.setAttribute("role", 2); // 선생님
		    session.setAttribute("classType", 1); // 기본적으로 오전반 설정
		    response.sendRedirect("teacher_page.jsp");
		} else {
		    // 로그인 실패 처리
		    response.sendRedirect("login.jsp?error=true");
		}
		*/

		/*		HttpSession session = request.getSession();
		
				int roleCode = (int) session.getAttribute("roleCode");
		
				if (roleCode == 1 || roleCode == 2) { // 관리자인 경우
					response.sendRedirect("/WEB-INF/views/classbook/classbookPageAdmin.jsp");
				} else if (roleCode == 3) { // 회원(일반 사용자)인 경우
					response.sendRedirect("/WEB-INF/views/classbook/classbookPageMember.jsp");
				} else { // 기타 처리
					response.sendRedirect("/WEB-INF/views/member/memberLogin.jsp");
				}*/

		request.getRequestDispatcher("/WEB-INF/views/classbook/classbookPageAdmin.jsp").forward(request, response);

		//request.getRequestDispatcher("/WEB-INF/views/classbook/classbookPageMember.jsp").forward(request, response);

	}

}
