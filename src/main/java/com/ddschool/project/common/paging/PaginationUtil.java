package com.ddschool.project.common.paging;

import java.util.List;

public class PaginationUtil {

    /**
     * 전체 데이터 수와 현재 페이지를 기반으로 최대 페이지 수를 계산
     * 
     * @param totalCount 전체 데이터 수
     * @param limit      페이지당 표시할 데이터 수
     * @return 최대 페이지 수
     */
    public static int calculateMaxPage(int totalCount, int limit) {
        if (totalCount % limit == 0) {
            return totalCount / limit;
        } else {
            return totalCount / limit + 1;
        }
    }

    /**
     * 현재 페이지와 한 페이지당 표시할 데이터 수를 기반으로 offset을 계산
     *
     * @param currentPage 현재 페이지 번호
     * @param limit 페이지당 표시할 데이터 수
     * @return 계산된 offset
     */
    public static int calculateOffset(int currentPage, int limit) {
        return (currentPage - 1) * limit;
    }

    /**
     * 페이지네이션을 위해 페이지 버튼의 시작 페이지와 끝 페이지를 계산
     * 
     * @param currentPage 현재 페이지
     * @param pageCount   전체 페이지 수
     * @param buttonCount 페이지 버튼 수
     * @return 시작 페이지와 끝 페이지를 포함하는 리스트
     */
    public static List<Integer> calculateStartEndPage(int currentPage, int pageCount, int buttonCount) {
        int halfPagesToShow = buttonCount / 2;
        int startPage = Math.max(1, currentPage - halfPagesToShow);
        int endPage = Math.min(startPage + buttonCount - 1, pageCount);

        // 리스트 끝에 접근할 때 시작 페이지 조정
        if (endPage - startPage + 1 < buttonCount) {
            startPage = Math.max(1, endPage - buttonCount + 1);
        }

        return List.of(startPage, endPage);
    }
}
