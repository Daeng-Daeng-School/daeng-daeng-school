package com.ddschool.project.notice.model.dao;

import java.util.List;
import java.util.Map;

import com.ddschool.project.notice.model.dto.NoticeDTO;

/**
 * 알림장 관련 데이터 접근 인터페이스
 */
public interface NoticeDAO {

    /**
     * 알림장 추가
     * 
     * @param newNotice 추가할 알림장 정보
     * @return 데이터베이스에 추가된 행 수
     */
    int insertNotice(NoticeDTO newNotice);

    /**
     * 검색 조건에 따른 전체 알림장 수 조회
     * 
     * @param searchMap 검색 조건을 담고 있는 맵
     * @return 전체 알림장 수
     */
    int selectTotalCount(Map<String, String> searchMap);

    /**
     * 특정 페이지의 알림장 목록 조회
     * 
     * @param offset 조회 시작 위치
     * @param limit 페이지당 조회할 알림장 수
     * @return 특정 페이지의 알림장 목록
     */
    List<NoticeDTO> selectNotice(Map<String, Integer> params);
    

    /**
     * 페이징 없이 전체 알림장 수 조회
     * 
     * @return 전체 알림장 수
     */
    int selectTotalCount();

    /**
     * 알림장 상세 정보 조회
     * 
     * @param noticeNo 조회할 알림장 번호
     * @return 알림장 상세 정보
     */
    NoticeDTO selectNoticeDetail(int noticeNo);

    /**
     * 알림장 정보 수정
     * 
     * @param modifyNotice 수정할 알림장 정보
     * @return 데이터베이스에 수정된 행 수
     */
    int updateNotice(NoticeDTO modifyNotice);

    /**
     * 알림장 삭제
     * 
     * @param noticeNo 삭제할 알림장 번호
     * @return 데이터베이스에서 삭제된 행 수
     */
    int deleteNotice(int noticeNo);

    /**
     * 키워드를 이용한 알림장 검색
     * 
     * @param keyword 검색 키워드
     * @return 검색된 알림장 목록
     */
    List<NoticeDTO> searchNotices(String keyword);

}
