package com.ddschool.project.notice.model.service;

import static com.ddschool.project.common.mybatis.Template.getSqlSession;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.ddschool.project.ddclass.model.dto.ClassDTO;
import com.ddschool.project.dog.model.dto.DogDTO;
import com.ddschool.project.notice.model.dao.NoticeDAO;
import com.ddschool.project.notice.model.dto.NoticeDTO;

/**
 * 알림장 관련 서비스 제공 클래스
 */
public class NoticeService {

	private static NoticeDAO noticeDAO;

	public NoticeService() {
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
		try (SqlSession session = getSqlSession()) {
			noticeDAO = session.getMapper(NoticeDAO.class);

			int result = noticeDAO.insertNotice(newNotice);

			if (result > 0) {
				session.commit();
			} else {
				session.rollback();
			}

			return result;
		}
	}

	/**
	 * 지정된 페이지의 알림장 목록 조회
	 *
	 * @param offset 시작 위치
	 * @param limit  가져올 개수
	 * @return 현재 페이지의 알림장 목록
	 */
	public List<NoticeDTO> selectNotice(Map<String, Object> paramMap) {
		try (SqlSession session = getSqlSession()) {
			noticeDAO = session.getMapper(NoticeDAO.class);

			List<NoticeDTO> noticeList = noticeDAO.selectNotice(paramMap);

			return noticeList;
		}
	}

	/**
	 * 전체 알림장 수 조회
	 *
	 * @return 전체 알림장 수
	 */
	public int getTotalNoticeCount() {
		try (SqlSession session = getSqlSession()) {
			noticeDAO = session.getMapper(NoticeDAO.class);

			int totalCount = noticeDAO.selectTotalCount();

			return totalCount;
		}
	}

	/**
	 * 알림장 상세내용 조회
	 *
	 * @param noticeNo 조회할 알림장 번호
	 * @return NoticeDTO 타입의 알림장 상세내용
	 */
	public NoticeDTO selectNoticeDetail(int noticeNo) {
		try (SqlSession session = getSqlSession()) {
			noticeDAO = session.getMapper(NoticeDAO.class);

			NoticeDTO noticeDetail = noticeDAO.selectNoticeDetail(noticeNo);

			return noticeDetail;
		}
	}

	/**
	 * 알림장 내용 수정
	 *
	 * @param modifyNotice 수정할 알림장 객체
	 * @return 데이터베이스에 수정된 행 수
	 */
	public int updateNotice(NoticeDTO modifyNotice) {
		try (SqlSession session = getSqlSession()) {
			noticeDAO = session.getMapper(NoticeDAO.class);

			int result = noticeDAO.updateNotice(modifyNotice);

			if (result > 0) {
				session.commit();
			} else {
				session.rollback();
			}

			return result;
		}
	}

	/**
	 * 알림장 삭제
	 *
	 * @param noticeNo 삭제할 알림장의 번호
	 * @return 데이터베이스에서 삭제된 행 수
	 */
	public int deleteNotice(int noticeNo) {
		try (SqlSession session = getSqlSession()) {
			noticeDAO = session.getMapper(NoticeDAO.class);

			int result = noticeDAO.deleteNotice(noticeNo);

			if (result > 0) {
				session.commit();
			} else {
				session.rollback();
			}

			return result;
		}
	}

	/**
	 * 키워드를 이용한 알림장 검색
	 *
	 * @param keyword 검색 키워드
	 * @param offset  시작 위치
	 * @param limit   가져올 개수
	 * @return 검색된 알림장 목록
	 */
	public List<NoticeDTO> searchNotices(String keyword, int offset, int limit) {
		try (SqlSession session = getSqlSession()) {
			noticeDAO = session.getMapper(NoticeDAO.class);

			Map<String, Object> params = new HashMap<>();
			params.put("keyword", keyword);
			params.put("offset", offset);
			params.put("limit", limit);

			List<NoticeDTO> searchList = noticeDAO.searchNotices(params);

			return searchList;
		}
	}

	/**
	 * 키워드를 이용한 알림장 검색 결과의 개수 조회
	 *
	 * @param keyword 검색 키워드
	 * @return 검색된 알림장 수
	 */
	public int getSearchNoticeCount(String keyword) {
		try (SqlSession session = getSqlSession()) {
			noticeDAO = session.getMapper(NoticeDAO.class);

			int count = noticeDAO.getSearchNoticeCount(keyword);

			return count;
		}
	}

	/**
	 * 모든 반 클래스 목록 조회
	 *
	 * @return 반 클래스 목록
	 */
	public static List<ClassDTO> selectClassList() {
		try (SqlSession session = getSqlSession()) {
			noticeDAO = session.getMapper(NoticeDAO.class);

			List<ClassDTO> classList = noticeDAO.selectClassList();

			return classList;
		}
	}

	/**
	 * 특정 반 클래스에 속하는 모든 개 리스트 조회
	 *
	 * @param classCode 반 클래스 코드
	 * @return 반 클래스에 속하는 개 리스트
	 */
	public static List<DogDTO> selectDogsByClass(int classCode) {
		try (SqlSession session = getSqlSession()) {
			noticeDAO = session.getMapper(NoticeDAO.class);

			List<DogDTO> dogList = noticeDAO.selectDogsByClass(classCode);

			return dogList;
		}
	}

	/**
	 * 멤버 코드를 이용하여 해당 멤버의 롤 코드 조회
	 *
	 * @param memberCode 멤버 코드
	 * @return 멤버의 롤 코드
	 */
	public int getRoleCodeByMemberCode(int memberCode) {
		try (SqlSession session = getSqlSession()) {
			noticeDAO = session.getMapper(NoticeDAO.class);

			int roleCode = noticeDAO.getRoleCodeByMemberCode(memberCode);

			return roleCode;
		}
	}

