package com.ddschool.project.dog.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import com.ddschool.project.dog.model.dto.DogDTO;
import com.ddschool.project.dog.model.service.DogService;
import com.ddschool.project.member.model.dto.MemberDTO;

@WebServlet("/dog/select")

public class DogSelectServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		// 조회하는 동작이 먼저 수행되어야한다. 
		//dog 서비스 객체를 생성해서   selectDogsByMemberCode 메소드를 호출한다. 
		DogService dogService = new DogService();
//		int memberNo = ((MemberDTO) request.getSession().getAttribute("loginMember")).getMemberCode();
		int memberNo = 1; 
		List<DogDTO> dogList = dogService.selectDogsByMemberCode(memberNo);
		request.setAttribute("dogList", dogList);
		System.out.println(dogList);
		
		String path = "/WEB-INF/views/dog/dogSelectListPage.jsp";
		request.getRequestDispatcher(path).forward(request, response);
		// get 요청에 대한 처리 담당
	}

	/*
	 * protected void doPost(HttpServletRequest request, HttpServletResponse
	 * response) throws ServletException, IOException {
	 * request.setCharacterEncoding("UTF-8");
	 * response.setContentType("text/html; charset=UTF-8"); // 회원코드 가져오기 (그래야 강아지 정보
	 * 가져올 수 있어) int memberCode =
	 * Integer.parseInt(request.getParameter("memberCode")); // 조회된 강아지 정보 request에
	 * 저장 request.setAttribute("dogs", dogs); // jsp로 포워딩 String path =
	 * "/WEB-INF/views/dog/dogselectlistpage.jsp";
	 * request.getParameter(path).forward(request, response); }
	 */

}
