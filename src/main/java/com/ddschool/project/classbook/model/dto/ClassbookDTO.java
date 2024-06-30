package com.ddschool.project.classbook.model.dto;

import java.sql.Date;
import java.util.List;

import com.ddschool.project.member.model.dto.MemberDTO;

public class ClassbookDTO {
	
	private int classbookNo;
	private List<MemberDTO> member;
	private int dogCode;
	private Date checkDate;
	private String checkStatus;
	private Date modifyDate;
	private boolean status;
	
	public ClassbookDTO() {
		super();
	}

	public ClassbookDTO(int classbookNo, List<MemberDTO> member, int dogCode, Date checkDate, String checkStatus,
			Date modifyDate, boolean status) {
		super();
		this.classbookNo = classbookNo;
		this.member = member;
		this.dogCode = dogCode;
		this.checkDate = checkDate;
		this.checkStatus = checkStatus;
		this.modifyDate = modifyDate;
		this.status = status;
	}

	public int getClassbookNo() {
		return classbookNo;
	}

	public void setClassbookNo(int classbookNo) {
		this.classbookNo = classbookNo;
	}

	public List<MemberDTO> getMember() {
		return member;
	}

	public void setMember(List<MemberDTO> member) {
		this.member = member;
	}

	public int getDogCode() {
		return dogCode;
	}

	public void setDogCode(int dogCode) {
		this.dogCode = dogCode;
	}

	public Date getCheckDate() {
		return checkDate;
	}

	public void setCheckDate(Date checkDate) {
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

	public boolean isStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "ClassbookDTO [classbookNo=" + classbookNo + ", member=" + member + ", dogCode=" + dogCode
				+ ", checkDate=" + checkDate + ", checkStatus=" + checkStatus + ", modifyDate=" + modifyDate
				+ ", status=" + status + "]";
	}
	
}
	