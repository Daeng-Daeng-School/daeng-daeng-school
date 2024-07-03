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

.delete-btn {
	position: absolute;
	border: none;
	background-color: #fff;
	color: #b6b6b6;
	bottom: 300px;
	font-weight: 600;
	right: 590px;
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
						</ul></li>
				</ul>
			</div>
			<div class="main_contents">
				<div class="regist-box">
					<div class="text_1">
						<h1>
							나의 반려견 정보를 <br> 수정하세요
						</h1>
					</div>
					<form id="UpdateDogForm" class="UpdateDogForm"
						action="${pageContext.servletContext.contextPath}/dog/update"
						method="post">
						<input type="hidden" name="dogCode" value="${dogDTO.dogCode}"
							placeholder="이름">
						<!-- 수정할 강아지 코드를 숨은 필드로 전달 -->
						<div class="input_box">
							<label for="dogName"><input type="text" id="dogName"
								name="dogName" class="input_box_radius"
								value="${dogDTO.dogName}"></label>
						</div>
						<div class="selectBox">
							<label for="dogClass" style="margin-left: 20px;">강아지반</label> <select
								id="dogClass" name="dogClass" class="dogClass">
								<option value="1" ${dogDTO.classCode == 1 ? 'selected' : ''}>오전반</option>
								<option value="2" ${dogDTO.classCode == 2 ? 'selected' : ''}>오후반</option>
								<option value="3" ${dogDTO.classCode == 3 ? 'selected' : ''}>종일반</option>
							</select>
						</div>
						<div class="checkBox">
							<label for="gender" style="margin-left: 10px;">성별</label> <input
								id="male" type="radio" name="gender" value="M"
								style="margin-left: 85px;"
								${dogDTO.gender == 'M' ? 'checked' : ''}> <label
								for="male">수컷</label> <input id="female" type="radio"
								name="gender" value="F" style="margin-left: 85px;"
								${dogDTO.gender == 'F' ? 'checked' : ''}> <label
								for="female">암컷</label>
						</div>
						<div class="input_box">
							<label for="dogBreed"></label> <input type="text" id="dogBreed"
								name="dogBreed" class="dogBreed" value="${dogDTO.dogBreed}"
								placeholder="품종">
						</div>
						<div class="input_box">
							<label for="birthdate"></label> <input type="date" id="birthdate"
								name="birthdate" class="birthdate"
								value="${dogDTO.birth}">
						</div>
						<div class="input_box">
							<label for="chipNo"></label> <input type="text" id="chipNo"
								name="chipNo" class="input_box" value="${dogDTO.chipNo}"
								placeholder="동물인식번호">
						</div>
						<div class="input_box">
							<label for="weight"></label> <input type="number" id="weight"
								name="weight" step="0.01" class="input_box"
								value="${dogDTO.weight}" placeholder="몸무게(kg)">
						</div>
						<div class="input_box">
							<label for="notes"></label> <input type="text" id="notes"
								name="notes" class="input_box_radius2"
								value="${dogDTO.notes}" placeholder="특이사항">
						</div>
						<div class="input_box">
							<button type="submit" id="submitBtn" class="Update-btn">수정
								완료</button>
						</div>
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
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	</script>
	<script>
		// 수정하기 버튼 클릭시 
		/* $("#submitBtn").click(function(){
			var dogName = $("#dogName");
	        var dogClass = $("#dogClass");
	        var gender = $('input[name="gender"]:checked');
	        var dogBreed = $("#dogBreed");
	        var birthdate = $("#birthdate");
	        var chipNo = $("#hipNo");
	        var weight = $("weight");
	        var notes = $("notes");
	        
	        var updatedDate ={
	                dogCode: "${requestDog.dogCode}",
	        		dogName: $("#dogName").val(),
	        		dogClass: $("#dogClass").val(),
	        		gender: $('input[name="gender"]:checked').val(),
	        		dogBreed: $("#dogBreed").val(),
	        		birthdate: $("#birthdate").val(),
	        		chipNo: $("#chipNo").val(),
	        		weight: $("#weight").val(),
	        		notes: $("#notes").val()
	        };
			
	        $.ajax({
	        	url: '${pageContext.servletContext.contextPath}/dog/update',
	        	type: 'POST',
	        	data: updatedDate,
	        	success: function(response) {
					if(response.status === 'success'){
						alert("강아지 정보가 성공적으로 수정되었습니다.");
						
						//Dom 업데이트 
						 $("#dogName").val(updatedDate.dogName);
		                 $("#dogClass").val(updatedDate.dogClass);
	                     $('input[name="gender"][value="' + updatedDate.gender + '"]').prop('checked', true);
		                 $("#dogBreed").val(updatedDate.dogBreed);
		                 $("#birthdate").val(updatedDate.birthdate);
		                 $("#chipNo").val(updatedDate.chipNo);
		                 $("#weight").val(updatedDate.weight);
		                 $("#notes").val(updatedDate.notes);
						
					}else{
						alert("강아지 정보 수정에 실패했습니다.");
					}
				},
				error: function() {
					alert("서버 오류가 발생했습니다. 다시 시동해주세요.")
				}
	        })
	        
						
		}); */
		

	</script>

	<%@ include file="../common/footer.jsp"%>
</body>
</html>
