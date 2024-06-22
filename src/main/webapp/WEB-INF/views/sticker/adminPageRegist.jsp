<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <h1>칭찬스티커 등록</h1>
   <form action="${ pageContext.servletContext.contextPath }/sticker/insert" method="post">
      스티커코드: <input type="text" name="stickerCode"><br>
      도그코드: <input type="text" name="dogCode"><br>
      회원코드: <input type="text" name="memerCode"><br>
      스티커개수 : 
      <select name="stickerNum">
         <option value="1">1개</option>
         <option value="2">2개</option>
         <option value="3">3개</option>
      </select><br>
      코멘트 : <input type="text" name="comment"><br>
      등록일 : <input type="text" name="registDate"><br>
      <input type="submit" value="등록하기">
   </form>   
  
</body>
</html>