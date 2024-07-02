<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>알림장 상세보기</title>
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/resources/css/notice.css">
<script
	src="${pageContext.servletContext.contextPath}/resources/js/notice.js"></script>
<script
	src="${pageContext.servletContext.contextPath}/resources/js/comment.js"></script>
<script>
function checkPermission(loggedInMemberId, noticeWriterId) {
    if (loggedInMemberId === noticeWriterId) {
        document.getElementById('deleteBtn').style.display = 'block';
        document.getElementById('modifyBtn').style.display = 'block';
    } else {
        document.getElementById('deleteBtn').style.display = 'none';
        document.getElementById('modifyBtn').style.display = 'none';
    }
}

// 페이지 로드 시 실행할 초기화 함수
window.onload = function() {
    var loggedInMemberId = '${sessionScope.loginMember.memberCode}'; // 세션에서 현재 로그인한 멤버코드
    console.log("loggedInMemberId:", loggedInMemberId);

    var noticeWriterId = '${notice.noticeWriter.memberCode}'; // 공지사항 작성자 멤버코드
    console.log("noticeWriterId:", noticeWriterId);
    
    checkPermission(loggedInMemberId, noticeWriterId); // 권한 체크 함수 호출
};
</script>
</head>
<body>
	<jsp:include page="../common/menubar.jsp" />
	<input type="hidden" name="noticeNo" value="${ notice.noticeNo }">
	<main class="main-content">
		<div class="container">
			<div class="question-box">
				<div class="notice-header">
					<p class="noticeTitle">
						<span style="font-weight: 900;">댕댕스쿨</span>에서는<br> 무엇을 할까요?
					</p>
					<form id="deleteForm"
						action="${ pageContext.servletContext.contextPath }/notice/delete"
						method="post">
						<input type="hidden" name="noticeNo" value="${ notice.noticeNo }">
					</form>
					<div class="button-section">
						<button onclick="doDelete(${ notice.noticeNo })"
							class="write-post-button" id="deleteBtn">삭제하기</button>
						<button onclick="doModify(${notice.noticeNo})"
							class="write-post-button" id="modifyBtn">수정하기</button>
					</div>
				</div>
			</div>
			<div class="outer-notice-detail">
				<div class="header-row">
					<div class="author" name="noticeWriter">
						<c:out value="${notice.noticeWriter.memberName}" />
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

		<jsp:include page="comment.jsp">
			<jsp:param name="noticeNo" value="${notice.noticeNo}" />
		</jsp:include>

		<button class="goBackList">
			<a href="${pageContext.servletContext.contextPath}/notice">목 록</a>
		</button>
	</main>

	<jsp:include page="../common/footer.jsp" />

	<!-- contextPath를 동적으로 JavaScript에서 사용할 수 있도록 숨겨진 입력 필드에 저장 -->
	<input type="hidden" id="contextPath"
		value="${pageContext.servletContext.contextPath}" />
</body>
</html>