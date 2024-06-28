<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>댕댕스쿨</title>
<script
	src="${pageContext.servletContext.contextPath}/resources/js/event.js">
	
</script>
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/resources/css/common.css">
</head>

<body>
	<header class="header">
		<div class="container header-content">
			<div class="left-section">
				<div class="logo">
					<a href="${pageContext.servletContext.contextPath}">댕댕스쿨</a>
				</div>
				<nav class="nav">
					<a href="${pageContext.servletContext.contextPath}/notice">알림장</a>
					<a href="#">출석부</a>
					<a href="${pageContext.servletContext.contextPath}/dog/select">반려견관리</a>
					<a href="#">이달의 반려견</a> <a href="#">유치원관리</a>
				</nav>
			</div>


			<div class="login-area">
				<div class="login-form">
					<a href="${pageContext.servletContext.contextPath}/member/login"
						id="login"> <img
						src="<%=request.getContextPath()%>/resources/image/login.svg"
						alt="로그인 아이콘" width="25">
					</a>
				</div>
			</div>




			<c:if test="${!empty sessionScope.loginMember}">
				<div class="welcome-message">
					<c:out value="${sessionScope.loginMember.memberName}" />
					님, 환영합니다.
				</div>
				<div class="btns">
					<input type="button" class="btn" value="정보수정" id="updateMember">
					<button class="btn">
						<a href="${pageContext.servletContext.contextPath}/member/logout"><img
							src="<%=request.getContextPath()%>/resources/image/logout.png"
							alt="로그아웃 아이콘" width="25"></a>
					</button>
				</div>
			</c:if>
		</div>
	</header>
	<!-- 공지 띠배너  -->
	<div class="announcement-bar">
		<div class="container">
			<span>🔔 2024년 07월 15일 제 1회 댕댕 체육대회를 진행할 예정입니다. 공지사항 체크하고 희망하는
				운동종목 댓글로 남겨주시길 바랍니다.</span>
		</div>
	</div>
</body>
</html>
