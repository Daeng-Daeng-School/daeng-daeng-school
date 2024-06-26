<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>알림장 서비스</title>
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/resources/css/notice.css">
<script
	src="${pageContext.servletContext.contextPath}/resources/js/notice.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	var contextPath = "${pageContext.request.contextPath}"; // Store the context path in a JavaScript variable
</script>
<!-- Load TinyMCE script -->
<script
	src="https://cdn.tiny.cloud/1/no-api-key/tinymce/5/tinymce.min.js"
	referrerpolicy="origin"></script>
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
					<div class="search-section">
						<input type="text" id="searchInput" class="searchAllInput"
							placeholder="Search All..." onkeypress="handleKeyPress(event)">
						<button class="searchIcon" onclick="search()">🔎</button>
						<button class="write-post-button" onclick="writeNotice()">작성하기</button>
					</div>
				</div>
				<jsp:include page="../notice/selectDog.jsp" />
			</div>
			<div class="posts">
				<!-- DB에서 게시글 불러와 반복출력 -->
				<c:forEach var="notice" items="${requestScope.noticeList}">
					<div class="post-card" onclick="showDetail(${notice.noticeNo})">
						<div class="post-thumbnail">
							<c:set var="imageUrl"
								value="${notice.getFirstImageFromNoticeBody()}" />
							<c:choose>
								<c:when test="${not empty imageUrl}">
									<img src="${imageUrl}" alt="Post Thumbnail">
								</c:when>
								<c:otherwise>
									<img
										src="${pageContext.servletContext.contextPath}/resources/image/dogs.jpg"
										alt="Default Image">
								</c:otherwise>
							</c:choose>
						</div>
						<div class="post-content">
							<h2>
								<c:out value="${notice.noticeTitle}" />
							</h2>
							<span style="text-align: right">
								<p>
									<c:out value="${notice.noticeWriter}" />
								</p>
								<p>
									<c:out value="${notice.createdDate}" />
								</p>
							</span>
						</div>
					</div>
				</c:forEach>
			</div>
			<br>
		</div>
	</main>
	<jsp:include page="../common/paging.jsp" />
	<jsp:include page="../common/footer.jsp" />

	<!-- contextPath를 가져오는 숨겨진 입력 필드 추가 -->
	<input type="hidden" id="contextPath"
		value="${pageContext.servletContext.contextPath}" />

</body>
</html>
