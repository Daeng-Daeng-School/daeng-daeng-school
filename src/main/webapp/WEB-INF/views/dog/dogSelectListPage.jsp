<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>나의 반려견 정보 관리</title>
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

.update, .delete {
	padding: 5px;
	border: 1px solid #f2f2f2;
	border-radius: 16px;
	color: #fff;
	font-weight: bold;
	cursor: pointer;
}

.delete-btn {
	padding: 5px;
	border: 1px solid #f2f2f2;
	border-radius: 16px;
	color: #fff;
	font-weight: bold;
}

#delete-modal {
	display: none; /* 기본적으로 모달을 숨김 */
	position: fixed; /* 화면에 고정 위치 */
	z-index: 1000; /* 다른 요소 위에 표시 */
	left: 50%; /* 화면 가로 중앙에 위치 */
	top: 50%; /* 화면 세로 중앙에 위치 */
	transform: translate(-50%, -50%); /* 중앙 정렬 */
	width: 300px; /* 모달 너비 */
	background-color: white; /* 모달 배경 색상 */
	box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3); /* 그림자 효과 */
	padding: 20px; /* 내부 여백 */
	border-radius: 8px; /* 모서리 둥글게 */
}

#delete-modal p {
	margin: 0 0 20px;
	font-size: 16px;
	text-align: center;
}

#delete-modal button {
	margin: 5px;
	padding: 10px;
	font-size: 14px;
	cursor: pointer;
}

#delete-modal button#confirm-delete {
	background-color: red;
	color: white;
	border: none;
	border-radius: 5px;
	border-radius: 16px;
}

#delete-modal button#cancel-delete {
	background-color: #f2f2f2;
	color: #222;
	border: none;
	border-radius: 5px;
	border-radius: 16px;
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
								<th>삭제</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="dog" items="${dogList}">
							<%-- <c:if test="${dog.status eq 0}">--%>								
								<tr>
									<td>${dog.dogName}</td>
									<td>${dog.dogBreed}</td>
									<td>${dog.gender}</td>
									<td>${dog.birth}</td>
									<td>${dog.chipNo}</td>
									<td>${dog.weight}</td>
									<td>${dog.notes}</td>
									<td><a
										href="${pageContext.servletContext.contextPath}/dog/update?dogCode=${dog.dogCode}"
										class="update">수정</a></td>
									<td><a href="#" class="delete-btn"
										data-dog-code="${dog.dogCode}">삭제</a></td>
								</tr>
							    <%-- </c:if> --%>
								
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>

	<!-- 삭제 모달 -->
	<div id="delete-modal" style="display: none;">
		<p>정말로 삭제하시겠습니까?</p>
		<button id="confirm-delete">확인</button>
		<button id="cancel-delete">취소</button>
	</div>

<script>
        document.addEventListener('DOMContentLoaded', function() {
            var deleteButtons = document.querySelectorAll('.delete-btn');
            var deleteModal = document.getElementById('delete-modal');
            var confirmDeleteButton = document.getElementById('confirm-delete');
            var cancelDeleteButton = document.getElementById('cancel-delete');
            var currentDogCode;

            deleteButtons.forEach(function(button) {
                button.addEventListener('click', function() {
                    currentDogCode = this.getAttribute('data-dog-code');
                    deleteModal.style.display = 'block';
                });
            });

            confirmDeleteButton.addEventListener('click', function() {
                $.ajax({
                    url: '${pageContext.servletContext.contextPath}/dog/delete',
                    type: 'POST',
                    data: { dogCode: currentDogCode },
                    success: function(response) {
                        if (response.status === 'success') {
                            alert("강아지 정보가 성공적으로 삭제되었습니다.");
                            location.reload(); // 페이지 새로고침
                        } else {
                            alert("강아지 정보 삭제에 실패했습니다.");
                        }
                    },
                    error: function() {
                        alert("서버 오류가 발생했습니다. 다시 시도해 주세요.");
                    }
                });
                deleteModal.style.display = 'none';
            });

            cancelDeleteButton.addEventListener('click', function() {
                deleteModal.style.display = 'none';
            });
        });
    </script>

	<%@ include file="../common/footer.jsp"%>
</body>
</html>
