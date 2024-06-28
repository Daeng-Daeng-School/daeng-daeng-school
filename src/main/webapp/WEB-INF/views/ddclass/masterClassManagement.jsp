<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>댕댕스쿨</title>
<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/common.css">
<style>
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
	
	/* 메인 컨텐츠 설정 */
	.mypage-container .main-content {
	    flex-grow: 1;
	    padding: 20px;
	    padding-left: 250px;
	    margin-top: 60px;
	}
	
	.mypage-container .main-content-header {
	    display: flex;
	    justify-content: space-between;
	    align-items: center;
	}
	
	.mypage-container .main-content h1 {
	    font-size: 28px;
	    margin-bottom: 20px;
	}
	
	.mypage-container .teacher-regist-btn {
	    padding: 5px 10px;
	    border-radius: 20px;
	    border: 1px solid #ccc;
	    background-color: #fff;
	    cursor: pointer;
	    font-size: 14px;
	    display: inline-block;
	    vertical-align: middle;
	    margin-bottom: 20px;
    }
        
    .teacher-list {
        margin-top: 20px;
    }
    
    .teacher-list table {
        width: 100%;
        border-collapse: collapse;
    }
    
    .teacher-list th, .member-list td {
        border: 1px solid #ddd;
        padding: 8px;
        text-align: center;
    }
    
    .teacher-list tr {
    	text-align: center;
    	margin-top: 20px;
    }
    
    .teacher-list th {
    	border: none;
        border-bottom: 2px solid #ddd; /* 하단 테두리선만 추가 */
    }
    
    .modal{
        position: fixed;
        display: none;
        justify-content: center;
        align-items: center; /* 수직 정렬 추가 */
        top:0;
        left:0;
        width:100%;
        height:100%;
        background-color: rgba(0,0,0,0.4);
        }
        
    .modal_body{
        position: absolute; 
        width: 30%;;  //모달의 가로크기 
        max-width: 300px; /* 최대 가로 크기 */
        height: 40%; //모달의 세로크기 
        max-height: 400px; /* 최대 세로 크기 */
        padding: 40px;  
        text-align: center;
        background-color: rgb(255,255,255); //모달창 배경색 흰색
        border-radius: 30px !important; //테두리 
        box-shadow: 0 2px 3px 0 rgba(34,36,38,0.15); //테두리 그림자 

    }
    
    .modal_body {
    	border-radius: 20px; /* 테두리를 더 둥글게 설정 */
	}
    
    .modal .close-btn {
	    position: absolute;
	    top: 10px;
	    right: 10px;
	    cursor: pointer;
	    background-color: #f5f5f5;
	    border: none;
	    padding: 5px 10px;
	    border-radius: 5px;
	}
	
	
	.modal .submit-btn {
	    margin-top: 20px;
	    padding: 10px 20px;
	    border-radius: 5px;
	    border: 1px solid #ccc;
	    background-color: #f5f5f5;
	    cursor: pointer;
	}

	.modal .input-field {
	    width: 80%;
	    padding: 10px;
	    margin-top: 20px;
	    border: 1px solid #000; /* 검정색 테두리 */
	    border-radius: 10px; /* 둥근 모서리 */
	    font-size: 16px;
	}

</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
$(document).ready(function() {
    const modal = $('.modal');
    const btnOpenModal = $('.teacher-regist-btn');
    const btnCloseModal = $('.close-btn');
    const btnSubmitClass = $('#submitClass');

    btnOpenModal.click(function() {
        modal.css('display', 'flex');
    });

    btnCloseModal.click(function() {
        modal.css('display', 'none');
    });

    btnSubmitClass.click(function() {
        const className = $('#className').val();

        $.ajax({
            type: 'POST',
            url: '${pageContext.servletContext.contextPath}/class/regist', 
            data: { className: className },
            success: function(response) {
            	if (response.status === 'success') {
                    alert('반 등록이 완료되었습니다');
                    modal.css('display', 'none');
                    updateClassList();
                } else {
                    alert('반 등록에 실패하였습니다');
                }
            },
            error: function() {
                alert('반 등록에 실패하였습니다');
            }
        });
    });
    
    function updateClassList() {
    	$.ajax({
    		type: 'GET',
    		url: '${pageContext.servletContext.contextPath}/class/list',
    		success: function(response) {
    			const classList = $('#classList');
    			classList.empty();
    			response.forEach(function(ddclass) {
    				const row = `
                        <tr>
                            <td>${ddclass.classCode}</td>
                            <td>${ddclass.className}</td>
                            <td>${ddclass.status ? '활성' : '비활성'}</td>
                        </tr>
                    `;
                    classList.append(row);
                });
            },
            error: function() {
                alert('반 목록을 불러오는데 실패하였습니다.');
            }
        });
    }
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
                <li><a href="${pageContext.servletContext.contextPath}/master/management">선생님 관리</a></li>
                <li><a href="${pageContext.servletContext.contextPath}/class/management" class="current">반 관리</a></li>
            </ul>
    	</div>
    	<div class="main-content">
            <div class="main-content-header">
                <h1>댕댕스쿨 반</h1>
                <button class="teacher-regist-btn">신규 반 등록하기</button>
            </div>
            <div class="teacher-list">
                <table>
                    <thead>
                        <tr>
                        	<th>순번</th>
                            <th>반이름</th>
                            <th>활성 상태</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${requestScope.classList}" var="ddclass">
                            <tr>
                            	<td><c:out value="${ddclass.classCode}"/></td>
                            	<td><c:out value="${ddclass.className}"/></td>
                                <td>
	                                <c:choose>
		                                <c:when test="${ddclass.status == true}">
		                                활성
		                                </c:when>
		                                <c:otherwise>
		                                비활성
		                                </c:otherwise>
	                                </c:choose>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
	</div>
</div>

<div class="modal">
	<div class="modal_body">
		<h3>신규 반 등록하기</h3>
		<input type="text" class="input-field" id="className" placeholder="등록하실 반 이름을 입력하세요">
		<button class="close-btn">닫기</button>
		<button class="submit-btn" id="submitClass">등록</button>
	</div>
</div>

</body>
</html>