	/**
	 * 멤버 코드를 이용하여 해당 멤버가 속한 반 클래스 코드 조회
	 *
	 * @param memberCode 멤버 코드
	 * @return 반 클래스 코드
	 */
	public int getClassCodeByMemberCode(int memberCode) {
		try (SqlSession session = getSqlSession()) {
			noticeDAO = session.getMapper(NoticeDAO.class);

			int classCode = noticeDAO.getClassCodeByMemberCode(memberCode);
			return classCode;
		}
	}

	/**
	 * 특정 반 클래스 내에서 키워드를 이용한 알림장 검색 결과의 개수 조회
	 *
	 * @param classCode 반 클래스 코드
	 * @param keyword   검색 키워드
	 * @return 검색된 알림장 수
	 */
	public int getSearchNoticeCountByClassCode(int classCode, String keyword) {
		try (SqlSession session = getSqlSession()) {
			noticeDAO = session.getMapper(NoticeDAO.class);

			int totalNotices = noticeDAO.getSearchNoticeCountByClassCode(classCode, keyword);

			return totalNotices;
		}
	}

	/**
	 * 특정 반 클래스 내에서 키워드를 이용한 알림장 검색
	 *
	 * @param classCode 반 클래스 코드
	 * @param keyword   검색 키워드
	 * @param offset    시작 위치
	 * @param limit     가져올 개수
	 * @return 검색된 알림장 목록
	 */
	public List<NoticeDTO> searchNoticesByClassCode(int classCode, String keyword, int offset, int limit) {
		try (SqlSession session = getSqlSession()) {
			noticeDAO = session.getMapper(NoticeDAO.class);

			List<NoticeDTO> notice = noticeDAO.searchNoticesByClassCode(classCode, keyword, offset, limit);

			return notice;
		}
	}

	/**
	 * 특정 반 클래스 내의 전체 알림장 수 조회
	 *
	 * @param classCode 반 클래스 코드
	 * @return 전체 알림장 수
	 */
	public int getTotalNoticeCountByClassCode(int classCode) {
		try (SqlSession session = getSqlSession()) {
			noticeDAO = session.getMapper(NoticeDAO.class);

			int totalNotices = noticeDAO.getTotalNoticeCountByClassCode(classCode);

			return totalNotices;
		}
	}

	/**
	 * 특정 멤버 코드 내에서 키워드를 이용한 알림장 검색 결과의 개수 조회
	 *
	 * @param memberCode 멤버 코드
	 * @param keyword    검색 키워드
	 * @return 검색된 알림장 수
	 */
	public int getSearchNoticeCountByMemberCode(int memberCode, String keyword) {
		try (SqlSession session = getSqlSession()) {
			noticeDAO = session.getMapper(NoticeDAO.class);

			int totalNotices = noticeDAO.getSearchNoticeCountByMemberCode(memberCode, keyword);

			return totalNotices;
		}
	}

	/**
	 * 특정 멤버 코드 내에서 키워드를 이용한 알림장 검색
	 *
	 * @param memberCode 멤버 코드
	 * @param keyword    검색 키워드
	 * @param offset     시작 위치
	 * @param limit      가져올 개수
	 * @return 검색된 알림장 목록
	 */
	public List<NoticeDTO> searchNoticesByMemberCode(int memberCode, String keyword, int offset, int limit) {
		try (SqlSession session = getSqlSession()) {
			noticeDAO = session.getMapper(NoticeDAO.class);

			List<NoticeDTO> notice = noticeDAO.searchNoticesByMemberCode(memberCode, keyword, offset, limit);

			return notice;
		}
	}

	/**
	 * 특정 멤버 코드 내의 전체 알림장 수 조회
	 *
	 * @param memberCode 멤버 코드
	 * @return 전체 알림장 수
	 */
	public int getTotalNoticeCountByMemberCode(int memberCode) {
		try (SqlSession session = getSqlSession()) {
			noticeDAO = session.getMapper(NoticeDAO.class);

			int totalNotices = noticeDAO.getTotalNoticeCountByMemberCode(memberCode);

			return totalNotices;
		}
	}

	/**
	 * 특정 멤버 코드 내의 알림장 목록 조회
	 *
	 * @param memberCode 멤버 코드
	 * @param offset     시작 위치
	 * @param limit      가져올 개수
	 * @return 멤버 코드 내의 알림장 목록
	 */

	public List<NoticeDTO> selectNoticeByMemberCode(Map<String, Object> paramMap) {
		try (SqlSession session = getSqlSession()) {
			noticeDAO = session.getMapper(NoticeDAO.class);

			List<NoticeDTO> notice = noticeDAO.selectNoticeByMemberCode(paramMap);

			return notice;
		}
	}

	
	/**
	 * 특정 반 클래스 코드 내의 알림장 목록 조회
	 *
	 * @param classCode 반 클래스 코드
	 * @param offset    시작 위치
	 * @param limit     가져올 개수
	 * @return 반 클래스 코드 내의 알림장 목록
	 */
	public List<NoticeDTO> selectNoticeByClassCode(Map<String, Object> paramMap) {
		try (SqlSession session = getSqlSession()) {
			noticeDAO = session.getMapper(NoticeDAO.class);

			List<NoticeDTO> notice = noticeDAO.selectNoticeByClassCode(paramMap);
			System.out.println("sdasdasd"+notice);

			return notice;
		}
	}

}
