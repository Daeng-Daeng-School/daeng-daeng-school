<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang='en'>
  <head>
    <meta charset='utf-8' />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>댕댕 유치원 출석부</title>
	<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/classbook.css">
    <link href='${pageContext.servletContext.contextPath}/resources/fullcalendar/main.css' rel='stylesheet' />
    <script src='https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js'></script>
    <script src='${pageContext.servletContext.contextPath}/resources/fullcalendar/main.js'></script>
    <script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.14/index.global.min.js'></script>
    <style>
    	/* 달력 위치 조정을 위한 CSS */
	    #calendar {
	  		width: 40%; 
		    height: auto; 
		    margin-left: auto; 
		    margin-right: auto; 
		}
    </style>
    <script>

      document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendar');
        var calendar = new FullCalendar.Calendar(calendarEl, {
            headerToolbar: {
                left: 'prev,next',
                center: 'title',
                right: 'today'
            },
            initialView: 'dayGridMonth',
            events: [], // 초기 빈 이벤트 배열
            datesSet: function(dateInfo) {
                var dogCode = $('#dogSelect').val();
                if (dogCode) {
                	var yearMonth = new Date(dateInfo.start);
                    yearMonth.setMonth(yearMonth.getMonth() + 1); // 한 달 더하기
                    var formattedYearMonth = yearMonth.toISOString().slice(0, 7); // 변동된 년월을 가져옴
                    loadDogCalendar(dogCode, formattedYearMonth);
                }
            }
        });
        calendar.render();
       
     	// 강아지 선택 시 호출되는 함수
        window.loadDogCalendar = function (dogCode, yearMonth) {
        	
            if (!dogCode) {
                calendar.removeAllEvents(); // 강아지 선택 해제 시 이벤트 모두 제거
                return;
            }

            $.ajax({
                url: '${pageContext.servletContext.contextPath}/classbook/member',
                type: 'GET',
                data: { dogCode: dogCode, yearMonth: yearMonth },
                success: function (data) {
                    // 기존 이벤트 제거
                    calendar.removeAllEvents();

                    // 새로운 이벤트 추가
                    data.forEach(function(event) {
                    	var color = event.checkStatus === 'Y' ? 'green' : 'red';
                        calendar.addEvent({
                            title: event.checkStatus === 'Y' ? '출석' : '결석', // 출석 상태
                            start: event.checkDate, // 날짜
                            allDay: true,
                            backgroundColor: color, // 배경 색상
                            borderColor: color // 테두리 색상
                        });
                    });
                },
                error: function (error) {
                    console.error('Error fetching data:', error);
                }
            });
        };

     	// 첫 번째 강아지를 자동으로 선택
        var firstDogOption = $('#dogSelect option:eq(1)'); // 첫 번째 강아지 옵션
        if (firstDogOption.length) {
        	firstDogOption.prop('selected', true);
            var yearMonth = new Date();
            var formattedYearMonth = yearMonth.toISOString().slice(0, 7); // 변동된 년월을 가져옴
            loadDogCalendar(firstDogOption.val(), formattedYearMonth); // 첫 번째 강아지의 달력 데이터를 로드
        }
    });
    </script>
  </head>
  <body>
  <jsp:include page="../common/menubar.jsp"/>
  
  <div class="text-area">
  <span><b>댕댕 유치원 출석부</b>를<br>이용해볼까요?</span>
  <div class="select-bar">
  	<form>
        <!-- 강아지 선택 select -->
        <select id="dogSelect" onchange="loadDogCalendar(this.value, new Date().toISOString().slice(0, 7))">
          <option value="">강아지를 선택하세요</option>
          <c:forEach var="dog" items="${myDogs}">
            <option value="${dog.dogCode}">${dog.dogName}</option>
          </c:forEach>
        </select>
     </form>
  </div>
  </div>
  
    <div id='calendar'></div>
  </body>
</html>