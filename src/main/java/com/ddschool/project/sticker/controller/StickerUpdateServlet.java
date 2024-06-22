package com.ddschool.project.sticker.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.ddschool.project.sticker.model.dto.StickerDTO;
import com.ddschool.project.sticker.model.service.StickerService;

@WebServlet("/sticker/update")
public class StickerUpdateServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path = "/WEB-INF/views/sticker/adminPageUpdate.jsp";
	    request.getRequestDispatcher(path).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int stickerCode = Integer.parseInt(request.getParameter("stickerCode"));
		String dogCode = request.getParameter("dogCode");
		String memerCode = request.getParameter("memerCode");
		String stickerNum = request.getParameter("stickerNum");
		String comment = request.getParameter("comment");
		String registDate = request.getParameter("registDate");
		
		StickerDTO requestSticker = new StickerDTO();
		
		requestSticker.setStickerCode(stickerCode);
		requestSticker.setDogCode(dogCode);
		requestSticker.setMemerCode(memerCode);
		requestSticker.setStickerNum(stickerNum);
		requestSticker.setComment(comment);
		requestSticker.setRegistDate(registDate);
		System.out.println("requestSticker: " + requestSticker);
		
		int result = new StickerService().updateSticker(requestSticker);
		
		String page = "";
		
		if(result>0) {
			page = "/WEB-INF/views/sticker/adminPage.jsp";
		}else {
			page = "/WEB-INF/views/common/failed.jsp";
			request.setAttribute("message", "수정이 실패하였습니다");
			
		}
		
		request.getRequestDispatcher(page).forward(request, response);
	
			
	
	}

}
