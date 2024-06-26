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

@WebServlet("/sticker/insert")
public class StickerInsertServlet extends HttpServlet {
  

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		 StickerDTO requestSticker = new StickerDTO();
	      
	      Map<String, List<StickerDTO>> stickerOptionLists = new StickerService().SelectOptionListSticker(requestSticker);
	      List<StickerDTO> stickerMemberList = stickerOptionLists.get("memberList");
	      List<StickerDTO> stickerDogList = stickerOptionLists.get("dogList");
	      
	      System.out.println("stickerMemberList : " + stickerMemberList );
	      System.out.println("stickerDogList : " + stickerDogList );
	      
	      String page = "";
	      
	      if(stickerMemberList != null && stickerDogList != null) {
	         page = "/WEB-INF/views/sticker/adminPageRegist.jsp";
	         request.setAttribute("stickerMemberList", stickerMemberList);
	         request.setAttribute("stickerDogList", stickerDogList);

	         
	      }else {
	         page = "/WEB-INF/views/common/failed.jsp";
	         request.setAttribute("message", "조회가 실패하였습니다");
	         
	      }
	    
		request.getRequestDispatcher(page).forward(request, response);
	}	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//String stickerCode = request.getParameter("stickerCode");
		
		//String dogCode = request.getParameter("dogCode");
		//String memberCode = request.getParameter("memberCode");
		
		
		String dogCode = request.getParameter("stickerDogList");
		String memberCode = request.getParameter("stickerMemberList");
		
		String stickerNum = request.getParameter("stickerNum");
		String comment = request.getParameter("comment");
		//String registDate = request.getParameter("registDate");
		
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Date currentDate = new Date();
        String registDate = dateFormat.format(currentDate);	
		
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
			//page = "/WEB-INF/views/sticker/adminPage.jsp";
			response.sendRedirect(request.getContextPath() + "/sticker/list");
		}else {
			page = "/WEB-INF/views/common/failed.jsp";
			request.setAttribute("message", "등록이 실패하였습니다");
			request.getRequestDispatcher(page).forward(request, response);
		}
		
		
	
			
	}

}
