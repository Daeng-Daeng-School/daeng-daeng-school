package com.ddschool.project.ddclass.model.service;

import static com.ddschool.project.common.mybatis.Template.getSqlSession;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.ddschool.project.common.mybatis.Template;
import com.ddschool.project.ddclass.model.dao.ClassDAO;
import com.ddschool.project.ddclass.model.dto.ClassDTO;
import com.ddschool.project.member.model.dao.MemberDAO;
import com.ddschool.project.member.model.dto.MemberDTO;

public class ClassService {
	
	private ClassDAO classDAO;
	private Template template;

	public List<ClassDTO> getClassList() {
		
		System.out.println("서비스에서 전체 반 목록조회 시작!");
		
		SqlSession session = getSqlSession();
	    classDAO = session.getMapper(ClassDAO.class);
		
		
		List<ClassDTO> classList = classDAO.getClassList();
		
		System.out.println("서비스에서 전체반 목록 출력: " + classList);
		
		return classList;

	}

	public int insertClass(String className) {
		System.out.println("서비스에서 신규 반 등록 시작!");
		
		SqlSession session = getSqlSession();
	    classDAO = session.getMapper(ClassDAO.class);
		
		int result = 0;
		
		result = classDAO.insertClass(className);
		
		if(result > 0) {
			session.commit();
		} else {
			session.rollback();
		}
		
		session.close();
		
		return result;
	}

}
