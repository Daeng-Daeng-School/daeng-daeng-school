<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>나의반려견 정보 관리</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/resources/css/dog.css">
<style>
body {
	text-align: center;
}

table {
	width: 930px;
	height: auto;
	text-align: center;
	border: 1px solid #b6b6b6;
	border-radius: 16px;
	padding: 20px;
}

/* table 스타일링 */
table.form {
	width: 100%;
}

table.form th, table.form td {
	padding: 8px;
	text-align: left;
}

table.form th {
	background-color: #f2f2f2;
}

table.form tr:hover {
	background-color: #f9f9f9;
}

table.form tr {
	border-bottom: 1px solid #b6b6b6;
}

update {
	padding: 5px;
	border: 1px solid #b6b6b6;
	background: #333;
	border-radius: 16px;
	color: #fff;
	font-weight: bold;
}
</style>
</head>

<body>
	<!-- 메뉴바 연결 -->
	<jsp:include page="../common/menubar.jsp" />

	<div class="mypage-container">
		<div class="container">
			<div class="sidebar">
				<ul>
					<li><a
						href="${pageContext.servletContext.contextPath}/member/mypage">회원정보
							관리</a></li>
					<li><a
						href="${pageContext.servletContext.contextPath}/dog/select"
						class="current">반려견정보 관리</a>
						<ul>
							<li><a
								href="${pageContext.servletContext.contextPath}/dog/insert">등록하기</a></li>
							<li><a
								href="${pageContext.servletContext.contextPath}/dog/update">수정하기</a></li>
						</ul></li>
				</ul>
			</div>
			<div class="main_contents">
				<div class="regist-box">
					<div class="text_1">
						<h1>나의 반려견 정보</h1>
					</div>
					<table class="form">
						<thead>
							<tr class="tr">
								<th>이름</th>
								<th>품종</th>
								<th>성별</th>
								<th>생년월일</th>
								<th>칩 번호</th>
								<th>몸무게</th>
								<th>특이사항</th>
								<th>수정</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="dog" items="${dogList}">
								<tr>
									<td>${dog.dogName}</td>
									<td>${dog.dogBreed}</td>
									<td>${dog.gender}</td>
									<td>${dog.birth}</td>
									<td>${dog.chipNo}</td>
									<td>${dog.weight}</td>
									<td>${dog.notes}</td>
									<td><a
										href="${pageContext.servletContext.contextPath}/dog/update?dogCode=${dog.dogCode}">수정하기</a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>

	<script>
        // 강아지 데이터를 테이블에 추가
        function populateDogTable() {
            var dogTableBody = document.getElementById('dogTableBody');
            dogTableBody.innerHTML = ''; // 기존 내용 초기화

            dogs.forEach(function(dog) {
                var row = `
                    <tr>
                        <td>${dog.dogName}</td>
                        <td>${dog.dogBreed}</td>
                        <td>${dog.gender}</td>
                        <td>${dog.birth}</td>
                        <td>${dog.chipNo}</td>
                        <td>${dog.weight}</td>
                        <td>${dog.notes}</td>
                        <td><a href="${pageContext.servletContext.contextPath}/dog/update?dogCode=${dog.dogCode}" class="update" >수정하기</a></td>
                    </tr>
                `;
                dogTableBody.innerHTML += row;
            });
        }

        // 페이지 로드 시 테이블 데이터 초기화
        window.onload = function() {
            populateDogTable();
        };
    </script>

	<%@ include file="../common/footer.jsp"%>
</body>
</html>
