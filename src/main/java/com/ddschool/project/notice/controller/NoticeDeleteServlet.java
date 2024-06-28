package com.ddschool.project.notice.controller;

import java.io.IOException;

import com.ddschool.project.notice.model.dto.NoticeDTO;
import com.ddschool.project.notice.model.service.NoticeService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/notice/delete")
public class NoticeDeleteServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 삭제하고자 하는 알림장의 번호 가져오기
		int noticeNo = Integer.parseInt(request.getParameter("noticeNo"));
		// NoticeService의 deleteNotice 메소드에 알림장번호를 매개변수로 보내 실행결과를 반환받음
		int result = new NoticeService().deleteNotice(noticeNo);
		// 삭제 후 리다이렉트 처리
		response.sendRedirect(request.getContextPath() + "/notice");
	}
}
