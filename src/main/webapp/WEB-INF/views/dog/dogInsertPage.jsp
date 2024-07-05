<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>나의 반려견 정보 등록</title>
<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/dog.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

</head>
<body>
	<!-- 메뉴바 연결 -->
	<%@ include file="../common/menubar.jsp"%>

	<div class="mypage-container">
		<div class="container">
			<div class="sidebar">
				<ul>
					<li><a href="${pageContext.servletContext.contextPath}/member/mypage">회원정보 관리</a></li>
					<li><a
						href="${pageContext.servletContext.contextPath}/dog/select"
						class="current">반려견정보 관리</a>
						<ul>
							<li><a
								href="${pageContext.servletContext.contextPath}/dog/insert">등록하기</a></li>
						</ul></li>
				</ul>
			</div>
			<div class="main_contents">
				<div class="regist-box">
					<div class="text_1">
						<h1>
							나의 반려견 정보를<br>입력하세요.
						</h1>
					</div>
					<form id="dogForm" class="dogForm"
						action="${pageContext.servletContext.contextPath}/dog/insert"
						method="post">
						<div class="input_box">
							<label for="dogName"></label> <input type="text" id="dogName"
								name="dogName" class="input_box_radius" placeholder="이름">
						</div>
						<div class="selectBox">
							<label for="dogClass" style="margin-left: 20px;">강아지반</label> <select
								id="dogClass" name="dogClass" class="dogClass">
								<option value="1">오전반</option>
								<option value="2">오후반</option>
								<option value="3">종일반</option>
							</select>
						</div>
						<div class="checkBox">
							<label for="gender" style="margin-left: 10px;">성별</label> <input
								id="male" type="checkbox" name="gender" value="M"
								style="margin-left: 85px;"> <label for="male">수컷</label>
							<input id="female" type="checkbox" name="gender" value="F"
								style="margin-left: 85px;"> <label for="female">암컷</label>
						</div>
						<div class="input_box">
							<label for="dogBreed"></label> <input type="text" id="dogBreed"
								name="dogBreed" class="dogBreed" placeholder="품종">
						</div>
						<div class="input_box">
							<label for="birthdate"></label> <input type="date" id="birthdate"
								name="birthdate" class="dog_birth">
						</div>
						<div class="input_box">
							<label for="chipNo"></label> <input type="text" id="chipNo"
								name="chipNo" class="input_box" placeholder="칩번호">
						</div>
						<div class="input_box">
							<label for="weight"></label> <input type="number" id="weight"
								name="weight" step="0.01" class="input_box"
								placeholder="몸무게(kg)">
						</div>
						<div class="input_box">
							<label for="notes"></label> <input type="text" id="notes"
								name="notes" class="input_box_radius2" placeholder="특이사항">
						</div>
						<button type="submit" id="submitBtn" class="register-btn">등록하기</button>
					</form>
				</div>
			</div>
		</div>
	</div>

	<!-- 푸터 연결 -->
	<%@ include file="../common/footer.jsp"%>
</body>
</html>
