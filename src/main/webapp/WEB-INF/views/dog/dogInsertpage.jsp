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
	// 원형 눌렀을 시 이미지 삽입
	function showForm(circleId) {
		var forms = document.getElementsByClassName('profileForm');
		for (var i = 0; i < forms.length; i++) {
			forms[i].style.display = 'none';
		}
		document.getElementById('profileForm' + circleId).style.display = 'block';
	}
	
	

	/* 프로필 이미지 업로드 */
	const $input_image = document.getElementById("inputImage1");

	$input_image.onclick = function() {
		document.getElementById("inputImage1").click();
	}

	function loadImg(value, num) {
		if (value.files && value.files[0]) {
			const reader = new FileReader();
			reader.onload = function(e) {
				switch (num) {
				case 1:
					document.getElementById("inputImage1").src = e.target.result;
					break;
				}
			}
			reader.readAsDataURL(value.files[0]);
		}
	}
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
						<img class="circle" id="circle1" onclick="showForm(1)">
						<div class="circle" id="circle2" onclick="showForm(2)"></div>
						<div class="circle" id="circle3" onclick="showForm(3)"></div>
					</div>

					<form
						action="${ pageContext.servletContext.contextPath }/dog/insert"
						method="post" enctype="multipart/form-data" id="profileForm1"
						class="profileForm" style="display: none;">
						<div class="input_image">
							<label for="inputImage1" class="btn_model"> <a
								id="btn_text" class="btn1"> 반려견 이미지 등록하기 </a>
							</label> <input type="file" id="inputImage1" name="inputImage1"
								class="dog_image" accept="image/*" style="display: none;">
						</div>

						<div class="input_box">
							<label for="dog_breed1"></label> <input type="text"
								name="dog_breed" id="dog_breed1" class="input_box_radius"
								placeholder="품종">
						</div>
						<div class="selectBox">
							<label for="dog_class1" style="padding-left: 20px;">강아지반</label>
							<select name="dog_class" id="dog_class1" class="dog_class">
								<option value="Class1">오전반</option>
								<option value="Class2">오후반</option>
								<option value="Class3">종일반</option>
							</select>
						</div>
						<div class="checkBox">
							<label for="male1" style="padding-left: 10px;">성별</label> <input
								id="male1" type="checkbox" name="dog_gender" value="M">
							<label for="male1">수컷</label> <input id="female1" type="checkbox"
								name="dog_gender" value="F"> <label for="female1">암컷</label>
						</div>
						<div class="input_box">
							<input type="text" id="name1" name="name" class="dog_name"
								placeholder="이름">
						</div>
						<div class="input_box">
							<input type="date" id="birthdate1" name="birthdate"
								class="dog_birth" style="color: #b6b6b6;">
						</div>
						<div class="input_box">
							<input type="text" id="regNumber1" name="regNumber"
								class="input_box" placeholder="등록번호">
						</div>
						<div class="input_box">
							<input type="number" id="weight1" name="weight" step="0.01"
								class="input_box" placeholder="몸무게(kg)">
						</div>
						<div class="input_box">
							<input type="text" id="specialNotes1" name="specialNotes"
								class="input_box_radius2" placeholder="특이사항">
						</div>
						<br>
						<button type="submit" class="register-btn">등록하기</button>
					</form>

					<form
						action="${ pageContext.servletContext.contextPath }/dog/insert"
						method="post" enctype="multipart/form-data" id="profileForm2"
						class="profileForm" style="display: none;">
						<div class="input_image">
							<label for="inputImage2" class="btn_model"> <a
								id="btn_text" class="btn1"> 반려견 이미지 등록하기 </a>
							</label> <input type="file" id="inputImage2" name="dog_image"
								accept="image/*" style="display: none;">
						</div>

						<div class="input_box">
							<label for="dog_breed2"></label> <input type="text"
								name="dog_breed" id="dog_breed2" class="input_box_radius"
								placeholder="품종">
						</div>
						<div class="selectBox">
							<label for="dog_class2" style="padding-left: 20px;">강아지반</label>
							<select name="dog_class" id="dog_class2" class="dog_class">
								<option value="Class1">오전반</option>
								<option value="Class2">오후반</option>
								<option value="Class3">종일반</option>
							</select>
						</div>
						<div class="checkBox">
							<label for="male2" style="padding-left: 10px;">성별</label> <input
								id="male2" type="checkbox" name="dog_gender" value="M">
							<label for="male2">수컷</label> <input id="female2" type="checkbox"
								name="dog_gender" value="F"> <label for="female2">암컷</label>
						</div>
						<div class="input_box">
							<input type="text" id="name2" name="name" class="dog_name"
								placeholder="이름">
						</div>
						<div class="input_box">
							<input type="date" id="birthdate2" name="birthdate"
								class="dog_birth" style="color: #b6b6b6;">
						</div>
						<input type="text" id="regNumber2" name="regNumber"
							class="input_box" placeholder="등록번호">
						<div class="input_box">
							<input type="number" id="weight2" name="weight" step="0.01"
								class="input_box" placeholder="몸무게(kg)">
						</div>
						<div class="input_box">
							<input type="text" id="specialNotes2" name="specialNotes"
								class="input_box_radius2" placeholder="특이사항">
						</div>
						<br>
						<button type="submit" class="register-btn">등록하기</button>
					</form>

					<form
						action="${ pageContext.servletContext.contextPath }/dog/insert"
						method="post" enctype="multipart/form-data" id="profileForm3"
						class="profileForm" style="display: none;">
						<div class="input_image">
							<label for="inputImage3" class="btn_model"> <a
								id="btn_text" class="btn1"> 반려견 이미지 등록하기 </a>
							</label> <input type="file" id="inputImage3" name="dog_image"
								accept="image/*" style="display: none;">
						</div>

						<div class="input_box">
							<label for="dog_breed3"></label> <input type="text"
								name="dog_breed" id="dog_breed3" class="input_box_radius"
								placeholder="품종">
						</div>
						<div class="selectBox">
							<label for="dog_class3" style="padding-left: 20px;">강아지반</label>
							<select name="dog_class" id="dog_class3" class="dog_class">
								<option value="Class1">오전반</option>
								<option value="Class2">오후반</option>
								<option value="Class3">종일반</option>
							</select>
						</div>
						<div class="checkBox">
							<label for="male3" style="padding-left: 10px;">성별</label> <input
								id="male3" type="checkbox" name="dog_gender" value="M">
							<label for="male3">수컷</label> <input id="female3" type="checkbox"
								name="dog_gender" value="F"> <label for="female3">암컷</label>
						</div>
						<div class="input_box">
							<input type="text" id="name3" name="name" class="dog_name"
								placeholder="이름">
						</div>
						<div class="input_box">
							<input type="date" id="birthdate3" name="birthdate"
								class="dog_birth" style="color: #b6b6b6;">
						</div>
						<div class="input_box">
							<input type="text" id="regNumber3" name="regNumber"
								class="input_box" placeholder="등록번호">
						</div>
						<div class="input_box">
							<input type="number" id="weight3" name="weight" step="0.01"
								class="input_box" placeholder="몸무게(kg)">
						</div>
						<div class="input_box">
							<input type="text" id="specialNotes3" name="specialNotes"
								class="input_box_radius2" placeholder="특이사항">
						</div>
						<br>
						<button type="submit" class="register-btn">등록하기</button>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- 푸터 연결 -->
	<jsp:include page="../common/footer.jsp" />
</body>

</html>





