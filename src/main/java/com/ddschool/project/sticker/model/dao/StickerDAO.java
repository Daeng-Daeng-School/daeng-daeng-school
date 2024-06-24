package com.ddschool.project.sticker.model.dao;

import java.util.List;

import com.ddschool.project.sticker.model.dto.StickerDTO;

public interface StickerDAO {

	int insertSticker(StickerDTO requestSticker);

	int updateSticker(StickerDTO requestSticker);

	int deleteSticker(StickerDTO requestSticker);

	List<StickerDTO> selectListSticker(StickerDTO requestSticker);

}
