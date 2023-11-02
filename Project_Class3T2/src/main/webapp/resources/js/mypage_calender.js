// 시작 날짜와 종료 날짜를 비교하여 유효성 검사를 수행하는 함수
function calculateDates() {
    const startDate = new Date(document.getElementById('startDate').value);
    const endDate = new Date(document.getElementById('endDate').value);

    // 시작 날짜가 종료 날짜보다 큰 경우 경고 메시지를 표시
    if (startDate > endDate) {
        alert('시작 날짜는 종료 날짜보다 이후일수 없습니다.');
        return;
    }

    // Do any desired calculation or display logic here
}

// 시작 날짜와 종료 날짜를 오늘 날짜로 설정하는 함수
function setToday() {
	console.log('setToday 함수가 호출되었습니다.');
    const currentDate = new Date();
    const formattedDate = formatDate(currentDate);

    document.getElementById('startDate').value = formattedDate;
    document.getElementById('endDate').value = formattedDate;
}

// 지정된 개월 수만큼 이전의 날짜를 시작 날짜로 설정하고, 종료 날짜는 오늘 날짜로 설정하는 함수
function setMonths(monthsAgo) {
	console.log('setMonths 함수가 호출되었습니다.');
	// 현재 날짜와 시간을 나타내는 새 Date 객체를 생성
    const currentDate = new Date();
    // 현재 날짜를 YYYY-MM-DD 형식의 문자열로 변환
    const endDate = formatDate(currentDate);
	
	// 현재 날짜에서 monthsAgo 변수에 저장된 개월 수를 뺌, monthsAgo가 -3이면 3개월 전의 날짜를 계산
    currentDate.setMonth(currentDate.getMonth() + monthsAgo);
    // 계산된 과거 날짜를 YYYY-MM-DD 형식의 문자열로 변환
    const startDate = formatDate(currentDate);
	
	// jsp 문서 내에 있는 'startDate'라는 ID를 가진 요소의 값을 계산된 과거 날짜로 설정
    document.getElementById('startDate').value = startDate;
    // jsp 문서 내에 있는 'endDate'라는 ID를 가진 요소의 값을 계산된 현재 날짜로 설정
    document.getElementById('endDate').value = endDate;
}

// Date 객체를 YYYY-MM-DD 형식의 문자열로 변환하는 함수
function formatDate(date) {
    return `${date.getFullYear()}-${String(date.getMonth() + 1).padStart(2, '0')}-${String(date.getDate()).padStart(2, '0')}`;
}
///////////////////////////////////////////////////////////////////////////////////////////////
// 선택된 시작 날짜와 종료 날짜 사이에 있는 예약만 표시하고, 그 외의 예약은 숨기는 함수
function filterReservationsByDate() {
	console.log('조회');
    const startDate = new Date(document.getElementById('startDate').value);
    const endDate = new Date(document.getElementById('endDate').value);
    
    // '.reservation-row' 클래스를 가진 모든 테이블 행을 선택
    const rows = document.querySelectorAll('.reservation-row');
    
    // 각 행에 대해 반복 처리
    rows.forEach(row => {
		
		// 각 행의 'data-reservation-date' 속성에서 예약 날짜를 가져와 Date 객체로 변환
        const reservationDate = new Date(row.getAttribute('data-reservation-date'));
        
        // 예약 날짜가 선택한 시작 날짜보다 이전이거나 종료 날짜보다 이후인 경우
        if (reservationDate < startDate || reservationDate > endDate) {
            row.style.display = 'none'; // 해당 행을 화면에서 숨김
        } else {
            row.style.display = ''; // 보이기
        }
    });
}

// 리뷰 데이터를 기간별로 필터링하는 함수
function filterReviewsByDate() {
    const startDate = new Date(document.getElementById('startDate').value);
    const endDate = new Date(document.getElementById('endDate').value);

    // '.review-row' 클래스를 가진 모든 테이블 행을 선택
    const rows = document.querySelectorAll('.review-row');

    // 각 행에 대해 반복 처리
    rows.forEach(row => {
        // 각 행의 'data-review-date' 속성에서 리뷰 날짜를 가져와 Date 객체로 변환
        const reviewDate = new Date(row.getAttribute('data-review-date'));

        // 리뷰 날짜가 선택한 시작 날짜보다 이전이거나 종료 날짜보다 이후인 경우
        if (reviewDate < startDate || reviewDate > endDate) {
            row.style.display = 'none'; // 해당 행을 화면에서 숨김
        } else {
            row.style.display = ''; // 보이기
        }
    });
}

///////////////////////////////////////////////////////////////////////////////////////////////
// "조회" 버튼 클릭 시 적절한 함수를 호출하는 이벤트 리스너
document.addEventListener('DOMContentLoaded', function() {
    // 여기에 DOM 요소에 접근하는 코드를 넣음.
    var searchButton = document.getElementById('search_btn');
    if (searchButton) {
        searchButton.addEventListener('click', filterReservationsByDate);
    }
});

// 페이지 로드 시 기본값으로 3개월 전의 날짜를 시작 날짜로 설정하는 초기화 로직
setMonths(-3);
