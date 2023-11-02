// 날짜를 YYYY-MM-DD 형식의 문자열로 변환하는 함수
function formatDate(date) {
    return `${date.getFullYear()}-${String(date.getMonth() + 1).padStart(2, '0')}-${String(date.getDate()).padStart(2, '0')}`;
}

// 지정된 개월 수만큼 이전의 날짜를 시작 날짜로 설정하고, 종료 날짜는 오늘 날짜로 설정하는 함수
function setMonths(monthsAgo) {
    const currentDate = new Date();
    const endDate = formatDate(currentDate);
    
    currentDate.setMonth(currentDate.getMonth() + monthsAgo);
    const startDate = formatDate(currentDate);
    
    document.getElementById('startDate').value = startDate;
    document.getElementById('endDate').value = endDate;
}

// 오늘 날짜를 시작 및 종료 날짜로 설정하는 함수
function setToday() {
    const currentDate = formatDate(new Date());
    document.getElementById('startDate').value = currentDate;
    document.getElementById('endDate').value = currentDate;
}

// 항목을 날짜별로 필터링하는 함수
function filterItemsByDate(startDateId, endDateId, itemClass, dateDataAttribute) {
    const startDate = new Date(document.getElementById(startDateId).value);
    const endDate = new Date(document.getElementById(endDateId).value);
    
    const rows = document.querySelectorAll(itemClass);
    
    rows.forEach(row => {
        const itemDate = new Date(row.getAttribute(dateDataAttribute));
        
        if (itemDate < startDate || itemDate > endDate) {
            row.style.display = 'none';
        } else {
            row.style.display = '';
        }
    });
}

// 페이지 로드 시 기본값으로 3개월 전의 날짜를 시작 날짜로 설정하는 초기화 로직
document.addEventListener('DOMContentLoaded', function() {
    setMonths(-3);

    // "조회" 버튼 클릭 시 적절한 함수를 호출하는 이벤트 리스너
    var searchButton = document.getElementById('search_btn');
    if (searchButton) {
        searchButton.addEventListener('click', function() {
            if (document.querySelector('.review-row')) {
                filterItemsByDate('startDate', 'endDate', '.review-row', 'data-review-date');
            } else if (document.querySelector('.reservation-row')) {
                filterItemsByDate('startDate', 'endDate', '.reservation-row', 'data-reservation-date');
            }
        });
    }
});