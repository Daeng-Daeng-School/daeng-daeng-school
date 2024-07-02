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

.modal {
	display: none;
	position: fixed;
	z-index: 1000;
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
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0
		rgba(0, 0, 0, 0.19);
}

.modal-content p {
	margin-bottom: 20px;
}

.modal-content button {
	background-color: #333;
	color: white;
	padding: 10px 20px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	margin-top: 10px;
	cursor: pointer;
	border: none;
	border-radius: 5px;
}

.modal-content button:hover {
	background-color: #555;
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
				<div class="select-box">
					<div class="text_1">
						<h1>나의 반려견 정보</h1>
					</div>
					<table class="form">
						<thead>
							<tr class="tr" style="font-weight: 700; text-align: center;">
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
								<tr>
									<td>${dog.dogName}</td>
									<td>${dog.dogBreed}</td>
									<td>${dog.gender}</td>
									<td>${dog.birth}</td>
									<td>${dog.chipNo}</td>
									<td>${dog.weight}</td>
									<td>${dog.notes}</td>
									<td><a
										href="${pageContext.servletContext.contextPath}/dog/update?dogCode=${dog.dogCode}">수정</a></td>
									<td><a href="#" class="delete-btn"
										data-dog-code="${dog.dogCode}">삭제</a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	<!-- 삭제 모달 -->
	<div id="delete-modal" class="modal">
		<div class="modal-content">
			<p>정말로 삭제하시겠습니까?</p>
			<button id="cancel-delete">취소</button>
			<button id="confirm-delete">확인</button>
		</div>
	</div>
	<script>
        // 강아지 데이터를 테이블에 추가
        function populateDogTable() {
            var dogTableBody = document.querySelector('.form tbody');
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
                        <td><a href="#" class="delete-btn" data-dog-code="${dog.dogCode}">삭제</a></td>
                    </tr>
                `;
                dogTableBody.innerHTML += row;
            });
        }

        // 페이지 로드 시 테이블 데이터 초기화
        window.onload = function() {
            populateDogTable();
        };
        
		// 삭제 모달 띄우기
		document.addEventListener('DOMContentLoaded', function() {
			var deleteButton = document.getElementById('delete-button');
			var deleteModal = document.getElementById('delete-modal');
			var cancelDeleteButton = document.getElementById('cancel-delete');
			var confirmDeleteButton = document.getElementById('confirm-delete');
		
			// 각 삭제 버튼에 클릭 이벤트 추가
            deleteButtons.forEach(function(button) {
                button.addEventListener('click', function() {
                	var dogCode = this.getAttribute('data-dog-code');
                    var modalMessage = deleteModal.querySelector('p');
                    modalMessage.innerHTML = "정말로 삭제하시겠습니까?";
            }
                // 모달 열기
                deleteModal.style.display = 'block';
                
                // 확인 버튼 클릭 시
                confirmDeleteButton.addEventListener('click', function() {
                    // Ajax를 통해 서버로 삭제 요청 전송
                    $.ajax({
                        url: '${pageContext.servletContext.contextPath}/dog/delete',
                        type: 'POST',
                        data: { dogCode: dogCode },
                        success: function(response) {
                            if (response.status === 'success') {
                                alert("강아지 정보가 성공적으로 삭제되었습니다.");

                                // 모달 닫기
                                deleteModal.style.display = 'none';

                                // 페이지 새로고침 없이 테이블에서 삭제된 항목 제거
                                var rowToDelete = button.parentElement.parentElement;
                                rowToDelete.remove();
                            } else {
                                alert("강아지 정보 삭제에 실패했습니다.");
                            }
                        },
                        error: function() {
                            alert("서버 오류가 발생했습니다. 다시 시도해 주세요.");
                        }
                    });
                });

                // 취소 버튼 클릭 시
                cancelDeleteButton.addEventListener('click', function() {
                    deleteModal.style.display = 'none'; // 모달 닫기
                });
            });
        });


    });
                
                
			
			  // 확인 버튼 클릭 시 Ajax 요청
	        confirmDeleteButton.addEventListener('click', function() {
	            var dogCode = "${requestDog.dogCode}";
	            $.ajax({
	                url: '${pageContext.servletContext.contextPath}/dog/delete',
	                type: 'POST',
	                data: { dogCode: dogCode },
	                success: function(response) {
	                    if (response.status === 'success') {
	                        alert("강아지 정보가 성공적으로 삭제되었습니다.");

	                        // 데이터 비활성화 처리
	                        $("#dogName").val('');
	                        $("#dogClass").val('');
	                        $('input[name="gender"]').prop('checked', false); // 모든 라디오 버튼 체크 해제
	                        $("#dogBreed").val('');
	                        $("#birthdate").val('');
	                        $("#chipNo").val('');
	                        $("#weight").val('');
	                        $("#notes").val('');

	                        // 모달 닫기
	                        deleteModal.style.display = 'none';
	                    } else {
	                        alert("강아지 정보 삭제에 실패했습니다.");
	                    }
	                },
	                error: function() {
	                    alert("서버 오류가 발생했습니다. 다시 시도해 주세요.");
	                }
	            });
	        });
		});
    </script>

	<%@ include file="../common/footer.jsp"%>
</body>
</html>
