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
	<jsp:include page="../common/menubar.jsp" />
	<div class="text-area">
		<b>댕댕 유치원 출석부</b>를<br>이용해볼까요?
		<div class="select-bar">
			<input type="month" id="selectedMonth" data-placeholder="연도-월 선택" required aria-required="true">
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

				// 값이 변경될 때 이벤트 처리
				/* selectedMonthInput.addEventListener('change', function() {
					if (this.value === '') {
						// 값이 없을 때 플레이스홀더 텍스트를 보여줍니다
						this.setAttribute('data-placeholder', '연도-월 선택');
					} else {
						// 값이 있을 때 플레이스홀더 텍스트를 숨깁니다
						this.removeAttribute('data-placeholder');
					}
				}); */

				/* //사용자가 변경할 때의 처리
				selectedMonthInput.addEventListener('change', function() {
					const selectedValue = this.value; // 사용자가 선택한 값

					// 사용자가 선택한 연도와 월을 Date 객체로 변환하여 최소 연도와 월과 비교
					const selectedDate = new Date(selectedValue);
					const minDate = new Date(minYearMonth);
					const maxDate = new Date(maxYearMonth);

					// 최소값보다 작으면 최소값으로 설정
					if (selectedDate < minDate) {
						this.value = minYearMonth;
					}

					//최대값보다 크면 최대값으로 설정
					if (selectedDate > maxDate) {
						this.value = maxYearMonth;
					}
				}); */
			</script>



			<select>
				<option value="class1">오전반</option>
				<option value="class2">오후반</option>
				<option value="class3">종일반</option>
			</select>
			<button class="btn-black">조회하기</button>
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
				
				<%-- <c:forEach var="board" items="${ requestScope.boardList }">
					<tr>
						<td><c:out value="${ board.no }" /></td>
						<td><c:out value="${ board.category.name }" /></td>
						<td><c:out value="${ board.title }" /></td>
						<td><c:out value="${ board.writer.nickname }" /></td>
						<td><c:out value="${ board.count }" /></td>
						<td><c:out value="${ board.createdDate }" /></td>
					</tr>
				</c:forEach> --%>
			</table>
			<hr>
			<hr class="hr-td">
			<hr class="hr-td">
			<hr class="hr-td">
			<hr class="hr-td">
			<hr class="hr-td">
		</div>

		<%-- 페이지 처리 --%>
		<%-- <jsp:include page="../common/paging.jsp" />

		<!-- 검색 폼 -->
		<div class="search-area" align="center">
			<form id="loginForm"
				action="${ pageContext.servletContext.contextPath }/board/list"
				method="get" style="display: inline-block">
				<input type="hidden" name="currentPage" value="1"> <select
					id="searchCondition" name="searchCondition">
					<option value="category"
						${ requestScope.selectCriteria.searchCondition eq "category"? "selected": "" }>카테고리</option>
					<option value="writer"
						${ requestScope.selectCriteria.searchCondition eq "writer"? "selected": "" }>작성자</option>
					<option value="title"
						${ requestScope.selectCriteria.searchCondition eq "title"? "selected": "" }>제목</option>
					<option value="content"
						${ requestScope.selectCriteria.searchCondition eq "content"? "selected": "" }>내용</option>
				</select> <input type="search" id="searchValue" name="searchValue"
					value="<c:out value="${ requestScope.selectCriteria.searchValue }"/>">

				<button type="submit">검색하기</button>
			</form>
			<c:if test="${ !empty sessionScope.loginMember }">
				<button id="writeBoard">작성하기</button>
			</c:if>
		</div> --%>
	</div>
	<!-- <script>
		if (document.getElementsByTagName("td")) {

			const $tds = document.getElementsByTagName("td");
			for (let i = 0; i < $tds.length; i++) {

				$tds[i].onmouseenter = function() {
					this.parentNode.style.backgroundColor = "orangered";
					this.parentNode.style.cursor = "pointer";
				}

				$tds[i].onmouseout = function() {
					this.parentNode.style.backgroundColor = "black";
				}

				$tds[i].onclick = function() {
					/* 게시물 번호까지 알아왔으니 이제 상세보기는 할 수 있습니다. */
					alert(this.parentNode.children[0].innerText);
				}

			}

		}
	</script> -->
	<jsp:include page="../common/footer.jsp" />
</body>
</html>