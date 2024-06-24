package com.ddschool.project.sticker.model.dto;

import java.sql.Date;

public class StickerDTO {

	private int stickerCode;
	private String dogCode;
	private String memberCode;
	private String stickerNum;
	private String comment;
	private String registDate;
	
	public StickerDTO() {
		super();
	}

	public StickerDTO(String memberCode, String stickerNum, String registDate, int stickerCode, String dogCode,
			String comment) {
		super();
		this.memberCode = memberCode;
		this.stickerNum = stickerNum;
		this.registDate = registDate;
		this.stickerCode = stickerCode;
		this.dogCode = dogCode;
		this.comment = comment;
	}

	public int getStickerCode() {
		return stickerCode;
	}

	public void setStickerCode(int stickerCode) {
		this.stickerCode = stickerCode;
	}

	public String getDogCode() {
		return dogCode;
	}

	public void setDogCode(String dogCode) {
		this.dogCode = dogCode;
	}

	public String getMemberCode() {
		return memberCode;
	}

	public void setMemberCode(String memberCode) {
		this.memberCode = memberCode;
	}

	public String getStickerNum() {
		return stickerNum;
	}

	public void setStickerNum(String stickerNum) {
		this.stickerNum = stickerNum;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public String getRegistDate() {
		return registDate;
	}

	public void setRegistDate(String registDate) {
		this.registDate = registDate;
	}

	@Override
	public String toString() {
		return "StickerDTO [stickerCode=" + stickerCode + ", dogCode=" + dogCode + ", memberCode=" + memberCode
				+ ", stickerNum=" + stickerNum + ", comment=" + comment + ", registDate=" + registDate + "]";
	}
	
	
	
	
	
	
	
}
