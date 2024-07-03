<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <!-- 공통 메뉴바 포함 -->
    <jsp:include page="../common/menubar.jsp" />
    <script>
        // 서버로부터 전달된 인증 실패 메시지를 가져옴
        const message = "<%= request.getAttribute("authFailMessage") != null ? request.getAttribute("authFailMessage").toString().replace("\"", "\\\"") : "" %>";
        // 메시지가 있을 경우 경고창을 띄움
        if (message) {
            alert(message);
        } 
        // 컨텍스트 경로로 페이지 이동
        window.location.replace("<%= request.getContextPath() %>");
    </script>
</body>
</html>
<%
    // 인증 실패 메시지를 요청에서 제거
    if (request.getAttribute("authFailMessage") != null) {
        request.removeAttribute("authFailMessage");
    }
%>
