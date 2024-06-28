<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>알림장 작성</title>
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/resources/css/notice.css">
<!-- TinyMCE CDN -->
<script
	src="https://cdn.tiny.cloud/1/mzvas2qdd6hui8ybi2mm7apd9x54xg7n8922fz9yypn13yhv/tinymce/5/tinymce.min.js"
	referrerpolicy="origin"></script>
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
						<button type="submit" form="postForm" class="write-post-button">작성하기</button>
					</div>
				</div>
			</div>
			<div class="table-area">
				<form id="postForm"
					action="${pageContext.servletContext.contextPath}/notice/insert"
					method="post">
					<!-- 반과 반려견 선택을 위해 selectDog.jsp 파일 포함 -->
					<jsp:include page="../notice/selectDog.jsp" />

					<!-- 선택된 반과 반려견 코드를 위한 숨겨진 입력 필드 -->
					<input type="hidden" name="classCode" id="selectedClassCode"
						value=""> 
						<input type="hidden" name="dogCode"
						id="selectedDogCode" value="">
					<div class="outer-notice-insert">
						<div class="header-row">
							<div class="author">
								<input type="text" name="writerName"
									value="${ sessionScope.loginMember.memberName }"
									class="noneBorderInput"> <input type="hidden"
									name="noticeWriterCode"
									value="${sessionScope.loginMember.memberCode}">
							</div>
							<div class="createdDate">
								<input type="date" name="createdDate" class="noneBorderInput"
									value="<%=new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date())%>">

							</div>
						</div>
						<h2 class="title">
							제목 :<input type="text" name="title" placeholder="제목을 입력하세요."
								required oninvalid="this.setCustomValidity('제목은 필수항목입니다.')">
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
	<jsp:include page="../common/footer.jsp" />
</body>
</html>
