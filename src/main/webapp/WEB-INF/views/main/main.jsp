<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ddschool</title>
<style>
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
}

.slider-container {
	margin-top: 20vh;
}

.slider {
	display: flex;
	gap: 20px; /* 슬라이드 간격 조정 */
	transition: transform 0.5s ease; /* 슬라이드 이동 애니메이션 설정 */
}

.slide {
	position: relative;
	flex: 0 0 390px; /* 슬라이드 너비 */
	height: 640px; /* 슬라이드 높이 */
	cursor: pointer;
	overflow: hidden;
	border: 1px solid #333; /* 보더 추가 */
	border-radius: 26px; /* 보더 라디우스 추가 */
	box-shadow: 0 2px 2px rgba(0, 0, 0, 0.1); /* 기본 그림자 추가 */
	transition: box-shadow 0.3s ease; /* 그림자 애니메이션 */
}

.slide:hover {
	box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2); /* 마우스 오버 시 그림자 효과 */
}

.slide img {
	width: 100%;
	height: auto;
	display: block;
	transition: transform 0.3s ease;
}

.slide-content {
	position: absolute;
	top: 40px;
	left: 40px;
	color: #333;
	z-index: 1; /* 텍스트 위로 올리기 */
}

.slide-content p {
	margin: 0;
	font-size: 20px; /* 텍스트 크기 추가 */
}

.slider-controls {
	position: absolute;
	top: calc(50% - 20px); /* 슬라이더 컨트롤 세로 가운데 정렬 */
	width: 100%;
	display: flex;
	justify-content: space-between;
	z-index: 1;
}

.slider-control {
	background-color: rgba(0, 0, 0, 0.7);
	color: #fff;
	width: 40px;
	height: 40px;
	display: flex;
	justify-content: center;
	align-items: center;
	cursor: pointer;
	border-radius: 50%;
	font-size: 20px;
	opacity: 0;
	transition: opacity 0.3s ease;
}

.slider-control:hover {
	opacity: 1;
}

.slider-control.left {
	left: 10px;
}

.slider-control.right {
	right: 10px;
}

.slider::-webkit-scrollbar {
	display: none; /* 스크롤바 숨김 */
}

.main {
	position: relative;
	width: 1680px;
	height: 700px;
	overflow: hidden;
	margin: 0 auto;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
	<!-- 메뉴바 연결 -->
	<%@ include file="../common/menubar.jsp"%>

	<div class="slider-container">
		<div class="main">
			<div class="slider" id="slider">
				<div class="slide">
					<img src="images/image1.jpg" alt="Image 1">
					<div class="slide-content">
						<p id="dateText"></p>
					</div>
				</div>
				<div class="slide">
					<img src="images/image2.jpg" alt="Image 2">
					<div class="slide-content">
						<p>이달의 반려견</p>
					</div>
				</div>
				<div class="slide">
					<img src="images/image3.jpg" alt="Image 3">
					<div class="slide-content">
						<p>알림장</p>
					</div>
				</div>
				<div class="slide">
					<img src="images/image4.jpg" alt="Image 4">
					<div class="slide-content">
						<p>반려견 관리</p>
					</div>
				</div>
				<div class="slide">
					<img src="images/image5.jpg" alt="Image 5">
					<div class="slide-content">
						<p>유치원관리</p>
					</div>
				</div>
			</div>
			<div class="slider-controls">
				<div class="slider-control left" onclick="prevButton">&lt;</div>
				<div class="slider-control right" onclick="nextButton">&gt;</div>
			</div>
		</div>
	</div>

	<!-- 푸터 연결 -->
	<%@ include file="../common/footer.jsp"%>

	<script>
		let currentSlide = 0;
		let timer;
		const slideWidth = 390; // 슬라이드 너비

		function updateSlide() {
			const slider = document.getElementById('slider');
			const newPosition = currentSlide * slideWidth;
			slider.style.transform = `translateX(-${newPosition}px)`;
		}

		function resetTimer() {
			clearInterval(timer);
			timer = setInterval(() => {
				nextSlide();
			}, 5000);
		}

		function prevSlide() {
			const slides = document.querySelectorAll('.slide');
			currentSlide = (currentSlide - 1 + slides.length) % slides.length;
			updateSlide();
			resetTimer();
		}

		function nextSlide() {
			const slides = document.querySelectorAll('.slide');
			currentSlide = (currentSlide + 1) % slides.length;
			updateSlide();
			resetTimer();
		}

		document.addEventListener('DOMContentLoaded', function() {
			const currentDate = new Date();
			const currentDay = currentDate.getDate();
			const currentMonth = currentDate.getMonth() + 1; // 1부터 시작하도록 + 1
			const currentYear = currentDate.getFullYear();
			const formattedDate = `${currentYear}년 ${currentMonth}월 ${currentDay}일`;

			document.getElementById('dateText').textContent = formattedDate;

			timer = setInterval(() => {
				nextSlide();
			}, 5000);

			const slider = document.getElementById('slider');
			slider.addEventListener('mouseenter', () => {
				clearInterval(timer);
			});

			slider.addEventListener('mouseleave', () => {
				timer = setInterval(() => {
					nextSlide();
				}, 5000);
			});

			document.getElementById('prevButton').addEventListener('click', prevSlide);
			document.getElementById('nextButton').addEventListener('click', nextSlide);
		});
	</script>
</body>
</html>
