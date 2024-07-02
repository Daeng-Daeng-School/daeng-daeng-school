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

	// 출석 등록
	public int insertAttendanceRecord(ClassbookDTO classbookDTO) {
		
		SqlSession session = getSqlSession();
		classbookDAO = session.getMapper(ClassbookDAO.class);
		
		int result = classbookDAO.insertAttendanceRecord(classbookDTO);
		
		if(result > 0) {
			session.commit();
		} else {
			session.rollback();
		}
		
		session.close();
		return result;
	}

	// 출석 삭제
	public int deleteAttendanceRecord(ClassbookDTO classbookDTO) {
		
		SqlSession session = getSqlSession();
		classbookDAO = session.getMapper(ClassbookDAO.class);
		
		int result = classbookDAO.deleteAttendanceRecord(classbookDTO);
		
		if(result > 0) {
			session.commit();
		} else {
			session.rollback();
		}
		
		session.close();
		return result;
		
	}

	// 날짜와 강아지코드로 출석 여부 조회 후 모달창 초기값설정
	public String getAttendanceStatus(ClassbookDTO classbookDTO) {
		
		SqlSession session = getSqlSession();
		classbookDAO = session.getMapper(ClassbookDAO.class);
		
		String status = classbookDAO.getAttendanceStatus(classbookDTO);
		
		System.out.println(status);
		
		session.close();
		return status;
	}
	
}