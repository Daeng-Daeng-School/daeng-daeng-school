package com.ddschool.project.member.model.dao;

import java.util.List;

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

	int deleteMember(
					@Param("deleteMemberCode") int deleteMemberCode,
					@Param("deleteMemberSatus") boolean deleteMemberSatus);

	List<MemberDTO> selectTeacherList(
					@Param("limit") int limit, // pageSize
					@Param("offset") int offset,
					@Param("sortOrder") String sortOrder,
					@Param("classFilter") String calssFilter);
	
	int getTeacherCount(@Param("classFilter") String classFilter);

	boolean isMemberIdExists(String memberId);

	MemberDTO selectTeacherInfo(String memberId);

	int updateTeacher(
					@Param("requestMemberCode") int requestMemberCode, 
            		@Param("changePhone") String changePhone, 
            		@Param("changeAddress") String changeAddress,
            		@Param("changeClassCode") int changeClassCode);

	int rejoinMember(String memberId);

}