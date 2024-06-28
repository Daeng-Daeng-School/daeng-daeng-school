<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>mv</title>
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/resources/css/dog.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
<script>

	$(document).ready(function() {
		var slideCount = $('.slide-box').length; // 슬라이드 박스 개수
		var slideWidth = $('.slide-box').width(); // 슬라이드 박스 너비
		var slideIndex = 0; // 현재 슬라이드 인덱스

		function slide() {
			slideIndex = (slideIndex + 1) % slideCount; // 다음 슬라이드 인덱스 계산
			var leftPosition = -slideIndex * slideWidth; // 이동할 위치 계산
			$('.visual-container').animate({
				left : leftPosition
			}, 500); // 슬라이드 애니메이션
		}

		var slideInterval = setInterval(slide, 3000); // 3초마다 슬라이드 함수 호출

		$('.visual-container').hover(function() {
			clearInterval(slideInterval); // 마우스 오버시 슬라이드 멈춤
		}, function() {
			slideInterval = setInterval(slide, 3000); // 마우스 아웃시 슬라이드 재개
		});
	});
</script>
<style>
.visual-container {
	width: 480px; /* 전체 비주얼 영역의 너비 */
	height: 600px; /* 전체 비주얼 영역의 높이 */
	overflow: hidden; /* 넘치는 부분은 숨기기 */
	position: relative; /* 상대 위치 설정 */
}

.slide-box {
	width: 480px; /* 각 슬라이드 박스의 너비 */
	height: 600px; /* 각 슬라이드 박스의 높이 */
	float: left; /* 왼쪽 정렬 */
}
</style>
</head>

<body>
	<!-- 메뉴바 연결 -->
	<jsp:include page="../common/menubar.jsp" />

	<div class="visual-container">
		<div class="slide-box">
			<img src="image1.jpg" alt="이미지 1">
		</div>
		<div class="slide-box">
			<img src="image2.jpg" alt="이미지 2">
		</div>
		<div class="slide-box">
			<img src="image3.jpg" alt="이미지 3">
		</div>
		<div class="slide-box">
			<img src="image4.jpg" alt="이미지 4">
		</div>
		<div class="slide-box">
			<img src="image5.jpg" alt="이미지 5">
		</div>
	</div>


	<!-- 푸터 연결 -->
	<jsp:include page="../common/footer.jsp" />
</body>
</html>