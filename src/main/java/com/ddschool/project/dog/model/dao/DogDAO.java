package com.ddschool.project.dog.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ddschool.project.dog.model.dto.DogDTO;

public interface DogDAO {

	/* 강아지 정보 등록 :insertDog */
	int insertDog(DogDTO dog);

	/* 강아지 정보 조회 : registDog */
    // 회원에 등록된 강아지 조회
    List<DogDTO> selectDogsByMemberCode(int memberCode);

	/* 강아지 정보 수정 */
	int updateDog(DogDTO dog);

	/* 강아지 정보 삭제 */
	int deleteDog(@Param("dogCode") int dogCode);

}
