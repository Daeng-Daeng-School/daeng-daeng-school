<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>알림장 작성</title>
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/notice.css">
    <!-- TinyMCE CDN -->
    <script src="https://cdn.tiny.cloud/1/mzvas2qdd6hui8ybi2mm7apd9x54xg7n8922fz9yypn13yhv/tinymce/5/tinymce.min.js" referrerpolicy="origin"></script>
    <script src="${pageContext.servletContext.contextPath}/resources/js/notice.js"></script>
</head>
<body>
    <jsp:include page="../common/menubar.jsp" />
    <main class="main-content">
        <div class="container">
            <div class="question-box">
                <div class="notice-header">
                    <p class="noticeTitle">
                        <span style="font-weight: 900;">댕댕스쿨</span>에서는<br> 무엇을 할까요?
                    </p>
                    <div class="button-section">
                        <button type="submit" form="postForm" class="write-post-button">작성하기</button>
                    </div>
                </div>
            </div>
            <div class="table-area">
                <form id="postForm" action="${pageContext.servletContext.contextPath}/notice/insert" method="post">
                    <jsp:include page="../notice/selectDog.jsp" />
                    <div class="outer-notice-insert">
                        <div class="header-row">
                            <div class="author">
                                <input type="text" name="writerName" value="2">
                            </div>
                            <div class="createdDate">
                                <input type="text" name="createdDate" value="<%=new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date())%>">
                            </div>
                        </div>
                        <h2 class="title">
                            제목 :<input type="text" name="title" placeholder="제목을 입력하세요.">
                        </h2>
                        <div class="content-box">
                            <textarea name="body" id="editor" cols="60" rows="15" placeholder="내용을 입력하세요."></textarea>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </main>
    <jsp:include page="../common/footer.jsp" />
</body>
</html>
