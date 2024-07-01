package com.ddschool.project.notice.controller;

import java.io.IOException;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

/**
 * 알림장 페이지 서블릿
 */
@WebServlet("/notice")
public class NoticePageServlet extends HttpServlet {

	private NoticeService noticeService;

	@Override
	public void init() throws ServletException {
		super.init();
		noticeService = new NoticeService();
	}

	/**
	 * 알림장 페이지 GET 요청 처리
	 *
	 * @param request  HTTP 요청 객체
	 * @param response HTTP 응답 객체
	 * @throws ServletException 서블릿 예외
	 * @throws IOException      IO 예외
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		MemberDTO loginMember = (MemberDTO) session.getAttribute("loginMember");
		System.out.println("loginMember = " + loginMember);

		int memberCode = loginMember.getMemberCode();
		System.out.println("memberCode = " + memberCode);

		// 기본 페이지 설정
		int currentPage = 1;
		int limit = 6; // 페이지당 표시할 알림장 수

		// 페이지 파라미터 처리
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
		List<NoticeDTO> noticeList;

		// 멤버 코드가 유효한 경우에만 처리
		if (memberCode > 0) {
			try {
				// 멤버의 롤 코드 가져오기
				int roleCode = noticeService.getRoleCodeByMemberCode(memberCode);

				// 준비된 맵 객체 생성
				Map<String, Object> paramMap = new HashMap<>();
				paramMap.put("memberCode", memberCode);
				paramMap.put("offset", (currentPage - 1) * limit);
				paramMap.put("limit", limit);

				// 롤 코드에 따라 처리 분기
				if (roleCode == 1) { // 마스터: 전체 데이터 조회 가능
					totalNotices = noticeService.getTotalNoticeCount();
					noticeList = noticeService.selectNotice(paramMap);
				} else if (roleCode == 2) { // 선생님: 클래스 코드에 속하는 반려견의 게시글 조회
					int classCode = noticeService.getClassCodeByMemberCode(memberCode);
					System.out.println("classCode = " + classCode);
					paramMap.put("classCode", classCode);
					totalNotices = noticeService.getTotalNoticeCountByClassCode(classCode);
					noticeList = noticeService.selectNoticeByClassCode(paramMap);
				} else if (roleCode == 3) { // 반려견 주인: 본인의 반려견의 게시글 조회
					totalNotices = noticeService.getTotalNoticeCountByMemberCode(memberCode);
					noticeList = noticeService.selectNoticeByMemberCode(paramMap);
				} else {
					// 예외 상황: 롤 코드가 없거나 다른 경우
					totalNotices = 0;
					noticeList = Collections.emptyList(); // 빈 리스트 생성 방식 변경
				}

				// 페이징 처리 객체 생성
				Pagination pagination = new Pagination(currentPage, totalNotices, limit);

				// JSP로 데이터 전달
				request.setAttribute("noticeList", noticeList);
				request.setAttribute("pagination", pagination);

				// JSP 페이지로 포워딩
				request.getRequestDispatcher("/WEB-INF/views/notice/noticePage.jsp").forward(request, response);
			} catch (NumberFormatException e) {
				System.out.println("유효하지 않은 memberCode 입니다. " + memberCode);
			}
		} else {
			System.out.println("memberCode가 없습니다.");
		}
	}

	/**
	 * 알림장 페이지 POST 요청 처리
	 *
	 * @param request  HTTP 요청 객체
	 * @param response HTTP 응답 객체
	 * @throws ServletException 서블릿 예외
	 * @throws IOException      IO 예외
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
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