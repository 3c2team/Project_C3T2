function calculateDates() {
    const startDate = new Date(document.getElementById('startDate').value);
    const endDate = new Date(document.getElementById('endDate').value);

    if (startDate > endDate) {
        alert('시작 날짜는 종료 날짜보다 이후일수 없습니다.');
        return;
    }
}

function setToday() {
    const currentDate = new Date();
    const formattedDate = formatDate(currentDate);

    document.getElementById('startDate').value = formattedDate;
    document.getElementById('endDate').value = formattedDate;
}

function setMonths(monthsAgo) {
    const currentDate = new Date();
    const endDate = formatDate(currentDate);

    currentDate.setMonth(currentDate.getMonth() + monthsAgo);
    const startDate = formatDate(currentDate);

    document.getElementById('startDate').value = startDate;
    document.getElementById('endDate').value = endDate;
}

function setAllPeriod(event) {
    // 시작 및 종료 날짜 입력 필드의 값을 비움
    document.getElementById('startDate').value = '';
    document.getElementById('endDate').value = '';
}

function formatDate(date) {
    return `${date.getFullYear()}-${String(date.getMonth() + 1).padStart(2, '0')}-${String(date.getDate()).padStart(2, '0')}`;
}