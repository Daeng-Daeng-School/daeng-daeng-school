package com.ddschool.project.common.paging;

/**
 * 페이지네이션을 위한 조회 기준 정보 클래스
 */
public class SelectCriteria {

    private int currentPage;    // 현재 페이지 번호
    private int limit;          // 페이지당 표시할 데이터 개수
    private int startRow;       // 조회 시작 행

    /**
     * 기본 생성자
     */
    public SelectCriteria() {
        this.currentPage = 1; // 기본적으로 1페이지로 초기화
        this.limit = 6;      // 기본적으로 6개의 데이터 표시
    }

    /**
     * 생성자
     *
     * @param currentPage 현재 페이지 번호
     * @param limit       페이지당 표시할 데이터 개수
     */
    public SelectCriteria(int currentPage, int limit) {
        this.currentPage = currentPage;
        this.limit = limit;
    }

    public int getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }

    public int getLimit() {
        return limit;
    }

    public void setLimit(int limit) {
        this.limit = limit;
    }

    public int getStartRow() {
        return startRow;
    }

    public void setStartRow(int startRow) {
        this.startRow = startRow;
    }

    /**
     * 조회 시작 행 계산
     */
    public void calculateStartRow() {
        this.startRow = (currentPage - 1) * limit;
    }

    /**
     * 페이징 처리 계산
     *
     * @param totalCount 전체 데이터 수
     */
    public void calculate(int totalCount) {
        int totalPages = (int) Math.ceil((double) totalCount / limit);
        int displayPage = 10; // 한 번에 표시할 페이지 수
        int beginPage = Math.max(1, currentPage - (displayPage / 2));
        int endPage = Math.min(beginPage + displayPage - 1, totalPages);

        this.setStartRow((currentPage - 1) * limit);
    }

    @Override
    public String toString() {
        return "SelectCriteria{" +
                "currentPage=" + currentPage +
                ", limit=" + limit +
                ", startRow=" + startRow +
                '}';
    }
}
