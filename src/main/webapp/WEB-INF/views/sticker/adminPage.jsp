<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
<!DOCTYPE html>
<html>
<head> 	
<meta charset="UTF-8">
<title>칭찬스티커 메인화면</title>
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/resources/css/CssStickerAdminPage.css">
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/resources/css/common.css">
<script
   src="${pageContext.servletContext.contextPath}/resources/js/JsStickerAdminPage.js"></script>
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
        		<option value="none" ${registDate == 'none' ? 'selected' : ''}>=== 선택 ===</option>
       			<option value="202401" ${registDate == '202401' ? 'selected' : ''}>2024년 1월</option>
		        <option value="202402" ${registDate == '202402' ? 'selected' : ''}>2024년 2월</option>
		        <option value="202403" ${registDate == '202403' ? 'selected' : ''}>2024년 3월</option>
		        <option value="202404" ${registDate == '202404' ? 'selected' : ''}>2024년 4월</option>
		        <option value="202405" ${registDate == '202405' ? 'selected' : ''}>2024년 5월</option>
		        <option value="202406" ${registDate == '202406' ? 'selected' : ''}>2024년 6월</option>
		        <option value="202407" ${registDate == '202407' ? 'selected' : ''}>2024년 7월</option>        
		        
    			</select>
				<button type="submit">조회하기</button>
			</form>
			
			
			<form action="${ pageContext.servletContext.contextPath }/sticker/insert" method="get">
				<button type="submit">등록하기</button>
			</form>
			
			<%--수정하기 버튼test임(추후 삭제) --%>
		     <%-- 
		     <form action="${ pageContext.servletContext.contextPath }/sticker/update" method="get">
			 <button type="submit">수정하기 test</button>			 
			 </form>
			--%>
			
  		</div>
  		
  		<div class="main-body-container">
	  		<section class="left_box">
	    	     <h2>이달의 칭찬 스티커 랭킹</h2>
	    	     <table align="center">  	    
	        	    <c:forEach var="sticker" items="${ requestScope.stickerRank }">
					<tr>					
					<td align="center"><c:out value="${ sticker.ranking }"/></td>
					<td align="center"><c:out value="${ sticker.dogName }"/></td>
					<td align="center"><c:out value="${ sticker.totalStickers }"/><br></td>				
																				
					</tr>
					</c:forEach>
					</table>
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
	               
               		
	               	<c:forEach var="sticker" items="${ requestScope.stickerList }" varStatus="status">
						<tr>
							<td align="center">${status.index + 1}</td>					
							
							<td align="center"><c:out value="${ sticker.registDate }"/></td>
							<td align="center"><c:out value="${ sticker.dogCode }"/></td>
							<td align="center"><c:out value="${ sticker.stickerNum }"/></td>
							<td align="center"><c:out value="${ sticker.memberCode }"/></td>				
							<td align="center"><c:out value="${ sticker.comment }"/></td>
							<td>							
							<input type="hidden" class="stickerCode" value="${sticker.stickerCode}">
							
								<button id="updateButton" onClick="updatePost(${ sticker.stickerCode })">수정</button>
								<button id="deleteButton" onClick="deletePost(${ sticker.stickerCode })">삭제</button> 	
							</td>						
									
						</tr>
					</c:forEach>
					
	            </table>
		     </section>   		
  		</div>
   		
  	</main>
    
    <footer class="foter">
		<jsp:include page="../common/footer.jsp" />		
	</footer> 
	
	<script>	
	
    function deletePost(stickerCode) {
        if (confirm("정말로 삭제하시겠습니까?")) {
        	 const form = document.createElement('form');
        	  form.method = 'post';
        	  form.action = '/ddschool/sticker/delete';
        	      const hiddenField = document.createElement('input');
        	      hiddenField.type = 'hidden';
        	      hiddenField.name = 'stickerCode';
        	      hiddenField.value = stickerCode;
        	      form.appendChild(hiddenField);
        	 
        	  document.body.appendChild(form);
        	  form.submit();
        }
    }		
		
		
	</script>
	
</body>
     
</html> 
  
