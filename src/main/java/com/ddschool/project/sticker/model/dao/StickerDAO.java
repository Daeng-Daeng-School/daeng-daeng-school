package com.ddschool.project.sticker.model.dao;

import java.util.List;
import java.util.Map;

import com.ddschool.project.sticker.model.dto.StickerDTO;

public interface StickerDAO {

	int insertSticker(StickerDTO requestSticker);

	int updateSticker(StickerDTO requestSticker);

	int deleteSticker(StickerDTO requestSticker);

	List<StickerDTO> selectListSticker(StickerDTO requestSticker);

	List<Map<String, String>> selectRankSticker(StickerDTO requestSticker);
	
	List<StickerDTO> selectDogListSticker(StickerDTO requestSticker);

	List<StickerDTO> selectMemberListSticker(StickerDTO requestSticker);

	StickerDTO updateSearchSticker(int stickerCode);

	

}
