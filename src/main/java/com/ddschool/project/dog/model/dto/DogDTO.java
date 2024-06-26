package com.ddschool.project.dog.model.dto;

import java.sql.Date;

public class DogDTO {

	private int dogCode;
	private int memberCode;
	private int classCode;
	private String dogName;
	private String gender;
	private String birth;
	private String dogBreed;
	private double weight;
	private String chipNo;
	private String notes;
	private Date joinDate;
	private Date withdrawDate;
	private boolean status;

	public DogDTO() {
		super();
	}

	public DogDTO(int dogCode, int memberCode, int classCode, String dogName, String gender, String birth,
			String dogBreed, double weight, String chipNo, String notes, Date joinDate, Date withdrawDate,
			boolean status) {
		super();
		this.dogCode = dogCode;
		this.memberCode = memberCode;
		this.classCode = classCode;
		this.dogName = dogName;
		this.gender = gender;
		this.birth = birth;
		this.dogBreed = dogBreed;
		this.weight = weight;
		this.chipNo = chipNo;
		this.notes = notes;
		this.joinDate = joinDate;
		this.withdrawDate = withdrawDate;
		this.status = status;
	}

	public int getDogCode() {
		return dogCode;
	}

	public void setDogCode(int dogCode) {
		this.dogCode = dogCode;
	}

	public int getMemberCode() {
		return memberCode;
	}

	public void setMemberCode(int memberCode) {
		this.memberCode = memberCode;
	}

	public int getClassCode() {
		return classCode;
	}

	public void setClassCode(int classCode) {
		this.classCode = classCode;
	}

	public String getDogName() {
		return dogName;
	}

	public void setDogName(String dogName) {
		this.dogName = dogName;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getDogBreed() {
		return dogBreed;
	}

	public void setDogBreed(String dogBreed) {
		this.dogBreed = dogBreed;
	}

	public double getWeight() {
		return weight;
	}

	public void setWeight(double weight) {
		this.weight = weight;
	}

	public String getChipNo() {
		return chipNo;
	}

	public void setChipNo(String chipNo) {
		this.chipNo = chipNo;
	}

	public String getNotes() {
		return notes;
	}

	public void setNotes(String notes) {
		this.notes = notes;
	}

	public Date getJoinDate() {
		return joinDate;
	}

	public void setJoinDate(Date joinDate) {
		this.joinDate = joinDate;
	}

	public Date getWithdrawDate() {
		return withdrawDate;
	}

	public void setWithdrawDate(Date withdrawDate) {
		this.withdrawDate = withdrawDate;
	}

	public boolean isStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "DogDTO [dogCode=" + dogCode + ", memberCode=" + memberCode + ", classCode=" + classCode + ", dogName="
				+ dogName + ", gender=" + gender + ", birth=" + birth + ", dogBreed=" + dogBreed + ", weight=" + weight
				+ ", chipNo=" + chipNo + ", notes=" + notes + ", joinDate=" + joinDate + ", withdrawDate="
				+ withdrawDate + ", status=" + status + "]";
	}

	
}
