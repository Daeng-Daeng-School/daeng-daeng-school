<%@page import="com.ddschool.project.classbook.model.service.ClassbookService" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>댕댕스쿨</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/resources/css/classbook.css">
</head>
<body>
	<jsp:include page="../main/main.jsp" />
	<div class="text-area">
		<b>댕댕 유치원 출석부</b>를<br>이용해볼까요?

		<div class="select-bar">
		<form action="${pagecontext.servletContext.contextPath }/classbook/admin" method="get">
			<input type="month" id="selectedMonth" data-placeholder="연도-월 선택"
				required aria-required="true">
			<script>
				const selectedMonthInput = document
						.getElementById('selectedMonth');

				//최소 연도와 월 설정
				const minYearMonth = '2020-01'; // 최소 연도와 월
				selectedMonthInput.setAttribute('min', minYearMonth);

				function getMaxYearMonth() {
					//현재 연도와 월 구하기
					const currentDate = new Date();
					const currentYear = currentDate.getFullYear();
					let currentMonth = currentDate.getMonth() + 1; // getMonth()는 0부터 시작하므로 1을 더해줍니다.
					if (currentMonth < 10) {
						currentMonth = '0' + currentMonth; // 한 자리 숫자일 경우 앞에 0을 추가하여 두 자리로 만듭니다.
					}
					return currentYear + "-" + currentMonth;
				}

				//const maxYearMonth = `${currentYear}-${currentMonth}`;
				const maxYearMonth = getMaxYearMonth();

				//document.write(minYearMonth+"/"+maxYearMonth);
				//최대 연도와 월 설정
				selectedMonthInput.setAttribute('max', maxYearMonth);

				//초기 값 설정 (현재 연도와 월을 기준으로 설정)
				selectedMonthInput.value = maxYearMonth;

			</script>

			<select>
				<%
				ClassbookService classbookService = new ClassbookService();
				int classNo = (int)classbookService.getClassName();
				switch(classNo){
				case 1:
					out.println("<option value='" + classNo +"'>"+"오전반"+"</option>"); break;
				case 2:
					out.println("<option value='" + classNo +"'>"+"오후반"+"</option>"); break;
				case 3:
					out.println("<option value='" + classNo +"'>"+"종일반"+"</option>"); break;
				}
				%>
			</select>
			
			<%-- </c:if> --%>
			<button class="btn-black" type="submit">조회하기</button>
			</form>
		</div>
		<div class="table-area">
			<table align="center" id="listArea" class="table-con">
				<tr>
					<th>날짜</th>
					<th>강아지1</th>
					<th>강아지2</th>
					<th>강아지3</th>
					<th>강아지4</th>
					<th>강아지5</th>
					<th>강아지6</th>
					<th>강아지7</th>
					<th>강아지8</th>
					<th>강아지9</th>
					<th>강아지10</th>
				</tr>

				<tr>
					<td colspan="11"><hr></td>
				</tr>
				<tr id="openModalBtn">
					<td class="list-td"></td>
					<td class="list-td"></td>
					<td class="list-td"></td>
					<td class="list-td"></td>
					<td class="list-td"></td>
					<td class="list-td"></td>
					<td class="list-td"></td>
					<td class="list-td"></td>
					<td class="list-td"></td>
					<td class="list-td"></td>
					<td class="list-td"></td>
				</tr>
				<tr>
					<td colspan="11"><hr class="hr-td"></td>
				</tr>

			</table>
		</div>

	</div>

	<div>

		<!-- 모달 창 -->
		<div id="myModal" class="modal">
			<div class="modal-content">
				<span class="close">&times;</span>
				<div id="modalTable">
					<table align="center" id="listArea" class="table-con">
						<tr>
							<th>출결</th>
							<th>강아지1</th>
							<th>강아지2</th>
							<th>강아지3</th>
							<th>강아지4</th>
							<th>강아지5</th>
							<th>강아지6</th>
							<th>강아지7</th>
							<th>강아지8</th>
							<th>강아지9</th>
							<th>강아지10</th>
						</tr>
						<tr>
							<th>출석</th>
							<td><input type="checkbox"></td>
							<td><input type="checkbox"></td>
							<td><input type="checkbox"></td>
							<td><input type="checkbox"></td>
							<td><input type="checkbox"></td>
							<td><input type="checkbox"></td>
							<td><input type="checkbox"></td>
							<td><input type="checkbox"></td>
							<td><input type="checkbox"></td>
							<td><input type="checkbox"></td>
						</tr>
						<tr>
							<th>결석</th>
							<td><input type="checkbox"></td>
							<td><input type="checkbox"></td>
							<td><input type="checkbox"></td>
							<td><input type="checkbox"></td>
							<td><input type="checkbox"></td>
							<td><input type="checkbox"></td>
							<td><input type="checkbox"></td>
							<td><input type="checkbox"></td>
							<td><input type="checkbox"></td>
							<td><input type="checkbox"></td>
						</tr>
					</table>
				</div>

				<div align="center">
					<button class="btn-black">등록하기</button>
				</div>
			</div>
		</div>

		<script
			src="${pageContext.servletContext.contextPath}/resources/js/classbook.js"></script>

	</div>
</body>
</html>