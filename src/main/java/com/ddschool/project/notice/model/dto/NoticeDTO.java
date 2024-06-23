package com.ddschool.project.notice.model.dto;

import java.sql.Date;

//import com.ddschool.project.member.dto.MemberDTO;

public class NoticeDTO {

    private int noticeNo;        // 알림장 번호
    private int dogNo;           // 관련된 강아지 번호
    //	DB연결시 MemberDTO 로 받아서 해당 회원코드를 가진 이름을 불러오도록 해야할 것 같음.
    private int noticeWriter;    // 작성자 회원 번호
    private String noticeTitle;  // 알림장 제목
    private String noticeBody;   // 알림장 내용
    private Date createdDate;    // 작성일
    private Date modifiedDate;   // 수정일
    private boolean noticeStatus;    // 알림장 상태 (활성화/비활성화 등)

	public NoticeDTO() {
		super();
	}

	public NoticeDTO(int noticeNo, int dogNo, int noticeWriter, String noticeTitle, String noticeBody,
			Date createdDate, Date modifiedDate, boolean noticeStatus) {
		super();
		this.noticeNo = noticeNo;
		this.dogNo = dogNo;
		this.noticeWriter = noticeWriter;
		this.noticeTitle = noticeTitle;
		this.noticeBody = noticeBody;
		this.createdDate = createdDate;
		this.modifiedDate = modifiedDate;
		this.noticeStatus = noticeStatus;
	}

	public int getNoticeNo() {
		return noticeNo;
	}

	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}

	public int getDogNo() {
		return dogNo;
	}

	public void setDogNo(int dogNo) {
		this.dogNo = dogNo;
	}

	public int getNoticeWriter() {
		return noticeWriter;
	}

	public void setNoticeWriter(int noticeWriter) {
		this.noticeWriter = noticeWriter;
	}

	public String getNoticeTitle() {
		return noticeTitle;
	}

	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}

	public String getNoticeBody() {
		return noticeBody;
	}

	public void setNoticeBody(String noticeBody) {
		this.noticeBody = noticeBody;
	}

	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	public Date getModifiedDate() {
		return modifiedDate;
	}

	public void setModifiedDate(Date modifiedDate) {
		this.modifiedDate = modifiedDate;
	}

	public boolean getNoticeStatus() {
		return noticeStatus;
	}

	public void setNoticeStatus(boolean noticeStatus) {
		this.noticeStatus = noticeStatus;
	}

	@Override
	public String toString() {
		return "NoticeDTO [noticeNo=" + noticeNo + ", dogNo=" + dogNo + ", noticeTitle=" + noticeTitle + ", noticeBody="
				+ noticeBody + ", noticeStatus=" + noticeStatus + "]";
	}
}
