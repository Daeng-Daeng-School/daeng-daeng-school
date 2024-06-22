<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 작성</title>
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/resources/css/notice.css">
<!-- CKEditor and CKFinder CDN -->
<script src="https://cdn.ckeditor.com/4.16.2/standard/ckeditor.js"></script>
<script src="https://cdn.cksource.com/ckfinder/3.5.2/ckfinder.js"></script>
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
						<a href="${pageContext.servletContext.contextPath}/notice/insert"
							id="write-post-button">작성하기</a>
					</div>
				</div>
				<jsp:include page="../notice/selectDog.jsp" />
			</div>
			<div class="table-area">
				<form id="postForm"
					action="${pageContext.servletContext.contextPath}/notice/insert"
					method="post">
					<div class="outer-notice-insert">
						<div class="header-row">
							<div class="author" name="writerName">
								김선생
								<c:out value="${sessionScope.loginMember.nickname}" />
							</div>
							<div class="createdDate" name="createdDate">
								2000-00-00
								<c:out value="${createdDate}" />
							</div>
						</div>

						<!-- 카테고리 부분 주석처리 : 추후 공지사항 등 나눌 수 있을 때 활용 
						<div class="category">
							<u>카테고리 : <select name="category">
									<option value="1">공통</option>
									<option value="2">운동</option>
							</select>
							</u>
						</div> -->

						<h2 class="title">
							제목 :<input type="text" name="title" placeholder="제목을 입력하세요.">
						</h2>

						<div class="content-box">
							<textarea name="body" id="editor" cols="60" rows="15"
								placeholder="내용을 입력하세요."></textarea>
						</div>
					</div>
				</form>
			</div>
		</div>
	</main>
	
	<script>
		// CKEditor 초기화
		CKEDITOR.replace('editor');

		function submitForm() {
			document.getElementById('postForm').submit();
		}
	</script>


</body>
</html>
