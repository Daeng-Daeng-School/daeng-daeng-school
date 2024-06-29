<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
<title>칭찬스티커 등록화면</title>
</head>
<body>
  <header>
	  <jsp:include page="../common/menubar.jsp" />
  </header>
  <main role="main">
	  <h1>오늘 우리 댕댕이는 무엇을 잘했을까요?</h1>
	   <form action="${ pageContext.servletContext.contextPath }/sticker/insert" method="post">
	      <%--스티커코드:--%> 
	      <input type="hidden" name="stickerCode"><br>

	     반려견 이름: 
        <select name="stickerDogList">
    	    <option value="" selected disabled>선택하세요</option>
            <c:forEach items="${requestScope.stickerDogList}" var="dog">
                <option value="${dog.dogCode}">${dog.dogName}</option>
            </c:forEach>
        </select>
        <br>

	      담당선생님: 
        <select name="stickerMemberList">
	        <option value="" selected disabled>선택하세요</option>
            <c:forEach items="${requestScope.stickerMemberList}" var="member">
                <option value="${member.memberCode}">${member.memberName}</option>
            </c:forEach>
        </select>
        <br>


	      스티커개수 : 
	      <select name="stickerNum">
	         <option value="1">1개</option>
	         <option value="2">2개</option>
	         <option value="3">3개</option>
	      </select><br>
	      코멘트 : <input type="text" name="comment"><br>
	      등록일 : <input type="text" name="registDate" value="<%= todayStr %>" readonly><br>
	    
	      <input type="submit" value="등록하기">
	      
	   </form>   
  </main>
  <footer class="foter_top">
  		<jsp:include page="../common/footer.jsp" />		
  </footer> 
  
</body>
</html>