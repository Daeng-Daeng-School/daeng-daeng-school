package com.ddschool.project.notice.model.service;

import com.ddschool.project.notice.model.dao.CommentDAO;
import com.ddschool.project.notice.model.dto.CommentDTO;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import static com.ddschool.project.common.mybatis.Template.getSqlSession;

/**
 * 댓글 관련 비즈니스 로직 처리 서비스 클래스
 */
public class CommentService {

	private CommentDAO commentDAO;

	public List<CommentDTO> selectComment(int noticeNo) {
		SqlSession session = getSqlSession();
		commentDAO = session.getMapper(CommentDAO.class);
		
		List<CommentDTO> comment = commentDAO.selectComment(noticeNo);
		session.close();

		return comment;
	}

	public int insertComment(CommentDTO newComment) {
		SqlSession session = getSqlSession();
		commentDAO = session.getMapper(CommentDAO.class);
		int result = commentDAO.insertComment(newComment);
		if (result > 0) {
			session.commit();
		} else {
			session.rollback();
		}
		session.close();

		return result;
	}

}
