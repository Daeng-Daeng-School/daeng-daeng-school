package com.ddschool.project.dog.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ddschool.project.dog.model.dto.DogDTO;
import com.ddschool.project.dog.model.dto.ImageDTO;

public interface dogDAO {

	/* 강아지 정보 등록 :insertDog */
	int insertDog(DogDTO dog);

	/* 강아지 프로필 이미지 등록:insertDog */
//	int insertDogImage(ImageDTO image);

	/* 강아지 정보 조회 : registDog */
	DogDTO selectDog(@Param("dogCode") int dogCode);

	List<DogDTO> selectAllDogs();

	/* 강아지 정보 수정 */
	int updateDog(DogDTO dog);

	/* 강아지 이미지 정보 수정 */
//	int updateDogImage(ImageDTO image);

	/* 강아지 정보 삭제 */
	int deleteDog(@Param("dogCode") int dogCode);

	/* 강아지 이미지 정보 삭제 */
//	int deleteDogImage(@Param("dogCode") int dogCode);
}
