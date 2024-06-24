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
 * 알림장 내용 수정을 처리하는 서블릿
 */
@WebServlet("/notice/modify")
public class NoticeModifyServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int noticeNo = Integer.parseInt(request.getParameter("noticeNo"));
		System.out.println("modify.noticeNo="+noticeNo);
		NoticeDTO noticeDetail = new NoticeService().selectNoticeDetail(noticeNo);
		request.setAttribute("noticeDetail", noticeDetail);
		
		request.getRequestDispatcher("/WEB-INF/views/notice/noticeModify.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		int noticeNo = Integer.parseInt(request.getParameter("noticeNo"));
		String noticeTitle = request.getParameter("noticeTitle");
		String noticeBody = request.getParameter("noticeBody");

		NoticeDTO modifyNotice = new NoticeDTO();
		modifyNotice.setNoticeNo(noticeNo);
		modifyNotice.setNoticeTitle(noticeTitle);
		modifyNotice.setNoticeBody(noticeBody);

		int result = new NoticeService().updateNotice(modifyNotice);

		if (result > 0) {
            response.sendRedirect(request.getContextPath() + "/notice/detail?noticeNo=" + noticeNo);
        } else {
            request.setAttribute("message", "게시물 수정에 실패했습니다.");
            request.getRequestDispatcher("/WEB-INF/views/common/error.jsp").forward(request, response);
        }
	}
}
