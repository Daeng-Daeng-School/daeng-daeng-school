package com.ddschool.project.notice.controller;

import java.io.IOException;
import java.util.List;

import com.ddschool.project.notice.model.dto.NoticeDTO;
import com.ddschool.project.notice.model.service.NoticeService;

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
        noticeService = new NoticeService(); // NoticeService 객체 초기화
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 페이징 처리를 위한 기본값 설정
        int currentPage = 1; // 기본 페이지는 1
        int limit = 6; // 한 페이지에 표시할 게시물 수

        // 요청 파라미터로부터 현재 페이지 받아오기
        String pageParam = request.getParameter("currentPage");
        if (pageParam != null && !pageParam.isEmpty()) {
            currentPage = Integer.parseInt(pageParam);
        }

        // NoticeService의 getNotices 메서드를 통해 공지사항 목록 조회
        List<NoticeDTO> noticeList = noticeService.getNotices(currentPage, limit);

        // 조회된 공지사항 목록을 JSP에 전달
        request.setAttribute("noticeList", noticeList);
        request.getRequestDispatcher("/WEB-INF/views/notice/noticePage.jsp").forward(request, response);
    }
}
