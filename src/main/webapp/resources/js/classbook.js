




$(document).ready(function() {
    const selectedMonthInput = $('#selectedMonth');

    // 최소 연도와 월 설정
    const minYearMonth = '2020-01';
    selectedMonthInput.attr('min', minYearMonth);

    // 최대 연도와 월 설정
    function getMaxYearMonth() {
        const currentDate = new Date();
        const currentYear = currentDate.getFullYear();
        let currentMonth = currentDate.getMonth() + 1;
        if (currentMonth < 10) {
            currentMonth = '0' + currentMonth;
        }
        return `${currentYear}-${currentMonth}`;
    }

    const maxYearMonth = getMaxYearMonth();
    selectedMonthInput.attr('max', maxYearMonth);

    // 초기 값 설정
    selectedMonthInput.val(maxYearMonth);
    console.log('선택: ', maxYearMonth);
    console.log('선택된 값: ', selectedMonthInput.val());


	// 페이지 로드 시 초기 데이터 표시
    displayInitialData(maxYearMonth);
	

    // 이벤트 핸들러 등록 (비동기 전송 등)
    $('#getDogMember').click(function(event) {
        event.preventDefault();
        const selectedValue = selectedMonthInput.val();
        console.log('선택된 값 전송: ', selectedValue);
        // 여기서 선택된 값(selectedValue)을 비동기로 처리할 수 있음
        // 예를 들어 AJAX 요청을 보내거나 필요한 로직을 추가할 수 있음
        displayInitialData(selectedValue); //선택된 값으로 초기 데이터를 다시 표시
        
    });
    
    // 초기 데이터 표시 함수
    function displayInitialData(selectedMonth) {
		console.log('선택된 값 전송: ', selectedMonth);
        // AJAX 요청을 통해 서버에서 초기 데이터를 가져옴
        $.ajax({
            url: contextPath + '/classbook/member', // 서블릿 URL
            type: 'GET',
            data: { month: selectedMonth }, // 선택된 연도-월 정보를 전달
            success: function(data) {
                // 서버에서 받아온 데이터를 화면에 출력하는 로직
                // 예시: 서버에서 JSON 형태의 데이터를 받아와서 화면에 표시
                console.log('출석부 데이터 로드 성공');
                console.log('Received data:', data);
                // 예시: 받아온 데이터를 특정 영역에 추가적으로 출력
                // $('#dogClassbookMember1').html(...);
                
                
                // 첫 번째 테이블 데이터 처리
            updateTableData('#listArea1 tbody', data, 1, 15);
            
            // 두 번째 테이블 데이터 처리
            updateTableData('#listArea2 tbody', data, 16, 31);
                
                
                
           /*     
                 // 테이블 바디 가져오기
            var tbody = $('#listArea1 tbody');
            tbody.empty(); // 기존 테이블 데이터 초기화
            
            // 데이터를 테이블에 추가
            $.each(data, function(index, dog) {
                var row = $('<tr>');
                row.append($('<td>').text(dog.DOG_NAME));
                
                for (var day = 1; day <= 15; day++) {
                    var cellValue = dog[day] ? dog[day] : '';
                    row.append($('<td>').text(cellValue));
                }
                
                tbody.append(row);
                
                });
                
              // 테이블 바디 가져오기
            var tbody = $('#listArea2 tbody');
            tbody.empty(); // 기존 테이블 데이터 초기화
            
            // 데이터를 테이블에 추가
            $.each(data, function(index, dog) {
                var row = $('<tr>');
                row.append($('<td>').text(dog.DOG_NAME));
                
                for (var day = 16; day <= 31; day++) {
                    var cellValue = dog[day] ? dog[day] : '';
                    row.append($('<td>').text(cellValue));
                }
                
                tbody.append(row);
                
                });  
        */

            },
            error: function(err) {
                console.error('출석부 데이터 로드 실패', err);
                alert("출석부 데이터 로드 실패");
            }
        });
        
    }
    
    // 테이블 데이터 업데이트 함수
function updateTableData(tableId, data, startDay, endDay) {
    var tbody = $(tableId);
    tbody.empty(); // 기존 테이블 데이터 초기화
    
    $.each(data, function(index, dog) {
        var row = $('<tr>');
        row.append($('<td>').text(dog.DOG_NAME));
        
        for (var day = startDay; day <= endDay; day++) {
            var cellValue = dog[day] ? dog[day] : '';
            row.append($('<td>').text(cellValue));
        }
        
        tbody.append(row);
    });
}
    
    
      
    
});




// 모달 열기 버튼 클릭 시 처리
    $('#openModalBtn').click(function() {
        $('#myModal').css('display', 'block');
    });

    // 모달 닫기 버튼 및 모달 외부 클릭 시 처리
    $('.close').click(function() {
        $('#myModal').css('display', 'none');
    });

    $(window).click(function(event) {
        if (event.target === $('#myModal')[0]) {
            $('#myModal').css('display', 'none');
        }
    });

    // 출석 정보 등록 폼 제출 시 처리
    $('#modalTable').submit(function(event) {
        event.preventDefault();
        // FormData 객체를 생성하여 출석 정보를 수집
        const formData = new FormData($('#attendanceTable')[0]);
        // FormData 객체를 JavaScript 객체로 변환
        const formDataObject = {};
        formData.forEach((value, key) => {
            formDataObject[key] = value;
        });
        console.log('출석 정보:', formDataObject);
        // 여기서 AJAX 요청을 사용하여 서버에 출석 정보를 전송할 수 있습니다.
    });



