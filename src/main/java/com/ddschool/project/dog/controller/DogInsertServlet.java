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
import com.ddschool.project.dog.model.service.dogService;
import com.ddschool.project.dog.model.dto.MemberDTO;

@WebServlet("/dog/insert")
public class DogInsertServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 등록 폼으로 이동
		String path = "/WEB-INF/views/dog/dogInsertpage.jsp";
		request.getRequestDispatcher(path).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 폼에서 입력된 데이터 받기
		String dogBreed = request.getParameter("dog_breed");
		String dogClass = request.getParameter("dog_class");
		String dogGender = request.getParameter("dog_gender");
		String dogName = request.getParameter("name");
		String birthdate = request.getParameter("birthdate");
		String regNumber = request.getParameter("regNumber");
		String weight = request.getParameter("weight");
		String notes = request.getParameter("notes");

		// 현재 로그인한 회원 정보 가져오기
		MemberDTO loginMember = (MemberDTO) request.getSession().getAttribute("loginMember");
		int writerMemberNo = loginMember.getNo();

		// 강아지 정보 DTO 생성
		DogDTO dogDTO = new DogDTO();
		dogDTO.setDogBreed(dogBreed);
		dogDTO.setDogClass(dogClass);
		dogDTO.setDogGender(dogGender);
		dogDTO.setDogName(dogName);
		dogDTO.setBirthdate(birthdate);
		dogDTO.setRegNumber(regNumber);
		dogDTO.setWeight(weight);
		dogDTO.setNotes(notes);
		dogDTO.setWriterMemberNo(writerMemberNo);

		// 강아지 서비스 호출하여 등록 처리
		DogService dogService = new DogService();
		int result = dogService.insertDog(dogDTO);

		// 등록 결과에 따라 페이지 이동 처리
		String path = "";
		if (result > 0) {
			path = "/WEB-INF/views/common/success.jsp";
			request.setAttribute("successCode", "insertDog");
		} else {
			path = "/WEB-INF/views/common/failed.jsp";
			request.setAttribute("message", "강아지 등록 실패했습니다!");
		}

		request.getRequestDispatcher(path).forward(request, response);
	}

	// 이미지 업로드는 추후에

}
