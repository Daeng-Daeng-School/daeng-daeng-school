package com.ddschool.project.notice.controller;

import java.io.IOException;
import java.util.List;

import com.ddschool.project.common.pagination.Pagination;
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
        String keyword = request.getParameter("keyword");
        int currentPage = 1;
        int limit = 6; // 페이지당 표시할 알림장 수

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

        if (keyword != null && !keyword.isEmpty()) {
            totalNotices = noticeService.getSearchNoticeCount(keyword);
            noticeList = noticeService.searchNotices(keyword, (currentPage - 1) * limit, limit);
        } else {
            totalNotices = noticeService.getTotalNoticeCount();
            noticeList = noticeService.selectNotice((currentPage - 1) * limit, limit);
        }

        Pagination pagination = new Pagination(currentPage, totalNotices, limit);

        request.setAttribute("noticeList", noticeList);
        request.setAttribute("pagination", pagination);
        request.setAttribute("keyword", keyword);
        
        System.out.println(noticeList);

        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/notice/noticePage.jsp");
        dispatcher.forward(request, response);
    }
}
