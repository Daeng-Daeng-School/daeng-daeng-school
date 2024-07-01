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
	 * SqlSession session = getSqlSession(); 
	 * classbookDAO = session.getMapper(ClassbookDAO.class);
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
	
	public List<Map<String, Object>> getDogClassbookList(String month) {

		SqlSession session = getSqlSession();
		classbookDAO = session.getMapper(ClassbookDAO.class);
		
		List<Map<String, Object>> dogClassbookList = classbookDAO.getDogClassbookList(month);
		System.out.println("여긴 서비스"+dogClassbookList);
		
		session.close();
		return dogClassbookList;
	}

	// dogCode 로 출석 조회
	public List<ClassbookDTO> getAttendanceByDogCode(int dogCode, String yearMonth) {
		
		SqlSession session = getSqlSession();
		classbookDAO = session.getMapper(ClassbookDAO.class);
		
		List<ClassbookDTO> attendanceList = classbookDAO.getAttendanceByDogCode(dogCode, yearMonth);
		
		session.close();
		return attendanceList;
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

	/*
	 * public List<Map<String, Object>> getDogClassbookList(int memberCode, String
	 * month) { Map<String, Object> paramMap = new HashMap<>();
	 * paramMap.put("memberCode", memberCode); paramMap.put("month", month); return
	 * classbookDAO.getDogClassbookList(paramMap); }
	 */
}
