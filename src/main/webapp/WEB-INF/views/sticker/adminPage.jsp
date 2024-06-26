<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
<!DOCTYPE html>
<html>
<head> 	
<meta charset="UTF-8">
<title>칭찬스티커 서비스</title>
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/resources/css/CssStickerAdminPage.css">
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/resources/css/common.css">
</head>
<body>
	<header>
		<jsp:include page="../common/menubar.jsp" />     
	</header>

  	<main role="main">
  		<div class="sticker-header-content sticker-container">
			<h2>
				우리 댕댕이를 <br> 칭찬합니다.
			</h2>

			<form action="${ pageContext.servletContext.contextPath }/sticker/list" method="get" 
			  class="container-item">
				<select id="selectbox" name="registDate">
					<option value="none">=== 선택 ===</option>
					<option value="202401">2024년 1월</option>
					<option value="202402">2024년 2월</option>
					<option value="202403">2024년 3월</option>
					<option value="202404">2024년 4월</option>
					<option value="202405">2024년 5월</option>
					<option value="202406">2024년 6월</option>
					<option value="202407" selected>2024년 7월</option>
				</select>
				<button type="submit">조회하기</button>
			</form>
			<form action="${ pageContext.servletContext.contextPath }/sticker/insert" method="get">
				<button type="submit">등록하기</button>
			</form>
			
			<%--수정하기 버튼test임(추후 삭제) --%>
		     <form action="${ pageContext.servletContext.contextPath }/sticker/update" method="get">
			 <button type="submit">수정하기 test</button>
			</form>
			
  		</div>
  		
  		<div class="main-body-container">
	  		<section class="left_box">
	    	     <h2>이달의 칭찬 스티커 랭킹</h2>
	        	 여기에 왼쪽 컬럼의 내용을 작성합니다.
	  		</section>
	 
		    <section class="right_box">
	        	<h2>우리 댕댕이를 칭찬해 볼까요?</h2>
	            <table align="center" id="listArea">
	            	<tr>
	                	<th>NO</th>
	                  	<th>등록일자</th>
	                  	<th>나의 반려견</th>
	                  	<th>오늘의 칭찬스티커</th>
	                  	<th>담당 선생님</th>
	                  	<th>선생님말씀</th>
	               	</tr>
	               
	               	<c:forEach var="sticker" items="${ requestScope.stickerList }">
						<tr>
							<td align="center"><c:out value="${ sticker.stickerCode }"/></td>
							<td align="center"><c:out value="${ sticker.registDate }"/></td>
							<td align="center"><c:out value="${ sticker.dogCode }"/></td>
							<td align="center"><c:out value="${ sticker.stickerNum }"/></td>
							<td align="center"><c:out value="${ sticker.memberCode }"/></td>				
							<td align="center"><c:out value="${ sticker.comment }"/></td>
							<td>
								<button id="updateButton" onClick="updatePost()">수정</button>
								<button id="deleteButton" onClick="deletePost()">삭제</button>
							</td>
							<td><input type="button" class="checkBtn" value="클릭"/></td>
											
						</tr>
					</c:forEach>
	            </table>
		     </section>   		
  		</div>
   		
  	</main>
    
    <footer class="foter_top">
		<jsp:include page="../common/footer.jsp" />		
	</footer> 
	
	<script>
		function updatePost() {
			alert('update button click');
		}
		
		$(".checkBtn").click(function(){ 	

			alert('checkBtn click');
		} 		
		/*
		
		$(".checkBtn").click(function(){ 	
				
			var str = ""
			var tdArr = new Array();	// 배열 선언
			var checkBtn = $(this);
			// checkBtn.parent() : checkBtn의 부모는 <td>이다.
			// checkBtn.parent().parent() : <td>의 부모이므로 <tr>이다.
			var tr = checkBtn.parent().parent();
			var td = tr.children();
				
			alert("클릭한 Row의 모든 데이터 : "+tr.text());
				
			var no = td.eq(0).text();
			var userid = td.eq(1).text();
			var name = td.eq(2).text();
			var email = td.eq(3).text();
		} 
		*/
	</script>
	
</body>
     
</html> 
  
