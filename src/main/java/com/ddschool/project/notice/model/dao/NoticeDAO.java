package com.ddschool.project.notice.model.dao;

import java.util.List;
import java.util.Map;

import com.ddschool.project.notice.model.dto.NoticeDTO;
import com.ddschool.project.common.paging.SelectCriteria;

public interface NoticeDAO {

    /**
     * 알림장 추가
     * 
     * @param newNotice 추가할 알림장 정보
     * @return 데이터베이스에 추가된 행 수
     */
    int insertNotice(NoticeDTO newNotice);

    /**
     * 총 알림장 수 조회
     * 
     * @param searchMap 검색 조건을 포함하는 맵
     * @return 총 알림장 수
     */
    int selectTotalCount(Map<String, String> searchMap);

    /**
     * 페이지네이션을 적용하여 전체 알림장 목록 조회
     * 
     * @param selectCriteria 페이지 조건 정보
     * @return 페이지네이션된 알림장 목록
     */
    List<NoticeDTO> selectAllNotice(SelectCriteria selectCriteria);

    /**
     * 특정 페이지의 알림장 목록 조회
     * 
     * @param params 페이지 처리를 위한 파라미터 (offset, limit)
     * @return 특정 페이지의 알림장 목록
     */
    List<NoticeDTO> selectNotice(Map<String, Object> params);

    /**
     * 페이지네이션 없이 전체 알림장 수 조회
     * 
     * @return 전체 알림장 수
     */
    int selectTotalCount();

    /**
     * 알림장 상세내용 조회 
     * 
     * @param 해당 알림장 넘버
     * @return 알림장 상세 내용 
     */
	NoticeDTO selectNoticeDetail(int noticeNo);

	int updateNotice(NoticeDTO modifyNotice);
}
