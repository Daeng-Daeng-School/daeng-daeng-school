<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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


				<!-- 반 선택 select-->
				<!-- 마스터 -->
				<%-- 	<c:if test="${ sessionScope.loginMember.roleCode == 1}"> --%>
				<select id="selectedClass">
					<option value="1" selected>오전반</option>
					<option value="2">오후반</option>
					<option value="3">종일반</option>
				</select>
				<%-- </c:if> --%>


				<%-- 			<c:choose>
						<c:when test="${ sessionScope.loginMember.roleCode == 1}">
							<button class="btn"><a href="${pageContext.servletContext.contextPath}/master/mypage">정보수정</a></button>
						</c:when>
						<c:when test="${ sessionScope.loginMember.roleCode == 2}">
							<button class="btn"><a href="${pageContext.servletContext.contextPath}/teacher/mypage">정보수정</a></button>
						</c:when>
						<c:when test="${ sessionScope.loginMember.roleCode == 3}">
							<button class="btn"><a href="${pageContext.servletContext.contextPath}/member/mypage">정보수정</a></button>
						</c:when>
						</c:choose> --%>






				<!-- 선생님 -->
				<%-- <c:if test="${ sessionScope.loginMember.roleCode == 2}">
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
			</select> --%>

				<%-- </c:if> --%>

				<!-- 조회하기 버튼 -->
				<button type="submit" class="btn-black" id="getDogAdmin">조회하기</button>
			</form>
		</div>


		<%-- 테이블 영역 --%>
		<div class="table-area">
			<table align="center" id="listArea" class="table-con">
				<%-- <thead>
				<tr class="head-tr">
					<th>날짜/반려견</th>
					<c:forEach begin="1" end="10" var="dog">

						<th>강아지${dog }</th>
						
					</c:forEach>
				
				</tr>
				</thead> --%>

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
				<!-- <tbody> -->

				<%-- 			<c:forEach begin="1" end="31" var="day">
								<tr id="openModalBtn">
						<td>${day }일</td>
						
						<c:forEach begin="1" end="10" var="status">
						<td class="list-td">${status }출결</td>
						</c:forEach>
				
					
				</tr>
					</c:forEach> --%>

				<%-- 		<c:forEach var="dog" items="${classbookList}">
					<tr class="body-tr">
						<td class="list-td">${dog.CHECK_DATE }일</td>
						<c:forEach begin="1" end="${ dog.length}" var="day">
							<td class="list-td">${dog[day]}</td>
						</c:forEach>
					</tr>
				</c:forEach> --%>

				<!-- 	</tbody> -->



				<c:forEach var="classbook" items="${results }">

					<thead>
						<tr class="head-tr">
							<th>날짜/반려견</th>

							<c:forEach var="entry" items="${classbook }">
								<c:if test="${!entry.key.equals('CHECK_DATE')}">
									<th data-name="${entry.key }">${entry.key }</th>
								</c:if>

							</c:forEach>
						</tr>
					</thead>
					<tbody>
						<c:forEach begin="1" end="31" var="day">
							<tr class="body-tr" data-id="${day }">
								<td>${day }일</td>

								<c:forEach var="entry" items="${classbook}">
									<c:choose>
										<c:when
											test="${entry.key == 'CHECK_DATE' && entry.value == day}">
											<c:forEach var="subEntry" items="${classbook}">
												<c:if test="${!subEntry.key.equals('CHECK_DATE')}">
													<c:if test="${subEntry.value != null}">
														<td data-content="${subEntry.value }">${subEntry.value}</td>
													</c:if>
													<c:if test="${subEntry.value == null}">
														<td data-content=""></td>
													</c:if>
												</c:if>
											</c:forEach>
										</c:when>
										<c:when
											test="${entry.key == 'CHECK_DATE' && entry.value != day}">
											<td data-content=""></td>
										</c:when>
									</c:choose>
								</c:forEach>


							</tr>
						</c:forEach>

					</tbody>

				</c:forEach>

				<!-- <thead>
				<tr class="head-tr">
					<th>날짜/반려견</th>
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
				</thead>
				<tbody>
				<tr class="body-tr" id="openModalBtn">
					<td>1일</td>
					<td>Y</td>
					<td>N</td>
					<td>N</td>
					<td>Y</td>
					<td>Y</td>
					<td>Y</td>
					<td>N</td>
					<td>N</td>
					<td>Y</td>
					<td>N</td>

				</tr>
				<tr class="body-tr" id="openModalBtn">
					<td>2일</td>
					<td>N</td>
					<td>N</td>
					<td>Y</td>
					<td>Y</td>
					<td>Y</td>
					<td>N</td>
					<td>Y</td>
					<td>Y</td>
					<td>N</td>
					<td>Y</td>

				</tr>
				
				</tbody> -->

			</table>
		</div>


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
				
				
	<form id="editForm">
            <input type="hidden" id="postId" name="postId">
            <div id="modalTable">
                <table align="center" id="listAreaModal" class="table-con">
                    <thead>
                        <tr>
                            <th>출결</th>
                            <c:forEach var="entry" items="${classbook}">
                                <c:if test="${!entry.key.equals('CHECK_DATE')}">
                                    <th>강아지 ${entry.key}</th>
                                </c:if>
                            </c:forEach>
                        </tr>
                    </thead>
                    <tbody id="modalTableBody">
                        <tr id="attendanceRow">
                            <td>출석</td>
                            <c:forEach var="entry" items="${classbook}">
                                <c:if test="${!entry.key.equals('CHECK_DATE')}">
                                    <td><input type="checkbox" name="attendance" value="Y"></td>
                                </c:if>
                            </c:forEach>
                        </tr>
                        <tr id="absenceRow">
                            <td>결석</td>
                            <c:forEach var="entry" items="${classbook}">
                                <c:if test="${!entry.key.equals('CHECK_DATE')}">
                                    <td><input type="checkbox" name="attendance" value="N"></td>
                                </c:if>
                            </c:forEach>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div align="center">
                <button type="button" class="btn-black" id="submitClassbookBtn">등록하기</button>
                <button type="button" class="btn-black" id="editClassbookBtn">수정하기</button>
                <button type="button" class="btn-black" id="deleteClassbookBtn">삭제하기</button>
            </div>
        </form>
	
	
	
	
	
	
				<%-- <div id="modalTable">
					<!-- <form id="attendanceForm"> -->
					<table align="center" id="listAreaModal" class="table-con">
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
								out.println("<td><input type='checkbox' name='attendance' value='Y'></td>");
								/* 	out.println("<td><input type='checkbox' name='attendance' value='attend-" + i + "'></td>"); */
							}
							%>
						</tr>
						<tr>
							<th>결석</th>
							<%
							// 결석 여부 체크박스
							for (int i = 1; i <= 10; i++) {
								out.println("<td><input type='checkbox' name='attendance' value='N'></td>");
							}
							%>
						</tr>
					</table>
				</div>
				<div align="center">
					<button class="btn-black" id="submitClassbookBtn">등록하기</button>
					<button class="btn-black" id="editClassbookBtn">수정하기</button>
					<button class="btn-black" id="deleteClassbookBtn">삭제하기</button>
				</div> --%>
			</div>
		</div>
		
		
		
		<div id="myModal" class="modal">
    <div class="modal-content">
        <span class="close">&times;</span>
        <h2>강아지 출결 정보 수정 및 삭제</h2>
        <form id="editForm">
            <input type="hidden" id="postId" name="postId">
            <div id="modalTable">
                <table align="center" id="listAreaModal" class="table-con">
                    <thead>
                        <tr>
                            <th>출결</th>
                            <c:forEach var="entry" items="${classbook}">
                                <c:if test="${!entry.key.equals('CHECK_DATE')}">
                                    <th>강아지 ${entry.key}</th>
                                </c:if>
                            </c:forEach>
                        </tr>
                    </thead>
                    <tbody id="modalTableBody">
                        <tr id="attendanceRow">
                            <td>출석</td>
                            <c:forEach var="entry" items="${classbook}">
                                <c:if test="${!entry.key.equals('CHECK_DATE')}">
                                    <td><input type="checkbox" name="attendance" value="Y"></td>
                                </c:if>
                            </c:forEach>
                        </tr>
                        <tr id="absenceRow">
                            <td>결석</td>
                            <c:forEach var="entry" items="${classbook}">
                                <c:if test="${!entry.key.equals('CHECK_DATE')}">
                                    <td><input type="checkbox" name="attendance" value="N"></td>
                                </c:if>
                            </c:forEach>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div align="center">
                <button type="button" class="btn-black" id="submitClassbookBtn">등록하기</button>
                <button type="button" class="btn-black" id="editClassbookBtn">수정하기</button>
                <button type="button" class="btn-black" id="deleteClassbookBtn">삭제하기</button>
            </div>
        </form>
    </div>
</div>
		
		
		
		
		

	</div>



</body>
</html>