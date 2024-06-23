<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 작성</title>
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/resources/css/notice.css">
<!-- TinyMCE CDN -->
<script
	src="https://cdn.tiny.cloud/1/mzvas2qdd6hui8ybi2mm7apd9x54xg7n8922fz9yypn13yhv/tinymce/5/tinymce.min.js"
	referrerpolicy="origin"></script>
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
						<button type="submit" form="postForm" id="write-post-button">작성하기</button>
					</div>
				</div>
			</div>
			<div class="table-area">
				<form id="postForm"
					action="${pageContext.servletContext.contextPath}/notice/insert"
					method="post">
					<jsp:include page="../notice/selectDog.jsp" />
					<div class="outer-notice-insert">
						<div class="header-row">
							<div class="author">
								<input type="text" name="writerName" value="2">
							</div>
							<div class="createdDate">
								<input type="text" name="createdDate"
									value="<%=new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date())%>">
							</div>
						</div>

						<h2 class="title">
							제목 :<input type="text" name="title" placeholder="제목을 입력하세요.">
						</h2>

						<div class="content-box">
							<textarea name="body" id="editor" cols="60" rows="15"
								placeholder="내용을 입력하세요."></textarea>
						</div>
					</div>
				</form>
			</div>
		</div>
	</main>
	<jsp:include page="../common/footer.jsp" />


	<!-- TinyMCE 에디터를 초기화하고 <textarea>를 통해 편집기를 렌더링 -->
	<script>
	  tinymce.init({
	    selector: 'textarea',
	    height: 600,
	    plugins: 'anchor autolink charmap codesample emoticons image link lists media searchreplace table visualblocks wordcount checklist mediaembed casechange export formatpainter pageembed linkchecker a11ychecker tinymcespellchecker permanentpen powerpaste advtable advcode editimage advtemplate ai mentions tinycomments tableofcontents footnotes mergetags autocorrect typography inlinecss markdown',
	    toolbar: 'undo redo | blocks fontfamily fontsize | bold italic underline strikethrough | link image media table mergetags | addcomment showcomments | spellcheckdialog a11ycheck typography | align lineheight | checklist numlist bullist indent outdent | emoticons charmap | removeformat',
	    tinycomments_mode: 'embedded',
	    tinycomments_author: '작성자 이름',
	    mergetags_list: [
	      { value: 'First.Name', title: '이름' },
	      { value: 'Email', title: '이메일' },
	    ],
	    ai_request: (request, respondWith) => respondWith.string(() => Promise.reject("AI 어시스턴트 구현 방법은 문서를 참조하세요")),
	  });
	</script>

	<script>
        function submitForm() {
            document.getElementById('postForm').submit();
        }
    </script>
</body>
</html>
