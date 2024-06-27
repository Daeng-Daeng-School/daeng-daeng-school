package com.ddschool.project.notice.controller;

import java.io.IOException;
import java.util.List;

import com.ddschool.project.notice.model.dto.NoticeDTO;
import com.ddschool.project.notice.model.service.NoticeService;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/notice")
public class NoticePageServlet extends HttpServlet {

	private NoticeService noticeService;

	@Override
	public void init() throws ServletException {
		super.init();
		noticeService = new NoticeService();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 전체 알림장 수 계산
		int totalNotices = noticeService.getTotalNoticeCount();
		// 현재 페이지 및 페이지당 알림장 수 결정
		int currentPage = 1;
		int limit = 6; // 페이지당 항목 수

		String pageParam = request.getParameter("page");
		if (pageParam != null && !pageParam.isEmpty()) {
			try {
				currentPage = Integer.parseInt(pageParam);
				if (currentPage < 1) {
					currentPage = 1;
				}
			} catch (NumberFormatException e) {
				currentPage = 1;
			}
		}

		// 페이징을 위한 오프셋 계산
		int offset = (currentPage - 1) * limit;

		// 현재 페이지의 알림장 목록 검색
		List<NoticeDTO> noticeList = noticeService.selectNotice(offset, limit);

		// JSP/HTML 뷰 렌더링을 위한 속성 설정
		request.setAttribute("noticeList", noticeList);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("limit", limit);
		request.setAttribute("totalNotices", totalNotices);

		// JSP/HTML 뷰로 포워딩
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/notice/noticePage.jsp");
		dispatcher.forward(request, response);
	}
}