<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/resources/css/dog.css">
</head>
<body>
	<!-- 메뉴바 연결 -->
	<jsp:include page="../common/menubar.jsp" />

	<div class="mypage-container">
		<div class="container">
			<div class="sidebar">
				<ul>
					<li><a href="#">회원정보 관리</a></li>
					<li><a href="" class="current">반려견정보 관리</a></li>
				</ul>
			</div>
			<div class="main_contents">
				<div class="regist-box">
					<div class="text_1">
						<h1>
							나의 반려견 정보를 <br>입력하세요.
						</h1>
					</div>
					<div class="dogprofile">
						<div class="circle" id="addCircleButton"
							onclick="addProfileForm()">+</div>
					</div>
					<div id="profileContainer">
						<!-- 프로필 이미지가 여기에 동적으로 추가됩니다 -->
					</div>
					<div id="formContainer">
						<!-- 폼이 여기에 동적으로 추가됩니다 -->
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 푸터 연결 -->
	<jsp:include page="../common/footer.jsp" />
</body>
</html>