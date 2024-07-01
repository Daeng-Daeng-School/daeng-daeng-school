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
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<style>
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
}

.slider-container {
	position: relative;
	width: 1680px;
	/* 슬라이더 컨테이너 너비 */
	height: 700px;
	/* 슬라이더 컨테이너 높이 */
	overflow: hidden;
	margin: 0 auto;
	/* 가운데 정렬을 위해 추가 */
}

.slider {
	display: flex;
	gap: 20px;
	/* 슬라이드 간격 조정 */
	transition: transform 0.5s ease;
	/* 슬라이드 이동 애니메이션 설정 */
}

.slide {
	position: relative;
	flex: 0 0 390px;
	/* 슬라이드 너비 */
	height: 640px;
	/* 슬라이드 높이 */
	cursor: pointer;
	overflow: hidden;
	border: 1px solid #333;
	/* 보더 추가 */
	border-radius: 26px;
	/* 보더 라디우스 추가 */
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	/* 기본 그림자 추가 */
	transition: box-shadow 0.3s ease;
	/* 그림자 애니메이션 */
}

.slide:hover {
	box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
	/* 마우스 오버 시 그림자 효과 */
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
	z-index: 1;
	/* 텍스트 위로 올리기 */
}

.slide-content p {
	margin: 0;
	font-size: 20px;
	/* 텍스트 크기 추가 */
}

.slider-controls {
	position: absolute;
	top: calc(50% - 20px);
	/* 슬라이더 컨트롤 세로 가운데 정렬 */
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
	display: none;
	/* 스크롤바 숨김 */
}
</style>
</head>

<body>
	<!-- 메뉴바 연결 -->
	<jsp:include page="../common/menubar.jsp" />

	<div class="slider-container">
		<div class="slider" id="slider">
			<div class="slide">
				<img src="images/image1.jpg" alt="Image 1">
				<div class="slide-content">
					<p id="currentDate"></p>
				</div>
			</div>
			<div class="slide">
				<img src="images/image2.jpg" alt="Image 2">
				<div class="slide-content">
					<p>Slide 2</p>
				</div>
			</div>
			<div class="slide">
				<img src="images/image3.jpg" alt="Image 3">
				<div class="slide-content">
					<p>Slide 3</p>
				</div>
			</div>
			<div class="slide">
				<img src="images/image4.jpg" alt="Image 4">
				<div class="slide-content">
					<p>Slide 4</p>
				</div>
			</div>
			<div class="slide">
				<img src="images/image5.jpg" alt="Image 5">
				<div class="slide-content">
					<p>Slide 5</p>
				</div>
			</div>
		</div>
		<div class="slider-controls">
			<div class="slider-control left" onclick="prevSlide()">&lt;</div>
			<div class="slider-control right" onclick="nextSlide()">&gt;</div>
		</div>
	</div>

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/js/all.min.js"></script>
	<script>
		const slider = document.getElementById('slider');
		const slides = document.querySelectorAll('.slide');
		const slideWidth = 390; // 슬라이드 너비
		let currentSlide = 0;
		let timer;


		// 현재 날짜 및 시간을 얻는다
		const currentDate = new Date();

		// 현재 날짜만 추출
		const currentDay = currentDate.getDate();

		// 현재 월만 추출한다 (0부터 시작)
		const currentMonth = currentDate.getMonth() + 1; // 1부터 시작하도록 + 1

		// 현재 연도만 추출한다
		const currentYear = currentDate.getFullYear();

		// 원하는 형식으로 문자열을 만든다
		const formattedDate = `${currentYear}년 ${currentMonth}월 ${currentDay}일`;

		// 'currentDate' 요소에 날짜 문자열을 출력한다
		document.getElementById('currentDate').textContent = formattedDate;


		// 이전 슬라이드 버튼 클릭 이벤트
		function prevSlide() {
			currentSlide = (currentSlide - 1 + slides.length) % slides.length;
			updateSlide();
			resetTimer();
		}

		// 다음 슬라이드 버튼 클릭 이벤트
		function nextSlide() {
			currentSlide = (currentSlide + 1) % slides.length;
			updateSlide();
			resetTimer();
		}

		function updateSlide() {
			const newPosition = currentSlide * slideWidth;
			slider.style.transform = `translateX(-${newPosition}px)`;

			// 첫 번째 슬라이드일 때 날짜 정보 업데이트
			if (currentSlide === 0) {
				const currentDate = new Date();
				const dateText = `${currentDate.getFullYear()}.${currentDate.getMonth() + 1}.${currentDate.getDate()}`;
				document.getElementById('dateText').textContent = dateText;
			}
		}

		// 자동 슬라이드
		timer = setInterval(() => {
			currentSlide = (currentSlide + 1) % slides.length;
			updateSlide();
		}, 5000);

		// 슬라이드 정지/재개
		slider.addEventListener('mouseenter', () => {
			clearInterval(timer);
		});

		slider.addEventListener('mouseleave', () => {
			timer = setInterval(() => {
				currentSlide = (currentSlide + 1) % slides.length;
				updateSlide();
			}, 5000);
		});

		// 타이머 리셋 함수
		function resetTimer() {
			clearInterval(timer);
			timer = setInterval(() => {
				currentSlide = (currentSlide + 1) % slides.length;
				updateSlide();
			}, 5000);
		}


	</script>

	<!-- 푸터 연결 -->
	<jsp:include page="../common/footer.jsp" />
</body>
</html>