package com.ddschool.project.notice.model.dto;

import java.sql.Date;

/**
 * 댓글 데이터 전송 객체 (DTO)
 */
public class CommentDTO {

    private int commentCode;     // 댓글 코드
    private int noticeNo;       // 게시판 코드 (게시판 번호와 연결)
    private int memberCode;      // 작성자 코드
    private String content;      // 댓글 내용
    private Date createdDate;     // 등록 일자
    private Date modifyDate;     // 수정 일자
    private boolean status;      // 댓글 상태 (활성화 여부)

    public CommentDTO() {
        super();
    }

    public CommentDTO(int noticeNo, int memberCode, String content) {
        super();
        this.noticeNo = noticeNo;
        this.memberCode = memberCode;
        this.content = content;
        this.createdDate = new Date(System.currentTimeMillis());
        this.modifyDate = new Date(System.currentTimeMillis());
        this.status = true;  // 댓글은 기본적으로 활성화 상태
    }

    public int getCommentCode() {
        return commentCode;
    }

    public void setCommentCode(int commentCode) {
        this.commentCode = commentCode;
    }

    public int getnoticeNo() {
        return noticeNo;
    }

    public void setnoticeNo(int noticeNo) {
        this.noticeNo = noticeNo;
    }

    public int getMemberCode() {
        return memberCode;
    }

    public void setMemberCode(int memberCode) {
        this.memberCode = memberCode;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getcreatedDate() {
        return createdDate;
    }

    public void setcreatedDate(Date createdDate) {
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

    @Override
    public String toString() {
        return "CommentDTO [commentCode=" + commentCode + ", noticeNo=" + noticeNo + ", memberCode=" + memberCode
                + ", content=" + content + ", createdDate=" + createdDate + ", modifyDate=" + modifyDate + ", status="
                + status + "]";
    }
}
