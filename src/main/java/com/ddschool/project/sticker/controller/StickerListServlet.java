package com.ddschool.project.sticker.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import com.ddschool.project.member.model.dto.MemberDTO;
import com.ddschool.project.sticker.model.dto.StickerDTO;
import com.ddschool.project.sticker.model.service.StickerService;

@WebServlet("/sticker/list")
public class StickerListServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String registDate = request.getParameter("registDate");
		if(registDate == null) {
			  // 현재 시스템 시간으로 파싱
	        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMM");
	        Date currentDate = new Date();
	        registDate = dateFormat.format(currentDate);		
	
		}

		int roleCode = 0; 
		StickerDTO requestSticker = new StickerDTO();
		
		HttpSession session = request.getSession(false);
		if (session != null && session.getAttribute("loginMember") != null) {
			MemberDTO loginMember = new MemberDTO();
			loginMember = (MemberDTO) session.getAttribute("loginMember");
			
			roleCode = loginMember.getRoleCode();
			String memberCode = Integer.toString(loginMember.getMemberCode());
			requestSticker.setMemberCode(memberCode);
			requestSticker.setRoleCode(roleCode);
			
			System.out.println("roleCode : " + roleCode );
			
			request.setAttribute("roleCode", roleCode);
		}
		
		
		requestSticker.setRegistDate(registDate);
		
		System.out.println("selectListSticker : " + requestSticker + ", " + roleCode );
		


	    List<StickerDTO> stickerList = new StickerService().selectListSticker(requestSticker);
	
		
		
		List<Map<String, String>> stickerRank = new StickerService().selectRankSticker(requestSticker); 
		
		System.out.println("stickerList : " + stickerList );
		System.out.println("stickerRank : " + stickerRank );
		
		String page = "";
		
		if ( roleCode == 0 ) { //로그인이 되지 않은 경우
			
			request.setAttribute("authFailMessage", "로그인이 필요한 서비스입니다. 로그인 후 이용해 주세요!");
			page = "/WEB-INF/views/common/failed.jsp";
			
		}
		else if(stickerList != null && stickerRank != null) {
			page = "/WEB-INF/views/sticker/adminPage.jsp";
			request.setAttribute("registDate", registDate);
			request.setAttribute("stickerList", stickerList);
			request.setAttribute("stickerRank", stickerRank);
			
		}else {
			page = "/WEB-INF/views/common/failed.jsp";
			request.setAttribute("message", "조회가 실패하였습니다");
			
		}	
		
		
		request.getRequestDispatcher(page).forward(request, response);

		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
				
	}

}
