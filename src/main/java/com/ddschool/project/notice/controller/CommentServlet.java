package com.ddschool.project.notice.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import com.ddschool.project.notice.model.dto.CommentDTO;
import com.ddschool.project.notice.model.service.CommentService;
import com.google.gson.Gson;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/notice/comment")
public class CommentServlet extends HttpServlet {

	private CommentService commentService;

	public void init() throws ServletException {
		super.init();
		commentService = new CommentService();
	}

	/**
	 * GET 요청을 처리하여 해당 공지사항 번호에 대한 댓글 목록을 JSON 형식으로 반환
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 요청 파라미터에서 공지 번호를 가져옴
		request.setCharacterEncoding("UTF-8");
		int noticeNo = Integer.parseInt(request.getParameter("noticeNo"));
		System.out.println("댓글 목록 조회 - 공지 번호: " + noticeNo);

		// 서비스에서 공지 번호에 해당하는 댓글 목록을 가져옴
		List<CommentDTO> comments = commentService.getCommentsByNoticeNo(noticeNo);

		// 댓글 데이터를 JSON 형식으로 변환하여 클라이언트에 전달
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();

		// Gson 라이브러리를 사용하여 객체를 JSON 문자열로 변환
		Gson gson = new Gson();
		String jsonComments = gson.toJson(comments);

		out.print(jsonComments);
		// flush()는 버퍼링된 데이터를 출력 스트림에서 클라이언트나 수신자에게 즉시 전송하여, 실시간 업데이트 및 효율적인 네트워크 통신에 중요한 기능
		out.flush();
	}

	/**
	 * POST 요청을 처리하여 새로운 댓글을 추가
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 요청 파라미터에서 공지사항 번호, 회원 코드, 댓글 내용을 가져옴
		request.setCharacterEncoding("UTF-8");
		int noticeNo = Integer.parseInt(request.getParameter("noticeNo"));
		int memberCode = Integer.parseInt(request.getParameter("memberCode"));
		String content = request.getParameter("content");

		// 댓글 객체를 생성하고 값 설정
		CommentDTO comment = new CommentDTO();
		comment.setNoticeNo(noticeNo);
		comment.setMemberCode(memberCode);
		comment.setContent(content);

		// 서비스를 통해 댓글을 추가하고 결과를 JSON 형식으로 반환
		int result = commentService.addComment(comment);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write("{\"result\":\"" + ((result > 0) ? "success" : "error") + "\"}");
	}

	/**
	 * PUT 요청을 처리하여 댓글 수정
	 */
	protected void doPut(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 요청 파라미터에서 댓글 코드와 컨텐츠를 가져옴
		request.setCharacterEncoding("UTF-8");
		int commentCode = Integer.parseInt(request.getParameter("commentCode"));
		String content = request.getParameter("content");

		// 새로운 댓글 객체 생성
		CommentDTO newComment = new CommentDTO();
		newComment.setCommentCode(commentCode);
		newComment.setContent(content);

		// 서비스에서 댓글 등록
		int result = commentService.modifyComment(newComment);
		// 성공 메시지 전송
		response.setContentType("text/plain");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write("{\"result\":\"" + ((result > 0) ? "success" : "error") + "\"}");
	}

	/**
	 * DELETE 요청을 처리하여 댓글 삭제
	 */
	protected void doDelete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 요청 파라미터에서 댓글 코드를 가져옴
		request.setCharacterEncoding("UTF-8");
		int commentCode = Integer.parseInt(request.getParameter("commentCode"));
		System.out.println("삭제 commentCode : " + commentCode);

		// 논리적 삭제를 위해 댓글의 상태를 '0'으로 업데이트
		int result = commentService.markCommentAsDeleted(commentCode);
		System.out.println("삭제result : " + result);
		
		// 결과를 JSON 형식으로 반환
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write("{\"result\":\"" + ((result > 0) ? "success" : "error") + "\"}");
	}
}
