package com.ddschool.project.member.model.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.ddschool.project.common.mybatis.Template;
import com.ddschool.project.member.model.dao.MemberDAO;
import com.ddschool.project.member.model.dto.MemberDTO;

import static com.ddschool.project.common.mybatis.Template.getSqlSession;

import java.util.List;

public class MemberService {
	
	private MemberDAO memberDAO;
	private Template template;

	// 회원가입
	public int registMember(MemberDTO registMember) {
		
		SqlSession session = template.getSqlSession();
		memberDAO = session.getMapper(MemberDAO.class);
		
		int result = memberDAO.insertMember(registMember);
		
		if(result > 0) {
			session.commit();
		} else {
			session.rollback();
		}
		
		session.close();
		
		return result;
	}

	public MemberDTO loginCheck(MemberDTO requestMember) {

		System.out.println("서비스에서 로그인체크 시작");
		SqlSession session = getSqlSession();
		memberDAO = session.getMapper(MemberDAO.class);
		
		MemberDTO loginMember = null;
		
		// db 에 request 정보 전달해서 비밀번호 얻어오기
		String encPwd = memberDAO.selectEncryptedPwd(requestMember.getMemberId());
		System.out.println("[memberService] 디비에 저장된 암호화 encPwd : " + encPwd);
		
		// 복호화하기 위해 BCryptPasswordEncoder 생성
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		
		// 로그인 요청한 비밀번호와 디비에 저장된 비밀번호가 같은지 확인
		// 같으면 로그인한 memberDTO 가져오고, 다르면 null 전달
		
		System.out.println("[MemberService] 입력한 비밀번호: " + requestMember.getMemberPwd());
		if(passwordEncoder.matches(requestMember.getMemberPwd(), encPwd)) {
			System.out.println("일치하는 회원정보 발견!! dao 에서 해당 회원 정보 찾아오겠다!!");
			
			loginMember = memberDAO.selectLoginMember(requestMember);
			System.out.println("과연 결과는?!!");
			System.out.println(loginMember);
		}
		
		session.close();
		
		return loginMember; // controller 에 결과 전달

	}

	public int updateMember(int requestMemberCode, String changePhone, String changeAddress, Integer changeClassCode) {
		
		System.out.println("서비스에서 회원정보 수정 시작!");
		
		SqlSession session = getSqlSession();
		memberDAO = session.getMapper(MemberDAO.class);
		
		int updateResult = memberDAO.updateMember(requestMemberCode, changePhone, changeAddress, changeClassCode);
		
		if(updateResult > 0) {
			session.commit();
		} else {
			session.rollback();
		}
		
		session.close();
		
		return updateResult;
		
	}

	public int deleteMember(int deleteMemberCode, boolean deleteMemberSatus) {
		
		System.out.println("서비스에서 회원탈퇴 시작!");
		
		SqlSession session = getSqlSession();
		memberDAO = session.getMapper(MemberDAO.class);
		
		int deleteResult = memberDAO.deleteMember(deleteMemberCode, deleteMemberSatus);
		
		if(deleteResult > 0) {
			session.commit();
		} else {
			session.rollback();
		}
		
		session.close();
		
		return deleteResult;
	}

	public List<MemberDTO> selectTeacherList() {
		
		System.out.println("서비스에서 선생님 목록조회 시작!");
		
		SqlSession session = getSqlSession();
		memberDAO = session.getMapper(MemberDAO.class);
		
		List<MemberDTO> teacherList = memberDAO.selectTeacherList();
		System.out.println("서비스에서 선생님 목록 출력: "+teacherList);
		
		return teacherList;
	}

	public boolean isMemberIdExists(String memberId) {
		
		System.out.println("서비스에서 아이디 중복체크 조회!");
		
		SqlSession session = getSqlSession();
		memberDAO = session.getMapper(MemberDAO.class);
		
		boolean exists = memberDAO.isMemberIdExists(memberId);
		
		session.close();
		
		return exists;
	}

	public MemberDTO selectTeacherInfo(String memberId) {
		
		System.out.println("서비스에서 선생님 정보 조회!");
		
		SqlSession session = getSqlSession();
		memberDAO = session.getMapper(MemberDAO.class);
		
		MemberDTO teacherInfo = memberDAO.selectTeacherInfo(memberId);
		System.out.println(teacherInfo);
		
		session.close();
		
		
		return teacherInfo;
	}

}
