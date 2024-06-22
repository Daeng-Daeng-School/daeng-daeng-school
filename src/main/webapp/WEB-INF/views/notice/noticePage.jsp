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
				<div class="post-card">
					<div class="post-thumbnail">
						<a
							href="${pageContext.servletContext.contextPath}/notice/detail?no=#">
							<img
							src="${pageContext.request.contextPath}/resources/image/dogs.jpg"
							alt="Post Thumbnail 1">
						</a>
					</div>
					<div class="post-content">
						<h2>
							<a
								href="${pageContext.servletContext.contextPath}/notice/detail?no=#">
								<c:out value="샘플" />
							</a>
						</h2>
						<span style="text-align: right">
							<p>
								<c:out value="김선생" />
							</p>
							<p>
								<c:out value="2000-00-00" />
							</p>
						</span>
					</div>
				</div>
				
				<!-- DB에서 게시글 불러와 반복출력 -->
				<c:forEach var="notice" items="${requestScope.noticeList}">
					<div class="post-card">
						<div class="post-thumbnail">
							<a
								href="${pageContext.servletContext.contextPath}/notice/detail?no=${notice.no}"><img
								src="../resources/image/dogs.jpg" alt="Post Thumbnail 1"></a>
						</div>
						<div class="post-content">
							<h2>
								<a
									href="${pageContext.servletContext.contextPath}/notice/detail?no=${notice.no}">
									<c:out value="${notice.title}" />
								</a>
							</h2>
							<span style="text-align: right">
								<p>
									<c:out value="${notice.writer.nickname}" />
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

	<!-- 확인용 - 추후 삭제요망  -->
	<jsp:include page="../notice/noticeDetail.jsp" />

	<jsp:include page="../notice/noticeModify.jsp" />


</body>
</html>
