package com.ddschool.project.notice.controller;

import java.io.IOException;
import java.util.List;

import com.ddschool.project.notice.model.dto.CommentDTO;
import com.ddschool.project.notice.model.service.CommentService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/notice/comment")
public class CommentServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int noticeNo = Integer.parseInt(request.getParameter("noticeNo"));
        CommentService commentService = new CommentService();
        List<CommentDTO> comments = commentService.selectComment(noticeNo);
        request.setAttribute("comments", comments);
        request.setAttribute("commentCount", comments.size());
        request.getRequestDispatcher("/path/to/jsp").forward(request, response); // JSP 파일 경로 지정
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int noticeNo = Integer.parseInt(request.getParameter("noticeNo"));
        int memberCode = Integer.parseInt(request.getParameter("memberCode"));
        String content = request.getParameter("content");

        // 현재 날짜로 설정
        java.sql.Date createdDate = new java.sql.Date(new java.util.Date().getTime());

        CommentDTO newComment = new CommentDTO();
        newComment.setnoticeNo(noticeNo);
        newComment.setMemberCode(memberCode);
        newComment.setContent(content);
        newComment.setcreatedDate(createdDate);

        CommentService commentService = new CommentService();
        int result = commentService.insertComment(newComment);

        if(result < 0) {
            request.setAttribute("message", "댓글 등록에 실패하였습니다.");
        }
        
        doGet(request, response); // 등록 후 doGet 메소드 호출하여 목록을 다시 불러옴
    }
}
