<%@page
	import="com.ddschool.project.classbook.model.service.ClassbookService"
	import="java.util.List"
	import="com.ddschool.project.dog.model.dto.DogDTO"
	import="java.util.Map" %>
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

<script
	src="${pageContext.request.contextPath }/resources/js/classbook.js"></script>
<script>
	var contextPath = '${pageContext.servletContext.contextPath}';
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


		<%-- 반복 테이블 영역 --%>
		<div class="table-area-member">
			<table align="center" id="listArea" class="table-con">
				<tr class="head-tr">
					<th>반려견/날짜</th>
					<%
					// 일자 반복
					for (int i = 1; i <= 15; i++) {
						out.println("<th>" + i + "일" + "</th>");
					}
					%>
				</tr>
				
				<%-- <% 
				// 데이터를 LinkedHashMap 타입으로 받음
				List<Map<String, Object>> dogs = (List<Map<String, Object>>) request.getAttribute("dogs");
				
        // 각각의 강아지 데이터를 반복적으로 출력
        for (Map<String, Object> dog : dogs) {
        %>
        <tr>
            <td><%= dog.get("DOG_NAME") %></td>
            <% 
            // 각각의 날짜에 대해 출석 상태를 확인하여 출력
            for (int i = 1; i <= 15; i++) {
                String status = (String) dog.get(String.valueOf(i) + "일");
                out.println("<td>" + status + "</td>");
            }
            %>
        </tr>
        <% } %> --%>
				
				
			<%-- 데이터 출력 --%>
            <%
            @SuppressWarnings("unchecked")
            List<Map<String, Object>> dataList = (List<Map<String, Object>>) request.getAttribute("dogClassbookList");
            out.println(dataList);
            if (dataList != null && !dataList.isEmpty()) {
                for (Map<String, Object> dogData : dataList) {
                    String dogName = (String) dogData.get("DOG_NAME");
            %>
            <tr>
                <td><%= dogName %></td>
                <%-- 1일부터 15일까지의 데이터 출력 --%>
                <% for (int i = 1; i <= 15; i++) { %>
                    <% String dayKey = i + "일"; %>
                    <td><%= dogData.get(dayKey) %></td>
                <% } %>
            </tr>
            <% 
                } // end for
            } // end if
            %>	
				
				
				
				
				
				
				
				
				<%--
				<!-- 비동기 조회 출력 -->
				여기서 서블릿에서 전달받은 데이터를 사용하여 초기 데이터를 출력할 수 있음
				예시로 초기 데이터를 출력
				
				<%
					// 데이터를 LinkedHashMap 타입으로 받음
					List<Map<String, Object>> dogs1 = (List<Map<String, Object>>) request.getAttribute("dogs");

				// 각각의 LinkedHashMap 데이터에 대해 처리
					for (Map<String, Object> dog : dogs1) {
				
						out.println("<tr>");
						
					// DOG_NAME 출력
					out.println("<td>" + dog.get("DOG_NAME") + "</td>");

					// 1일부터 15일까지의 데이터 출력

					for (int j = 1; j <= 15; j++) {

					String status = (String) dog.get(String.valueOf(j));
					out.println("<td>" + status + "</td>");
					}
					
				out.println("</tr>");

				}
				%> --%>
</table>
</div>

<div class="table-area-member">
			<table align="center" id="listArea" class="table-con">
				<tr class="head-tr">
					<th>반려견/날짜</th>
					<%
					// 일자 반복
					for (int i = 16; i <= 31; i++) {
						out.println("<th>" + i + "일" + "</th>");
					}
					%>
				</tr>
				<%--
				<!-- 비동기 조회 출력 -->
				여기서 서블릿에서 전달받은 데이터를 사용하여 초기 데이터를 출력할 수 있음
				예시로 초기 데이터를 출력
				
				<%
					// 데이터를 LinkedHashMap 타입으로 받음
					List<Map<String, Object>> dogs2 = (List<Map<String, Object>>) request.getAttribute("dogs");

				// 각각의 LinkedHashMap 데이터에 대해 처리
					for (Map<String, Object> dog : dogs2) {
				
						out.println("<tr>");
						
					// DOG_NAME 출력
					out.println("<td>" + dog.get("DOG_NAME") + "</td>");

					// 1일부터 15일까지의 데이터 출력

					for (int j = 16; j <= 31; j++) {

					String status = (String) dog.get(String.valueOf(j));
					out.println("<td>" + status + "</td>");
					}
					
				out.println("</tr>");

				}
				%>--%>
</table>
</div> 




<%-- 




















		반복 테이블 영역
		<%
		int day = 1;
		for (int i = 1; i <= 2; i++) {
		%>
		<div class="table-area-member">
			<table align="center" id="listArea" class="table-con">
				<tr class="head-tr">
					<th>반려견/날짜</th>
					<%
					// 일자 반복
					for (int j = 1; j <= 15; j++) {

						out.println("<th>" + day + "일" + "</th>");
						++day;

					}
					if (day == 31) {
						out.println("<th>" + day + "일" + "</th>");
					}
					%>
				</tr>








</table>

<div id="dogClassbookMember">
				<!-- 비동기 조회 출력 -->
				여기서 서블릿에서 전달받은 데이터를 사용하여 초기 데이터를 출력할 수 있음
				예시로 초기 데이터를 출력
				비동기출력창입니다
				<tr>
					<%
					int index = 1;
					// 데이터를 LinkedHashMap 타입으로 받음
					List<Map<String, Object>> dogs = (List<Map<String, Object>>) request.getAttribute("dogs");

					// 각각의 LinkedHashMap 데이터에 대해 처리
					for (Map<String, Object> dog : dogs) {
						// DOG_NAME 출력

						out.println("<td>" + dog.get("DOG_NAME") + "</td>");

						// 1일부터 15일까지의 데이터 출력

						for (int j = 1; j <= 15; j++) {

							String status = (String) dog.get(String.valueOf(index));
							out.println("<td>" + status + "</td>");
							++index;
						}

						out.println("</tr>");
					}
					%>


					<c:forEach var="dogInfo" items="${dogClassbookList}">
				<div>${dogInfo.dogName}</div>
				<c:forEach var="checkStatus" items="${dogInfo.checkStatusList}">
					<div>${checkStatus}</div>
				</c:forEach>
			</c:forEach>
			</div>



		</div>
		<%
		}
		%>

 --%>



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

		<%-- 	<script
			src="${pageContext.servletContext.contextPath}/resources/js/classbook.js"></script> --%>

	</div>

	<%-- 푸터 --%>
	<jsp:include page="../common/footer.jsp" />
</body>
</html>