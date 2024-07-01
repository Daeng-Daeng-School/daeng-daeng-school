<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
    
    .pagination {
        display: flex;
        justify-content: center;
        margin-top: 20px;
    }
    
    .pagination a {
        margin: 0 5px;
        padding: 10px 15px;
        text-decoration: none;
        border: 1px solid #ddd;
        color: #000;
        border-radius: 5px;
    }
    
    .pagination a.active {
        background-color: #007bff;
        color: white;
        border: 1px solid #007bff;
    }
</style>
</head>
<body>

<script> // 선생님 등록 성공 시 띄울 alert
window.onload = function() {
    const message = "<%= session.getAttribute("registTeacherSuccessMessage") != null ? session.getAttribute("registTeacherSuccessMessage") : "" %>";
    if (message) {
        alert(message);
        <% session.removeAttribute("registTeacherSuccessMessage"); %>
    } 
}

function updateFilters() { 
	document.getElementById("filterForm").submit();
}
</script>

<jsp:include page="../common/menubar.jsp"/>

<div class="mypage-container">
    <div class="container">
        <div class="sidebar">
            <ul>
                <li><a href="${pageContext.servletContext.contextPath}/master/mypage">회원정보 관리</a></li>
                <li><a href="${pageContext.servletContext.contextPath}/master/management" class="current">선생님 관리</a></li>
                <li><a href="${pageContext.servletContext.contextPath}/class/management">반 관리</a></li>
            </ul>
    	</div>
    	<div class="main-content">
            <div class="main-content-header">
                <h1>댕댕스쿨 선생님들</h1>
                <form action="${pageContext.servletContext.contextPath}/master/teacherRegist" method="get" style="margin: 0;">
                    <button type="submit" class="teacher-regist-btn">신규 선생님 등록하기</button>
                </form>
            </div>
            <div class="sort-options">
                <form id="filterForm" action="${pageContext.servletContext.contextPath}/master/management" method="get">
                    <label for="sortOrder">정렬 기준:</label>
                    <select id="sortOrder" name="sortOrder" onchange="updateFilters()">
                        <option value="joinDate" ${sortOrder == 'joinDate' ? 'selected' : ''}>등록일 기준</option>
                        <option value="status" ${sortOrder == 'status' ? 'selected' : ''}>활성 상태 기준</option>
                        <option value="classCode" ${sortOrder == 'classCode' ? 'selected' : ''}>담당 반 기준</option>
                    </select>
                    <label for="classFilter">반 선택:</label>
                    <select id="classFilter" name="classFilter" onchange="updateFilters()">
                        <option value="" ${classFilter == '' ? 'selected' : ''}>전체</option>
                        <option value="1" ${classFilter == '1' ? 'selected' : ''}>오전반</option>
                        <option value="2" ${classFilter == '2' ? 'selected' : ''}>오후반</option>
                        <option value="3" ${classFilter == '3' ? 'selected' : ''}>종일반</option>
                    </select>
                    
                    <label for="startDate">시작 날짜:</label>
                    <input type="date" id="startDate" name="startDate" value="${startDate}" onchange="updateFilters()">

                    <label for="endDate">종료 날짜:</label>
                    <input type="date" id="endDate" name="endDate" value="${endDate}" onchange="updateFilters()">

                </form>
            </div>
            <div class="teacher-list">
                <table>
                    <thead>
                        <tr>
                        	<th>순서</th>
                            <th>이름</th>
                            <th>담당 반</th>
                            <th>연락처</th>
                            <th>활성 상태</th>
                            <th>최초 등록일</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${requestScope.teacherList}" var="teacher" varStatus="status">
                            <tr>
                            	<td><c:out value="${status.index + 1}"/></td>
                            	<td>
                            		<a href="${pageContext.servletContext.contextPath}/master/teacherInfo?memberId=${teacher.memberId}">
                                	<c:out value="${teacher.memberName}" />
                                	</a>
                                </td>
                                <td>
						            <c:choose>
						                <c:when test="${teacher.classCode == 1}">
						                    오전반
						                </c:when>
						                <c:when test="${teacher.classCode == 2}">
						                    오후반
						                </c:when>
						                <c:when test="${teacher.classCode == 3}">
						                    종일반
						                </c:when>
						                <c:otherwise>
						                    미정
						                </c:otherwise>
						            </c:choose>
						        </td>
                                <td><c:out value="${teacher.phone}" /></td>
                                <td>
	                                <c:choose>
		                                <c:when test="${teacher.status == true}">
		                                활성
		                                </c:when>
		                                <c:otherwise>
		                                비활성
		                                </c:otherwise>
	                                </c:choose>
                                </td>
                                <td><c:out value="${teacher.formattedDate}" /></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
            
            <!-- 페이지네이션 -->
            <div class="pagination">
            	
            	<!--  현재 페이지가 가운데 위치할 수 있도록 -->
                <c:set var="startPage">
                    <c:choose>
                        <c:when test="${currentPage - 2 <= 1}">1</c:when>
                        <c:otherwise>${currentPage - 2}</c:otherwise>
                    </c:choose>
                </c:set>
                <c:set var="endPage">
                    <c:choose>
                        <c:when test="${startPage + 4 >= totalPages}">${totalPages}</c:when>
                        <c:otherwise>${startPage + 4}</c:otherwise>
                    </c:choose>
                </c:set>
                
                <a href="${pageContext.servletContext.contextPath}/master/management?page=1&sortOrder=${sortOrder}&classFilter=${classFilter}&startDate=${startDate}&endDate=${endDate}">&laquo;&laquo;</a>
                <a href="${pageContext.servletContext.contextPath}/master/management?page=${currentPage > 1 ? currentPage - 1 : 1}&sortOrder=${sortOrder}&classFilter=${classFilter}&startDate=${startDate}&endDate=${endDate}">&laquo;</a>
                
                <c:forEach var="i" begin="${startPage}" end="${endPage}" varStatus="status">
                    <c:if test="${i <= totalPages}">
                        <a href="${pageContext.servletContext.contextPath}/master/management?page=${i}&sortOrder=${sortOrder}&classFilter=${classFilter}&startDate=${startDate}&endDate=${endDate}" class="${i == currentPage ? 'active' : ''}">${i}</a>
                    </c:if>
                </c:forEach>
                
                <a href="${pageContext.servletContext.contextPath}/master/management?page=${currentPage < totalPages ? currentPage + 1 : totalPages}&sortOrder=${sortOrder}&classFilter=${classFilter}&startDate=${startDate}&endDate=${endDate}">&raquo;</a>
                <a href="${pageContext.servletContext.contextPath}/master/management?page=${totalPages}&sortOrder=${sortOrder}&classFilter=${classFilter}&startDate=${startDate}&endDate=${endDate}">&raquo;&raquo;</a>
            </div>
            
        </div>
	</div>
</div>

</body>
</html>