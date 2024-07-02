package com.ddschool.project.classbook.model.dto;

import java.sql.Date;
import java.util.List;

import com.ddschool.project.member.model.dto.MemberDTO;

public class ClassbookDTO {
	
	private int classbookNo;
	private int memberCode;
	private int dogCode;
	private String checkDate;
	private String checkStatus;
	private Date modifyDate;
	
	public ClassbookDTO() {
		super();
	}

	public ClassbookDTO(int classbookNo, int memberCode, int dogCode, String checkDate, String checkStatus,
			Date modifyDate) {
		super();
		this.classbookNo = classbookNo;
		this.memberCode = memberCode;
		this.dogCode = dogCode;
		this.checkDate = checkDate;
		this.checkStatus = checkStatus;
		this.modifyDate = modifyDate;
	}

	public int getClassbookNo() {
		return classbookNo;
	}

	public void setClassbookNo(int classbookNo) {
		this.classbookNo = classbookNo;
	}

	public int getMemberCode() {
		return memberCode;
	}

	public void setMemberCode(int memberCode) {
		this.memberCode = memberCode;
	}

	public int getDogCode() {
		return dogCode;
	}

	public void setDogCode(int dogCode) {
		this.dogCode = dogCode;
	}

	public String getCheckDate() {
		return checkDate;
	}

	public void setCheckDate(String checkDate) {
		this.checkDate = checkDate;
	}

	public String getCheckStatus() {
		return checkStatus;
	}

	public void setCheckStatus(String checkStatus) {
		this.checkStatus = checkStatus;
	}

	public Date getModifyDate() {
		return modifyDate;
	}

	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}

	@Override
	public String toString() {
		return "ClassbookDTO [classbookNo=" + classbookNo + ", memberCode=" + memberCode + ", dogCode=" + dogCode
				+ ", checkDate=" + checkDate + ", checkStatus=" + checkStatus + ", modifyDate=" + modifyDate + "]";
	}

	
	
}