package com.ddschool.project.sticker.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

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
	        String formattedDate = dateFormat.format(currentDate);		
	
		}
	 
		
		StickerDTO requestSticker = new StickerDTO();
		
		
		requestSticker.setRegistDate(registDate);
		
		List<StickerDTO> stickerList = new StickerService().selectListSticker(requestSticker);
		
		List<Map<String, String>> stickerRank = new StickerService().selectRankSticker(requestSticker); 
		
		System.out.println("stickerList : " + stickerList );
		System.out.println("stickerRank : " + stickerRank );
		
		String page = "";
		
		if(stickerList != null && stickerRank != null) {
			page = "/WEB-INF/views/sticker/adminPage.jsp";
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
