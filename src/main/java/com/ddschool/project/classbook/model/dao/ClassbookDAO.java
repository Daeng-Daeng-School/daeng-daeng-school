package com.ddschool.project.classbook.model.dao;

import java.util.List;
import java.util.Map;

import com.ddschool.project.classbook.model.dto.ClassbookDTO;
import com.ddschool.project.dog.model.dto.DogDTO;
import com.ddschool.project.member.model.dto.MemberDTO;

public interface ClassbookDAO {

	/* List<DogDTO> getDogNameList(); */

	int getClassName();
	
	List<Map<String, Object>> getDogClassbookList(Map<String, Object> paramMap);

}
