package com.ddschool.project.dog.model.dto;

public class ClassDTO {
	
	private int classCode;
	private int dogCode;
	private String className;
	
	public ClassDTO() {
		super();
	}

	public ClassDTO(int classCode, int dogCode, String className) {
		super();
		this.classCode = classCode;
		this.dogCode = dogCode;
		this.className = className;
	}

	public int getClassCode() {
		return classCode;
	}

	public void setClassCode(int classCode) {
		this.classCode = classCode;
	}

	public int getDogCode() {
		return dogCode;
	}

	public void setDogCode(int dogCode) {
		this.dogCode = dogCode;
	}

	public String getClassName() {
		return className;
	}

	public void setClassName(String className) {
		this.className = className;
	}

	@Override
	public String toString() {
		return "ClassDTO [classCode=" + classCode + ", dogCode=" + dogCode + ", className=" + className + "]";
	}
	
	
}