/*// 모달 열기 버튼
const openModalBtn = document.getElementById('openModalBtn');

// 모달과 닫기 버튼 가져오기
const modal = document.getElementById('myModal');
const closeModalBtn = modal.querySelector('.close');

// 모달 열기 이벤트 리스너
openModalBtn.addEventListener('click', function() {
	modal.style.display = 'block';
});

// 모달 닫기 이벤트 리스너 (닫기 버튼 또는 모달 외부 클릭 시)
closeModalBtn.addEventListener('click', function() {
	modal.style.display = 'none';
});

window.addEventListener('click', function(event) {
	if (event.target === modal) {
		modal.style.display = 'none';
	}
});

// 폼 제출 이벤트 리스너 (임시로 콘솔에 출력)
const modalTable = document.getElementById('modalTable');
modalTable.addEventListener('submit', function(event) {
	event.preventDefault();
	const formData = new FormData(modalTable);
	const formDataObject = Object.fromEntries(formData.entries());
	console.log('게시물 등록 폼 데이터:', formDataObject);
	// 여기서 실제로 서버로 데이터를 전송하거나 다른 작업을 수행할 수 있습니다.
});*/


/*window.onload = function(){

// 회원 출석부 페이지 로드 시 실행되는 함수
function firstData(){
	
	
	
	
}

};*/


/*$(document).ready(function() {

	const selectedMonthInput = document.getElementById('selectedMonth');

	//최소 연도와 월 설정
	const minYearMonth = '2020-01'; // 최소 연도와 월
	selectedMonthInput.setAttribute('min', minYearMonth);

	function getMaxYearMonth() {
		//현재 연도와 월 구하기
		const currentDate = new Date();
		const currentYear = currentDate.getFullYear();
		let currentMonth = currentDate.getMonth() + 1; // getMonth()는 0부터 시작하므로 1을 더해줍니다.
		if (currentMonth < 10) {
			currentMonth = '0' + currentMonth; // 한 자리 숫자일 경우 앞에 0을 추가하여 두 자리로 만듭니다.
		}
		return currentYear + "-" + currentMonth;
		
		return {
            yearMonth: `${currentYear}-${currentMonth < 10 ? '0' + currentMonth : currentMonth}`,
            year: currentYear,
            month: currentMonth
        };
	}

	//const maxYearMonth = `${currentYear}-${currentMonth}`;
	//const maxYearMonthObj = getMaxYearMonth();
	//const maxYearMonth = maxYearMonthObj.yearMonth;
	const maxYearMonth = getMaxYearMonth();
	

	//최대 연도와 월 설정
	selectedMonthInput.setAttribute('max', maxYearMonth);

	//초기 값 설정 (현재 연도와 월을 기준으로 설정)
	selectedMonthInput.value = maxYearMonth;

	console.log('선택: ', maxYearMonth);
	console.log('선태기 ', selectedMonthInput.value);


	$("#getDogMember").click(function() {

		var month = selectedMonthInput.value;

		$.ajax({
			url: "${pageContext.request.contextPath}/classbook/member",
			type: "get",
			data: {
				month: month
			},
			success: function(data) {
				displayResultMember(data);
			},
			error: function() {
				console.log("출석부 조회 실패");
			}
		});
	});

	function displayResultMember(dogClassbook) {

		var dogClassbookHtml = '<table>';
		$.each(dogClassbook, function(index, item) {
			dogClassbookHtml += '<tr>';
			dogClassbookHtml += '<td>' + item.dogName + '</td>';
			for (var i = 0; i < item.dayList.length; i++) {
				dogClassbookHtml += '<td>' + item.dayList[i] + '</td>';
			}
			dogClassbookHtml += '</tr>';
		});
		dogClassbookHtml += '</table>';
		$("#dogClassbookMember").html(dogClassbookHtml);

	}
});*/


/*// 회원 출석부 리스트 조회
$("#getDogMember").click(function(){
	
			var month = document.getElementById('month').value;
			//var dogCode = $("#dogCode").val();
			
			$.ajax({
				url: "${pageContext.request.contextPath}/classbook/member",
				type: "get",
				data: {
					month: month
				},
				success: function(data){
					displayResultMember(data);
				},
				error: function(){
					console.log("출석부 조회 실패");
				}
			});
		});
		
function displayResultMember(dogClassbook){
	
	var dogClassbookHtml = '<table>';
	$.each(dogClassbook, function(index, item){
		dogClassbookHtml += '<tr>';
		dogClassbookHtml += '<td>'+ item.dogName +'</td>';
		for(var i=0; i<item.dayList.length; i++){
			dogClassbookHtml += '<td>'+item.dayList[i] + '</td>';
			}
			dogClassbookHtml += '</tr>';
	});
	dogClassbookHtml += '</table>';
	$("#dogClassbookMember").html(dogClassbookHtml);
	
	
	
	
	dogClassbook.forEach(function(dogClassbook){
		
		
		<tr>
		<td>${dogClassbook.dogName}</td>
		
		<td>${dogClassbook.${day}}</td>
		</tr>
		</table>
	});

	
}*/




