package com.ddschool.project.notice.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Properties;

import com.ddschool.project.ddclass.model.dto.ClassDTO;
import com.ddschool.project.dog.model.dto.DogDTO;
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
	       // 폼에서 전달된 선택된 반과 반려견 코드 가져오기
        String classCode = request.getParameter("classCode");
        int dogCode = Integer.parseInt(request.getParameter("dogCode"));

        // 나머지 폼 데이터 가져오기
        int noticeWriterCode = Integer.parseInt(request.getParameter("noticeWriterCode"));
        Date createdDate = null;
        try {
            createdDate = new java.sql.Date(new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("createdDate")).getTime());
        } catch (ParseException e) {
            e.printStackTrace();
        }
        String title = request.getParameter("title");
        String body = request.getParameter("body");
        
    	String editorApiKey = props.getProperty("api.key"); // 에디터 API


        // 서비스 호출 및 알림장 등록
        NoticeDTO newNotice = new NoticeDTO();
        newNotice.setCreatedDate(createdDate);
        newNotice.setDogNo(dogCode); // 반려견 코드 설정
        newNotice.setNoticeBody(body);
        newNotice.setNoticeTitle(title);
        newNotice.setNoticeWriterCode(noticeWriterCode);

        // 알림장 등록 서비스 호출
        NoticeService noticeService = new NoticeService(editorApiKey);
        int result = noticeService.insertNotice(newNotice);

        // 결과에 따른 페이지 이동 처리
        String path = "";
        if (result > 0) {
            path = "/WEB-INF/views/common/success.jsp";
            request.setAttribute("successCode", "insertNotice");
        } else {
            path = "/WEB-INF/views/common/failed.jsp";
            request.setAttribute("message", "알림장 등록에 실패하였습니다.");
        }

        request.getRequestDispatcher(path).forward(request, response);
    }
}
