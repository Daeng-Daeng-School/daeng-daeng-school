<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body> 
   <h1>칭찬스티커 등록페이지로 이동</h1>
   <a href= "${ pageContext.servletContext.contextPath }/sticker/insert">등록하기</a><br>
   <h1>칭찬스티커 등록페이지로 수정</h1>
   <a href= "${ pageContext.servletContext.contextPath }/sticker/update">수정하기</a>
  
</body>
</html>