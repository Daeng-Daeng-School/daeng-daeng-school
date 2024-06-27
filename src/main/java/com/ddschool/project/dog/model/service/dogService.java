package com.ddschool.project.dog.model.service;

import com.ddschool.project.dog.model.dao.DogDAO;
import com.ddschool.project.dog.model.dto.DogDTO;
import com.ddschool.project.common.mybatis.Template;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import static com.ddschool.project.common.mybatis.Template.getSqlSession;

public class dogService {

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

	// 회원아이디와 연결된 강아지 정보 조회
	public List<DogDTO> selectDogsByMemberCode(int memberCode) {
		SqlSession session = Template.getSqlSession();
		List<DogDTO> dogs = null;
		try {
			dogs = session.selectList("com.ddschool.project.dog.mapper.DogMapper.selectDogsByMemberCode", memberCode);
		} finally {
			session.close();
		}
		return dogs;
	}
	// 수정하기
	/*
	 * public int updateDog(DogDTO dogDTO) { SqlSession session = getSqlSession();
	 * dogDAO = session.getMapper(DogDAO.class);
	 * 
	 * int result = 0;
	 * 
	 * try { result = dogDAO.updateDog(dogDTO); // DogDAO를 통해 데이터베이스에 수정 if (result
	 * > 0) { session.commit(); // 커밋 } else { session.rollback(); // 롤백 } } finally
	 * { session.close(); // 세션 닫기 }
	 * 
	 * return result; }
	 */
	// 삭제하기
	/*
	 * public int deleteDog(int dogCode, boolean status) { SqlSession session =
	 * getSqlSession(); dogDAO = session.getMapper(DogDAO.class);
	 * 
	 * int result = 0; try { result = dogDAO.deleteDog(dogCode, status); if (result
	 * > 0) { session.commit();// 커밋 } else { session.rollback();// 롤백 } } finally {
	 * session.close();// 세션 닫기 } return result; }
	 */

}
