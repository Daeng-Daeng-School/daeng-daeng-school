package com.ddschool.project.classbook.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.ddschool.project.classbook.model.dao.ClassbookDAO;
import com.ddschool.project.classbook.model.dto.ClassbookDTO;
import com.ddschool.project.dog.model.dto.DogDTO;
import com.ddschool.project.member.model.dto.MemberDTO;

import static com.ddschool.project.common.mybatis.Template.getSqlSession;

public class ClassbookService {
	
	private ClassbookDAO classbookDAO;
	
	/*
	 * public List<DogDTO> getDogNameList() {
	 * 
	 * SqlSession session = getSqlSession(); classbookDAO =
	 * session.getMapper(ClassbookDAO.class);
	 * 
	 * List<DogDTO> dogList = classbookDAO.getDogNameList();
	 * 
	 * session.close();
	 * 
	 * return dogList;
	 * 
	 * }
	 */
	
	public int getClassName(){
		
		SqlSession session = getSqlSession();
		classbookDAO = session.getMapper(ClassbookDAO.class);
		
		int classNo = (int)classbookDAO.getClassName();
		
		session.close();
		return classNo;
	}
	
	/*
	 * public List<ClassbookDTO> getDogClassbookList(Map<String, Object> params) {
	 * 
	 * SqlSession session = getSqlSession(); classbookDAO =
	 * session.getMapper(ClassbookDAO.class);
	 * 
	 * List<ClassbookDTO> resultList = classbookDAO.getDogClassbookList(params);
	 * System.out.println(resultList); session.close(); return resultList; }
	 */

	public List<Map<String, Object>> getDogClassbookList(int memberCode, String month) {
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("memberCode", memberCode);
		paramMap.put("month", month);
		return classbookDAO.getDogClassbookList(paramMap);
	}
}
