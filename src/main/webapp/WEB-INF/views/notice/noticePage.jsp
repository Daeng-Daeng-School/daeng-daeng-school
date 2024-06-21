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
						<input type="text" id="searchInput"
							class="search-input searchAllInput" placeholder="Search All...">
						<a onclick="search()"><span class="searchIcon">🔎</span></a> <a
							href="${pageContext.servletContext.contextPath}/notice/insert"
							id="write-post-button">작성하기</a>
					</div>
				</div>
				<!-- 검색 섹션 시작 -->
				<div class="search-input-container">
					<!-- 반 선택 / 추후 DB 연결하여 활용 -->
					<select id="searchClass" class="search-select">
						<option value="" disabled selected>반 선택</option>
						<option value="class1">오전반</option>
						<option value="class2">오후반</option>
						<option value="class3">종일반</option>
					</select>
					<!-- 해당반 반려견 리스트 선택 / 추후 DB 연결하여 활용 -->
					<select id="searchDog"
						class="search-select">
						<option value="" disabled selected>반려견 선택</option>
						<option value="">쿠키</option>
						<option value="dog1">쿠키</option>
						<option value="dog2">루키</option>
					</select>
					<a onclick="search()"
						class="search-button">조회</a>
				</div>
				<!-- 검색 섹션 끝 -->
			</div>
			<div class="posts">
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
									<c:out value="${notice.createdDate}" />
								</p>
								<p>
									<c:out value="${notice.writer.nickname}" />
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

	<script>
		function search() {
			var searchClass = document.getElementById('searchClass').value;
			var searchDog = document.getElementById('searchDog').value;
			var searchValue = document.getElementById('searchInput').value
					.trim();
		}
	</script>
</body>
</html>
