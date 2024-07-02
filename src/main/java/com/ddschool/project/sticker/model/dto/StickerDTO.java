package com.ddschool.project.sticker.model.dto;

import java.sql.Date;

public class StickerDTO {

	private int stickerCode;
	private String dogCode;
	private String memberCode;
	private String stickerNum;
	private String comment;
	private String registDate;
	private String dogName;
	private String memberName;
	private int roleCode;
	
	public StickerDTO() {
		super();
	}



	public StickerDTO(int stickerCode, String dogCode, String memberCode, String stickerNum, String comment,
			String registDate, String dogName, String memberName, int roleCode) {
		super();
		this.stickerCode = stickerCode;
		this.dogCode = dogCode;
		this.memberCode = memberCode;
		this.stickerNum = stickerNum;
		this.comment = comment;
		this.registDate = registDate;
		this.dogName = dogName;
		this.memberName = memberName;
		this.roleCode = roleCode;
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
	
	public String getDogName() {
		return dogName;
	}


	public void setDogName(String dogName) {
		this.dogName = dogName;
	}


	public String getMemberName() {
		return memberName;
	}


	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}



	public int getRoleCode() {
		return roleCode;
	}


	public void setRoleCode(int roleCode) {
		this.roleCode = roleCode;
	}



	@Override
	public String toString() {
		return "StickerDTO [stickerCode=" + stickerCode + ", dogCode=" + dogCode + ", memberCode=" + memberCode
				+ ", stickerNum=" + stickerNum + ", comment=" + comment + ", registDate=" + registDate + ", dogName="
				+ dogName + ", memberName=" + memberName + ", roleCode=" + roleCode + "]";
	}
	
		
	
}
