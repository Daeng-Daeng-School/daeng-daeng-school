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
     * @return DB에 추가된 행 수
     */
    int insertNotice(NoticeDTO newNotice);

    /**
     * 전체 알림장 수 조회
     * 
     * @param searchMap 검색 조건을 담은 맵
     * @return 전체 알림장 수
     */
    int selectTotalCount(Map<String, String> searchMap);

    /**
     * 페이징 처리를 적용하여 전체 알림장 목록 조회
     * 
     * @param selectCriteria 페이지 조건 정보
     * @return 페이징 처리된 알림장 목록
     */
    List<NoticeDTO> selectAllNotice(SelectCriteria selectCriteria);

    /**
     * 특정 페이지의 알림장 목록 조회
     * 
     * @param params 페이지 처리용 매개변수 (offset, limit)
     * @return 특정 페이지의 알림장 목록
     */
    List<NoticeDTO> selectNotice(Map<String, Object> params);

    /**
     * 페이징 없이 전체 알림장 수 조회
     * 
     * @return 전체 알림장 수
     */
    int selectTotalCount();

    /**
     * 알림장 상세내용 조회
     * 
     * @param noticeNo 조회할 알림장 번호
     * @return 알림장 상세내용
     */
    NoticeDTO selectNoticeDetail(int noticeNo);

    /**
     * 알림장 수정
     * 
     * @param modifyNotice 수정할 알림장 정보
     * @return DB에서 수정된 행 수
     */
    int updateNotice(NoticeDTO modifyNotice);

    /**
     * 알림장 삭제
     * 
     * @param noticeNo 삭제할 알림장 번호
     * @return DB에서 삭제된 행 수
     */
    int deleteNotice(int noticeNo);
}
