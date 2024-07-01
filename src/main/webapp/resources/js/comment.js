// 페이지 로드 시 댓글 데이터를 가져오는 함수
function fetchComments(noticeNo) {
	$.ajax({
		type: "GET",
		url: contextPath + "/notice/comment",
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

// 댓글 목록을 화면에 출력하는 함수
function displayComments(comments) {
	var commentCount = comments.length;
	$("#commentCount").text(commentCount); // 댓글 개수 업데이트

	var commentListHtml = "";
	comments.forEach(function(comment) {
		commentListHtml += `
            <div class="comment" data-comment-code="${comment.commentCode}">
                <div class="comment-info">
                    <p class="author">${comment.commentWriter.memberName}</p>
                    <!-- 원본 내용 -->
                    <p class="original-content">${comment.content}</p>
                    <!-- 편집할 textarea -->
                    <textarea class="edit-content" style="display: none;" rows="3">${comment.content}</textarea> 
                    <div class="actions">
                        <p class="original-date">${comment.createdDate}</p>
                        <button class="edit-button" onclick="toggleEditMode(${comment.commentCode})">수정</button> 
                        <!-- 수정 버튼 클릭시 보여지는 저장 버튼과 취소 버튼 -->
                        <button class="save-button" style="display: none;" onclick="saveComment(${comment.commentCode})">저장</button>
                        <button class="cancel-button" style="display: none;" onclick="cancelEdit(${comment.commentCode})">취소</button>
                        <button class="delete-button" onclick="deleteComment(${comment.commentCode})">삭제</button>
                    </div>
                </div>
            </div>
            <hr>
        `;
	});
	// 댓글 목록 업데이트
	$("#commentList").html(commentListHtml);
}

// 댓글 등록을 처리하는 함수
function addComment() {
	var memberCode = $("#memberCode").val();
	var noticeNo = $("#noticeNo").val();
	var content = $("#content").val();

	console.log("memberCode:", memberCode);
	console.log("noticeNo:", noticeNo);
	console.log("content:", content);

	if (content.trim() === "") {
		alert("댓글 내용을 입력해주세요.");
		return;
	}

	$.ajax({
		type: "POST",
		url: contextPath + "/notice/comment",
		data: {
			noticeNo: noticeNo,
			memberCode: memberCode,
			content: content
		},
		success: function(response) {
			if (response.result === "success") {
				fetchComments(noticeNo); // 댓글 목록 갱신
				$("#content").val(''); // 입력 필드 비우기
			} else {
				alert("댓글 등록에 실패했습니다.");
			}
		},
		error: function() {
			alert('댓글 등록 중 오류가 발생했습니다.');
		}
	});
}

// 수정 모드와 보기 모드 전환
function toggleEditMode(commentCode) {
	// 원본 내용 숨기고, 편집할 textarea 표시
	$(".comment[data-comment-code='" + commentCode + "'] .original-content").hide();
	$(".comment[data-comment-code='" + commentCode + "'] .edit-content").show();

	// 저장 및 취소 버튼 표시, 수정 버튼 숨기기
	$(".comment[data-comment-code='" + commentCode + "'] .edit-button").hide();
	$(".comment[data-comment-code='" + commentCode + "'] .save-button").show();
	$(".comment[data-comment-code='" + commentCode + "'] .cancel-button").show();

	// 원본 작성일자 숨기기
	$(".comment[data-comment-code='" + commentCode + "'] .original-date").hide();
}

// 댓글 저장
function saveComment(commentCode) {
	var newContent = $(".comment[data-comment-code='" + commentCode + "'] .edit-content").val();

	// 내용을 URL 안전하게 인코딩
	var encodedContent = encodeURIComponent(newContent);
	console.log(newContent);

	$.ajax({
		type: "PUT",
		// 톰캣에서 PUT/DELETE 요청시, 바디값이 NULL로 전달되기 때문에, 쿼리스트링으로 댓글 코드와 컨텐츠를 전달함
		url: contextPath + "/notice/comment?commentCode=" + commentCode + "&content=" + encodedContent,
		dataType: "json",
		success: function(response) {
			if (response.result === "success") {
				// alert("댓글이 수정되었습니다.");
				fetchComments($("#noticeNo").val()); // 수정 후 댓글 목록 다시 불러오기
			} else {
				alert("댓글 수정에 실패했습니다.");
				cancelEdit(commentCode); // 실패 시 편집 취소
			}
		},
		error: function(xhr, status, error) {
			console.error("댓글 수정 오류:", error);
			alert("댓글 수정에 실패했습니다.");
			cancelEdit(commentCode); // 오류 시 편집 취소
		}
	});
}

// 편집 취소 후 보기 모드로 복귀
function cancelEdit(commentCode) {
	// 편집할 textarea 숨기고, 원본 내용 표시
	$(".comment[data-comment-code='" + commentCode + "'] .edit-content").hide();
	$(".comment[data-comment-code='" + commentCode + "'] .original-content").show();

	// 수정 버튼 표시, 저장 및 취소 버튼 숨기기
	$(".comment[data-comment-code='" + commentCode + "'] .edit-button").show();
	$(".comment[data-comment-code='" + commentCode + "'] .save-button").hide();
	$(".comment[data-comment-code='" + commentCode + "'] .cancel-button").hide();
}

// 댓글 삭제 처리 함수
function deleteComment(commentCode) {
	console.log(commentCode);
	if (confirm("정말 삭제하시겠습니까?")) {
		$.ajax({
			type: "DELETE",
			// 톰캣에서 PUT/DELETE 요청시, 바디값이 NULL로 전달되기 때문에, 쿼리스트링으로 댓글 코드를 전달함
			url: contextPath + "/notice/comment?commentCode=" + commentCode,
			dataType: "json",
			success: function(response) {
				if (response.result === "success") {
					alert("댓글이 삭제되었습니다.");
					fetchComments($("#noticeNo").val()); // 삭제 후 댓글 목록 갱신
				} else {
					alert("댓글 삭제에 실패했습니다.");
				}
			},
			error: function(xhr, status, error) {
				console.error("댓글 삭제 오류:", error);
				alert("댓글 삭제에 실패했습니다.");
			}
		});
	}
}
