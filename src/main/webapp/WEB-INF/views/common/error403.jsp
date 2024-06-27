<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Access Denied</title>
</head>
<body>

	<script>
	const message = "<%= request.getAttribute("accessDeniedMessage") != null ? request.getAttribute("accessDeniedMessage") : "" %>";
	if (message) {
	    alert(message);
	    request.removeAttribute("accessDeniedMessage");
	} 
	window.location.replace("${pageContext.servletContext.contextPath}");
	</script>

	<jsp:include page="../common/menubar.jsp" />
	<h1 align="center">ErrorCode 403: 요청 권한이 없는 페이지 입니다.</h1>
</body>
</html>