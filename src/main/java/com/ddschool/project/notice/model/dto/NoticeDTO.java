package com.ddschool.project.notice.model.dto;

import java.sql.Date;

import com.ddschool.project.member.dto.MemberDTO;

public class NoticeDTO {

	private int noticeNo;
	private int dogNo;
	private MemberDTO noticeWriter;
	private String noticeTitle;
	private String noticeBody;
	private Date createdDate;
	private Date modifiedDate;
	private String noticeStatus;

	public NoticeDTO() {
		super();
	}

	public NoticeDTO(int noticeNo, int dogNo, MemberDTO noticeWriter, String noticeTitle, String noticeBody,
			Date createdDate, Date modifiedDate, String noticeStatus) {
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

	public MemberDTO getNoticeWriter() {
		return noticeWriter;
	}

	public void setNoticeWriter(MemberDTO noticeWriter) {
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

	public String getNoticeStatus() {
		return noticeStatus;
	}

	public void setNoticeStatus(String noticeStatus) {
		this.noticeStatus = noticeStatus;
	}

	@Override
	public String toString() {
		return "NoticeDTO [noticeNo=" + noticeNo + ", dogNo=" + dogNo + ", noticeTitle=" + noticeTitle + ", noticeBody="
				+ noticeBody + ", noticeStatus=" + noticeStatus + "]";
	}
}
