<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
</head>
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/resources/css/common.css">
<style>
    /* 회원가입 폼에 대한 스타일 */
    
        .register-container .custom-header {
        	font-size: 1.75em; /* h1과 h2 사이의 크기 설정 */
        	line-height: 1.5; /* 줄 간격 설정 */
        	margin: 0 0 10px; /* 하단 여백 설정 */
    	}
    
    .register-container .container {
        width: 480px;
        margin: 0 auto; /* 가운데 정렬 */ 
        padding: 20px; /* 내부 여백 */
        position: absolute;
        top: 200px; /* 원하는 위치로 이동 */
        left: 50%;
        transform: translateX(-50%); /* 가운데 정렬 */
    }

    .register-container .input-box {
        width: 100%; /* 입력 상자의 너비를 컨테이너에 맞춤 */
    	margin: 0; /* 입력 상자 간의 간격 */
    	padding: 15px; /* 입력 상자의 내부 여백 */
    	border: 1px solid #ccc; /* 입력 상자의 테두리 */
    	box-sizing: border-box; /* padding과 border를 포함한 너비 계산 */
    }
    
    .register-container .input-box:focus {
    	border-color: #000000; /* 포커스 시 테두리 색을 진한 검정색으로 변경 */
    	outline: 1.5px solid #000;
	}
    
	/* 아이디와 비밀번호 입력 상자에 대한 스타일 */
	.register-container .auth-input:first-of-type {
	    margin: 30px 0 0;
	    border-radius: 10px 10px 0 0; /* 첫 입력 상자의 상단 모서리 둥글게 */
		border-bottom: 3px solid #ccc;
	}

	.register-container .auth-input:last-of-type {
	    border-radius: 0 0 10px 10px; /* 마지막 입력 상자의 하단 모서리 둥글게 */
		border-top: 1px solid #ccc;
	}
    
    .register-container .input-box:focus {
        border-color: #000000; /* 포커스 시 테두리 색을 진한 검정색으로 변경 */
        outline: 1.5px solid #000;
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
    
    .register-container .highlight {
        font-weight: bold; /* 두껍게 설정 */
    }

    .register-container .normal {
        font-weight: lighter; /* 얇게 설정 */
    }
    
    .register-container .line-spacing {
        line-height: 4.5; /* 줄 간격 설정 */
    }
    
    .register-container .custom-header {
        font-size: 1.75em; /* h1과 h2 사이의 크기 설정 */
        line-height: 1.5; /* 줄 간격 설정 */
        margin: 0 0 10px; /* 하단 여백 설정 */
    }
    
	/* 체크박스 그룹 스타일 */
	.register-container .checkbox-group-wrapper {
	    margin-top: 30px; /* 위의 input 박스와 간격 추가 */
	}
	
	.register-container .checkbox-group {
	    display: flex;
	    align-items: center;
	    padding: 15px; /* 내부 여백 */
	    border: 1px solid #ccc; /* 테두리 */
	    border-radius: 10px; /* 모서리 둥글게 */
	    box-sizing: border-box; /* padding과 border를 포함한 너비 계산 */
	}
	
	.register-container .checkbox-group label {
	    margin-left: 10px; /* 체크박스와 레이블 간의 간격 */
	    color: #aaa; /* 초기 레이블 글자 색상 연한 회색 */
	    font-size: 14px; /* 레이블 글자 크기 줄이기 */
	}
	
	.register-container .checkbox-group input[type="checkbox"] {
	    appearance: none; /* 기본 체크박스 스타일 제거 */
	    width: 16px;
	    height: 16px;
	    border: 2px solid #ccc; /* 테두리 색상 */
	    border-radius: 50%; /* 둥근 모서리 */
	    margin-right: 10px; /* 레이블과 간격 */
	    position: relative;
	    cursor: pointer;
	    background-color: #fff; /* 기본 배경색 */
	}
	
	.register-container .checkbox-group input[type="checkbox"]::after {
	    content: '';
	    position: absolute;
	    top: 50%;
	    left: 50%;
	    width: 5;
	    height: 10;
	    border: solid transparent;
	    border-width: 0 2px 2px 0;
	    transform: translate(-50%, -50%) rotate(45deg);
	    opacity: 0; /* 기본 체크 모양 숨김 */
	}
	
	.register-container .checkbox-group input[type="checkbox"]:checked {
	    border-color: #000; /* 체크 시 테두리 색상 검정 */
	}
	
	.register-container .checkbox-group input[type="checkbox"]:checked::after {
	    content: '✔';
	    color: #000;
	    font-size: 12px;
	    top: 50%;
	    left: 50%;
	    transform: translate(-50%, -50%);
	    opacity: 1; /* 체크 시 체크 모양 보임 */
	}
	
	.register-container .checkbox-group input[type="checkbox"]:checked + label {
	    color: #000000; /* 체크되었을 때 레이블 글자 색상 검정 */
	}
	
	.register-container .checkbox-group input[type="checkbox"]:not(:checked) {
    	border-color: #ccc; /* 체크 해제 시 테두리 색상 회색 */
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
        } else {
        	alert("가입이 완료되었습니다! 로그인해 주세요:)")
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

<div class="register-container">
    <div class="container">
        <h1 class="custom-header">회원가입을 진행하세요.</h1>
        <form action="${ pageContext.servletContext.contextPath }/member/regist" method="post">
            <div class="input-group">
            	<button type="button" id="checkIdBtn" class="check-btn">아이디 중복체크</button>
                <input type="text" id="memberId" name="memberId" class="input-box auth-input" placeholder="아이디" required>
                <input type="password" id="memberPwd" name="memberPwd" class="input-box auth-input" placeholder="비밀번호" required>
            </div>
            <div class="input-group spacing-top">
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
            <div class="checkbox-group-wrapper">
            <div class="checkbox-group">
                <input type="checkbox" id="agreement" name="agreement" required>
                <label for="agreement">[필수] 개인정보 및 인증 약관 전체동의</label>
            </div>
            </div>
            <div class="button-container">
                <button type="submit" class="register-btn">회원가입</button>
            </div>
        </form>
    </div>
</div>

</body>
</html>