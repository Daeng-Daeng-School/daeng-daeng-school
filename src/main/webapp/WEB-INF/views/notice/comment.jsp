<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>댓글 페이지</title>
    <link rel="stylesheet" type="text/css"
        href="${pageContext.request.contextPath}/resources/css/notice.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/comment.js"></script>
</head>
<body>
    <input type="hidden" id="noticeNo" value="${param.noticeNo}">
    <div class="container">
        <div class="comments-section">
            <h3>
                댓글 <span class="comment-count" id="commentCount"></span>
            </h3>
            <div class="nonComment-msg" id="nonCommentMsg">
                <p>댓글이 없습니다.</p>
            </div>

            <form id="commentForm" method="post">
                <input type="hidden" name="noticeNo" value="${param.noticeNo}">
                <input type="hidden" name="memberCode" value="1">
                <textarea name="content" id="content" required></textarea>
                <button type="submit" onclick="addComment()">등록</button>
            </form>

            <div id="commentList">
                <!-- 여기에 댓글 목록이 동적으로 추가될 예정 -->
            </div>

            <div id="pagingSection">
                <!-- 페이징 부분 -->
            </div>
        </div>
    </div>

    <script>
        // 페이지 로드 시 실행될 함수
        $(document).ready(function() {
            fetchComments(); // 댓글 데이터를 가져오는 함수 호출
        });
    </script>

</body>
</html>
