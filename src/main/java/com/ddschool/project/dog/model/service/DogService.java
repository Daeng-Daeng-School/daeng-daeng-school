package com.ddschool.project.dog.model.service;

import com.ddschool.project.dog.model.dao.DogDAO;
import com.ddschool.project.dog.model.dto.DogDTO;
import com.ddschool.project.common.mybatis.Template;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import static com.ddschool.project.common.mybatis.Template.getSqlSession;

public class DogService {

	private DogDAO dogDAO;

	// 등록하기
	public int insertDog(DogDTO dogDTO) {
		SqlSession session = getSqlSession();
		dogDAO = session.getMapper(DogDAO.class);

		int result = 0;

		try {
			result = dogDAO.insertDog(dogDTO); // DogDAO를 통해 데이터베이스에 등록
			if (result > 0) {
				session.commit(); // 커밋
			} else {
				session.rollback(); // 롤백
			}
		} finally {
			session.close(); // 세션 닫기
		}

		return result;
	}

	// 회원아이디와 연결된 강아지 정보 조회 - classBook 에서 쓰는 메서드
	public List<DogDTO> selectDogsByMemberCode(int memberCode) {

		SqlSession session = getSqlSession();
		dogDAO = session.getMapper(DogDAO.class);

		List<DogDTO> dogs = dogDAO.selectDogsByMemberCode(memberCode);
		
		session.close();
		return dogs;
	}
	
	// 클래스코드와 연결된 강아지 정보 조회
	public List<DogDTO> selectDogsByClassCode(int classCode) {
			
		SqlSession session = getSqlSession();
		dogDAO = session.getMapper(DogDAO.class);
		
		List<DogDTO> dogs = dogDAO.selectDogsByClassCode(classCode);
		
		session.close();
		return dogs;
	}
		
	// 모든 강아지 정보 조회
	public List<DogDTO> selectDogsAllList() {
	
		SqlSession session = getSqlSession();
		dogDAO = session.getMapper(DogDAO.class);
		
		List<DogDTO> dogs = dogDAO.selectDogsAllList();
		
		session.close();
		return dogs;
	}

	// 강아지 코드로 조회
	public DogDTO selectDogByDogCode(int dogCode) {

		SqlSession session = getSqlSession();
		dogDAO = session.getMapper(DogDAO.class);

		DogDTO dog = dogDAO.selectDogByDogCode(dogCode);

		session.close();
		return dog;
	}

	// 수정하기
	public int updateDog(DogDTO dogDTO) {
		SqlSession session = getSqlSession();
		dogDAO = session.getMapper(DogDAO.class);

		int result = 0;

		try {
			result = dogDAO.updateDog(dogDTO); // DogDAO를 통해 데이터베이스에 수정
			if (result > 0) {
				session.commit();
			} else {
				session.rollback();
			}
		} finally {
			session.close();
		}

		System.out.println("service result: " + result);

		return result;
	}


	// 삭제하기
	public int deleteDog(int dogCode) {
		SqlSession session = getSqlSession();
		DogDAO dogDAO = session.getMapper(DogDAO.class);

		int result = 0;

		try {
			result = dogDAO.deleteDog(dogCode); // DogDAO를 통해 데이터베이스에 삭제 상태 업데이트
			if (result > 0) {
				session.commit();
			} else {
				session.rollback();
			}
		} finally {
			session.close();
		}

		return result;
	}

	// dogId 로 memberId 찾기
	public int getMemberIdByDogCode(int dogCode) {
		
		SqlSession session = getSqlSession();
		dogDAO = session.getMapper(DogDAO.class);
		
		int memberId = dogDAO.getMemberIdByDogCode(dogCode);
		
		session.close();
		return memberId;
	}
}

