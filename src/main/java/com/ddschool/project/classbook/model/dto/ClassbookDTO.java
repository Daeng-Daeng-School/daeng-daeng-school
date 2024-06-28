package com.ddschool.project.classbook.model.dto;

import java.sql.Date;
import java.util.List;

import com.ddschool.project.member.model.dto.MemberDTO;

public class ClassbookDTO {
	
	private int classbookNo;
	private List<MemberDTO> member;
	private int dog;
	private Date checkDate;
	private String checkStatus;
	private Date modifyDate;
	
	
	public ClassbookDTO() {
		
	}


	public ClassbookDTO(int classbookNo, List<MemberDTO> member, int dog, Date checkDate, String checkStatus,
			Date modifyDate) {
		super();
		this.classbookNo = classbookNo;
		this.member = member;
		this.dog = dog;
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


	public List<MemberDTO> getMember() {
		return member;
	}


	public void setMember(List<MemberDTO> member) {
		this.member = member;
	}


	public int getDog() {
		return dog;
	}


	public void setDog(int dog) {
		this.dog = dog;
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


	@Override
	public String toString() {
		return "ClassbookDTO [classbookNo=" + classbookNo + ", member=" + member + ", dog=" + dog + ", checkDate="
				+ checkDate + ", checkStatus=" + checkStatus + ", modifyDate=" + modifyDate + "]";
	}
	
	
	
	

}
