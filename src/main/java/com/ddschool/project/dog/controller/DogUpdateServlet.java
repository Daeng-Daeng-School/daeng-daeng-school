package com.ddschool.project.dog.controller;

import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;

import com.ddschool.project.dog.model.dto.DogDTO;
import com.ddschool.project.dog.model.service.DogService;
import com.ddschool.project.member.model.dto.MemberDTO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/dog/update")
public class DogUpdateServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 도그 조회하는 기능
		int dogCode = Integer.parseInt(request.getParameter("dogCode"));
		DogDTO dogDTO = new DogService().selectDogByDogCode(dogCode);
		request.setAttribute("dogDTO", dogDTO);
		String path = "/WEB-INF/views/dog/dogUpdatePage.jsp";
		request.getRequestDispatcher(path).forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		// 현재 로그인한 회원 정보 가져오기 멤버디티오에서 가져오기
		MemberDTO loginMember = (MemberDTO) request.getSession().getAttribute("loginMember");
		int memberCode = loginMember.getMemberCode();
		/*
		 * if (loginMember == null) { // 로그인 되지 않은 경우 처리
		 * response.sendRedirect(request.getContextPath() + "/member/login.jsp");
		 * return; }
		 */
		// 폼에서 입력된 데이터 받기

		int dogCode = Integer.parseInt(request.getParameter("dogCode"));
		String dogName = request.getParameter("dogName");
		String dogBreed = request.getParameter("dogBreed");
		int dogClass = Integer.parseInt(request.getParameter("dogClass"));
		String dogGender = request.getParameter("gender");
		String birth = request.getParameter("birthdate");
		String chipNo = request.getParameter("chipNo");
		double weight = Double.parseDouble(request.getParameter("weight"));
		String notes = request.getParameter("notes");

		// 강아지 정보 DTO 생성
		DogDTO requestDog = new DogDTO();
		requestDog.setDogCode(dogCode);
		requestDog.setDogName(dogName);
		requestDog.setDogBreed(dogBreed);
		requestDog.setClassCode(dogClass);
		requestDog.setGender(dogGender);
		requestDog.setBirth(birth);
		requestDog.setChipNo(chipNo);
		requestDog.setWeight(weight);
		requestDog.setNotes(notes);
		requestDog.setMemberCode(memberCode);
		requestDog.setJoinDate(Date.valueOf(LocalDate.now()));
		// 로그확인
		request.setAttribute("dogInfo", requestDog);
		System.out.println("requestDog: " + requestDog);

		// 강아지 정보 업데이트 처리
		int updateResult = new DogService().updateDog(requestDog);
		System.out.println("servletresult: " + updateResult);

		// 응답처리

		String path = "";
		if (updateResult > 0) {
			path = "/WEB-INF/views/common/success.jsp";
			request.setAttribute("successCode", "updateDog");

		} else {
			path = "/WEB-INF/views/common/failed.jsp";
			request.setAttribute("message", "수정이 실패하였습니다");

		}

		request.getRequestDispatcher(path).forward(request, response);

	}

}
