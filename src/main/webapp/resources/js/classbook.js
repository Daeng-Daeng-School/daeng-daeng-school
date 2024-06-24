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