package com.ddschool.project.sticker.model.service;

import org.apache.ibatis.session.SqlSession;

import com.ddschool.project.sticker.model.dao.StickerDAO;
import com.ddschool.project.sticker.model.dto.StickerDTO;

import static com.ddschool.project.common.mybatis.Template.getSqlSession;

import java.util.List;

public class StickerService {
	
	private StickerDAO stickerDAO;
	
	public int insertSticker(StickerDTO requestSticker) {
		
		SqlSession session = getSqlSession();
		stickerDAO = session.getMapper(StickerDAO.class);
		
		int result = stickerDAO.insertSticker(requestSticker);
		
		if(result>0) {
			session.commit();
		}else {
			session.rollback();
		}
		
		session.close();
		
		return result;

	}

	public int updateSticker(StickerDTO requestSticker) {
		
		SqlSession session = getSqlSession();
		stickerDAO = session.getMapper(StickerDAO.class);
		
		int result = stickerDAO.updateSticker(requestSticker);
		
		if(result>0) {
			session.commit();
		}else {
			session.rollback();
		}
		
		session.close();
		
		return result;
	}

	public int deleteSticker(StickerDTO requestSticker) {
		SqlSession session = getSqlSession();
		stickerDAO = session.getMapper(StickerDAO.class);
		
		int result = stickerDAO.deleteSticker(requestSticker);
		
		if(result>0) {
			session.commit();
		}else {
			session.rollback();
		}
		
		session.close();
		
		return result;
		
	}

	public List<StickerDTO> SelectListSticker(StickerDTO requestSticker) {
		
		SqlSession session = getSqlSession();
		stickerDAO = session.getMapper(StickerDAO.class);
		
		List<StickerDTO> stickerList = stickerDAO.selectListSticker(requestSticker);
		
		session.close();
		
		return stickerList;
	}
	

}
