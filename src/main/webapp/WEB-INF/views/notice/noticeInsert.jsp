<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 수정</title>
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
						<a
							href="${pageContext.servletContext.contextPath}/notice/insert"
							id="write-post-button">글 작성하기</a>
					</div>
				</div>
			</div>
			<div class="table-area">
				<form id="postForm"
					action="${pageContext.servletContext.contextPath}/notice/insert"
					method="post">
					<div class="outer-notice-insert">
						<div class="author">
							<u>작성자 : <c:out value="${sessionScope.loginMember.nickname}" /></u>
						</div>
						<div class="category">
							<u>카테고리 : <select name="category">
									<option value="1">공통</option>
									<option value="2">운동</option>
							</select>
							</u>
						</div>
						<h2 class="title">
							제목 :<input type="text" name="title" placeholder="제목을 입력하세요.">
						</h2>
						<div class="content-box">
							<textarea name="body" cols="60" rows="15"
								placeholder="내용을 입력하세요."></textarea>
						</div>
					</div>
				</form>
			</div>
		</div>
	</main>

	<script>
		function submitForm() {
			document.getElementById('postForm').submit();
		}
	</script>

</body>
</html>
