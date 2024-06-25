// 페이지 로드 시 댓글 데이터를 가져오는 함수
function fetchComments() {
    var noticeNo = $("#noticeNo").val();
    $.ajax({
        type: "GET",
        url: "${pageContext.request.contextPath}/notice/comment",
        data: { noticeNo: noticeNo },
        dataType: "json",
        success: function(data) {
            displayComments(data); // 가져온 데이터를 화면에 출력하는 함수 호출
        },
        error: function() {
            console.log("댓글 데이터를 가져오는데 실패했습니다.");
        }
    });
}

// 댓글 등록을 처리하는 함수
function addComment() {
    var noticeNo = $("#noticeNo").val();
    var memberCode = 1; // 임시로 회원 코드를 지정
    var content = $("#content").val();
    
    $.ajax({
        type: "POST",
        url: "${pageContext.request.contextPath}/notice/comment",
        data: { noticeNo: noticeNo, memberCode: memberCode, content: content },
        dataType: "json",
        success: function(data) {
            if (data.result === "success") {
                fetchComments(); // 댓글 등록 후 댓글 목록을 다시 가져오기
                $("#content").val(""); // 입력 창 초기화
            } else {
                console.log("댓글 등록 실패");
            }
        },
        error: function() {
            console.log("댓글 등록 과정에서 오류가 발생했습니다.");
        }
    });
}

// 댓글 목록을 화면에 출력하는 함수
function displayComments(comments) {
    var commentCount = comments.length;
    $("#commentCount").text(commentCount); // 댓글 개수 업데이트

    var commentListHtml = "";
    comments.forEach(function(comment) {
        commentListHtml += `
            <div class="comment">
                <div class="comment-info">
                    <p>${comment.memberCode}</p>
                    <p>${comment.content}</p>
                    <div class="actions">
                        <p class="date">${comment.registDate}</p>
                        <button onclick="editComment(${comment.commentCode})">수정</button>
                        <button onclick="deleteComment(${comment.commentCode})">삭제</button>
                    </div>
                </div>
            </div>
            <hr>
        `;
    });

    $("#commentList").html(commentListHtml); // 댓글 목록 업데이트
}

// 댓글 등록을 처리하는 함수
function submitComment() {
	var noticeNo = document.getElementById('noticeNo').value;
	var memberCode = 1; // 임시로 고정된 값
	var content = document.getElementById('content').value;

	$.ajax({
		url: '${pageContext.request.contextPath}/notice/comment',
		type: 'POST',
		data: {
			noticeNo: noticeNo,
			memberCode: memberCode,
			content: content
		},
		success: function(response) {
			if (response.result === 'success') {
				fetchComments(); // 등록 성공 시 댓글 목록 다시 불러오기
				document.getElementById('content').value = ''; // 등록 후 입력 필드 비우기
			} else {
				alert('댓글 등록에 실패했습니다.');
			}
		},
		error: function() {
			alert('댓글 등록 중 오류가 발생했습니다.');
		}
	});
}

// 댓글 수정 처리 함수
function editComment(commentCode) {
	var newContent = prompt('수정할 내용을 입력하세요.');
	if (newContent) {
		$.ajax({
			url: '${pageContext.request.contextPath}/notice/comment',
			type: 'PUT',
			data: {
				commentCode: commentCode,
				content: newContent
			},
			success: function(response) {
				if (response.result === 'success') {
					fetchComments(); // 수정 성공 시 댓글 목록 다시 불러오기
				} else {
					alert('댓글 수정에 실패했습니다.');
				}
			},
			error: function() {
				alert('댓글 수정 중 오류가 발생했습니다.');
			}
		});
	}
}

// 댓글 삭제 처리 함수
function deleteComment(commentCode) {
	if (confirm('정말로 삭제하시겠습니까?')) {
		$.ajax({
			url: '${pageContext.request.contextPath}/notice/comment',
			type: 'DELETE',
			data: {
				commentCode: commentCode
			},
			success: function(response) {
				if (response.result === 'success') {
					fetchComments(); // 삭제 성공 시 댓글 목록 다시 불러오기
				} else {
					alert('댓글 삭제에 실패했습니다.');
				}
			},
			error: function() {
				alert('댓글 삭제 중 오류가 발생했습니다.');
			}
		});
	}
}
