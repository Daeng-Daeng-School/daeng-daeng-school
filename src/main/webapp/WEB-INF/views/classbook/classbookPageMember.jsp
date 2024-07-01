<%@page
	import="com.ddschool.project.classbook.model.service.ClassbookService"
	import="java.util.List"
	import="com.ddschool.project.dog.model.dto.DogDTO"
	import="java.util.Map" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>댕댕스쿨</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/resources/css/classbook.css">
<script>
	var contextPath = '${pageContext.servletContext.contextPath}';
</script>

<script>
    $(document).ready(function() {
        // 오늘 날짜로 기본 설정
        var today = new Date();
        var year = today.getFullYear();
        var month = (today.getMonth() + 1).toString().padStart(2, '0');
        var formattedDate = year + '-' + month;
        $('#selectedMonth').val(formattedDate);
    });
</script>

</head>
<body>
	<jsp:include page="../common/menubar.jsp" />
	<div class="text-area">
		<b>댕댕 유치원 출석부</b>를<br>이용해볼까요?

		<div class="select-bar">
			<form>
				<!-- 연도-월 선택 input -->
				<input type="month" id="selectedMonth" data-placeholder="연도-월 선택"
					required aria-required="true">

				<!-- 반 선택 select (disabled) -->
				<select disabled>
					<option>반 선택</option>
				</select>

				<!-- 조회하기 버튼 -->
				<button type="submit" class="btn-black" id="getDogMember">조회하기</button>
			</form>
		</div>


		<%-- 테이블 영역 --%>
		<div class="table-area-member">
			<table align="center" id="listArea1" class="table-con">
				<thead>
				<tr class="head-tr">
					<th>반려견/날짜</th>
					<c:forEach begin="1" end="15" var="day">
						<th>${day }일</th>
					</c:forEach>
				</tr>
				</thead>
				<tbody>
				<c:forEach var="dog" items="${dogClassbookList}">
					<tr class="body-tr">
						<td>${dog.DOG_NAME }</td>
						<c:forEach begin="1" end="15" var="day">
							<td>${dog[day]}</td>
						</c:forEach>
					</tr>
				</c:forEach>
				</tbody>
			</table>
		</div>
		
		<div class="table-area-member">
			<table align="center" id="listArea2" class="table-con">
				<thead>
				<tr class="head-tr">
					<th>반려견/날짜</th>
					<c:forEach begin="16" end="31" var="day">
						<th>${day }일</th>
					</c:forEach>
				</tr>
				</thead>
				<tbody>
				<c:forEach var="dog" items="${dogClassbookList}">
					<tr class="body-tr">
						<td>${dog.DOG_NAME }</td>
						<c:forEach begin="16" end="31" var="day">
							<td>${dog[day]}</td>
						</c:forEach>
					</tr>
				</c:forEach>
				</tbody>
			</table>
		</div>
</table>
</div> 


		<div>

			<%-- 모달 창 --%>
			<div id="myModal" class="modal">
				<div class="modal-content">
					<span class="close">&times;</span>
					<div id="modalTable">
						<table align="center" id="listArea" class="table-con">
							<tr>
								<th>출결</th>
								<%
								// 강아지 반복
								for (int i = 1; i <= 10; i++) {
									out.println("<th>강아지" + i + "</th>");
								}
								%>
							</tr>
							<tr>
								<th>출석</th>
								<%
								// 출석 여부 체크박스
								for (int i = 1; i <= 10; i++) {
									out.println("<td><input type='checkbox'></td>");
								}
								%>
							</tr>
							<tr>
								<th>결석</th>
								<%
								// 결석 여부 체크박스
								for (int i = 1; i <= 10; i++) {
									out.println("<td><input type='checkbox'></td>");
								}
								%>
							</tr>
						</table>
					</div>
					<div align="center">
						<button class="btn-black" id="submitClassbookBtn">등록하기</button>
					</div>
				</div>
			</div>

		</div>
	</div>

	<%-- 푸터 --%>
	<jsp:include page="../common/footer.jsp" />
</body>
</html>