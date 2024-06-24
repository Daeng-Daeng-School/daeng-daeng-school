package com.ddschool.project.notice.model.dao;

import com.ddschool.project.notice.model.dto.CommentDTO;

import java.sql.SQLException;
import java.util.List;

/**
 * 댓글 데이터 접근 객체 (DAO) 인터페이스
 */
public interface CommentDAO {

	List<CommentDTO> selectComment(int noticeNo);

	int insertComment(CommentDTO newComment);
}
