<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
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
					<div class="search-section">
						<input type="text" id="searchInput" class="searchAllInput"
							placeholder="Search All..."> <a onclick="search()"><span
							class="searchIcon">🔎</span></a> <a
							href="${pageContext.servletContext.contextPath}/notice/insert"
							id="write-post-button">작성하기</a>
					</div>
				</div>
				<jsp:include page="../notice/selectDog.jsp" />
			</div>
			<div class="posts">
				<!-- DB에서 게시글 불러와 반복출력 -->
				<c:forEach var="notice" items="${requestScope.noticeList}">
					<div class="post-card" onclick="showDetail(${notice.noticeNo})">
						<div class="post-thumbnail">
								<img
								src="${pageContext.servletContext.contextPath}/resources/image/dogs.jpg"
								alt="Post Thumbnail 1">
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

	<script>
		function showDetail(noticeNo) {
			const contextPath = '${ pageContext.servletContext.contextPath }';
			location.href = contextPath + "/notice/detail?noticeNo=" + noticeNo;
		}
	</script>

</body>
</html>
