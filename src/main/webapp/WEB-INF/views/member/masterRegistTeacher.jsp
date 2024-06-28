<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>선생님 등록</title>
<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/common.css">
<style>
    .mypage-container .container {
        display: flex;
        margin-top: 80px; /* 메뉴바 높이에 맞게 여백 추가 */
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
        max-width: 800px;
        margin: 0 auto; /* 가운데 정렬 */
        background-color: #fff;
        padding: 20px;
        border-radius: 5px;
        position: relative;
    }

    .register-container .auth-input + .auth-input {
    	margin-top: -1px; /* 경계선이 겹치도록 마진 조정 */
	}
	
	/* 다른 입력 상자들 간의 스타일 */
	.register-container .input-group + .input-group {
	    margin-top: -1px; /* 경계선이 겹치도록 마진 조정 */
	}
	
	.register-container .input-group.spacing-top {
	    margin-top: 30px; /* 아이디/비밀번호 박스와의 간격 */
	}
	
	.register-container .input-group.spacing-top .input-box {
	    border-radius: 10px 10px 0 0; /* 상단 모서리 둥글게 */
	}
	
	.register-container .input-group.last-of-type .input-box {
	    border-radius: 0 0 10px 10px; /* 하단 모서리 둥글게 */
	}

    .register-container .input-group label {
        display: block;
        font-weight: bold;
        margin-bottom: 5px;
    }

    .register-container .input-box,
    .register-container .select-box {
        width: 100%;
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 5px;
        box-sizing: border-box;
        font-size: 16px;
    }

    .register-container .input-box:focus,
    .register-container .select-box:focus {
        border-color: #000;
        outline: 1.5px solid #000;
    }

    .register-container .auth-input:first-of-type {
        margin-top: 30px;
        border-radius: 10px 10px 0 0; /* 첫 입력 상자의 상단 모서리 둥글게 */
        border-bottom: 3px solid #ccc;
    }

    .register-container .auth-input:last-of-type {
        border-radius: 0 0 10px 10px; /* 마지막 입력 상자의 하단 모서리 둥글게 */
        border-top: 1px solid #ccc;
    }

    .register-container .input-group.spacing-top .input-box {
        border-radius: 10px 10px 0 0; /* 상단 모서리 둥글게 */
    }

    .register-container .input-group.last-of-type .input-box {
        border-radius: 0 0 10px 10px; /* 하단 모서리 둥글게 */
    }

    .register-container .register-btn {
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

    .register-container .register-btn:hover {
        background-color: #828282; /* 버튼에 마우스를 올렸을 때 배경색 변경 */
    }

    .register-container .custom-header {
        font-size: 1.75em; /* h1과 h2 사이의 크기 설정 */
        line-height: 1.5; /* 줄 간격 설정 */
        margin: 0 0 10px; /* 하단 여백 설정 */
    }

    .register-container .highlight {
        font-weight: bold; /* 두껍게 설정 */
    }

    .register-container .normal {
        font-weight: lighter; /* 얇게 설정 */
    }

    .register-container .line-spacing {
        line-height: 4.5; /* 줄 간격 설정 */
    }
    
    /* 아이디 중복 체크 버튼 스타일 */
    .register-container .input-group .check-btn {
        position: absolute;
        right: 10px;
        padding: 5px 10px;
        border-radius: 5px;
        border: 1px solid #ccc;
        background-color: #fff;
        cursor: pointer;
        font-size: 14px;
        box-sizing: border-box;
    }

    .register-container .input-group .check-btn:hover {
        background-color: #f0f0f0;
    }
</style>
<!-- 아이디 중복체크 ajax -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
$(document).ready(function() {
	
	var isIdChecked = false;
	
    $('#checkIdBtn').click(function() {
        var memberId = $('#memberId').val();
        if (memberId === "") {
            alert("아이디를 입력해 주세요.");
            return;
        }

        $.ajax({
            url: '${pageContext.servletContext.contextPath}/checkId',
            type: 'POST',
            data: { memberId: memberId },
            success: function(response) {
                if (response.exists) {
                    alert("이미 사용 중인 아이디입니다.");
                    isIdChecked = false;
                    
                } else {
                    alert("사용 가능한 아이디입니다.");
                    isIdChecked = true;
                }
            },
            error: function() {
                alert("아이디 중복 체크 중 오류가 발생했습니다.");
                isIdChecked = false;
            }
        });
    });
    
    $("form").submit(function(event) {
        if (!isIdChecked) {
            alert("아이디 중복체크를 해주세요.");
            event.preventDefault();
        }
    });
    
 	// 아이디 입력 값 변경 시 isIdChecked를 false로 설정
    $("#memberId").on("input", function() {
        isIdChecked = false;
    });
});
</script>
</head>
<body>

<jsp:include page="../common/menubar.jsp"/>

<div class="mypage-container">
    <div class="container">
        <div class="sidebar">
            <ul>
                <li><a href="${pageContext.servletContext.contextPath}/master/mypage">회원정보 관리</a></li>
                <li><a href="${pageContext.servletContext.contextPath}/master/management" class="current">선생님 관리</a></li>
                <li><a href="${pageContext.servletContext.contextPath}/master/class">반 관리</a></li>
            </ul>
        </div>
        <div class="main-content">
            <div class="register-container">
                <div class="container">
                    <form action="${pageContext.servletContext.contextPath}/master/teacherRegist" method="post">
                        <h1 class="custom-header">신규 선생님을 등록하세요.</h1>
                        <div class="input-group">
                        	<button type="button" id="checkIdBtn" class="check-btn">아이디 중복체크</button>
                            <input type="text" id="memberId" name="memberId" class="input-box auth-input" placeholder="아이디" required>
                            <input type="password" id="memberPwd" name="memberPwd" class="input-box auth-input" placeholder="비밀번호" required>
                        </div>
                        <div class="input-group spacing-top">
                            <select id="className" name="className" class="select-box" required>
                                <option value="" disabled selected>담당반을 선택하세요</option>
                                <option value="오전반">오전반</option>
                                <option value="오후반">오후반</option>
                                <option value="종일반">종일반</option>
                            </select>
                        </div>
                        <div class="input-group">
                            <input type="text" id="memberBirth" name="memberBirth" class="input-box" placeholder="생년월일 8자리" required>
                        </div>
                        <div class="input-group">
                            <input type="text" id="memberName" name="memberName" class="input-box" placeholder="이름" required>
                        </div>
                        <div class="input-group">
                            <input type="text" id="phone" name="phone" class="input-box" placeholder="연락처" required>
                        </div>
                        <div class="input-group last-of-type">
                            <input type="text" id="address" name="address" class="input-box" placeholder="주소" required>
                        </div>
                        <div class="button-container">
                            <button type="submit" class="register-btn">등록 하기</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>
