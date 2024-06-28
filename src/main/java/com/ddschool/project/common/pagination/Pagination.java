package com.ddschool.project.common.pagination;

public class Pagination {
	private int currentPage;
	private int totalItems;
	private int itemsPerPage;
	private int totalPages;

	public Pagination(int currentPage, int totalItems, int itemsPerPage) {
		this.currentPage = currentPage;
		this.totalItems = totalItems;
		this.itemsPerPage = itemsPerPage;
		this.totalPages = (int) Math.ceil((double) totalItems / itemsPerPage);
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public int getTotalItems() {
		return totalItems;
	}

	public int getItemsPerPage() {
		return itemsPerPage;
	}

	public int getTotalPages() {
		return totalPages;
	}

	public int getOffset() {
		return (currentPage - 1) * itemsPerPage;
	}

	public boolean isFirstPage() {
		return currentPage == 1;
	}

	public boolean isLastPage() {
		return currentPage == totalPages;
	}
}