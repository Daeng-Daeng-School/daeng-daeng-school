package com.ddschool.project.sticker.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import com.ddschool.project.sticker.model.dto.StickerDTO;
import com.ddschool.project.sticker.model.service.StickerService;

@WebServlet("/sticker/list")
public class StickerListServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path = "/WEB-INF/views/sticker/adminPage.jsp";
	    request.getRequestDispatcher(path).forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
				String registDate = request.getParameter("registDate");
				
				StickerDTO requestSticker = new StickerDTO();
				
				
				requestSticker.setRegistDate(registDate);
				
				List<StickerDTO> stickerList = new StickerService().SelectListSticker(requestSticker);
				
				
				System.out.println("stickerList : " + stickerList );
				
				String page = "";
				
				if(stickerList != null) {
					page = "/WEB-INF/views/sticker/adminPage.jsp";
					request.setAttribute("stickerList", stickerList);
					
				}else {
					page = "/WEB-INF/views/common/failed.jsp";
					request.setAttribute("message", "조회가 실패하였습니다");
					
				}
				
				request.getRequestDispatcher(page).forward(request, response);
	
	}

}
