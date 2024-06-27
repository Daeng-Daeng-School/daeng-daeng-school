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
		<select id="searchClass" class="search-select" name="class">
			<!-- <option value="" disabled selected>반 선택</option> -->
			<option value="1">오전반</option>
			<!-- <option value="2">오후반</option>
			<option value="3">종일반</option> -->
		</select>
		<!-- 해당반 반려견 리스트 선택 / 추후 DB 연결하여 활용 -->
		<select id="searchDog" class="search-select" name="dog">
			<!-- <option value="" disabled selected>반려견 선택</option> -->
			<!-- 추후 DB연결하여 뿌려주기 필요 -->
			<option value="2">쿠키</option>
		</select> <a onclick="select()" class="select-button">선택</a>
	</div>
	<!-- 검색 섹션 끝 -->

	<script>
		function select() {
			var selectClass = document.getElementById('selectClass').value;
			var selectDog = document.getElementById('selectDog').value;
		}
	</script>
</body>
</html>