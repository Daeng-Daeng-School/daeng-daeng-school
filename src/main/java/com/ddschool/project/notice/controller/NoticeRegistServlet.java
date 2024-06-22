package com.ddschool.project.notice.controller;

import java.io.IOException;

import com.ddschool.project.member.dto.MemberDTO;
import com.ddschool.project.notice.model.dto.NoticeDTO;
import com.ddschool.project.notice.model.service.NoticeService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/notice/insert")
public class NoticeRegistServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String path = "/WEB-INF/views/notice/noticeInsert.jsp";
		request.getRequestDispatcher(path).forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String title = request.getParameter("title");
		String body = request.getParameter("body");
//		MemberDTO writerName = ((MemberDTO) request.getSession().getAttribute("loginMember")).getMemberName();
		
		NoticeDTO newNotice = new NoticeDTO();
		newNotice.setNoticeTitle(title);	
		newNotice.setNoticeBody(body);
		// newNotice.setNoticeWriter(writerName);
		
		NoticeService NoticeService = new NoticeService();
		int result = NoticeService.insertNotice(newNotice);
		
		String path = "";
		if(result > 0) {
			path = "/WEB-INF/views/common/success.jsp";
			request.setAttribute("successCode", "insertNotice");
		} else {
			path = "/WEB-INF/views/common/failed.jsp";
			request.setAttribute("message", "게시판 작성에 실패하셨습니다.");
		}
		
		request.getRequestDispatcher(path).forward(request, response);
		
		
	}

}
