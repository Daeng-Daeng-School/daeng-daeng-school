<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원정보 관리</title>
<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/common.css">
<style>
    .mypage-container .container {
        display: flex;
        margin-top: 150px; /* 메뉴바 높이에 맞게 여백 추가 */
    }

    .mypage-container .sidebar {
        width: 300px;
        background-color: #fff;
        padding: 20px;
        padding-right: 40px; /* 오른쪽 패딩을 추가하여 경계선을 오른쪽으로 이동 */
        height: calc(100vh - 150px); /* 메뉴바 높이를 뺀 높이 설정 */
        box-sizing: border-box;
        border-right: 1px solid #ddd; /* 사이드바 오른쪽 경계 추가 */
    }
    .mypage-container .sidebar ul {
        list-style-type: none;
        padding: 0;
        padding-top: 60px; /* 메뉴 항목을 아래로 이동 */
    }
    .mypage-container .sidebar ul li {
        margin-bottom: 10px;
    }
    .mypage-container .sidebar ul li a {
        text-decoration: none;
        color: #999; /* 클릭 전 연한 회색 */
        font-size: 20px;
        display: block;
        padding: 10px;
        padding-left: 35px; /* 메뉴 항목을 오른쪽으로 이동 */
        border-radius: 5px;
        transition: color 0.3s, text-decoration 0.3s;
    }
    .mypage-container .sidebar ul li a:hover {
        color: #000;
        text-decoration: underline;
        text-underline-offset: 5px; /* 텍스트와 밑줄 사이의 간격 */
        text-decoration-thickness: 1.9px;
    }
    
    .mypage-container .sidebar ul li a.current {
        color: #000;
        text-decoration: underline;
        text-underline-offset: 5px; /* 텍스트와 밑줄 사이의 간격 */
        text-decoration-thickness: 1.9px;
    }
    
    .mypage-container .main-content {
        flex-grow: 1;
        padding: 20px;
    }
    
    .register-container {
        max-width: 600px;
        margin: 0 auto; /* 가운데 정렬 */
        background-color: #fff;
        padding: 20px;
        border-radius: 5px;
    }

    .register-container .input-group {
        margin-bottom: 20px;
    }

    .register-container .input-group label {
        display: block;
        font-weight: bold;
        margin-bottom: 5px;
    }

    .register-container .input-box {
        width: 100%;
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 5px;
        box-sizing: border-box;
        font-size: 16px;
    }

    .register-container .input-box[disabled] {
        background-color: #f9f9f9;
        color: #777;
    }

    .register-container .button-container {
        text-align: center;
    }

    .register-container .register-btn, .register-container .edit-btn {
        width: 100%; /* 버튼의 너비를 컨테이너에 맞춤 */
        margin: 40px 0 10px; /* 버튼 간의 간격 */
        padding: 10px; /* 버튼의 내부 여백 */
        border: none; /* 버튼의 테두리 제거 */
        border-radius: 10px; /* 버튼의 모서리 둥글게 */
        background-color: #aaaaaa; /* 버튼의 배경색 */
        color: white; /* 버튼의 글자색 */
        font-size: 18px; /* 버튼의 글자 크기 */
        cursor: pointer; /* 버튼에 마우스 포인터 */
        box-sizing: border-box; /* padding과 border를 포함한 너비 계산 */
    }

    .register-container .register-btn:hover, .register-container .edit-btn:hover {
        background-color: #828282;
    }

    .register-container .edit-btn {
        margin-top: 20px;
    }
    
    .register-container .withdraw-btn-container {
        display: flex;
        justify-content: flex-end; /* 회원가입 버튼을 오른쪽 정렬 */
        width: 100%; /* 전체 너비로 설정 */
        margin-top: 0px; /* 상단 간격 설정 */
    }

   .register-container .withdraw-btn {
        margin-left: auto; /* 오른쪽 정렬 */
        padding: 0; /* 내부 여백 */
        font-size: 14px; /* 글자 크기 */
        cursor: pointer; /* 마우스 포인터 */
        background: none; /* 배경 제거 */
        border: none; /* 테두리 제거 */
    }

    .register-container .withdraw-btn:hover {
        color: #787878; /* 마우스를 올렸을 때 텍스트 색상 변경 */
    }
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
$(document).ready(function() {

    // 수정하기 버튼 클릭 시
    $("#edit-btn").click(function() {
        $("#phone, #address").prop('disabled', false);
        $("#edit-btn").hide();
        $("#update-btn").show();
    });

    // 수정 완료 버튼 클릭 시
    $("#update-btn").click(function() {
    	
    	var phone = $("#phone").val();
        var address = $("#address").val();

        if (!phone || !address) {
            alert("연락처와 주소를 모두 입력해주세요.");
            return; // 데이터가 없으면 여기서 중단
        }
        
        var updatedData = {
            memberId: $("#memberId").val(),
            memberPwd: $("#memberPwd").val(),
            memberBirth: $("#memberBirth").val(),
            memberName: $("#memberName").val(),
            phone: phone,
            address: address
        };

        $.ajax({
            url: '${pageContext.servletContext.contextPath}/member/update',
            type: 'POST',
            data: updatedData,
            success: function(response) {
                if (response.status == 'success') {
                    alert("회원 정보가 수정되었습니다.");
                    
                 	// DOM 업데이트
                    $("#phone").val(updatedData.phone);
                    $("#address").val(updatedData.address);
                    
                    $("#phone, #address").prop('disabled', true);
                    $("#update-btn").hide();
                    $("#edit-btn").show();
                    
                } else {
                    alert("회원 정보 수정에 실패했습니다.");
                }
            }
        });
    });
    
    // 탈퇴하기 버튼 클릭 시
    $(".withdraw-btn").click(function() {
        if (confirm("정말 탈퇴하시겠습니까?")) {
            window.location.href = '${pageContext.servletContext.contextPath}/member/delete';
        }
    });
});
</script>
</head>
<body>

