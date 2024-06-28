package com.ddschool.project.notice.model.service;

import static com.ddschool.project.common.mybatis.Template.getSqlSession;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.ddschool.project.ddclass.model.dto.ClassDTO;
import com.ddschool.project.dog.model.dto.DogDTO;
import com.ddschool.project.member.model.dto.MemberDTO;
import com.ddschool.project.notice.model.dao.NoticeDAO;
import com.ddschool.project.notice.model.dto.NoticeDTO;

/**
 * 알림장 관련 서비스 제공 클래스
 */
public class NoticeService {

	private static NoticeDAO noticeDAO;

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

		// 성공적으로 처리되면 커밋, 그렇지 않으면 롤백
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
	 * @param currentPage  현재 페이지 번호
	 * @param itemsPerPage 페이지당 표시할 알림장 수
	 * @return 현재 페이지의 알림장 목록
	 */
	public List<NoticeDTO> selectNotice(int offset, int limit) {
		SqlSession session = getSqlSession();
		noticeDAO = session.getMapper(NoticeDAO.class);

		Map<String, Integer> params = new HashMap<>();
		params.put("offset", offset);
		params.put("limit", limit);

		List<NoticeDTO> noticeList = noticeDAO.selectNotice(params);

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

		// NoticeDAO를 통해 전체 알림장 수 조회
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

		// 성공적으로 처리되면 커밋, 그렇지 않으면 롤백
		if (result > 0) {
			session.commit();
		} else {
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

		// 성공적으로 처리되면 커밋, 그렇지 않으면 롤백
		if (result > 0) {
			session.commit();
		} else {
			session.rollback();
		}
		session.close();
		return result;
	}

	/**
	 * 키워드를 이용한 알림장 검색
	 *
	 * @param keyword 검색 키워드
	 * @return 검색된 알림장 목록
	 */
	public List<NoticeDTO> searchNotices(String keyword, int offset, int limit) {
		SqlSession session = getSqlSession();
		noticeDAO = session.getMapper(NoticeDAO.class);

		Map<String, Object> params = new HashMap<>();
		params.put("keyword", keyword);
		params.put("offset", offset);
		params.put("limit", limit);

		List<NoticeDTO> searchList = noticeDAO.searchNotices(params);

		session.close();

		return searchList;
	}

	public int getSearchNoticeCount(String keyword) {
		SqlSession session = getSqlSession();
		noticeDAO = session.getMapper(NoticeDAO.class);

		int count = noticeDAO.getSearchNoticeCount(keyword);

		session.close();

		return count;
	}

	public static List<ClassDTO> selectClassList() {
		SqlSession session = getSqlSession();
		noticeDAO = session.getMapper(NoticeDAO.class);

		List<ClassDTO> classList = noticeDAO.selectClassList();
		session.close();
		return classList;
	}

	public static List<DogDTO> selectDogsByClass(int classCode) {
		SqlSession session = getSqlSession();
		noticeDAO = session.getMapper(NoticeDAO.class);

		List<DogDTO> dogList = noticeDAO.selectDogsByClass(classCode);
		session.close();
		return dogList;
	}

 

}
