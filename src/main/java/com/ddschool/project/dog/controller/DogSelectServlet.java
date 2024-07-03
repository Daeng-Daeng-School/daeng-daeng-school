package com.ddschool.project.dog.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

import com.ddschool.project.dog.model.dto.DogDTO;
import com.ddschool.project.dog.model.service.DogService;
import com.ddschool.project.member.model.dto.MemberDTO;

@WebServlet("/dog/select")

public class DogSelectServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();
		MemberDTO loginMember = (MemberDTO) session.getAttribute("loginMember");
		
		int memberCode = loginMember.getMemberCode();
		
		List<DogDTO> dogList = new DogService().selectDogsByMemberCode(memberCode);
		
		request.setAttribute("dogList", dogList);
		System.out.println(dogList);
		
		String path = "/WEB-INF/views/dog/dogSelectListPage.jsp";
		request.getRequestDispatcher(path).forward(request, response);
		
	}

}

