package com.ddschool.project.notice.model.service;

import org.apache.ibatis.session.SqlSession;

import com.ddschool.project.common.paging.PaginationUtil;
import com.ddschool.project.common.paging.SelectCriteria;
import com.ddschool.project.notice.model.dao.NoticeDAO;
import com.ddschool.project.notice.model.dto.NoticeDTO;

import static com.ddschool.project.common.mybatis.Template.getSqlSession;

import java.util.List;

/**
 * 알림장 관련 서비스 제공 클래스
 */
public class NoticeService {

	private NoticeDAO noticeDAO;

	/**
	 * 기본 생성자
	 */
	public NoticeService() {
		// 기본 동작을 위한 초기화 로직
	}

	/**
	 * API 키를 이용한 생성자
	 *
	 * @param apiKey 서비스 초기화를 위한 API 키
	 */
	public NoticeService(String apiKey) {
		// API 키를 이용한 초기화 로직 추가 가능
	}

	/**
	 * 새로운 알림장을 데이터베이스에 추가
	 *
	 * @param newNotice 추가할 알림장 객체
	 * @return 데이터베이스에 추가된 행 수
	 */
	public int insertNotice(NoticeDTO newNotice) {
		SqlSession session = getSqlSession();
		noticeDAO = session.getMapper(NoticeDAO.class);

		int result = noticeDAO.insertNotice(newNotice);

		if (result > 0) {
			session.commit();
		} else {
			session.rollback();
		}
		session.close();

		return result;
	}

	/**
	 * 지정된 페이지의 알림장 목록 조회
	 *
	 * @param currentPage 현재 페이지 번호
	 * @param limit       페이지당 표시할 알림장 수
	 * @return 현재 페이지의 알림장 목록
	 */
	public List<NoticeDTO> selectNotice(int currentPage, int limit) {
		SqlSession session = getSqlSession();
		noticeDAO = session.getMapper(NoticeDAO.class);

		int offset = PaginationUtil.calculateOffset(currentPage, limit);
		SelectCriteria selectCriteria = new SelectCriteria(currentPage, limit);
		selectCriteria.calculateStartRow();

		List<NoticeDTO> noticeList = noticeDAO.selectAllNotice(selectCriteria);

		session.close();

		return noticeList;
	}

	/**
	 * 페이징 처리가 적용된 알림장 목록 조회
	 *
	 * @param selectCriteria 페이징 정보를 담고 있는 객체
	 * @return 페이징 처리된 알림장 목록
	 */
	public List<NoticeDTO> selectAllNotice(SelectCriteria selectCriteria) {
		SqlSession session = getSqlSession();
		noticeDAO = session.getMapper(NoticeDAO.class);

		selectCriteria.setStartRow(selectCriteria.getStartRow() - 1);

		List<NoticeDTO> noticeList = noticeDAO.selectAllNotice(selectCriteria);

		session.close();

		return noticeList;
	}

	/**
	 * 전체 알림장 수 조회
	 *
	 * @return 전체 알림장 수
	 */
	public int getTotalNoticeCount() {
		SqlSession session = getSqlSession();
		noticeDAO = session.getMapper(NoticeDAO.class);

		int totalCount = noticeDAO.selectTotalCount();

		session.close();

		return totalCount;
	}

	/**
	 * 알림장 상세내용 조회
	 *
	 * @return NoticeDTO 타입의 알림장 상세내용
	 */
	public NoticeDTO selectNoticeDetail(int noticeNo) {
		SqlSession session = getSqlSession();
		NoticeDAO noticeDAO = session.getMapper(NoticeDAO.class);
		NoticeDTO noticeDetail = noticeDAO.selectNoticeDetail(noticeNo);
		session.close();
		return noticeDetail;
	}

	/**
	 * 알림장 내용 수정 
	 *
	 * @param modifyNotice 수정할 알림장 객체
	 * @return 데이터베이스에 수정된 행 수
	 */
	public int updateNotice(NoticeDTO modifyNotice) {
		SqlSession session = getSqlSession();
		NoticeDAO noticeDAO = session.getMapper(NoticeDAO.class);
		int result = noticeDAO.updateNotice(modifyNotice);
		if(result > 0) {
			session.commit();
		}else {
			session.rollback();
		}
		session.close();
		return result;
	}

	/**
	 * 알림장 삭제
	 *
	 * @param noticeNo 삭제할 알림장의 번호
	 * @return 데이터베이스에서 삭제된 행 수
	 */
	public int deleteNotice(int noticeNo) {
		SqlSession session = getSqlSession();
		NoticeDAO noticeDAO = session.getMapper(NoticeDAO.class);
		int result = noticeDAO.deleteNotice(noticeNo);
		if(result > 0) {
			session.commit();
		}else {
			session.rollback();
		}
		session.close();
		return result;
	}

}
