<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>댓글 페이지</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/notice.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/comment.js"></script>
</head>
<body>

<title>댓글 목록</title>

<div class="container">
    <div class="comments-section">
        <h3>
            댓글 <span class="comment-count"><c:out value="${commentCount}" /></span>
        </h3>
        <c:if test="${empty comments}">
            <div class="nonComment-msg">
                <p>댓글이 없습니다.</p>
            </div>
        </c:if>
        
        <div class="comment-form">
            <form action="${pageContext.request.contextPath}/notice/comment" id="commentForm" method="post">
                <input type="hidden" id="noticeNo" name="noticeNo" value="${param.noticeNo}">
                <input type="hidden" name="memberCode" value="1">
                <textarea id="commentContent" name="content" placeholder="댓글을 작성하세요"></textarea>
                <button type="submit" class="btn">등록</button>
            </form>
        </div>
        <hr>

        <c:if test="${not empty comment}">
            <c:forEach var="comment" items="${comment}">
                <div class="comment">
                    <div class="comment-info">
                        <p><c:out value="${comment.memberCode}" /></p>
                        <p><c:out value="${comment.content}" /></p>
                        <div class="actions">
                            <p class="date"><c:out value="${comment.registDate}" /></p>
                            <button class="edit-btn">수정</button>
                            <button class="delete-btn">삭제</button>
                        </div>
                    </div>
                </div>
                <hr>
            </c:forEach>
        </c:if>
        
        <jsp:include page="../common/paging.jsp" />
    </div>
</div>
</body>
</html>
