package com.ddschool.project.sticker.model.service;

import org.apache.ibatis.session.SqlSession;

import com.ddschool.project.sticker.model.dao.StickerDAO;
import com.ddschool.project.sticker.model.dto.StickerDTO;

import static com.ddschool.project.common.mybatis.Template.getSqlSession;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class StickerService {
	
	private StickerDAO stickerDAO;
	
	//등록(삽입)
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

	//수정(업데이트)
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

	//삭제
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

	//조회
	public List<StickerDTO> selectListSticker(StickerDTO requestSticker) {
		
		SqlSession session = getSqlSession();
		stickerDAO = session.getMapper(StickerDAO.class);
		
		List<StickerDTO> stickerList = stickerDAO.selectListSticker(requestSticker);
		
		session.close();
		
		return stickerList;
	}
   
	//랭킹조회
	public List<Map<String, String>> selectRankSticker(StickerDTO requestSticker) {
		
		SqlSession session = getSqlSession();
		stickerDAO = session.getMapper(StickerDAO.class);
		
		//여러개의 문자열을 키-쌍으로 저장
		List<Map<String, String>> stickerRank = stickerDAO.selectRankSticker(requestSticker);
		
		session.close();
		
		return stickerRank;
	}
	
	
    //등록옵션(반려견,담당선생님)
	public Map<String, List<StickerDTO>> SelectOptionListSticker(StickerDTO requestSticker) {
		SqlSession session = getSqlSession();
	    stickerDAO = session.getMapper(StickerDAO.class);

	    List<StickerDTO> MemberList = stickerDAO.selectMemberListSticker(requestSticker);
	    List<StickerDTO> dogList = stickerDAO.selectDogListSticker(requestSticker);
             
	    //문자열키와 객체리스트를 매핑
	    Map<String, List<StickerDTO>> result = new HashMap<>();
	    result.put("memberList", MemberList);
	    result.put("dogList", dogList);

	    session.close();
	      
	    return result;

	}

	public StickerDTO updateSearchSticker(int stickerCode) {
		SqlSession session = getSqlSession();
	    stickerDAO = session.getMapper(StickerDAO.class);
	    
	    StickerDTO result = stickerDAO.updateSearchSticker(stickerCode);
	    
	    session.close();
	      
	    return result;
	    
	    
	}
	

}