<jsp:include page="../main/main.jsp"/>

<div class="mypage-container">
    <div class="container">
        <div class="sidebar">
            <ul>
                <li><a href="${pageContext.servletContext.contextPath}/member/mypage" class="current">회원정보 관리</a></li>
                <li><a href="${pageContext.servletContext.contextPath}">반려견정보 관리</a></li>
            </ul>
        </div>
        <div class="main-content">
            <div class="register-container">
            <h1>나의 가입 정보</h1>
                <form id="memberInfoForm">
                    <div class="input-group">
                        <label for="memberId">아이디</label>
                        <input type="text" id="memberId" name="memberId" value="${sessionScope.loginMember.memberId}" class="input-box" required disabled>
                    </div>
                    <div class="input-group">
                        <label for="memberPwd">비밀번호</label>
                        <input type="password" id="memberPwd" name="memberPwd" value=******* class="input-box" required disabled>
                    </div>
                    <div class="input-group">
                        <label for="memberBirth">생년월일</label>
                        <input type="text" id="memberBirth" name="memberBirth" value="${sessionScope.loginMember.memberBirth}" class="input-box" required disabled>
                    </div>
                    <div class="input-group">
                        <label for="memberName">이름</label>
                        <input type="text" id="memberName" name="memberName" value="${sessionScope.loginMember.memberName}" class="input-box" required disabled>
                    </div>
                    <div class="input-group">
                        <label for="phone">연락처</label>
                        <input type="text" id="phone" name="phone" value="${sessionScope.loginMember.phone}" class="input-box" required disabled>
                    </div>
                    <div class="input-group">
                        <label for="address">주소</label>
                        <input type="text" id="address" name="address" value="${sessionScope.loginMember.address}" class="input-box" required disabled>
                    </div>
                    <div class="button-container">
                        <button type="button" id="edit-btn" class="edit-btn">수정하기</button>
                        <button type="button" id="update-btn" class="register-btn" style="display:none;">수정 완료</button>
                        <div class="withdraw-btn-container">
                    		<button type="button" class="withdraw-btn">탈퇴하기</button>
                		</div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

</body>
</html>