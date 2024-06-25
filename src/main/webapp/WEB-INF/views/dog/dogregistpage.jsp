<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="/dogregist.css">
    <script>
        function showForm() {
            document.getElementById('profileForm').style.display = 'block';
        }

        function submitProfile(event) {
            event.preventDefault();
            var formData = new FormData(document.getElementById('profileForm'));

            var xhr = new XMLHttpRequest();
            xhr.open('POST', 'uploadProfile', true);
            xhr.onreadystatechange = function () {
                if (xhr.readyState == 4 && xhr.status == 200) {
                    alert('프로필이 성공적으로 등록되었습니다.');
                }
            };
            xhr.send(formData);
        }
    </script>

</head>


<body>
    <div class="mypage-container">
        <div class="container">
            <div class="sidebar">
                <ul>
                    <li><a href="#">회원정보 관리</a></li>
                    <li><a href="#" onclick="">반려견정보 관리</a></li>
                </ul>
            </div>
            <div class="main_contents">
                <div class="regist-box">
                    <div class="text_1">
                        <h1>나의 반려견 정보를 <br>입력하세요.</h1>
                    </div>
                    <div class="dogprofile">
                        <div class="circle" onclick="showForm()"></div>
                        <div class="circle" onclick="showForm()"></div>
                        <div class="circle" onclick="showForm()"></div>
                    </div>

                    <form action="" method="post">
                        <div class="input_image">
                            <label for="inputImage" class="btn_model">
                                <a id="btn_text" class="btn1"> </a>
                            </label>
                            <input type="file" id="inputImage" accept="image/*" style="display: none;">
                        </div>

                        <div class="input_box">
                            <label for="dogInfo_breed"></label>
                            <input type="text" name="dog_breed" id="dog_breed" class="input_box_radius"
                                placeholder="품종">
                        </div>
                        <div class="selectBox">
                            <label for="dogInfo_class" style="padding-left: 20px;">강아지반</label>
                            <select name="dog_class" id="dog_class" class="dog_class">
                                <option value="Class1">오전반</option>
                                <option value="Class2">오후반</option>
                                <option value="Class3">종일반</option>
                            </select>

                        </div>
                        <div class="checkBox">
                            <label for="dogInfo_gender" style="padding-left: 10px;">성별</label>
                            <input id="male" type="checkbox" name="dog_gender" value="M">
                            <label for="male">수컷</label>
                            <input id="female" type="checkbox" name="dog_gender" value="F">
                            <label for="female">암컷</label>
                        </div>
                        <div class="input_box">
                            <input type="text" id="name" name="name" class="dog_name" placeholder="이름">
                        </div>
                        <div class="input_box">
                            <input type="date" id="birthdate" name="birthdate" class="dog_birth"
                                style="color: #b6b6b6;">
                        </div>
                        <div class="input_box">
                            <input type="text" id="regNumber" name="regNumber" class="input_box" placeholder="등록번호">
                        </div>
                        <div class="input_box">
                            <input type="number" id="weight" name="weight" step="0.01" class="input_box"
                                placeholder="몸무게(kg)">
                        </div>
                        <div class="input_box">
                            <input type="text" id="specialNotes" name="specialNotes" class="input_box_radius2"
                                placeholder="특이사항">
                        </div>
                        <br>
                        <button type="submit" class="register-btn">수정하기</button>
<!--                         <div class="delete_info">
                            <a href="#" class="delete">삭제하기</a>
                        </div> -->
                    </form>
                </div>
            </div>
        </div>
    </div>
    </div>
</body>

</html>