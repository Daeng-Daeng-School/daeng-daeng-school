<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>로그인 페이지</title>
<style>
    
    .login-container .container {
        width: 480px;
		margin: 0 auto; /* 가운데 정렬 */ 
        padding: 20px; /* 내부 여백 */
        position: absolute;
        top: 200px; /* 원하는 위치로 이동 */                                                                                                                                                          
   		left: 50%;
    	transform: translateX(-50%); /* 가운데 정렬 */
    }

    .login-container .input-box {
        width: 100%; /* 입력 상자의 너비를 컨테이너에 맞춤 */
        margin: 0; /* 입력 상자 간의 간격 */
        padding: 15px; /* 입력 상자의 내부 여백 */
        border: 1px solid #ccc; /* 입력 상자의 테두리 */
        box-sizing: border-box; /* padding과 border를 포함한 너비 계산 */
    }
    
    .login-container .input-box:first-of-type {
    	margin: 30px 0 0;
        border-radius: 10px 10px 0 0; /* 첫 입력 상자의 상단 모서리 둥글게 */
        border-bottom: 3px solid #ccc; /* 첫 입력 상자의 하단 테두리 */
    }

    .login-container .input-box:last-of-type {
        border-radius: 0 0 10px 10px; /* 마지막 입력 상자의 하단 모서리 둥글게 */
        border-top: 1px solid #ccc; /* 마지막 입력 상자의 상단 테두리 */ 
    }
    
   .login-container .input-box:focus {
        border-color: #000000; /* 포커스 시 테두리 색을 진한 검정색으로 변경 */
        outline: 1.5px solid #000;
    }

   .login-container .login-btn {
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

    .login-container .login-btn:hover {
        background-color: #828282; /* 버튼에 마우스를 올렸을 때 배경색 변경 */
    }
    
    .login-container .button-container {
        display: flex;
        justify-content: space-between; /* 버튼 사이에 공간을 배치 */
        align-items: center; /* 회원가입 버튼을 로그인 버튼의 하단에 맞춤 */
        flex-direction: column; /* 버튼을 수직으로 배치 */
    }
    
   .login-container .signup-btn-container {
        display: flex;
        justify-content: flex-end; /* 회원가입 버튼을 오른쪽 정렬 */
        width: 100%; /* 전체 너비로 설정 */
        margin-top: 0px; /* 상단 간격 설정 */
    }

   .login-container .signup-btn {
        margin-left: auto; /* 오른쪽 정렬 */
        padding: 0; /* 내부 여백 */
        font-size: 14px; /* 글자 크기 */
        cursor: pointer; /* 마우스 포인터 */
        background: none; /* 배경 제거 */
        border: none; /* 테두리 제거 */
    }

    .login-container .signup-btn:hover {
        color: #787878; /* 마우스를 올렸을 때 텍스트 색상 변경 */
    }
    
    .login-container .highlight {
        font-weight: bold; /* 두껍게 설정 */
    }

    .login-container .normal {
        font-weight: lighter; /* 얇게 설정 */
    }
    
    .login-container .line-spacing {
        line-height: 4.5; /* 줄 간격 설정 */
    }
    
    .login-container .custom-header {
        font-size: 1.75em; /* h1과 h2 사이의 크기 설정 */
        line-height: 1.5; /* 줄 간격 설정 */
        margin: 0 0 10px; /* 하단 여백 설정 */
    }
</style>
</head>
<body>

<jsp:include page="../common/menubar.jsp" />

<script>
window.onload = function() {
    // 탈퇴한 회원의 로그인 실패 시 띄울 alert
    const statusDisAvailableMessage = "<%= request.getAttribute("statusDisAvailableMessage") != null ? request.getAttribute("statusDisAvailableMessage") : "" %>";
    if (statusDisAvailableMessage !== "") {
        alert(statusDisAvailableMessage);
        <% request.removeAttribute("statusDisAvailableMessage"); %>
    }

    // 존재하지 않는 회원의 로그인 실패 시 띄울 alert
    const notfoundMEmberMessage = "<%= request.getAttribute("notfoundMEmberMessage") != null ? request.getAttribute("notfoundMEmberMessage") : "" %>";
    if (notfoundMEmberMessage !== "") {
        alert(notfoundMEmberMessage);
        <% request.removeAttribute("notfoundMEmberMessage"); %>
    }
}
</script>


    <div class="login-container">
    <div class="container">
        <h1 class="custom-header"><span class="highlight">우리 아이들의 모습</span><span class="normal">을</span><br><span class="normal">좀 더 자세히 알고싶다면?</span></h1>
        <form action="login" method="post">
            <input type="text" id="memberId" name="memberId" placeholder="아이디" class="input-box" required><br>
            <input type="password" id="memberPwd" name="memberPwd" placeholder="비밀번호" class="input-box" required><br>
            <div class="button-container">
                <button type="submit" class="login-btn">로그인</button>
                <div class="signup-btn-container">
                    <button type="button" class="signup-btn">회원가입</button>
                </div>
            </div>
        </form>
    </div>
    </div>

</body>
</html>