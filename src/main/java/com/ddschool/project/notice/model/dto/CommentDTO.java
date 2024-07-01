package com.ddschool.project.notice.model.dto;

import java.util.Date;

import com.ddschool.project.member.model.dto.MemberDTO;

public class CommentDTO {
    private int commentCode;     // 댓글 코드
    private int noticeNo;        // 게시판 코드 (게시판 번호와 연결)
    private MemberDTO commentWriter; // 작성자 정보 (MemberDTO 객체)
    private String content;      // 댓글 내용
    private Date createdDate;    // 등록 일자
    private Date modifyDate;     // 수정 일자
    private boolean status;      // 댓글 상태 (활성화 여부)

    public CommentDTO() {
        super();
    }

    public CommentDTO(int commentCode, int noticeNo, MemberDTO commentWriter, String content, Date createdDate, Date modifyDate, boolean status) {
        super();
        this.commentCode = commentCode;
        this.noticeNo = noticeNo;
        this.commentWriter = commentWriter;
        this.content = content;
        this.createdDate = createdDate;
        this.modifyDate = modifyDate;
        this.status = status;
    }

    public int getCommentCode() {
        return commentCode;
    }

    public void setCommentCode(int commentCode) {
        this.commentCode = commentCode;
    }

    public int getNoticeNo() {
        return noticeNo;
    }

    public void setNoticeNo(int noticeNo) {
        this.noticeNo = noticeNo;
    }

    public MemberDTO getCommentWriter() {
        return commentWriter;
    }

    public void setCommentWriter(MemberDTO commentWriter) {
        this.commentWriter = commentWriter;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }

    public Date getModifyDate() {
        return modifyDate;
    }

    public void setModifyDate(Date modifyDate) {
        this.modifyDate = modifyDate;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }
}
