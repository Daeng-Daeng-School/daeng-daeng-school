<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="pagination">
    <c:if test="${pagination.totalPages > 1}">
        <button onclick="goToPage(1)" <c:if test="${pagination.isFirstPage()}">disabled</c:if>><<</button>
        <button onclick="goToPage(${pagination.currentPage - 1})" <c:if test="${pagination.isFirstPage()}">disabled</c:if>><</button>

        <c:forEach var="i" begin="1" end="${pagination.totalPages}">
            <button onclick="goToPage(${i})" <c:if test="${pagination.currentPage == i}">class="active"</c:if>>${i}</button>
        </c:forEach>

        <button onclick="goToPage(${pagination.currentPage + 1})" <c:if test="${pagination.isLastPage()}">disabled</c:if>>></button>
        <button onclick="goToPage(${pagination.totalPages})" <c:if test="${pagination.isLastPage()}">disabled</c:if>>></button>
    </c:if>
</div>

<script>
    function goToPage(page) {
        var urlParams = new URLSearchParams(window.location.search);
        urlParams.set('page', page);
        window.location.search = urlParams.toString();
    }
</script>