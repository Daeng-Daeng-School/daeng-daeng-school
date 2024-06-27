package com.ddschool.project.dog.model.service;

import com.ddschool.project.dog.model.dao.DogDAO;
import com.ddschool.project.dog.model.dto.DogDTO;
import com.ddschool.project.common.mybatis.Template;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import static com.ddschool.project.common.mybatis.Template.getSqlSession;

public class dogService {

	private DogDAO dogDAO;

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

}