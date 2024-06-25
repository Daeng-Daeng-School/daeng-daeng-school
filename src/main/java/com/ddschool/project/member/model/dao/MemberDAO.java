package com.ddschool.project.member.model.dao;

import org.apache.ibatis.annotations.Param;

import com.ddschool.project.member.model.dto.MemberDTO;

public interface MemberDAO {

	int insertMember(MemberDTO requestMember);

	String selectEncryptedPwd(String memberId);

	MemberDTO selectLoginMember(MemberDTO requestMember);

	int updateMember(
					@Param("requestMemberCode") int requestMemberCode, 
            		@Param("changePhone") String changePhone, 
            		@Param("changeAddress") String changeAddress);
	
}
