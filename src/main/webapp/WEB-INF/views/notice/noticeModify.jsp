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
					<div class="button-section">
						<a href="${pageContext.servletContext.contextPath}/notice/modify"
							id="write-post-button">수정하기</a>
					</div>
				</div>
				<jsp:include page="../notice/selectDog.jsp" />
			</div>
			<div class="table-area">
				<form id="postForm"
					action="${pageContext.servletContext.contextPath}/notice/modify"
					method="post">
					<div class="outer-notice-modify">
						<div class="author" name="writerName">
							<c:out value="${ noticeDetail.noticeWriter }" />
						</div>
						<div class="createdDate" name="createdDate">
							<c:out value="${noticeDetail.createdDate}" />
						</div>
					</div>

					<h2 class="title">
						제목 :<input type="text" name="title"
							value="${ noticeDetail.noticeTitle }">
					</h2>

					<div class="content-box">
						<textarea name="body" id="editor" cols="60" rows="15">${ boardDetail.boardBody }</textarea>
					</div>
				</form>
			</div>
		</div>
	</main>
	<jsp:include page="../common/footer.jsp" />
	<script>
		// CKEditor 초기화
		CKEDITOR.replace('editor');

		function submitForm() {
			document.getElementById('postForm').submit();
		}
	</script>


</body>
</html>
