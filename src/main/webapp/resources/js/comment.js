$(document).ready(function() {
    // 함수 정의: 댓글을 비동기적으로 로드
    function loadComments() {
        var boardCode = $('#boardCode').val(); // 보드 코드 가져오기
        $.ajax({
            url: '${pageContext.servletContext.contextPath}/notice/comment?boardCode=' + boardCode,
            type: 'GET',
            dataType: 'json',
            success: function(data) {
                displayComments(data);
            },
            error: function(xhr, status, error) {
                console.error('댓글을 불러오는 중 오류가 발생했습니다:', error);
            }
        });
    }

    // 함수 정의: 댓글을 화면에 표시
    function displayComments(comments) {
        var commentsSection = $('.comments-section');
        commentsSection.empty(); // 기존 댓글 삭제

        if (comments.length > 0) {
            $.each(comments, function(index, comment) {
                var commentDiv = $('<div>').addClass('comment');
                var commentInfo = $('<div>').addClass('comment-info');

                $('<p>').text(comment.author).appendTo(commentInfo); // 작성자 표시
                $('<p>').text(comment.content).appendTo(commentInfo); // 내용 표시
                $('<p>').text(comment.date).addClass('date').appendTo(commentInfo); // 작성일 표시

                var actionsDiv = $('<div>').addClass('actions');
                $('<button>').text('수정').addClass('edit-btn').appendTo(actionsDiv); // 수정 버튼
                $('<button>').text('삭제').addClass('delete-btn').appendTo(actionsDiv); // 삭제 버튼

                actionsDiv.appendTo(commentInfo);
                commentInfo.appendTo(commentDiv);
                commentDiv.appendTo(commentsSection);
                $('<hr>').appendTo(commentsSection); // 구분선 추가
            });
        } else {
            $('<div>').addClass('nonComment-msg').append('<p>댓글이 없습니다.</p>').appendTo(commentsSection);
        }
    }

    // 페이지 로드 시 댓글 로드
    loadComments();

    // 댓글 등록 폼 submit 이벤트 핸들러
    $('#commentForm').submit(function(event) {
        event.preventDefault(); // 기본 동작 방지

        var boardCode = $('#boardCode').val(); // 보드 코드 가져오기
        var content = $('#commentContent').val(); // 댓글 내용 가져오기

        // Ajax를 이용하여 서버에 댓글 등록 요청
        $.ajax({
            type: 'POST',
            url: '${pageContext.servletContext.contextPath}/notice/comment', // 서블릿 매핑 경로
            data: {
                boardCode: boardCode,
                content: content
            },
            success: function(response) {
                // 등록 성공 시 댓글을 다시 로드
                loadComments();
                $('#commentContent').val(''); // 입력 필드 초기화
            },
            error: function(xhr, status, error) {
                console.error('댓글 등록 실패:', error);
            }
        });
    });

    // 수정 및 삭제 버튼 처리 예시 (유사한 AJAX 호출 방법)
    $('.comments-section').on('click', '.edit-btn', function() {
        var commentId = $(this).closest('.comment').data('comment-id');
        // 수정 기능 구현
    });

    $('.comments-section').on('click', '.delete-btn', function() {
        var commentId = $(this).closest('.comment').data('comment-id');
        // 삭제 기능 구현
    });
});
