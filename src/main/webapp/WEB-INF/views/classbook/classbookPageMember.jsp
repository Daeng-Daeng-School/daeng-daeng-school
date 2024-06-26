<%@page import="com.ddschool.project.classbook.model.service.ClassbookService"
import="java.util.List"
import="com.ddschool.project.dog.model.dto.DogDTO" %>
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

<script src="${pageContext.request.contextPath }/resources/js/classbook.js"></script>
<!-- <script>
	$(document).ready(function(){
		firstClassbook();
	});
</script> -->

</head>
<body>
	<jsp:include page="../common/menubar.jsp" />
	<div class="text-area">
		<b>댕댕 유치원 출석부</b>를<br>이용해볼까요?

		<div class="select-bar">
		<form id="memberForm">
			<input type="month" id="selectedMonth" data-placeholder="연도-월 선택"
				required aria-required="true">
			<script>
			/* document.getElementById('memberForm').addEventListener('submit', function(event) {
		        event.preventDefault(); // 폼 기본 동작인 페이지 리로드를 막습니다.

		        var selectedMonth = document.getElementById('selectedMonth').value;
		        console.log('선택된 월:', selectedMonth);

		        // AJAX 요청 등으로 서버에 데이터를 전송하도록 구현합니다.
		        // 예시: $.ajax({ url: 'your_url', data: { month: selectedMonth }, ... });
		    });  */

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

				//최대 연도와 월 설정
				selectedMonthInput.setAttribute('max', maxYearMonth);

				//초기 값 설정 (현재 연도와 월을 기준으로 설정)
				selectedMonthInput.value = maxYearMonth;
				console.log('선택: ', maxYearMonth);
				console.log('선태기 ', selectedMonthInput.value);
			</script>



			<select disabled>
				<option>반 선택</option>
			</select>
			<button type="submit" class="btn-black" id="getDogMember">조회하기</button>
			</form>
		</div>
		
		<%
			int day=1;
			for(int i=1; i<=2; i++){
		%>
		<div class="table-area-member">
			<table align="center" id="listArea" class="table-con">
			<tr class="head-tr">
					<th>반려견/날짜</th>
		<%
				for(int j=1; j<=16; j++){
					
					if(day==32){
						break;
					}else{
					out.println("<th>" + day+"일"+"</th>");
					++day;
					}
				}
		%>
			</tr>
	
			</table>
			<div id="dogClassbookMember">
				<!-- 비동기 조회 출력 -->
				비동기출력창입니다
			</div>
			</div>
		<%
			}
		%>
		
		
		<% for (Map<String, Object> dogClassbook : (List<Map<String, Object>>) request.getAttribute("dogClassbookList")) { %>
                <tr>
                    <td><%= dogClassbook.get("DOG_NAME") %></td>
                    <td><%= dogClassbook.get("1일") %></td>
                    <td><%= dogClassbook.get("2일") %></td>
                    <td><%= dogClassbook.get("3일") %></td>
                    <!-- 필요한 만큼 일자 추가 -->
                    <td><%= dogClassbook.get("31일") %></td>
                </tr>
            <% } %>
		
		
		
		
		
		<!-- <div class="table-area">
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
				</tr> -->

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

				<!-- <tr>
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

			</table> -->
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
		if (document.getElementsByTagName("tr")) {

			const $trs = document.getElementsByTagName("tr");
			for (let i = 0; i < $trs.length; i++) {

				/* $tds[i].onmouseenter = function() {
					this.parentNode.style.backgroundColor = "orangered";
					this.parentNode.style.cursor = "pointer";
				}

				$tds[i].onmouseout = function() {
					this.parentNode.style.backgroundColor = "black";
				}
 */
				$trs[i].onclick = function() {
					/* 게시물 번호까지 알아왔으니 이제 상세보기는 할 수 있습니다. */
					alert(this.parentNode.children[0].innerText);
				}

			}

		}
	</script> -->



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


	<jsp:include page="../common/footer.jsp" />
</body>
</html>