<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>알림장 수정</title>
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/resources/css/notice.css">
<script
	src="${pageContext.servletContext.contextPath}/resources/js/notice.js"></script>
<!-- CKEditor CDN -->
<script src="https://cdn.ckeditor.com/4.16.2/standard/ckeditor.js"></script>
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
						<button onclick="updateNotice()" class="write-post-button">수정완료</button>
					</div>
				</div>
				<jsp:include page="../notice/selectDog.jsp" />
			</div>
			<div class="table-area">
				<form id="postForm"
					action="${pageContext.servletContext.contextPath}/notice/modify"
					method="post">
					<div class="outer-notice-modify">
						<div class="header-row">
							<input type="hidden" name="noticeNo"
								value="${ noticeDetail.noticeNo }" />

							<div class="author" name="noticeWriter">
								<c:out value="${ noticeDetail.noticeWriter }" />
							</div>
							<div class="createdDate" name="createdDate">
								<c:out value="${noticeDetail.createdDate}" />
							</div>
						</div>
					</div>

					<h2 class="title">
						제목 :<input type="text" name="noticeTitle"
							value="${ noticeDetail.noticeTitle }">
					</h2>

					<div class="content-box">
						<textarea name="noticeBody" id="editor" cols="60" rows="15">${ noticeDetail.noticeBody }</textarea>
					</div>
				</form>
			</div>
		</div>
	</main>
	<jsp:include page="../common/footer.jsp" />
	<!-- contextPath를 동적으로 JavaScript에서 사용할 수 있도록 숨겨진 입력 필드에 저장 -->
	<input type="hidden" id="contextPath"
		value="${pageContext.servletContext.contextPath}" />

	<script>
		// CKEditor 초기화
		CKEDITOR.replace('editor');
	</script>
</body>
</html>
