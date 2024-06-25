package com.ddschool.project.member.model.dto;

import java.util.Date;

public class MemberDTO {
	
	private int memberCode;
	
<<<<<<< Upstream, based on origin/master
	private Integer classCode;
	
	private int roleCode;
	
	private String memberId;
	
	private String memberPwd;
	
	private String memberName;
	
	private String phone;
	
	private String address;
	
	private String memberBirth;
	
	private boolean status;
	
	private Date joinDate;
	
	private Date withdrawDate;
	
	public MemberDTO() {
		super();
	}

	public MemberDTO(int memberCode, Integer classCode, int roleCode, String memberId, String memberPwd, String memberName,
			String phone, String address, String memberBirth, boolean status, Date joinDate, Date withdrawDate) {
		super();
		this.memberCode = memberCode;
		this.classCode = classCode;
		this.roleCode = roleCode;
		this.memberId = memberId;
		this.memberPwd = memberPwd;
		this.memberName = memberName;
		this.phone = phone;
		this.address = address;
		this.memberBirth = memberBirth;
		this.status = status;
		this.joinDate = joinDate;
		this.withdrawDate = withdrawDate;
	}

	public int getMemberCode() {
		return memberCode;
	}

	public void setMemberCode(int memberCode) {
		this.memberCode = memberCode;
	}

	public Integer getClassCode() {
		return classCode;
	}

	public void setClassCode(Integer classCode) {
		this.classCode = classCode;
	}

	public int getRoleCode() {
		return roleCode;
	}

	public void setRoleCode(int roleCode) {
		this.roleCode = roleCode;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getMemberPwd() {
		return memberPwd;
	}

	public void setMemberPwd(String memberPwd) {
		this.memberPwd = memberPwd;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getMemberBirth() {
		return memberBirth;
	}

	public void setMemberBirth(String memberBirth) {
		this.memberBirth = memberBirth;
=======
	private int classCode;
	
	private int roleCode;
	
	private String memberId;
	
	private String memberPwd;
	
	private String memberName;
	
	private String phone;
	
	private String address;
	
	private boolean status;
	
	private Date joinDate;
	
	private Date withdrawDate;
	
	public MemberDTO() {
		super();
	}

	public MemberDTO(int memberCode, int classCode, int roleCode, String memberId, String memberPwd, String memberName,
			String phone, String address, boolean status, Date joinDate, Date withdrawDate) {
		super();
		this.memberCode = memberCode;
		this.classCode = classCode;
		this.roleCode = roleCode;
		this.memberId = memberId;
		this.memberPwd = memberPwd;
		this.memberName = memberName;
		this.phone = phone;
		this.address = address;
		this.status = status;
		this.joinDate = joinDate;
		this.withdrawDate = withdrawDate;
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

	public int getRoleCode() {
		return roleCode;
	}

	public void setRoleCode(int roleCode) {
		this.roleCode = roleCode;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getMemberPwd() {
		return memberPwd;
	}

	public void setMemberPwd(String memberPwd) {
		this.memberPwd = memberPwd;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
>>>>>>> 150794a Design: css 수정 Docs: sql 수정 Feat: jsp 출석부 select 기능, 권한설정
	}

	public boolean isStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
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

	@Override
	public String toString() {
		return "MemberDTO [memberCode=" + memberCode + ", classCode=" + classCode + ", roleCode=" + roleCode
				+ ", memberId=" + memberId + ", memberPwd=" + memberPwd + ", memberName=" + memberName + ", phone="
				+ phone + ", address=" + address + ", status=" + status + ", joinDate=" + joinDate + ", withdrawDate="
				+ withdrawDate + "]";
	}

}
