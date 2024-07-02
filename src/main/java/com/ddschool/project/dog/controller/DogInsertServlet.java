package com.ddschool.project.dog.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import com.ddschool.project.dog.model.dto.DogDTO;
import com.ddschool.project.dog.model.service.DogService;
import com.ddschool.project.member.model.dto.MemberDTO;

@WebServlet("/dog/insert")
public class DogInsertServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 등록 폼으로 이동
		String path = "/WEB-INF/views/dog/dogInsertPage.jsp";
		request.getRequestDispatcher(path).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		// 폼에서 입력된 데이터 받기
		String dogName = request.getParameter("dogName");
		String dogBreed = request.getParameter("dogBreed");
		int dogClass = Integer.parseInt(request.getParameter("dogClass"));
		String dogGender = request.getParameter("gender");
		String birth = request.getParameter("birthdate");
		String chipNo = request.getParameter("chipNo");
		double weight = Double.parseDouble(request.getParameter("weight"));
		String notes = request.getParameter("notes");

		// 현재 로그인한 회원 정보 가져오기 멤버디티오에서 가져오기
		MemberDTO loginMember = (MemberDTO) request.getSession().getAttribute("loginMember");
		int memberCode = loginMember.getMemberCode();

		// 강아지 정보 DTO 생성
		DogDTO dogDTO = new DogDTO();
		dogDTO.setDogName(dogName);
		dogDTO.setDogBreed(dogBreed);
		dogDTO.setClassCode(dogClass);
		dogDTO.setGender(dogGender);
		dogDTO.setBirth(birth);
		dogDTO.setChipNo(chipNo);
		dogDTO.setWeight(weight);
		dogDTO.setNotes(notes);
		dogDTO.setMemberCode(memberCode);

		// 강아지 서비스 호출하여 등록 처리
		int result = new DogService().insertDog(dogDTO);

		// 등록 결과에 따라 페이지 이동 처리
		String path = "";
		if (result > 0) {
			path = "/WEB-INF/views/common/success.jsp";
			request.setAttribute("successCode", "insertDog");
		} else {
			path = "/WEB-INF/views/common/failed.jsp";
			request.setAttribute("errorMessage", "강아지 등록에 실패했습니다! 다시 등록해주세요!");
		}

		request.getRequestDispatcher(path).forward(request, response);
	}

	// 이미지 업로드는 추후에
}