// 페이지 로드 후 TinyMCE 에디터를 초기화
document.addEventListener("DOMContentLoaded", function() {
	// TinyMCE 초기화 코드
	tinymce.init({
		selector: 'textarea',
		height: 600,
		plugins: 'anchor autolink charmap codesample emoticons image link lists media searchreplace table visualblocks wordcount checklist mediaembed casechange export formatpainter pageembed linkchecker a11ychecker tinymcespellchecker permanentpen powerpaste advtable advcode editimage advtemplate ai mentions tinycomments tableofcontents footnotes mergetags autocorrect typography inlinecss markdown',
		toolbar: 'undo redo | formatselect | bold italic underline strikethrough | link image media | bullist numlist | removeformat',
		menubar: 'file edit view insert format tools table help',
		toolbar_mode: 'floating',
		tinycomments_mode: 'embedded',
		tinycomments_author: '작성자 이름',
		mergetags_list: [
			{ value: 'First.Name', title: '이름' },
			{ value: 'Email', title: '이메일' },
		],
		ai_request: (request, respondWith) => respondWith.string(() => Promise.reject("AI 어시스턴트 구현 방법은 문서를 참조하세요")),
	});
});

document.addEventListener("DOMContentLoaded", function() {
	// DOM이 완전히 로드된 후 contextPath 설정
	var contextPath = document.getElementById('contextPath').value;

	// 알림장 작성 버튼 클릭 시, 해당 경로로 이동
	window.writeNotice = function() {
		window.location.href = contextPath + "/notice/insert";
	}

	// 알림장 상세보기 버튼 클릭 시, 알림장 번호를 매개변수로 받아 경로 이동
	window.showDetail = function(noticeNo) {
		window.location.href = contextPath + "/notice/detail?noticeNo=" + noticeNo;
	}

	// 폼 제출 함수
	window.submitForm = function() {
		document.getElementById('postForm').submit();
	}

	// 수정하기 버튼 클릭 시, 해당 알림장 번호를 매개변수로 받아 경로 이동
	window.doModify = function(noticeNo) {
		window.location.href = contextPath + "/notice/modify?noticeNo=" + noticeNo;
	}

	// 수정완료 버튼 클릭 시, 작성한 내용을 업데이트 후 폼 제출
	window.updateNotice = function() {
		document.getElementById('postForm').submit();
	}
	
	// 삭제하기 버튼 클릭 시, 확인 창을 띄우고 삭제를 실행
    window.doDelete = function(noticeNo) {
        if (confirm("정말 삭제하시겠습니까?")) {
            document.getElementById('deleteForm').submit();
        }
    }
});



// Enter 키 이벤트 처리
function handleKeyPress(event) {
	if (event.keyCode === 13) { // Enter키 keyCode = 13
		event.preventDefault(); // 기본 동작(폼 제출 등) 방지
		search(); // 검색 함수 호출
	}
}

// 검색 함수
window.search = function() {
	var searchInput = $('#searchInput').val(); // 검색어 입력값 가져오기
	console.log(searchInput);

	// Ajax를 이용해 검색 요청 전송
	$.ajax({
		type: "GET",
		url: contextPath + "/notice/search", // 검색 요청을 처리할 서버 경로
		data: { keyword: searchInput }, // 검색어 데이터 전송
		dataType: "json", // 응답 데이터 타입 설정
		success: function(data) { // 성공적으로 응답을 받았을 때 처리할 함수
			displayNotices(data); // 검색 결과를 화면에 표시하는 함수 호출
		},
		error: function() { // 검색 요청이 실패했을 때 처리할 함수
			alert("검색에 실패했습니다.");
		}
	});
}

// 검색 결과 표시 함수
function displayNotices(notices) {
	var postsDiv = $('.posts'); // 알림장 목록을 표시할 요소 선택
	postsDiv.empty(); // 기존 알림장 목록 제거

	// 검색 결과를 반복적으로 처리하여 화면에 표시
	$.each(notices, function(index, notice) {
		var imageUrl = extractImageUrlFromNoticeBody(notice.noticeBody); // 알림장 본문에서 이미지 URL 추출
		if (!imageUrl) {
			imageUrl = contextPath + "/resources/image/dogs.jpg"; // 기본 이미지 URL 설정
		}

		var postCard = `
            <div class="post-card" onclick="showDetail(${notice.noticeNo})">
                <div class="post-thumbnail">
                    <img src="${imageUrl}" alt="Post Thumbnail">
                </div>
                <div class="post-content">
                    <h2>${notice.noticeTitle}</h2>
                    <span style="text-align: right">
                        <p>${notice.noticeWriter}</p>
                        <p>${notice.createdDate}</p>
                    </span>
                </div>
            </div>
        `;
		postsDiv.append(postCard); // 알림장 목록 카드를 화면에 추가
	});
}

// 알림장 본문에서 이미지 URL을 추출하는 함수
function extractImageUrlFromNoticeBody(noticeBody) {
	var regex = /<img.*?src="(.*?)"/; // img 태그의 src 속성을 추출하는 정규표현식
	var match = regex.exec(noticeBody); // 정규표현식을 이용해 본문에서 이미지 URL 추출
	if (match && match.length > 1) {
		return match[1]; // 추출된 이미지 URL 반환
	}
	return null; // 이미지 URL이 없을 경우 null 반환
}
