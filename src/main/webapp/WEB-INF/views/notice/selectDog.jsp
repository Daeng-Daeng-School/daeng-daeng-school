<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>반과 반려견 선택</title>
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/resources/css/notice.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
/* 재선택 버튼의 추가 스타일링 */
.reselect-button {
	display: none; /* 처음에는 숨겨짐 */
}
</style>
</head>
<body>
	<!-- 검색 섹션 시작 -->
	<div class="search-input-container">
		<!-- 반 선택 -->
		<select id="searchClass" class="search-select" name="ddclass"
			onchange="fetchDogs(this.value)" required>
			<option value="" disabled selected>반 선택</option>
		</select>

		<!-- 선택된 반려견 표시를 위한 선택 -->
		<select id="searchDog" class="search-select" name="dog"
			onchange="updateSelected()" required>
			<option value="" disabled selected>반려견 선택</option>
		</select>

		<!-- 선택 버튼 -->
		<a id="selectButton" onclick="select()" class="select-button">선택</a>

		<!-- 재선택 버튼 (처음에는 숨겨짐) -->
		<a id="reselectButton" onclick="reselect()" class="reselect-button">변경</a>
	</div>
	<!-- 검색 섹션 끝 -->



	<script>
		$(document)
				.ready(
						function() {
							fetchClasses(); // 페이지 로딩 시 반 리스트 가져오기

							// 반 리스트 가져오기
							function fetchClasses() {
								$
										.ajax({
											url : "${pageContext.servletContext.contextPath}/notice/selectClassDog",
											method : "GET",
											success : function(data) {
												console.log('반 리스트 받음:', data);
												var searchClass = $('#searchClass');
												searchClass.empty();
												searchClass
														.append('<option value="" disabled selected>반 선택</option>');
												$
														.each(
																data,
																function(index,
																		item) {
																	searchClass
																			.append('<option value="' + item.classCode + '">'
																					+ item.className
																					+ '</option>');
																});
											},
											error : function(xhr, status, error) {
												console.error('반 리스트 가져오기 실패:',
														error);
												alert('반 리스트를 불러오는 데 실패했습니다.');
											}
										});
							}

							// 반려견 리스트 가져오기
							window.fetchDogs = function(classCode) {
								if (classCode) {
									$
											.ajax({
												url : "${pageContext.servletContext.contextPath}/notice/selectClassDog?classCode="
														+ classCode,
												method : "GET",
												success : function(data) {
													console.log('반려견 리스트 받음:',
															data);
													var searchDog = $('#searchDog');
													searchDog.empty();
													searchDog
															.append('<option value="" disabled selected>반려견 선택</option>');
													$
															.each(
																	data,
																	function(
																			index,
																			item) {
																		searchDog
																				.append('<option value="' + item.dogCode + '">'
																						+ item.dogName
																						+ '</option>');
																	});
												},
												error : function(xhr, status,
														error) {
													console.error(
															'반려견 리스트 가져오기 실패:',
															error);
													alert('반려견 목록을 불러오는 데 실패했습니다.');
												}
											});
								}
							}

							// 선택 버튼 클릭 시 동작
							window.select = function() {
								var selectedClass = $('#searchClass').val();
								var selectedDog = $('#searchDog').val();

								if (!selectedClass || !selectedDog) {
									alert('반과 반려견을 모두 선택해주세요.');
									return;
								}

								// 선택된 반과 반려견 코드를 숨겨진 필드에 설정
								$('#selectedClassCode').val(selectedClass);
								$('#selectedDogCode').val(selectedDog);

								// 폼 제출
								$('#dogSelectionForm').submit();

								// 버튼 변경 및 비활성화
								$('#selectButton').hide();
								$('#reselectButton').show();
								disableSelect();
							}

							// 재선택 버튼 클릭 시 동작
							window.reselect = function() {
								// 숨겨진 필드 초기화
								$('#selectedClassCode').val('');
								$('#selectedDogCode').val('');

								// 선택 버튼으로 변경
								$('#selectButton').show();
								$('#reselectButton').hide();

								// 선택 드롭다운 활성화
								enableSelect();
							}

							// 선택 드롭다운 비활성화
							function disableSelect() {
								$('#searchClass').prop('disabled', true);
								$('#searchDog').prop('disabled', true);
							}

							// 선택 드롭다운 활성화
							function enableSelect() {
								$('#searchClass').prop('disabled', false);
								$('#searchDog').prop('disabled', false);
							}
						});
	</script>
</body>
</html>
