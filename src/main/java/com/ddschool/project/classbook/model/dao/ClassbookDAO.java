package com.ddschool.project.classbook.model.dao;

import java.util.List;

import com.ddschool.project.dog.model.dto.DogDTO;
import com.ddschool.project.member.model.dto.MemberDTO;

public interface ClassbookDAO {

	List<DogDTO> getDogNameList();

	int getClassName();
	
	

}
