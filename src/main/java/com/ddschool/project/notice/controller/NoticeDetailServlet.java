package com.ddschool.project.notice.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.ddschool.project.notice.model.dto.NoticeDTO;
import com.ddschool.project.notice.model.service.NoticeService;

/**
 * 알림장 상세내용 조회를 처리하는 서블릿
 */
@WebServlet("/notice/detail")
public class NoticeDetailServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String noticeNo = request.getParameter("noticeNo");
		System.out.println("detail.noticeNo=" + noticeNo);
		if (noticeNo == null || noticeNo.isEmpty()) {
			response.sendRedirect(request.getContextPath() + "/notice");
		}

		NoticeService noticeService = new NoticeService();
		NoticeDTO notice = noticeService.selectNoticeDetail(Integer.parseInt(noticeNo));
		System.out.println(notice);
		String path = "";
		if (notice != null) {
			path = "/WEB-INF/views/notice/noticeDetail.jsp";
			request.setAttribute("notice", notice);
		} else {
			path = "/WEB-INF/views/common/failed.jsp";
			request.setAttribute("message", "알림장 조회 실패");
		}

		request.getRequestDispatcher(path).forward(request, response);

	}

}