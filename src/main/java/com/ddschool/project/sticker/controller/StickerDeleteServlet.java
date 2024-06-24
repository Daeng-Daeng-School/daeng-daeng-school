package com.ddschool.project.sticker.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.ddschool.project.sticker.model.dto.StickerDTO;
import com.ddschool.project.sticker.model.service.StickerService;

@WebServlet("/sticker/delete")
public class StickerDeleteServlet extends HttpServlet {
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path = "/WEB-INF/views/sticker/adminPage.jsp";
	    request.getRequestDispatcher(path).forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int stickerCode = Integer.parseInt(request.getParameter("stickerCode")) ;
		
        StickerDTO requestSticker = new StickerDTO();
		
		requestSticker.setStickerCode(stickerCode);
		
       int result = new StickerService().deleteSticker(requestSticker);
		
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
