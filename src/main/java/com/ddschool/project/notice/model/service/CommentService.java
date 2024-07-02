package com.ddschool.project.notice.model.service;

import static com.ddschool.project.common.mybatis.Template.getSqlSession;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.ddschool.project.notice.model.dao.CommentDAO;
import com.ddschool.project.notice.model.dto.CommentDTO;

public class CommentService {

	private CommentDAO commentDAO;

	public CommentService() {
		super();
	}

	/**
	 * 댓글 추가
	 * 
	 * @param comment 새로운 댓글 객체
	 * @return 삽입 결과
	 */
	public int addComment(CommentDTO comment) {
		SqlSession session = getSqlSession();
		commentDAO = session.getMapper(CommentDAO.class);
		System.out.println("Adding comment: " + comment);
		int result = commentDAO.insertComment(comment);
		if (result > 0) {
			session.commit();
		} else {
			session.rollback();
		}
		session.close();
		return result;
	}

	/**
	 * 댓글 조회
	 * 
	 * @param noticeNo 알림장 번호
	 * @return 댓글 목록
	 */
	public List<CommentDTO> getCommentsByNoticeNo(int noticeNo) {
		SqlSession session = getSqlSession();

		try {
			// CommentDAO의 매퍼를 얻음
			commentDAO = session.getMapper(CommentDAO.class);
			// 공지사항 번호에 해당하는 댓글 목록을 조회
			List<CommentDTO> comments = commentDAO.selectCommentsByNoticeNo(noticeNo);
			return comments;
		} finally {
			// 세션을 닫아 자원을 해제
			session.close();
		}
	}

	/**
	 * 댓글 수정
	 * 
	 * @param comment 수정할 댓글 객체
	 * @return 수정 결과
	 */
	public int modifyComment(CommentDTO modifyComment) {
		SqlSession session = getSqlSession();
		commentDAO = session.getMapper(CommentDAO.class);
		int result = commentDAO.updateComment(modifyComment);
		if (result > 0) {
			session.commit();
		} else {
			session.rollback();
		}
		session.close();
		return result;
	}

	/**
	 * 댓글 삭제
	 * 
	 * @param commentCode 삭제할 댓글 코드
	 * @return 삭제 결과
	 */
	public int markCommentAsDeleted(CommentDTO deleteComment) {
		SqlSession session = getSqlSession();
		commentDAO = session.getMapper(CommentDAO.class);
		int result = commentDAO.updateCommentStatusToDeleted(deleteComment);
		if (result > 0) {
			session.commit();
		} else {
			session.rollback();
		}
		session.close();
		return result;
	}
}