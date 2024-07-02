package com.ddschool.project.classbook.controller;

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

@WebServlet("/classbook")
public class ClassbookServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("도착");
		// 내 반려견 정보 조회하기
	    HttpSession session = request.getSession();
	    MemberDTO loginMember = (MemberDTO) session.getAttribute("loginMember");
	   
	    
	    if(loginMember.getRoleCode() == 1){
	    	
	    	List<DogDTO> dogs = new DogService().selectDogsAllList();
	    	
	    	request.setAttribute("dogs", dogs);
	    	request.getRequestDispatcher("/WEB-INF/views/classbook/classbookPageAdmin.jsp").forward(request, response);
	    	
	    }else if(loginMember.getRoleCode() == 2) {
	    	
	    	int classCode = loginMember.getClassCode();
	    	
	    	List<DogDTO> myDogs = new DogService().selectDogsByClassCode(classCode);
	    	
	    	request.setAttribute("myDogs", myDogs);
	    	request.getRequestDispatcher("/WEB-INF/views/classbook/classbookPageMember.jsp").forward(request, response);
	    	
	    }else {
	    	int loginMemberCode = loginMember.getMemberCode();
		    
		    List<DogDTO> myDogs = new DogService().selectDogsByMemberCode(loginMemberCode);
		    System.out.println(myDogs);
		    
		    request.setAttribute("myDogs", myDogs);
			
			request.getRequestDispatcher("/WEB-INF/views/classbook/classbookPageMember.jsp").forward(request, response);
	    }
  
	}

}
