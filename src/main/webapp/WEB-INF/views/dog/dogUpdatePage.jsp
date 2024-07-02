<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>반려견 정보 수정</title>
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/resources/css/dog.css">
<style>
/* 모달 스타일 */
.modal {
	display: none;
	position: fixed;
	z-index: 1;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	overflow: auto;
	background-color: rgba(0, 0, 0, 0.4);
}

.modal-content {
	background-color: #fefefe;
	margin: 15% auto;
	padding: 20px;
	border: 1px solid #888;
	width: 80%;
	border-radius: 10px;
	text-align: center;
}

.close-button {
	color: #aaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.close-button:hover, .close-button:focus {
	color: black;
	text-decoration: none;
	cursor: pointer;
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
						href="${pageContext.servletContext.contextPath}/dog/select">반려견정보
							관리</a>
						<ul>
							<li><a
								href="${pageContext.servletContext.contextPath}/dog/insert">등록하기</a></li>
							<li><a
								href="${pageContext.servletContext.contextPath}/dog/update"
								class="current">수정하기</a></li>
						</ul></li>
				</ul>
			</div>
			<div class="main_contents">
				<div class="regist-box">
					<div class="text_1">
						<h1>반려견 정보 수정</h1>
					</div>
					<form id="update-dog-form"
						action="${pageContext.servletContext.contextPath}/dog/processUpdate"
						method="post">
						<input type="hidden" name="dogCode" value="${dog.dogCode}">
						<!-- 수정할 강아지 코드를 숨은 필드로 전달 -->
						<label for="dogName">이름:</label> <input type="text" id="dogName"
							name="dogName" value="${dog.dogName}" required> <label
							for="dogBreed">품종:</label> <input type="text" id="dogBreed"
							name="dogBreed" value="${dog.dogBreed}" required> <label
							for="dogGender">성별:</label> <select id="dogGender"
							name="dogGender" required>
							<option value="수컷" ${dog.gender == '수컷' ? 'selected' : ''}>수컷</option>
							<option value="암컷" ${dog.gender == '암컷' ? 'selected' : ''}>암컷</option>
						</select> <label for="birthdate">생년월일:</label> <input type="date"
							id="birthdate" name="birthdate" value="${dog.birth}"> <label
							for="chipNo">인식번호:</label> <input type="text" id="chipNo"
							name="chipNo" value="${dog.chipNo}"> <label for="weight">체중
							(kg):</label> <input type="number" id="weight" name="weight"
							value="${dog.weight}"> <label for="notes">특이사항:</label> <input
							id="notes" name="notes" value="${dog.notes}">
						<button type="submit">수정완료</button>
						<button type="button" id="delete-button">삭제하기</button>
					</form>
				</div>
			</div>
		</div>
	</div>

	<!-- 삭제 모달 -->
	<div id="delete-modal" class="modal">
		<div class="modal-content">
			<span class="close-button" id="close-modal">&times;</span>
			<p>정말로 강아지 정보를 삭제하시겠습니까?</p>
			<button id="confirm-delete">확인</button>
			<button id="cancel-delete">취소</button>
		</div>
	</div>

	<script>
		// 삭제 모달 띄우기
		
		var deleteButton = document.getElementById('delete-button');
		var deleteModal = document.getElementById('delete-modal');
		var closeModal = document.getElementById('close-modal');
		var cancelDeleteButton = document.getElementById('cancel-delete');

		deleteButton.addEventListener('click', function() {
			deleteModal.style.display = 'block';
		});

		closeModal.addEventListener('click', function() {
			deleteModal.style.display = 'none';
		});

		cancelDeleteButton.addEventListener('click', function() {
			deleteModal.style.display = 'none';
		});
	</script>

	<%@ include file="../common/footer.jsp"%>
</body>
</html>
