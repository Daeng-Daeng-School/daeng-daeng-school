<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>나의반려견 정보 등록</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/resources/css/dog.css">
<script>
    let formCounter = 1;

    function addProfileForm() {
        const formTemplate = `
            <form action="${pageContext.servletContext.contextPath}/dog/insert" method="post" id="profileForm${formCounter}" class="profileForm">
                <div class="input_box">
                    <label for="name${formCounter}"></label>
                    <input type="text" id="name${formCounter}" name="name" class="input_box_radius" placeholder="이름">
                </div>
                <div class="selectBox">
                    <label for="dog_class${formCounter}" style="padding-left: 20px;">강아지반</label>
                    <select name="dog_class" id="dog_class${formCounter}" class="dog_class">
                        <option value="1">오전반</option>
                        <option value="2">오후반</option>
                        <option value="3">종일반</option>
                    </select>
                </div>
                <div class="checkBox">
                    <label for="male${formCounter}" style="padding-left: 10px;">성별</label>
                    <input id="male${formCounter}" type="checkbox" name="dog_gender" value="M">
                    <label for="male${formCounter}">수컷</label>
                    <input id="female${formCounter}" type="checkbox" name="dog_gender" value="F">
                    <label for="female${formCounter}">암컷</label>
                </div>
                <div class="input_box">
                    <label for="dog_breed${formCounter}"></label>
                    <input type="text" name="dog_breed" id="dog_breed${formCounter}" class="dog_breed" placeholder="품종">
                </div>
                <div class="input_box">
                    <label for="birthdate${formCounter}"></label>
                    <input type="date" id="birthdate${formCounter}" name="birthdate" class="dog_birth" style="color: #b6b6b6;">
                </div>
                <div class="input_box">
                    <label for="regNumber${formCounter}"></label>
                    <input type="text" id="regNumber${formCounter}" name="regNumber" class="input_box" placeholder="등록번호">
                </div>
                <div class="input_box">
                    <label for="weight${formCounter}"></label>
                    <input type="number" id="weight${formCounter}" name="weight" step="0.01" class="input_box" placeholder="몸무게(kg)">
                </div>
                <div class="input_box">
                    <label for="notes${formCounter}"></label>
                    <input type="text" id="notes${formCounter}" name="notes" class="input_box_radius2" placeholder="특이사항">
                </div>
                <br>
                <button type="submit" class="register-btn">등록하기</button>
            </form>
        `;
        document.getElementById('formContainer').innerHTML += formTemplate;
        formCounter++;
    }

/*     $(document).on('submit', 'form', function(event) {
        event.preventDefault();
        var form = $(this)[0];
        var formData = new FormData(form);

        $.ajax({
            type: form.method,
            url: form.action,
            data: formData,
            processData: false,
            contentType: false,
            success: function(response) {
                alert('등록 완료!');
                form.reset(); // 폼 초기화
            },
            error: function() {
                alert('등록 실패!');
            }
        });
    });
 */
    window.onload = function() {
        addProfileForm();
    };
</script>
</head>

<body>
	<!-- 메뉴바 연결 -->
	<jsp:include page="../common/menubar.jsp" />

	<div class="mypage-container">
		<div class="container">
			<div class="sidebar">
				<ul>
					<li><a href="#">회원정보 관리</a></li>
					<li><a href="" class="current">반려견정보 관리</a></li>
				</ul>
			</div>
			<div class="main_contents">
				<div class="regist-box">
					<div class="text_1">
						<h1>
							나의 반려견 정보를 <br>입력하세요.
						</h1>
					</div>
					<div class="dogprofile">
						<div class="circle" id="addCircleButton"
							onclick="addProfileForm()">+</div>
					</div>
					<div id="profileContainer">
						<!-- 프로필 이미지가 여기에 동적으로 추가됩니다 -->
					</div>
					<div id="formContainer">
						<!-- 폼이 여기에 동적으로 추가됩니다 -->
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 푸터 연결 -->
	<jsp:include page="../common/footer.jsp" />
</body>

</html>
