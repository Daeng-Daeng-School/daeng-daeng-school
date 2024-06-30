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
<script
	src="${pageContext.request.contextPath }/resources/js/classbook.js"></script>
<script>
	var contextPath = '${pageContext.servletContext.contextPath}';
</script>

</head>
<body>
	<jsp:include page="../main/main.jsp" />
	<div class="text-area">
		<b>댕댕 유치원 출석부</b>를<br>이용해볼까요?

		<div class="select-bar">
			<form>
				<!-- 연도-월 선택 input -->
				<input type="month" id="selectedMonth">

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
						<td class="list-td">${dog.DOG_NAME }</td>
						<c:forEach begin="1" end="15" var="day">
							<td class="list-td">${dog[day]}</td>
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
						<td class="list-td">${dog.DOG_NAME }</td>
						<c:forEach begin="16" end="31" var="day">
							<td class="list-td">${dog[day]}</td>
						</c:forEach>
					</tr>
				</c:forEach>
				</tbody>
			</table>
		</div>
				

		<%-- <% for (Map<String, Object> dogClassbook : (List<Map<String, Object>>) request.getAttribute("dogClassbookList")) { %>
                <tr>
                    <td><%= dogClassbook.get("DOG_NAME") %></td>
                    <td><%= dogClassbook.get("1일") %></td>
                    <td><%= dogClassbook.get("2일") %></td>
                    <td><%= dogClassbook.get("3일") %></td>
                    <!-- 필요한 만큼 일자 추가 -->
                    <td><%= dogClassbook.get("31일") %></td>
                </tr>
            <% } %> --%>


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
					<td class="list-td">왜</td>
					<td class="list-td">안되고</td>
					<td class="list-td">그러니</td>
					<td class="list-td">제발</td>
					<td class="list-td">되려무나</td>
					<td class="list-td">헬프미</td>
					<td class="list-td">우와</td>
					<td class="list-td">머지</td>
					<td class="list-td">좋겠다</td>
					<td class="list-td">에휴</td>
					<td class="list-td">모달안돼</td>
				</tr>
				<tr>
					<td colspan="11"><hr class="hr-td"></td>
				</tr>

			</table> 
	</div>  -->


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
		</div> 
	</div> --%>


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




		<%-- <div>

			모달 창
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

		</div> --%>
	</div>
</body>
</html>