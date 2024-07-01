




$(document).ready(function() {
	//값 가져오기
	const selectedMonthInput = $('#selectedMonth');
	const selectedClassInput = $('#selectedClass');

	// 최소 연도와 월 설정
	const minYearMonth = '2020-01';
	selectedMonthInput.attr('min', minYearMonth);

	//현재 연도와 월 구하기
	function getMaxYearMonth() {
		const currentDate = new Date();
		const currentYear = currentDate.getFullYear();
		let currentMonth = currentDate.getMonth() + 1; // getMonth()는 0부터 시작하므로 1을 더해줍니다.
		if (currentMonth < 10) {
			currentMonth = '0' + currentMonth; // 한 자리 숫자일 경우 앞에 0을 추가하여 두 자리로 만듭니다.
		}
		return `${currentYear}-${currentMonth}`;
	}

	// 최대 연도와 월 설정
	const maxYearMonth = getMaxYearMonth();
	selectedMonthInput.attr('max', maxYearMonth);

	// 초기 값 설정
	selectedMonthInput.val(maxYearMonth);
	console.log('선택: ', maxYearMonth);
	console.log('선택된 값: ', selectedMonthInput.val());


	/*	// 페이지 로드 시 초기 데이터 표시
		function displayInitialDataOnPermission(permission){
			if(permission.roleCode === 1 || permission.roleCode === 2){
				displayInitialAdminData(maxYearMonth, selectedClassInput.val());
			}else if(permission.roleCode === 3){
				displayInitialMemberData(maxYearMonth);
			}
		}*/

	displayInitialAdminData(maxYearMonth, selectedClassInput.val());


	//회원 페이지
	// 이벤트 핸들러 등록 (비동기 전송 등)
	$('#getDogMember').click(function(event) {
		event.preventDefault();
		const selectedValue = selectedMonthInput.val();
		console.log('선택된 값 전송: ', selectedValue);
		// 여기서 선택된 값(selectedValue)을 비동기로 처리할 수 있음
		// 예를 들어 AJAX 요청을 보내거나 필요한 로직을 추가할 수 있음
		displayInitialMemberData(selectedValue); //선택된 값으로 초기 데이터를 다시 표시

	});


	//관리자 페이지
	// 이벤트 핸들러 등록 (비동기 전송 등)

	$('#getDogAdmin').click(function(event) {
		event.preventDefault();
		const selectedValue = selectedMonthInput.val();
		const selectedClass = selectedClassInput.val();
		console.log('선택된 값 전송: ', selectedValue, selectedClass);
		// 여기서 선택된 값(selectedValue)을 비동기로 처리할 수 있음
		// 예를 들어 AJAX 요청을 보내거나 필요한 로직을 추가할 수 있음
		displayInitialAdminData(selectedValue, selectedClass); //선택된 값으로 초기 데이터를 다시 표시

	});



	// 초기 데이터 표시 함수
	function displayInitialMemberData(selectedMonth) {
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
				updateMemberTableData('#listArea1 tbody', data, 1, 15);

				// 두 번째 테이블 데이터 처리
				updateMemberTableData('#listArea2 tbody', data, 16, 31);



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


	function displayInitialAdminData(selectedMonth, selectedClass) {
		console.log('선택된 값 전송: ', selectedMonth, selectedClass);
		// AJAX 요청을 통해 서버에서 초기 데이터를 가져옴
		$.ajax({
			url: contextPath + '/classbook/admin', // 서블릿 URL
			type: 'GET',
			data: { month: selectedMonth, classCode: selectedClass }, // 선택된 연도-월, 클래스 정보를 전달
			success: function(data) {
				// 서버에서 받아온 데이터를 화면에 출력하는 로직
				// 예시: 서버에서 JSON 형태의 데이터를 받아와서 화면에 표시
				console.log('출석부 데이터 로드 성공');
				console.log('Received data:', data);
				// 예시: 받아온 데이터를 특정 영역에 추가적으로 출력
				// $('#dogClassbookMember1').html(...);


				updateAdminTableData('#listArea', data);

			},
			error: function(err) {
				console.error('출석부 데이터 로드 실패', err);
				alert("출석부 데이터 로드 실패");
			}
		});

	}




	// 테이블 데이터 업데이트 함수
	function updateMemberTableData(tableId, data, startDay, endDay) {
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




	function updateAdminTableData(tableId, data) {
		// 테이블 바디 가져오기
		var tbody = $(tableId);
		tbody.empty(); // 기존 테이블 데이터 초기화


		// 테이블 헤더를 동적으로 구성
		var thead = $('<thead>');
		var headRow = $('<tr class="head-tr">');
		headRow.append($('<th>날짜/반려견</th>'));




		// 최대 키 수를 저장할 변수와 인덱스변수 초기화
		var maxKeysCount = 0;
		var num = 0;
		
		// 데이터 배열을 순회하면서 각 객체의 키 수를 비교
		for (var i = 0; i < data.length; i++) {
			var keysCount = Object.keys(data[i]).length; // i번째 객체의 키 수

			// 최대 키 수 갱신
			if (keysCount > maxKeysCount) {
				maxKeysCount = keysCount;
				num = i;
			}
		}



		// 동적으로 강아지 이름(열)을 헤더에 추가
		var keys = Object.keys(data[num]); // 데이터의 maxKeysCount 번째 객체의 키들을 가져옴
			console.log(keys);
		for (var i = 1; i < keys.length; i++) {
			var nameValue = keys[i];
			console.log(nameValue);
			headRow.append($('<th>').text(nameValue));
		}


		thead.append(headRow);
		tbody.append(thead);


		// 데이터를 순회하면서 테이블 내용 구성
		var tbodyElement = $('<tbody>');
		for (var day = 1; day <= 31; day++) {
			var bodyRow = $('<tr class="body-tr">');
			bodyRow.append($('<td>' + day + '일' + '</td>')); // 날짜 행 추가

			for (var j = 1; j < keys.length; j++) {
				var found = false;
				for (var i = 0; i < data.length; i++) {
					if (parseInt(data[i].CHECK_DATE) === day) {
						if (data[i][keys[j]] !== undefined) {
							bodyRow.append($('<td>' + data[i][keys[j]] + '</td>'));
							found = true;
							break;
						} else {
							bodyRow.append($('<td>' + '' + '</td>'));
							found = true;
							break;
						}

					}
				}
				if (!found) {
					bodyRow.append($('<td>' + '' + '</td>'));
				}
			}

			tbodyElement.append(bodyRow);
		}

		tbody.append(tbodyElement);
		console.log(tbody);
	}



	/*
	
	
	
	
		//모달창 파트
	
		let selectedAttendanceId = null; // 선택된 출결 ID를 저장할 변수
	
		// 모달 열기 버튼 클릭 시 처리
		$('#listArea').on('click', '.body-tr', function() {
	
			// 여기서 해당 출결의 ID를 가져와 selectedAttendanceId에 저장
			selectedAttendanceId = $(this).data('attendance-id');
			$('#myModal').css('display', 'block');
	
			// AJAX를 통해 해당 출결 정보를 가져와서 모달에 반영할 수도 있음
			// 예시: AJAX 요청을 통해 서버에서 해당 출결 정보를 가져와서 모달에 반영
			// $.ajax({
			//     url: contextPath + '/attendance/details',
			//     type: 'GET',
			//     data: { attendanceId: selectedAttendanceId },
			//     success: function(response) {
			//         // 모달에 데이터를 반영하는 로직
			//         updateModalWithData(response);
			//     },
			//     error: function(xhr, status, error) {
			//         console.error('출결 정보 가져오기 실패:', error);
			//     }
			// });
	
	
		});
	
		// 모달 닫기 버튼 및 모달 외부 클릭 시 처리
		$('.close').click(function() {
			$('#myModal').css('display', 'none');
	
			selectedAttendanceId = null;
		});
	
		$(window).click(function(event) {
			if (event.target === $('#myModal')[0]) {
				$('#myModal').css('display', 'none');
	
				selectedAttendanceId = null;
			}
		});
	
	
	
		
	
		// 출결 수정 버튼 클릭 시 처리
		$('#updateAttendanceBtn').click(function() {
			if (!selectedAttendanceId) {
				alert('출결을 선택해주세요.');
				return;
			}
			const formData = new FormData($('#attendanceForm')[0]);
			formData.append('attendanceId', selectedAttendanceId);
			updateAttendance(formData);
		});
	
		// 출결 삭제 버튼 클릭 시 처리
		$('#deleteAttendanceBtn').click(function() {
			if (!selectedAttendanceId) {
				alert('출결을 선택해주세요.');
				return;
			}
			const confirmDelete = confirm('정말로 삭제하시겠습니까?');
			if (confirmDelete) {
				deleteAttendance(selectedAttendanceId);
			}
		});
	
		// 출결 정보 등록 함수
		function submitAttendance(formData) {
			$.ajax({
				url: contextPath + '/attendance/register',
				type: 'POST',
				data: formData,
				processData: false,
				contentType: false,
				success: function(response) {
					console.log('출결 정보 등록 성공');
					// 여기에 성공 시 처리할 로직 추가
				},
				error: function(xhr, status, error) {
					console.error('출결 정보 등록 실패:', error);
					// 여기에 실패 시 처리할 로직 추가
				}
			});
		}
	
		// 출결 정보 수정 함수
		function updateAttendance(formData) {
			$.ajax({
				url: contextPath + '/attendance/update',
				type: 'POST',
				data: formData,
				processData: false,
				contentType: false,
				success: function(response) {
					console.log('출결 정보 수정 성공');
					// 여기에 성공 시 처리할 로직 추가
				},
				error: function(xhr, status, error) {
					console.error('출결 정보 수정 실패:', error);
					// 여기에 실패 시 처리할 로직 추가
				}
			});
		}
	
		// 출결 정보 삭제 함수
		function deleteAttendance(attendanceId) {
			$.ajax({
				url: contextPath + '/attendance/delete',
				type: 'POST',
				data: { attendanceId: attendanceId },
				success: function(response) {
					console.log('출결 정보 삭제 성공');
					// 여기에 성공 시 처리할 로직 추가
					$('#myModal').css('display', 'none');
					selectedAttendanceId = null;
				},
				error: function(xhr, status, error) {
					console.error('출결 정보 삭제 실패:', error);
					// 여기에 실패 시 처리할 로직 추가
				}
			});
		}
	
		// 출석 정보 등록 폼 제출 시 처리
		$('#submitClassbookBtn').click(function(event) {
			event.preventDefault();
	
			// FormData 객체를 생성하여 출석 정보를 수집
			const formData = new FormData(this);
	
			// 출석 정보를 확인하여 출력
			for (let pair of formData.entries()) {
				console.log(pair[0], pair[1]);
			}
	
			// AJAX 요청을 사용하여 서버에 출석 정보를 전송할 수 있습니다.
			$.ajax({
				url: contextPath + '/classbook/regist', // 출석 정보 등록 서블릿 URL
				type: 'POST',
				data: formData,
				processData: false,  // 데이터를 query string으로 변환하지 않음
				contentType: false,  // 데이터 타입을 설정하지 않음 (FormData를 사용할 경우)
				success: function(response) {
					console.log('출석 정보 등록 성공');
					// 여기에 성공 시 처리할 로직 추가
				},
				error: function(xhr, status, error) {
					console.error('출석 정보 등록 실패:', error);
					// 여기에 실패 시 처리할 로직 추가
				}
			});
		});
	
	
		
	
	*/













	// 각 테이블 행을 클릭할 때 모달창 열기 및 해당 행의 데이터 보여주기
	$('#listArea').on('click', '.body-tr', function() {
		
		// 여기서 행의 데이터 유무를 확인하고 처리
        var rowDataExists = checkRowDataExists(this); // 함수로 데이터 유무 확인

        // 데이터가 있으면 수정/삭제 버튼 보이기, 없으면 등록 버튼 보이기
        if (rowDataExists) {
            $('#editDeleteBtns').show();
            $('#registerBtn').hide();
        } else {
            $('#editDeleteBtns').hide();
            $('#registerBtn').show();
        }
        
        
	/*	// 선택한 행의 날짜를 postId에 설정
		var day = $(this).attr('data-id');
		$('#postId').val(day);
		console.log(day);*/

		// 날짜/반려견 테이블 헤더에서 강아지 이름 가져오기
		var dogNames = [];
		$('#listArea thead .head-tr th').each(function(index) {
			if (index > 0) { // 첫 번째 칼럼(날짜/반려견) 제외
				dogNames.push($(this).text().trim().replace());
			}
		});



		// 모달 테이블 헤더에 강아지 이름 설정하기
		$('#modalTable thead .head-tr th').each(function(index) {
			if (index > 0) { // 첫 번째 칼럼(출결) 제외
				if (index <= dogNames.length) {
					$(this).text(dogNames[index - 1]);
				} else {
					$(this).text('');
				}
			}
		});


		console.log('모달창 나오나요?');

		// 출석 및 결석 데이터를 가져와서 모달에 설정
		var attendanceRow = $('#attendanceRow');
		var absenceRow = $('#absenceRow');


		// 각 체크박스에 해당 데이터 설정
		$(this).find('td').each(function(index) {
			if (index > 0) { // 첫 번째 칼럼(날짜) 제외
				var checkboxAttendance = $('#attendanceRow td:eq(' + (index - 1) + ') input[type="checkbox"]');
				var checkboxAbsence = $('#absenceRow td:eq(' + (index - 1) + ') input[type="checkbox"]');
				var attendanceValue = $(this).text().trim();

				if (attendanceValue === 'Y') {
					$(checkboxAttendance).prop('checked', true);
					$(checkboxAbsence).prop('checked', false);
				} else if (attendanceValue === 'N') {
					$(checkboxAttendance).prop('checked', false);
					$(checkboxAbsence).prop('checked', true);
				} else {
					$(checkboxAttendance).prop('checked', false);
					$(checkboxAbsence).prop('checked', false);
				}
			}
		});

		console.log('모달창 나오나요?');




		/*
		$('#listArea').on('click', '.body-tr', function() {
			selectedAttendanceId = $(this).data('attendance-id');
			$('#myModal').css('display', 'block');
		
			// AJAX를 통해 해당 출결 정보를 가져와서 모달에 반영
			$.ajax({
				url: contextPath + '/attendance/details',
				type: 'GET',
				data: { attendanceId: selectedAttendanceId },
				success: function(response) {
					// 서버에서 받아온 데이터를 모달에 반영하는 함수 호출
					updateModalWithData(response);
				},
				error: function(xhr, status, error) {
					console.error('출결 정보 가져오기 실패:', error);
				}
			});*/






		// 모달 열기
		$('#myModal').css('display', 'block');
	});

	// 모달 닫기
	$('.close').on('click', function() {
		$('#myModal').css('display', 'none');
	});


	/*//모달 외부 클릭 시 처리
		$(window).click(function(event) {
		if (event.target === $('#myModal')[0]) {
			$('#myModal').css('display', 'none');

			
		}
	});*/



	// 등록 버튼 이벤트 리스너
    $('#submitClassbookBtn').on('click', function() {
        // 출석 체크박스 정보 가져오기
        var attendanceValues = [];
        $('#attendanceRow input[type="checkbox"]').each(function() {
           /* attendanceValues.push({
                //name: $(this).attr('name'),
                value: $(this).is(':checked') ? 'Y' : ''
                });*/
                
                attendanceValues.push($(this).is(':checked') ? 'Y' : '');
                
                 
            });
            
        /*    var checkboxName = $(this).attr('name');
        var checkboxValue = $(this).is(':checked') ? 'Y' : '';

        // dogNames 배열에 있는 강아지 이름을 attendanceValues 배열에 추가하기
        var dogNames = [];
        $('#listArea thead .head-tr th').each(function(index) {
            if (index > 0) { // 첫 번째 칼럼(날짜/반려견) 제외
                dogNames.push($(this).text().trim());
            }
        });
            
            // 각 출석 정보 객체에 name 속성과 dogNames 배열 추가
        var attendanceInfo = {
            name: checkboxName,
            value: checkboxValue,
            dogNames: []
        };

        // dogNames 배열의 길이를 구해서 해당 인덱스의 데이터를 추가
        var dogNamesLength = dogNames.length;
        for (var i = 0; i < dogNamesLength; i++) {
            attendanceInfo.dogNames.push(dogNames[i]);
        }

        attendanceValues.push(attendanceInfo); */
         
     

		console.log(attendanceValues);
		
        // 결석 체크박스 정보 가져오기
        var absenceValues = [];
        $('#absenceRow input[type="checkbox"]').each(function() {
           /* absenceValues.push({
               // name: $(this).attr('name'),
                value: $(this).is(':checked') ? 'N' : ''
                
                });*/
                absenceValues.push($(this).is(':checked') ? 'Y' : '');
            
        });
        
        console.log(absenceValues);


	
		const selectedValue = $('#selectedMonth').val();
		const selectedClass = selectedClassInput.val();

		console.log(selectedMonth);
		console.log(selectedClass);
		
		// AJAX를 이용해 서버로 데이터 전송
        $.ajax({
            type: 'POST',
            url: contextPath + '/classbook/regist',
            data: {
	
                attendance: attendanceValues,
                absence: absenceValues,
                month: selectedMonth,
                classCode: selectedClass
            },
            success: function(response) {
				console.log(response);
                alert('등록이 완료되었습니다.');
                // 등록 성공 후 추가 작업
                
                
                // 성공적으로 데이터를 서버에 전송한 후 처리
            // 테이블에 데이터를 추가하고 모달창을 닫기 등의 작업 수행
            // 예시로 모달 닫기
            $('#myModal').css('display', 'none');

            // 테이블에 데이터 추가 함수 호출
            addDataToTable(response); // response는 서버에서 받은 데이터일 것입니다.
            
            
            },
            error: function(err) {
                alert('등록 중 오류가 발생했습니다.');
                console.error('등록 실패', err);
            }
        });

	});

	// 수정 버튼 이벤트 리스너
	$('#editClassbookBtn').on('click', function() {
		// 수정 로직 추가
	});

	// 삭제 버튼 이벤트 리스너
	$('#deleteClassbookBtn').on('click', function() {
		// 삭제 로직 추가
	});


	function checkRowDataExists(row) {
    var dataExists = false;

    // tr 요소 안의 모든 td 요소를 순회합니다.
    $(row).find('td').each(function() {
        var cellText = $(this).text().trim();
        if (cellText === 'Y' || cellText === 'N') {
            dataExists = true;
            // Y 또는 N 값을 찾으면 순회를 멈춥니다.
            return false;
        }
    });

    return dataExists;
}



	function addDataToTable(data) {
    // data를 테이블에 추가하는 로직을 구현
    // 예시로 테이블 행(tr)을 생성하고 데이터를 추가하는 방식으로 구현할 수 있습니다.
    var newRow = '<tr><td>' + data.someValue + '</td><td>' + data.anotherValue + '</td></tr>';
    $('#listArea tbody').append(newRow);
}




	/*	// 출석 정보 등록 함수
		function submitAttendance(formData) {
			$.ajax({
				url: contextPath + '/attendance/register',
				type: 'POST',
				data: formData,
				processData: false,
				contentType: false,
				success: function(response) {
					console.log('출결 정보 등록 성공');
					// 여기에 성공 시 처리할 로직 추가
				},
				error: function(xhr, status, error) {
					console.error('출결 정보 등록 실패:', error);
					// 여기에 실패 시 처리할 로직 추가
				}
			});
		}
*/
	

});


/*//모달창 반영
$('#listArea').on('click', '.body-tr', function() {
	selectedAttendanceId = $(this).data('attendance-id');
	$('#myModal').css('display', 'block');

	// AJAX를 통해 해당 출결 정보를 가져와서 모달에 반영
	$.ajax({
		url: contextPath + '/attendance/details',
		type: 'GET',
		data: { attendanceId: selectedAttendanceId },
		success: function(response) {
			// 서버에서 받아온 데이터를 모달에 반영하는 함수 호출
			updateModalWithData(response);
		},
		error: function(xhr, status, error) {
			console.error('출결 정보 가져오기 실패:', error);
		}
	});
});



function updateModalWithData(data) {
	// 예시: 데이터를 받아서 모달 내부의 요소에 반영하는 로직
	$('#modalAttendanceId').text(data.attendanceId);
	$('#modalStudentName').text(data.studentName);
	$('#modalAttendanceDate').text(data.attendanceDate);
	// 필요한 만큼 다른 데이터를 추가로 처리할 수 있습니다.
}

*/





/* //등록수정삭제모달창
$(document).ready(function() {
	const modal = $('#myModal');
	const closeBtn = $('.close');
	let selectedRowData = null;

	// 테이블 행 클릭 이벤트
	$('.body-tr').on('click', function() {
		const rowData = {
			day: $(this).attr('data-id'),
			data: []
		};

		// 해당 행의 데이터 수집
		$(this).find('td').each(function() {
			const content = $(this).attr('data-content');
			rowData.data.push(content);
		});

		// 모달에 데이터 채우기
		fillModal(rowData);
		selectedRowData = rowData;

		// 모달 열기
		modal.css('display', 'block');
	});

	// 모달 닫기 버튼 클릭 이벤트
	closeBtn.on('click', function() {
		modal.css('display', 'none');
	});

	// 모달 바깥 클릭 시 닫기
	$(window).on('click', function(event) {
		if (event.target === modal.get(0)) {
			modal.css('display', 'none');
		}
	});

	// 수정 버튼 클릭 시
	$('#editClassbookBtn').on('click', function() {
		if (selectedRowData) {
			console.log('Selected Row Data:', selectedRowData);
			// 선택된 데이터로 모달의 출석/결석 상태 업데이트
			updateAttendanceStatus(selectedRowData);
		}
	});

	// 모달 데이터 채우기 함수
	function fillModal(rowData) {
		$('#modalTableBody #attendanceRow td').each(function(index) {
			const checkbox = $(this).find('input[type="checkbox"]');
			if (rowData.data[index] === 'Y') {
				checkbox.prop('checked', true);
			} else {
				checkbox.prop('checked', false);
			}
		});

		$('#modalTableBody #absenceRow td').each(function(index) {
			const checkbox = $(this).find('input[type="checkbox"]');
			if (rowData.data[index] === 'N') {
				checkbox.prop('checked', true);
			} else {
				checkbox.prop('checked', false);
			}
		});
	}

	// 출석/결석 상태 업데이트 함수 (임시)
	function updateAttendanceStatus(rowData) {
		// 여기서 실제로 서버로 데이터 전송 또는 다른 작업 수행
		console.log('Updating attendance status for day:', rowData.day);
		console.log('Attendance:', $('#attendanceRow input[type="checkbox"]').serialize());
		console.log('Absence:', $('#absenceRow input[type="checkbox"]').serialize());
	}
});*/
























/*// 테이블의 각 행을 클릭했을 때의 처리
	$('#listArea').on('click', 'tbody tr', function() {
		// 현재 클릭된 행에서 데이터가 있는지 확인
		var hasData = $(this).find('td').length > 0;

		// 등록 버튼과 수정/삭제 버튼을 토글
		if (hasData) {
			$('#registerBtn').hide();
			$('#editDeleteBtns').show();
		} else {
			$('#registerBtn').show();
			$('#editDeleteBtns').hide();
		}
	});

	// 등록 버튼 클릭 시 모달 창 열기
	$('#registerBtn').click(function() {
		// 모달 창을 열고 초기화하는 등록 폼 처리
		openModalForRegistration();
	});

	// 수정 버튼 클릭 시 모달 창 열기
	$('#editBtn').click(function() {
		// 선택된 행의 데이터를 가져와서 모달 창을 열어 수정 폼을 채우는 처리
		openModalForEdit();
	});

	// 삭제 버튼 클릭 시 모달 창 열기
	$('#deleteBtn').click(function() {
		// 선택된 행의 데이터를 가져와서 모달 창을 열어 삭제 처리를 확인하는 로직
		openModalForDelete();
	});

	// 출석 정보 등록 폼 제출 시 처리
	$('#attendanceForm').submit(function(event) {
		event.preventDefault();
		const formData = new FormData(this);
		submitAttendance(formData);
	});

	// 등록 폼 초기화 및 모달 창 열기
	function openModalForRegistration() {
		// 모달 창을 열고 등록 폼을 초기화
		$('#myModal').css('display', 'block');
		// 등록 폼 초기화 등 추가 작업
	}

	// 수정 폼 초기화 및 모달 창 열기
	function openModalForEdit() {
		// 모달 창을 열고 수정 폼을 초기화
		$('#myModal').css('display', 'block');
		// 선택된 행의 데이터를 가져와서 수정 폼을 채우는 추가 작업
	}

	// 삭제 처리 확인 모달 창 열기
	function openModalForDelete() {
		// 모달 창을 열고 삭제 처리 확인 폼을 보여주는 추가 작업
		$('#myModal').css('display', 'block');
		// 선택된 행의 데이터를 가져와서 삭제 처리를 확인하는 로직
	}

	// AJAX를 사용하여 출석 정보를 서버에 제출
	function submitAttendance(formData) {
		$.ajax({
			url: contextPath + '/attendance/register',
			type: 'POST',
			data: formData,
			processData: false,
			contentType: false,
			success: function(response) {
				console.log('출석 정보 등록 성공:', response);
				// 성공 시 추가 작업
			},
			error: function(xhr, status, error) {
				console.error('출석 정보 등록 실패:', error);
				// 실패 시 추가 작업
			}
		});
	}

	// 모달 닫기 버튼 및 모달 외부 클릭 시 처리
	$('.close').click(function() {
		$('#myModal').css('display', 'none');
	});

	$(window).click(function(event) {
		if (event.target === $('#myModal')[0]) {
			$('#myModal').css('display', 'none');
		}
	}); */


/*// 모달 열기 버튼 클릭 시 처리
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
	});*/



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



/* // 모달 열기 버튼 클릭 시 처리
	$('#listArea').on('click', '.body-tr', function() {
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
*/








