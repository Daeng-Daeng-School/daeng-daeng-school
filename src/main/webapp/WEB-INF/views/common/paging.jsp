<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
</head>
<body>
	<div class="pagingArea" align="center">
        <!-- 첫 페이지 버튼 -->
        <button id="startPage"><<</button>

        <!-- 이전 페이지 버튼 -->
        <c:if test="${ paginationInfo.currentPage <= 1 }">
            <button disabled><</button>
        </c:if>
        <c:if test="${ paginationInfo.currentPage > 1 }">
            <button id="prevPage"><</button>
        </c:if>

        <!-- 페이지 번호 버튼 -->
        <c:forEach var="p" begin="${ paginationInfo.startPage }" end="${ paginationInfo.endPage }" step="1">
            <c:if test="${ paginationInfo.currentPage == p }">
                <button class="selected" disabled><c:out value="${ p }"/></button>
            </c:if>
            <c:if test="${ paginationInfo.currentPage != p }">
                <button onclick="pageButtonAction(this.innerText);"><c:out value="${ p }"/></button>
            </c:if>
        </c:forEach>

        <!-- 다음 페이지 버튼 -->
        <c:if test="${ paginationInfo.currentPage >= paginationInfo.maxPage }">
            <button disabled>></button>
        </c:if>
        <c:if test="${ paginationInfo.currentPage < paginationInfo.maxPage }">
            <button id="nextPage">></button>
        </c:if>

        <!-- 마지막 페이지 버튼 -->
        <button id="maxPage">>></button>
    </div>

</body>
</html>