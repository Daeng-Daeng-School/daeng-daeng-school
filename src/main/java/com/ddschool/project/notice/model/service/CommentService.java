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
	 */
	public int addComment(CommentDTO comment) {
		SqlSession session = getSqlSession();
		commentDAO = session.getMapper(CommentDAO.class);
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
	 * 공지사항 번호에 해당하는 댓글 목록 가져옴
	 */
	public List<CommentDTO> getCommentsByNoticeNo(int noticeNo) {
		SqlSession session = getSqlSession();
		commentDAO = session.getMapper(CommentDAO.class);
		List<CommentDTO> comments = commentDAO.selectCommentsByNoticeNo(noticeNo);
		session.close();
		return comments;
	}

	/**
	 * 댓글 수정
	 */
	public int modifyComment(CommentDTO comment) {
		SqlSession session = getSqlSession();
		commentDAO = session.getMapper(CommentDAO.class);
		int result = commentDAO.updateComment(comment);
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
	 */
	public int deleteComment(int commentCode) {
		SqlSession session = getSqlSession();
		commentDAO = session.getMapper(CommentDAO.class);
		int result = commentDAO.deleteComment(commentCode);
		if (result > 0) {
			session.commit();
		} else {
			session.rollback();
		}
		session.close();
		return result;
	}
}
