package com.ddschool.project.ddclass.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ddschool.project.ddclass.model.dto.ClassDTO;

public interface ClassDAO {

	List<ClassDTO> getClassList();

	int insertClass(String className);

	int updateClassStatus(@Param("classCode") int classCode,
						  @Param("status") boolean status);

}
