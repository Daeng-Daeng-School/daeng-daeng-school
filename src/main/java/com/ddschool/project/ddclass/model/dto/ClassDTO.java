package com.ddschool.project.ddclass.model.dto;

public class ClassDTO {
	
	private int classCode;
	
	private String className;
	
	public ClassDTO() {
		super();
	}

	public ClassDTO(int classCode, String className) {
		super();
		this.classCode = classCode;
		this.className = className;
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

	@Override
	public String toString() {
		return "ClassDTO [classCode=" + classCode + ", className=" + className + "]";
	}
	
}
