<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>댕댕스쿨</title>
</head>
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/resources/css/common.css">
<style>
    .mypage-container .input-box {
        width: 480px;
		margin:500px auto; /* 가운데 정렬 */ 
        padding: 20px; /* 내부 여백 */
        position: absolute;
        top: 200px; /* 원하는 위치로 이동 */
   		left: 50%;
    	transform: translateX(-50%); /* 가운데 정렬 */
    }
    
    .mypage-container .container {
        display: flex;
        margin-top: 150px; /* 메뉴바 높이에 맞게 여백 추가 */
    }
    
    /* 사이드바 스타일 설정 */
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
    .mypage-container .sidebar ul li a:hover,
	.mypage-container .sidebar ul li a:focus {
	    color: #000;
	    text-decoration: underline;
	    text-underline-offset: 5px; /* 텍스트와 밑줄 사이의 간격 */
	    text-decoration-thickness: 1.9px;
	}
	
	.mypage-container .sidebar ul li a:active,
	.mypage-container .sidebar ul li a.current {
	    color: #000;
	    text-decoration: underline;
	    text-underline-offset: 5px; /* 텍스트와 밑줄 사이의 간격 */
	    text-decoration-thickness: 1.9px;
	}
	
	/* 메인 컨텐츠 설정*/
	.mypage-container .main-content {
	    flex-grow: 1;
	    padding: 20px;
	}
	
	.mypage-container .main-content h1 {
	    font-size: 28px;
	    margin-bottom: 20px;
	}
	
	.mypage-container .main-content {
        flex-grow: 1;
        padding-left: 250px;
        margin-top: 60px;
    }
    
    .mypage-container .main-content h1 {
        font-size: 28px;
        margin-bottom: 20px;
    }
</style>
<body>

<jsp:include page="../common/menubar.jsp"/>

<div class="mypage-container">
    <div class="container">
        <div class="sidebar">
            <ul>
                <li><a href="#">회원정보 관리</a></li>
                <li><a href="#">선생님 관리</a></li>
            </ul>
    	</div>
    	<div class="main-content">
            <h1>메인 콘텐츠</h1>
            <p>여기에 메인 콘텐츠가 들어갑니다.</p>
        </div>
	</div>
</div>

</body>
</html>