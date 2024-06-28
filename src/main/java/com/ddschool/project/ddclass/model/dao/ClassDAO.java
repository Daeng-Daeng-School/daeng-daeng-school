package com.ddschool.project.ddclass.model.dao;

import java.util.List;

import com.ddschool.project.ddclass.model.dto.ClassDTO;

public interface ClassDAO {

	List<ClassDTO> getClassList();

	int insertClass(String className);

}
