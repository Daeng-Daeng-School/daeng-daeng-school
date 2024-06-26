package com.ddschool.project.sticker.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.ddschool.project.sticker.model.dto.StickerDTO;
import com.ddschool.project.sticker.model.service.StickerService;

@WebServlet("/sticker/insert")
public class StickerInsertServlet extends HttpServlet {
  

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String path = "/WEB-INF/views/sticker/adminPageRegist.jsp";
	    request.getRequestDispatcher(path).forward(request, response);
	}	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//String stickerCode = request.getParameter("stickerCode");
		String dogCode = request.getParameter("dogCode");
		String memberCode = request.getParameter("memberCode");
		String stickerNum = request.getParameter("stickerNum");
		String comment = request.getParameter("comment");
		String registDate = request.getParameter("registDate");
		
		StickerDTO requestSticker = new StickerDTO();
		
		requestSticker.setDogCode(dogCode);
		requestSticker.setMemberCode(memberCode);
		requestSticker.setStickerNum(stickerNum);
		requestSticker.setComment(comment);
		requestSticker.setRegistDate(registDate);
		System.out.println("requestSticker: " + requestSticker);
		
		int result = new StickerService().insertSticker(requestSticker);
		
		String page = "";
		
		if(result>0) {
			page = "/WEB-INF/views/sticker/adminPage.jsp";
		}else {
			page = "/WEB-INF/views/common/failed.jsp";
			request.setAttribute("message", "등록이 실패하였습니다");
			
		}
		
		request.getRequestDispatcher(page).forward(request, response);
	
			
	}

}
