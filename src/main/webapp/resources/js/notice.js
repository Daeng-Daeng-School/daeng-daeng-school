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
