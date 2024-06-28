<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
				<div class="dog-info">

					<div class="text_1">
						<h1>
							나의 반려견 정보를 <br>수정하세요.
						</h1>
					</div>

					<form action="${pageContext.servletContext.contextPath}/dog/update"
						method="post">
						<table class="dog-table">
							<tbody>
								<c:forEach var="dog" items="${dogList}">
									<tr>
										<th>이름</th>
										<td><input type="text" name="dogName"
											value="${dog.dogName}" required></td>
									</tr>
									<tr>
										<th>품종</th>
										<td><input type="text" name="dogBreed"
											value="${dog.dogBreed}" required></td>
									</tr>
									<tr>
										<th>성별</th>
										<td><select name="gender" required>
												<option value="male"
													<c:if test="${dog.gender eq 'male'}">selected</c:if>>수컷</option>
												<option value="female"
													<c:if test="${dog.gender eq 'female'}">selected</c:if>>암컷</option>
										</select></td>
									</tr>
									<tr>
										<th>생년월일</th>
										<td><input type="date" name="birth" value="${dog.birth}"
											required></td>
									</tr>
									<tr>
										<th>칩 번호</th>
										<td><input type="text" name="chipNo"
											value="${dog.chipNo}" required></td>
									</tr>
									<tr>
										<th>몸무게</th>
										<td><input type="number" name="weight"
											value="${dog.weight}" required></td>
									</tr>
									<tr>
										<th>특이사항</th>
										<td><textarea name="notes" rows="3">${dog.notes}</textarea></td>
									</tr>
									<tr>
										<td colspan="2" style="text-align: center;"><input
											type="hidden" name="dogId" value="${dog.dogId}">
											<button type="submit">수정하기</button></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</form>
				</div>
			</div>
		</div>
	</div>

	<%@ include file="../common/footer.jsp"%>
</body>
</html>


<!-- 삭제 모달 -->
<div id="delete-modal" class="modal">
	<div class="modal-content">
		<span class="close-button" id="close-modal">&times;</span>
		<p>정말로 강아지 정보를 삭제하시겠습니까?</p>
		<button id="confirm-delete">확인</button>
		<button id="cancel-delete">취소</button>
	</div>
</div>

<script src="script.js"></script>