<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../common/menubar.jsp" />
	<script>
	const message = "<%= request.getAttribute("authFailMessage") != null ? request.getAttribute("authFailMessage") : "" %>";
	if (message) {
	    alert(message);
	    request.removeAttribute("authFailMessage");
	} 
	window.location.replace("${pageContext.servletContext.contextPath}");
	</script>
</body>
</html>