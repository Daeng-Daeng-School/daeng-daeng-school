package com.ddschool.project.sticker.model.dao;

import com.ddschool.project.sticker.model.dto.StickerDTO;

public interface StickerDAO {

	int insertSticker(StickerDTO requestSticker);

	int updateSticker(StickerDTO requestSticker);

}
