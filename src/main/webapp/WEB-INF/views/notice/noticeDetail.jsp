<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 상세보기</title>
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/resources/css/notice.css">
</head>
<body>
	<jsp:include page="../common/menubar.jsp" />
	<main class="main-content">
		<div class="container">
			<div class="question-box">
				<div class="notice-header">
					<p class="noticeTitle">
						<span style="font-weight: 900;">댕댕스쿨</span>에서는<br> 무엇을 할까요?
					</p>
					<div class="button-section">
						<a href="${pageContext.servletContext.contextPath}/notice/delete"
							id="write-post-button">삭제하기</a> <a
							href="${pageContext.servletContext.contextPath}/notice/modify"
							id="write-post-button">수정하기</a>
					</div>
				</div>
			</div>
			<div class="outer-notice-detail">
				<div class="header-row">
					<div class="author" name="writerName">
						<c:out value="${notice.writer.nickname}" />
					</div>
					<div class="createdDate" name="createdDate">
						<c:out value="${notice.createdDate}" />
					</div>
				</div>

				<h2 class="title">제목 :${notice.title}</h2>
				<div class="content-box">
					<c:out value="${notice.body}" />
				</div>

			</div>
		</div>
		<!-- 댓글 섹션 -->
		<jsp:include page="../notice/comment.jsp" />

		<button class="goList-btn">
			<a href="${pageContext.servletContext.contextPath}/notice">목 록</a>
		</button>
	</main>
	<jsp:include page="../common/footer.jsp" />
</body>
</html>
