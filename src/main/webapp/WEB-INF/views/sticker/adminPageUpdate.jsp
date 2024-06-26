<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
    Date today = new Date();
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    String todayStr = sdf.format(today);
%>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/resources/css/CssStickerAdminPage.css">
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/resources/css/common.css">
<title>칭찬스티커 수정</title>
</head>
<body>
 <header>
	  <jsp:include page="../common/menubar.jsp" />
  </header>
  <main role="main">
 <h1>우리 댕댕이의 칭찬스티커를 수정해 볼까요?</h1>
   <form action="${ pageContext.servletContext.contextPath }/sticker/update" method="post">
      스티커 no:
          <input type="text" name="stickerCode" value="1" readonly><br>     
	          
       
      반려견 이름:
	       <select name="dogCode">
	         <option value="1">뽀삐</option>
	         <option value="2">순돌이</option>
	         <option value="3">복실이</option>
	      </select><br>
	      
	   담당 선생님: 
	      <select name="memberCode">
	         <option value="3">아이유</option>
	         <option value="4">지민</option>
	         <option value="5">정국</option>
	      </select><br>
	      
	   스티커개수 : 
	      <select name="stickerNum">
	         <option value="1">1개</option>
	         <option value="2">2개</option>
	         <option value="3">3개</option>
	      </select><br>
	      
	   코멘트 : <input type="text" name="comment"><br>
	   수정일 : 
	       <input type="text" name="registDate" value="<%= todayStr %>" readonly>
	       <input type="submit" value="수정하기">
   </form>
   </main>
  <footer class="foter_top">
  		<jsp:include page="../common/footer.jsp" />		
  </footer> 
</body>
</html>