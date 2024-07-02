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
	href="${pageContext.servletContext.contextPath}/resources/css/sticker.css">
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/resources/css/common.css">
<title>칭찬스티커 수정</title>
</head>
<body>
 <header>
	  <jsp:include page="../common/menubar.jsp" />
  </header>
  <main role="main">
   <h1 class="header-title">오늘 우리 댕댕이의<br>칭찬스티커를<br>수정해볼까요?</h1>
 
   <div class="main-body-container">
	  <div class="input_box">
      <form action="${ pageContext.servletContext.contextPath }/sticker/update" method="post">
      
        <%--스티커 no: --%>
          <input type="hidden" name="stickerCode" value="${ stickerCode }" readonly><br>   
	   	          
       
       반려견 이름 
      	<input class="input_style" type="text" name="dogName" value="${ dogName }" readonly><br>   
	       <!-- <select name="dogCode">
	         <option value="1">뽀삐</option>
	         <option value="2">순돌이</option>
	         <option value="3">복실이</option>	         
	      </select><br> -->
	      
	   담당 선생님  
	   <input class="input_style" type="text" name="memberName" value="${ memberName }" readonly><br>   
	      <!-- <select name="memberCode">	      
	         <option value="3">아이유</option>
	         <option value="4">지민</option>
	         <option value="5">정국</option>
	      </select><br> -->
	      
	   스티커 개수  	 
	      <select class="select_style" name="stickerNum">
	         <option value="1" ${stickerNum == '1' ? 'selected' : ''}>1개</option>
	         <option value="2" ${stickerNum == '2' ? 'selected' : ''}>2개</option>
	         <option value="3" ${stickerNum == '3' ? 'selected' : ''}>3개</option>
	      </select><br>
	      
	   선생님 말씀  <input class="input_style" type="text" name="comment"  value="${ comment }" readonly><br>
	   
	   수정 년월일  
	       <input class="input_style" type="text" name="registDate" value="<%= todayStr %>" readonly><br>     
	       <input class="submit-input-button" type="submit" value="수정하기">
	       
	   <%--반려견 코드 히든: --%>
	    <input type="hidden" name="dogCode" value="${ dogCode }" readonly><br>         
	    <%--선생님 코드 히든: --%>
	    <input type="hidden" name="memberCode" value="${ memberCode }" readonly><br>       
     </form>
    </div>
   </div>   
   </main>
  <footer> 
  		<jsp:include page="../common/footer.jsp" />		
  </footer> 
</body>
</html>