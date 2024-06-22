<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/resources/css/notice.css">
</head>
<body>
	<!-- 검색 섹션 시작 -->
	<div class="search-input-container">
		<!-- 반 선택 / 추후 DB 연결하여 활용 -->
		<select id="searchClass" class="search-select">
			<option value="" disabled selected>반 선택</option>
			<option value="class1">오전반</option>
			<option value="class2">오후반</option>
			<option value="class3">종일반</option>
		</select>
		<!-- 해당반 반려견 리스트 선택 / 추후 DB 연결하여 활용 -->
		<select id="searchDog" class="search-select">
			<option value="" disabled selected>반려견 선택</option>
			<option value="">쿠키</option>
			<option value="dog1">쿠키</option>
			<option value="dog2">루키</option>
		</select> <a onclick="search()" class="search-button">선택</a>
	</div>
	<!-- 검색 섹션 끝 -->

	<script>
		function search() {
			var searchClass = document.getElementById('searchClass').value;
			var searchDog = document.getElementById('searchDog').value;
		}
	</script>
</body>
</html>