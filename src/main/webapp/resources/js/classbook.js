/**
 * 
 */

// 모달 열기 버튼
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
});


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




