<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.table-area {
   margin-left:auto;
   margin-right:auto;
	}
</style>
</head>
<body> 
   <h1>칭찬스티커 등록페이지로 이동</h1>
   <a href= "${ pageContext.servletContext.contextPath }/sticker/insert">등록하기</a><br>
   <h1>칭찬스티커 등록페이지로 수정</h1>
   <a href= "${ pageContext.servletContext.contextPath }/sticker/update">수정하기</a><br>
  
  
  <h1>칭찬스티커 삭제</h1>
   <form action="${ pageContext.servletContext.contextPath }/sticker/delete" method="post">
      스티커코드: <input type="text" name="stickerCode"><br>     
      <input type="submit" value="삭제하기">
    </form>  
  
  <h1>칭찬스티커 조회</h1>
   <form action="${ pageContext.servletContext.contextPath }/sticker/list" method="post">
     등록일 : <input type="text" name="registDate"><br>     
     <input type="submit" value="조회하기">
    </form>  	
    
   <h2 align="center">우리 댕댕이를 칭찬해 볼까요?</h2>
		<div class="table-area">
			<table align="center" id="listArea">
			<tr>
				<th width="100px">NO</th>
				<th width="100px">등록일자</th>
				<th width="300px">나의 반려견</th>
				<th width="100px">오늘의 칭찬스티커</th>
				<th width="100px">담당선생님</th>
				<th width="150px">선생님말씀</th>				
			</tr>	  
		
		
			<c:forEach var="sticker" items="${ requestScope.stickerList }">
			<tr>
				<td><c:out value="${ sticker.stickerCode }"/></td>
				<td><c:out value="${ sticker.registDate }"/></td>
				<td><c:out value="${ sticker.dogCode }"/></td>
				<td><c:out value="${ sticker.stickerNum }"/></td>
				<td><c:out value="${ sticker.memberCode }"/></td>				
				<td><c:out value="${ sticker.comment }"/></td>				
			</tr>
			</c:forEach>
		  </table>
		 </div> 		
			  
</body>
</html>