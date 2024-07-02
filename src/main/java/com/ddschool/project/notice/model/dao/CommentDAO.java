package com.ddschool.project.notice.model.dao;

import java.util.List;

import com.ddschool.project.notice.model.dto.CommentDTO;

public interface CommentDAO {
	List<CommentDTO> selectCommentsByNoticeNo(int noticeNo);
    int insertComment(CommentDTO comment);
    int updateComment(CommentDTO comment);
    int updateCommentStatusToDeleted(CommentDTO deleteComment);
}
