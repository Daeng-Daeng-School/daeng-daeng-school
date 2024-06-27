<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- Pagination Section -->
<div id="pagination">
    <c:if test="${pagination.totalPages > 1}">
        <!-- First Page Button -->
        <button onclick="goToPage(1)" <c:if test="${pagination.isFirstPage()}">disabled</c:if>><<</button>

        <!-- Previous Page Button -->
        <button onclick="goToPage(${pagination.currentPage - 1})" <c:if test="${pagination.isFirstPage()}">disabled</c:if>><</button>

        <!-- Page Buttons -->
        <c:forEach var="i" begin="1" end="${pagination.totalPages}">
            <button onclick="goToPage(${i})" <c:if test="${pagination.currentPage == i}">class="active"</c:if>>${i}</button>
        </c:forEach>

        <!-- Next Page Button -->
        <button onclick="goToPage(${pagination.currentPage + 1})" <c:if test="${pagination.isLastPage()}">disabled</c:if>>></button>

        <!-- Last Page Button -->
        <button onclick="goToPage(${pagination.totalPages})" <c:if test="${pagination.isLastPage()}">disabled</c:if>>>></button>
    </c:if>
</div>

<!-- JavaScript for Pagination -->
<script>
    function goToPage(page) {
        var urlParams = new URLSearchParams(window.location.search);
        urlParams.set('page', page);
        window.location.search = urlParams.toString();
    }
</script>
