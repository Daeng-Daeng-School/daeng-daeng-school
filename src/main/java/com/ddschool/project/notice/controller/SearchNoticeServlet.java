package com.ddschool.project.notice.controller;

import java.io.IOException;
import java.util.Collections;
import java.util.List;

import com.ddschool.project.common.pagination.Pagination;
import com.ddschool.project.member.model.dto.MemberDTO;
import com.ddschool.project.notice.model.dto.NoticeDTO;
import com.ddschool.project.notice.model.service.NoticeService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/notice/search")
public class SearchNoticeServlet extends HttpServlet {

	private NoticeService noticeService;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		MemberDTO loginMember = (MemberDTO) session.getAttribute("loginMember");

		int memberCode = loginMember.getMemberCode();

		int currentPage = 1;
		int limit = 6;

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

		int totalNotices;
		String keyword;
		List<NoticeDTO> noticeList;

		if (memberCode > 0) {
			try {
				int roleCode = noticeService.getRoleCodeByMemberCode(memberCode);

				if (roleCode == 1) {
					keyword = request.getParameter("keyword");
					totalNotices = noticeService.getSearchNoticeCount(keyword);
					noticeList = noticeService.searchNotices(keyword, (currentPage - 1) * limit, limit);
				} else if (roleCode == 2) {
					int classCode = noticeService.getClassCodeByMemberCode(memberCode);
					keyword = request.getParameter("keyword");
					totalNotices = noticeService.getSearchNoticeCountByClassCode(classCode, keyword);
					noticeList = noticeService.searchNoticesByClassCode(classCode, keyword, (currentPage - 1) * limit,
							limit);
				} else if (roleCode == 3) {
					keyword = request.getParameter("keyword");
					totalNotices = noticeService.getSearchNoticeCountByMemberCode(memberCode, keyword);
					noticeList = noticeService.searchNoticesByMemberCode(memberCode, keyword, (currentPage - 1) * limit,
							limit);
				} else {
					keyword = "";
					totalNotices = 0;
					noticeList = Collections.emptyList();
				}

				Pagination pagination = new Pagination(currentPage, totalNotices, limit);

				request.setAttribute("noticeList", noticeList);
				request.setAttribute("pagination", pagination);
				request.setAttribute("keyword", keyword);

				response.setContentType("application/json");
				response.setCharacterEncoding("UTF-8");
				response.getWriter().write("{\"result\":\"success\"}");

			} catch (Exception e) {
				e.printStackTrace();
				response.setContentType("application/json");
				response.setCharacterEncoding("UTF-8");
				response.getWriter().write("{\"result\":\"error\"}");
			}
		} else {
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write("{\"result\":\"error\"}");
		}
	}
}
