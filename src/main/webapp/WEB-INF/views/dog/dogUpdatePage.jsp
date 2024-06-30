<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>반려견정보 수정</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/resources/css/dog.css">
<style>
body {
	font-family: Arial, sans-serif;
}

.dog-info {
	width: 480px;
	height: 600px;
	margin: 0 auto;
	padding: 20px;
	border: 1px solid #ccc;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.dog-info form {
	display: flex;
	flex-direction: column;
}

.dog-info form label {
	margin-bottom: 5px;
}

.dog-info form input, .dog-info form button {
	margin-bottom: 15px;
	padding: 5px;
	font-size: 16px;
}

.modal {
	display: none;
	position: fixed;
	z-index: 1;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	overflow: auto;
	background-color: rgb(0, 0, 0);
	background-color: rgba(0, 0, 0, 0.4);
}

.modal-content {
	background-color: #fefefe;
	margin: 15% auto;
	padding: 20px;
	border: 1px solid #888;
	width: 80%;
	text-align: center;
}

.close-button {
	color: #aaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
	cursor: pointer;
}

.close-button:hover, .close-button:focus {
	color: black;
	text-decoration: none;
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
					<li><a href="#">회원정보 관리</a></li>
					<li><a href="" class="current">반려견정보 관리</a></li>
				</ul>
			</div>
			<div class="main_contents">
				<div class="dog-info">

					<div class="text_1">
						<h1>
							나의 반려견 정보를 <br>수정하세요.
						</h1>
					</div>

					<form id="update-dog-form"
						action="<%=request.getContextPath()%>/dog/update" method="post">
						<label for="dogName">이름:</label> <input type="text" id="dogName"
							name="dogName" required> <label for="dogAge">나이:</label>
						<input type="text" id="dogAge" name="dogAge"> <label
							for="dogBreed">품종:</label> <input type="text" id="dogBreed"
							name="dogBreed" required> <label for="dogGender">성별:</label>
						<select id="dogGender" name="dogGender" required>
							<option value="수컷">수컷</option>
							<option value="암컷">암컷</option>
						</select> <label for="birthdate">생년월일:</label> <input type="date"
							id="birthdate" name="birthdate"> <label for="regNumber">등록
							번호:</label> <input type="text" id="regNumber" name="regNumber"> <label
							for="weight">체중 (kg):</label> <input type="number" id="weight"
							name="weight" step="0.1"> <label for="notes">특이
							사항:</label>
						<textarea id="notes" name="notes" rows="3"></textarea>
						<button type="submit">수정하기</button>
						<button type="button" id="delete-button">삭제하기</button>
					</form>
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
        document.addEventListener('DOMContentLoaded', () => {
            const deleteButton = document.getElementById('delete-button');
            const deleteModal = document.getElementById('delete-modal');
            const closeModal = document.getElementById('close-modal');
            const confirmDelete = document.getElementById('confirm-delete');
            const cancelDelete = document.getElementById('cancel-delete');

            // 삭제하기 버튼 클릭 시 모달을 보여줌
            deleteButton.addEventListener('click', () => {
                deleteModal.style.display = 'block';
            });

            // 모달의 닫기 버튼 클릭 시 모달을 숨기기
            closeModal.addEventListener('click', () => {
                deleteModal.style.display = 'none';
            });

            // 취소 버튼 클릭 시 모달을 숨기기
            cancelDelete.addEventListener('click', () => {
                deleteModal.style.display = 'none';
            });

            // 확인 버튼 클릭 시 비활성화 작업을 진행
            confirmDelete.addEventListener('click', () => {
                // 서버에 비활성화 요청을 보냄
                const dogCode = 123; // 실제 강아지 ID로 대체

                fetch('<%=request.getContextPath()%>/dog/delete', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/x-www-form-urlencoded',
                    },
                    body: `dogCode=${dogCode}`,
                })
                .then(response => response.json())
                .then(data => {
                    if (data.success) {
                        // 비활성화 성공 시 처리 (예: 페이지 새로고침 또는 다른 알림)
                        alert('강아지 정보가 비활성화되었습니다.');
                        deleteModal.style.display = 'none';
                    } else {
                        alert('비활성화 중 오류가 발생했습니다.');
                    }
                })
                .catch(error => {
                    console.error('Error:', error);
                    alert('비활성화 중 오류가 발생했습니다.');
                });
            });

            // 모달 외부 클릭 시 모달을 숨김처리
            window.addEventListener('click', (event) => {
                if (event.target === deleteModal) {
                    deleteModal.style.display = 'none';
                }
            });
        });
    </script>

				<%@ include file="../common/footer.jsp"%>
</body>
</html>

