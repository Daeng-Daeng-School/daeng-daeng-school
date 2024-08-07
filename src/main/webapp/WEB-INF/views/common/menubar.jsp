<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>댕댕스쿨</title>

<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/resources/css/common.css">
</head>
<body>

	<!-- header 영역 -->
	<header class="header">
		<div class="container header-content">
			<div class="left-section">
				<div class="logo">
					<a href="${pageContext.servletContext.contextPath}">댕댕스쿨</a>
				</div>
				<nav class="nav">
					<a href="${pageContext.servletContext.contextPath}/notice">알림장</a>
					<a href="${pageContext.servletContext.contextPath}/classbook">출석부</a>
					<a href="${pageContext.servletContext.contextPath}/dog/select">반려견관리</a>
					<a href="${pageContext.servletContext.contextPath}/sticker/list">이달의 반려견</a> 
					<!-- <a href="#">유치원관리</a> -->
				</nav>
			</div>

			<!-- 로그인 영역 -->

			<div class="login-area">
				<div class="login-form">
					<c:if test="${empty sessionScope.loginMember}">
						<div class="btns">
							<button class="btn">
								<a href="${pageContext.servletContext.contextPath}/member/login">로그인</a>
							</button>
							<button class="btn">
								<a
									href="${pageContext.servletContext.contextPath}/member/regist">회원가입</a>
							</button>
						</div>
					</c:if>

					<c:if test="${!empty sessionScope.loginMember}">
						<div class="welcome-message">
							<c:out value="${sessionScope.loginMember.memberName}" />
							님, 환영합니다.
						</div>
						<div class="btns">
							<c:choose>
								<c:when test="${ sessionScope.loginMember.roleCode == 1}">
									<button class="btn">
										<a
											href="${pageContext.servletContext.contextPath}/master/mypage">정보수정</a>
									</button>
								</c:when>
								<c:when test="${ sessionScope.loginMember.roleCode == 2}">
									<button class="btn">
										<a
											href="${pageContext.servletContext.contextPath}/teacher/mypage">정보수정</a>
									</button>
								</c:when>
								<c:when test="${ sessionScope.loginMember.roleCode == 3}">
									<button class="btn">
										<a
											href="${pageContext.servletContext.contextPath}/member/mypage">정보수정</a>
									</button>
								</c:when>
							</c:choose>
							<button class="btn">
								<a
									href="${pageContext.servletContext.contextPath}/member/logout">로그아웃</a>
							</button>
						</div>
					</c:if>
				</div>
			</div>
	</header>
	<div class="announcement-bar">
		<div class="container">
			<span>🔔 댕댕스쿨에 오신 여러분을 환영합니다. 오늘도 즐겁고 신나는 시간 함께해요~!</span>
		</div>
	</div>


</body>
</html>