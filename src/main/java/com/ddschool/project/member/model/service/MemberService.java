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

	// 로그인 비밀번호 체크
	public MemberDTO loginCheck(MemberDTO requestMember) {

		SqlSession session = getSqlSession();
		memberDAO = session.getMapper(MemberDAO.class);
		
		MemberDTO loginMember = null;
		
		// db 에 request 정보 전달해서 비밀번호 얻어오기
		String encPwd = memberDAO.selectEncryptedPwd(requestMember.getMemberId());
		System.out.println("[memberService] 디비에 저장된 암호화 encPwd : " + encPwd);
		
		// 복호화하기 위해 BCryptPasswordEncoder 생성
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		
		// 로그인 요청 비밀번호와 디비에 저장된 비밀번호가 같은지 확인
		if(passwordEncoder.matches(requestMember.getMemberPwd(), encPwd)) {
			loginMember = memberDAO.selectLoginMember(requestMember);
			System.out.println(loginMember);
		}
		
		session.close();
		return loginMember; 

	}

	// 회원정보 수정
	public int updateMember(int requestMemberCode, String changePhone, String changeAddress) {
		System.out.println("서비스에서 회원정보 수정 시작!");
		
		SqlSession session = getSqlSession();
		memberDAO = session.getMapper(MemberDAO.class);
		
		int updateResult = memberDAO.updateMember(requestMemberCode, changePhone, changeAddress);
		
		if(updateResult > 0) {
			session.commit();
		} else {
			session.rollback();
		}
		
		session.close();
		return updateResult;
		
	}

	// 회원탈퇴
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

	// 선생님목록 조회
	public List<MemberDTO> selectTeacherList(int page, int pageSize, String sortOrder, String classFilter, String startDate, String endDate) {
		System.out.println("서비스에서 선생님 목록조회 시작!");
		
		SqlSession session = getSqlSession();
		memberDAO = session.getMapper(MemberDAO.class);
		
		// 불러올 데이터의 시작점 정하기 (몇 개를 건너뛸지 결정)
		int offset = (page - 1) * pageSize; 
		
		/*
		 * 페이지네이션 offset 의 역할 정리
		 * page = 1, offset = 0 => 첫 페이지는 건너뛸 데이터가 없음
		 * page = 2, offset = 10 => 앞 10개의 데이터는 건너뛰로 11번째 데이터부터 시작
		 * */
		
		List<MemberDTO> teacherList = memberDAO.selectTeacherList(pageSize, offset, sortOrder, classFilter, startDate, endDate);
		
		session.close();
		return teacherList;
	}
	
	// 전체 선생님 수 조회
	public int getTeacherCount(String classFilter, String startDate, String endDate) {
		
		SqlSession session = getSqlSession();
		memberDAO = session.getMapper(MemberDAO.class);
		
		int count = memberDAO.getTeacherCount(classFilter, startDate, endDate);
		
		session.close();
		return count;
	}

	// 아이디 중복체크
	public boolean isMemberIdExists(String memberId) {
		System.out.println("서비스에서 아이디 중복체크 조회!");
		
		SqlSession session = getSqlSession();
		memberDAO = session.getMapper(MemberDAO.class);
		
		boolean exists = memberDAO.isMemberIdExists(memberId);
		
		session.close();
		return exists;
	}

	// 선생님 1명 정보 조회
	public MemberDTO selectTeacherInfo(String memberId) {
		System.out.println("서비스에서 선생님 정보 조회!");
		
		SqlSession session = getSqlSession();
		memberDAO = session.getMapper(MemberDAO.class);
		
		MemberDTO teacherInfo = memberDAO.selectTeacherInfo(memberId);
		System.out.println(teacherInfo);
		
		session.close();
		return teacherInfo;
	}

	// 선생님 1명 정보 수정
	public int updateTeacher(int requestMemberCode, String changePhone, String changeAddress, Integer changeClassCode) {
		System.out.println("서비스에서 선생님 정보 수정 시작!");
		
		SqlSession session = getSqlSession();
		memberDAO = session.getMapper(MemberDAO.class);
		
		int updateResult = memberDAO.updateTeacher(requestMemberCode, changePhone, changeAddress, changeClassCode);
		
		if(updateResult > 0) {
			session.commit();
		} else {
			session.rollback();
		}
		
		session.close();
		return updateResult;
	}

	// 선생님 활성화
	public int rejoinMember(String memberId) {
		System.out.println("서비스에서 선생님 활성화 시작!");
		
		SqlSession session = getSqlSession();
		memberDAO = session.getMapper(MemberDAO.class);
		
		int rejoinResult = memberDAO.rejoinMember(memberId);
		
		if(rejoinResult > 0) {
			session.commit();
		} else {
			session.rollback();
		}
		
		session.close();
		return rejoinResult;
	}

}