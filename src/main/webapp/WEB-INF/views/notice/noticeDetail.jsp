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
<script
	src="${pageContext.servletContext.contextPath}/resources/js/notice.js"></script>
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
						<a
							href="${pageContext.servletContext.contextPath}/notice/delete?noticeNo=${notice.noticeNo}"
							id="write-post-button">삭제하기</a>
						<button onclick="doModify(${notice.noticeNo})"
							id="write-post-button">수정하기</button>
					</div>
				</div>
			</div>
			<div class="outer-notice-detail">
				<div class="header-row">
					<div class="author" name="noticeWriter">
						<c:out value="${notice.noticeWriter}" />
					</div>
					<div class="createdDate" name="createdDate">
						<c:out value="${notice.createdDate}" />
					</div>
				</div>

				<h2 class="title">
					제목 :
					<c:out value="${notice.noticeTitle}" />
				</h2>
				<div class="content-box">
					<c:out value="${notice.noticeBody}" escapeXml="false" />
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

	<!-- contextPath를 동적으로 JavaScript에서 사용할 수 있도록 숨겨진 입력 필드에 저장 -->
	<input type="hidden" id="contextPath"
		value="${pageContext.servletContext.contextPath}" />
</body>
</html>
