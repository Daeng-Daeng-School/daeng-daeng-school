package com.ddschool.project.sticker.model.dto;

import java.sql.Date;

public class StickerDTO {

	private int stickerCode;
	private String dogCode;
	private String memerCode;
	private String stickerNum;
	private String comment;
	private String registDate;
	
	public StickerDTO() {
		super();
	}

	public StickerDTO(String memerCode, String stickerNum, String registDate, int stickerCode, String dogCode,
			String comment) {
		super();
		this.memerCode = memerCode;
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

	public String getMemerCode() {
		return memerCode;
	}

	public void setMemerCode(String memerCode) {
		this.memerCode = memerCode;
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
		return "StickerDTO [stickerCode=" + stickerCode + ", dogCode=" + dogCode + ", memerCode=" + memerCode
				+ ", stickerNum=" + stickerNum + ", comment=" + comment + ", registDate=" + registDate + "]";
	}
	
	
	
	
	
	
	
}
