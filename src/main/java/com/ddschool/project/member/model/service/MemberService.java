package com.ddschool.project.member.model.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.ddschool.project.common.mybatis.Template;
import com.ddschool.project.member.model.dao.MemberDAO;
import com.ddschool.project.member.model.dto.MemberDTO;

import static com.ddschool.project.common.mybatis.Template.getSqlSession;

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

}
