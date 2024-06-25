package com.ddschool.project.classbook.model.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.ddschool.project.classbook.model.dao.ClassbookDAO;
import com.ddschool.project.dog.model.dto.DogDTO;
import com.ddschool.project.member.model.dto.MemberDTO;

import static com.ddschool.project.common.mybatis.Template.getSqlSession;

public class ClassbookService {
	
	private ClassbookDAO classbookDAO;
	
	public List<DogDTO> getDogNameList() {
		
		SqlSession session = getSqlSession();
		classbookDAO = session.getMapper(ClassbookDAO.class);

		List<DogDTO> dogList = classbookDAO.getDogNameList();

		session.close();

		return dogList;
		
	}
	
	public int getClassName(){
		
		SqlSession session = getSqlSession();
		classbookDAO = session.getMapper(ClassbookDAO.class);
		
		int classNo = (int)classbookDAO.getClassName();
		
		session.close();
		return classNo;
	}
}
