package com.ddschool.project.dog.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.ddschool.project.dog.model.dto.DogDTO;
import com.ddschool.project.dog.model.dto.MemberDTO;
import com.ddschool.project.dog.model.service.dogService;

@WebServlet("/dog/Update")
public class DogUpdateServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String path = "/WEB-INF/views/dog/dogUpdatePage.jsp";
		request.getRequestDispatcher(path).forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		// 폼에서 입력된 데이터 받기
		String dogName = request.getParameter("name");
		String dogBreed = request.getParameter("dog_breed");
		int dogClass = Integer.parseInt(request.getParameter("dog_class"));
		String dogGender = request.getParameter("dog_gender");
		String birth = request.getParameter("birthdate");
		String chipNo = request.getParameter("regNumber");
		double weight = Double.parseDouble(request.getParameter("weight"));
		String notes = request.getParameter("notes");

		// 현재 로그인한 회원 정보 가져오기 멤버디티오에서 가져오기
		MemberDTO loginMember = (MemberDTO) request.getSession().getAttribute("loginMember");
//        int writerMemberCode = loginMember.getMemberCode();
		int writerMemberCode = 1; // 예시로 1234를 임의의 회원 코드로 설정

		// 강아지 정보 DTO 생성
		DogDTO requestDog = new DogDTO();

		requestDog.setDogName(dogName);
		requestDog.setDogBreed(dogBreed);
		requestDog.setClassCode(dogClass);
		requestDog.setGender(dogGender);
		requestDog.setBirth(birth);
		requestDog.setChipNo(chipNo);
		requestDog.setWeight(weight);
		requestDog.setNotes(notes);
		requestDog.setMemberCode(writerMemberCode);
		System.out.println("requestDog: " + requestDog);

		int result = new dogService().updateDog(requestDog);

		String page = "";
		if (result > 0) {
			page = "/WEB-INF/views/common/success.jsp";
			request.setAttribute("successMessage", "수정이 완료되었습니다.");
		} else {
			page = "/WEB-INF/views/common/failed.jsp";
			request.setAttribute("message", "수정이 실패하였습니다");

		}

		request.getRequestDispatcher(page).forward(request, response);

	}

}
