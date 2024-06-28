package com.ddschool.project.ddclass.model.dto;

public class ClassDTO {
	
	private int classCode;
	
	private String className;
	
	private boolean status;
	
	public ClassDTO() {
		super();
	}

	public ClassDTO(int classCode, String className) {
		super();
		this.classCode = classCode;
		this.className = className;
		this.status = status;
	}

	public int getClassCode() {
		return classCode;
	}

	public void setClassCode(int classCode) {
		this.classCode = classCode;
	}

	public String getClassName() {
		return className;
	}

	public void setClassName(String className) {
		this.className = className;
	}

	public boolean isStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "ClassDTO [classCode=" + classCode + ", className=" + className + ", status=" + status + "]";
	}

}
