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
                    yearMonth.setMonth(yearMonth.getMonth() + 1); 
                    var formattedYearMonth = yearMonth.toISOString().slice(0, 7); 
                    loadDogCalendar(dogCode, formattedYearMonth);
                }
            },
            dateClick: function(info) {
                var dogCode = $('#dogSelect').val();
                if (dogCode) {
                    $('#modal').show();
                    $('#modal-date').val(info.dateStr);
                    $('#modal-dog-code').val(dogCode);
                } else {
                    alert("강아지를 선택해주세요.");
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
                            title: event.checkStatus === 'Y' ? '출석' : '결석', 
                            start: event.checkDate, 
                            allDay: true,
                            backgroundColor: color, 
                            borderColor: color 
                        });
                    });
                },
                error: function (error) {
                    console.error('Error fetching data:', error);
                }
            });
        };
        
        // 출석 기록 모달창
        $('#modal-save').on('click', function() {
            var dogCode = $('#modal-dog-code').val();
            var checkDate = $('#modal-date').val();
            var checkStatus = $('#modal-status').val();

            $.ajax({
                url: '${pageContext.servletContext.contextPath}/classbook/regist',
                type: 'POST',
                data: { dogCode: dogCode, checkDate: checkDate, checkStatus: checkStatus },
                success: function(response) {
                    alert("출석 기록이 추가되었습니다.");
                    $('#modal').hide();
                    var yearMonth = checkDate.slice(0, 7);
                    loadDogCalendar(dogCode, yearMonth);
                },
                error: function(error) {
                    console.error('Error adding attendance record:', error);
                    alert("출석 기록 추가 중 오류가 발생했습니다.");
                }
            });
        });

        $('.close').on('click', function() {
            $('#modal').hide();
        });

     	// 첫 번째 강아지를 자동으로 선택
        var firstDogOption = $('#dogSelect option:eq(1)'); // 첫 번째 강아지 옵션
        if (firstDogOption.length) {
        	firstDogOption.prop('selected', true);
            var yearMonth = new Date();
            var formattedYearMonth = yearMonth.toISOString().slice(0, 7); // 변동된 년월을 가져옴
            loadDogCalendar(firstDogOption.val(), formattedYearMonth); // 첫 번째 강아지의 달력 데이터를 로드
        }
        
     	// 반 선택 시 서블릿으로 요청 보내기
        $('#classSelect').change(function() {
            var classCode = $(this).val();
            window.location.href = '${pageContext.servletContext.contextPath}/classbook?classCode=' + classCode;
        });
     	
     	// 페이지 로드 시 반 선택 상태 유지
        var urlParams = new URLSearchParams(window.location.search);
        var selectedClassCode = urlParams.get('classCode');
        if (selectedClassCode) {
            $('#classSelect').val(selectedClassCode);
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
			<!-- 반 선택 select -->
			<select id="classSelect">
			 	<c:forEach var="ddclass" items="${classList}">
	
			 		<option value="${ddclass.classCode}">${ddclass.className}</option>
		
			 	</c:forEach>
			</select>
  		</form>
  		
  		<form>
        <!-- 강아지 선택 select -->
        <select id="dogSelect" onchange="loadDogCalendar(this.value, new Date().toISOString().slice(0, 7))">
          <option value="">강아지를 선택하세요</option>
          <c:forEach var="dog" items="${dogs}">
            <option value="${dog.dogCode}">${dog.dogName}</option>
          </c:forEach>
        </select>
     </form>
     
  </div>

 
  </div>
  
    <div id='calendar'></div>
    
    <div id="modal" class="modal">
    <div class="modal-content">
        <span class="close">&times;</span>
        <h2>출석 정보 등록/수정</h2>
        <form id="attendanceForm">
            <input type="hidden" id="modal-dog-code">
            <label for="modal-date">날짜:</label>
            <input type="text" id="modal-date" readonly><br><br>
            <label for="modal-status">출석 여부:</label>
            <select id="modal-status">
                <option value="Y">출석</option>
                <option value="N">결석</option>
            </select><br><br>
            <button type="button" id="modal-save">저장</button>
        </form>
    </div>
	</div>
	
  </body>
</html>