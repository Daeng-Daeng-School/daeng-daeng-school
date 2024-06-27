package com.ddschool.project.notice.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Properties;

import com.ddschool.project.member.model.dto.MemberDTO;
import com.ddschool.project.notice.model.dto.NoticeDTO;
import com.ddschool.project.notice.model.service.NoticeService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * 알림장 등록을 처리하는 서블릿
 */
@WebServlet("/notice/insert")
public class NoticeRegistServlet extends HttpServlet {
    private static final String PROPERTIES_FILE = "config.properties";
    private static Properties props = new Properties();

    static {
        try (InputStream input = new FileInputStream(PROPERTIES_FILE)) {
            props.load(input);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * GET 요청을 처리하여 알림장 등록 페이지로 이동
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String path = "/WEB-INF/views/notice/noticeInsert.jsp";
        request.getRequestDispatcher(path).forward(request, response);
    }

    /**
     * POST 요청을 처리하여 신규 알림장 등록
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int dog = Integer.parseInt(request.getParameter("dog")); // 반려견 번호
        System.out.println(dog);
        int noticeWriterCode  = Integer.parseInt(request.getParameter("noticeWriterCode")); // 작성자 정보 
        System.out.println(noticeWriterCode);
        Date createdDate = null;
        try {
            createdDate = new java.sql.Date(
                    new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("createdDate")).getTime());
        } catch (ParseException e) {
            e.printStackTrace();
        }
        String title = request.getParameter("title"); // 알림장 제목
        String body = request.getParameter("body"); // 알림장 내용

        String editorApiKey = props.getProperty("api.key"); // 에디터 API 

        NoticeDTO newNotice = new NoticeDTO();
        newNotice.setCreatedDate(createdDate);
        newNotice.setDogNo(dog);
        newNotice.setNoticeBody(body);
        newNotice.setNoticeTitle(title);
        newNotice.setNoticeWriterCode(noticeWriterCode);
        
        NoticeService noticeService = new NoticeService(editorApiKey);
        // 알림장 등록 서비스 호출
        int result = noticeService.insertNotice(newNotice);

        String path = "";
        if (result > 0) {
            path = "/WEB-INF/views/common/success.jsp"; 
            request.setAttribute("successCode", "insertNotice");
        } else {
            path = "/WEB-INF/views/common/failed.jsp"; 
            request.setAttribute("message", "게시판 작성에 실패하였습니다.");
        }

        request.getRequestDispatcher(path).forward(request, response);
    }
}
