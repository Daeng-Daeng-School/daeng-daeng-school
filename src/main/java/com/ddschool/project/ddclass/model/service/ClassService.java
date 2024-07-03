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

	// 반 목록 조회
	public List<ClassDTO> getClassList() {
		
		SqlSession session = getSqlSession();
	    classDAO = session.getMapper(ClassDAO.class);
		
		List<ClassDTO> classList = classDAO.getClassList();
		
		session.close();
		return classList;

	}

	// 신규 반 등록
	public int insertClass(String className) {
		
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

	// 반 활성상태 수정
	public int updateClassStatus(int classCode, boolean status) {
		
		SqlSession session = getSqlSession();
	    classDAO = session.getMapper(ClassDAO.class);
	    
		int result=0;
		
		result = classDAO.updateClassStatus(classCode, status);
		
		if(result > 0) {
			session.commit();
		} else {
			session.rollback();
		}
		
		session.close();
		return result;
	}

}
