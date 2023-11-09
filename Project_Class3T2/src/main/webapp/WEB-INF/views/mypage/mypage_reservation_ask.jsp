<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="./include/head.jsp"%>
<title>마이페이지-예약 내역</title>
</head>
<body>
	<%@ include file="./include/body_top.jsp"%>

	<div class="mypageContents">
		<div class="text-center mt50 mb50">	
			<h1>예약 내역</h1>
		</div>
		<h2>기간 조회</h2>
		<div class="reservationConfirmContainer">
			<div class="reservationConfirmTerm">
				<div class="calendarContainer">
					<button onclick="setToday()">오늘</button>
					<button onclick="setMonths(-1)">1개월</button> <!-- "1개월" 버튼을 클릭하면 setMonths 함수가 호출됨 -->
					<button onclick="setMonths(-3)">3개월</button>
					<button onclick="setMonths(-6)">6개월</button>
					<button onclick="setAllPeriod()">전체기간</button>
				</div>
				<div id="reservation_confirm_term_right">
					<div class="calanderWrap">
						<input type="date" id="startDate"> - <input type="date" id="endDate">
						<button id="search_btn">조회</button> <!--  "조회" 버튼을 클릭하면, filterReservationsByDate 함수가 호출 -->
					</div>
				</div>
<%-- 				<script src="${pageContext.request.contextPath }/resources/js/mypage_calender.js"></script> --%>
			</div>
			<br>
			<br>
			<!-- 리뷰 목록 테이블 -->
			<article>
				<section id="list_Form">
					<table>
						<!-- 테이블 헤더 -->
						<tr id="tr_top">
							<th width="100px">예약자 성함</th>
							<th width="100px">예약 번호</th>
							<th width="100px">예약 날짜</th>
							<th width="130px">예약 시간</th>
							<th width="80px">예약 인원</th>
							<th width="100px">예약 테이블</th>
						</tr>
						<!-- 예약 내역 데이터 반복 출력 -->
						<c:forEach var="reservation" items="${reviews}">
							
							<!-- 각 테이블 행에는 'reservation-row' 클래스가 지정되어 있고, 예약 날짜를 데이터 속성으로 포함-->
							<tr class="reservation-row" data-reservation-date="${reservation.reservation_date}">
								<td>${reservation.reservation_person_name}</td>
								<td>
						                ${reservation.reservation_guest_num}
						        </td>
								<td>${reservation.reservation_date}</td>
								<td>${reservation.reservation_time}</td>
								<td>${reservation.reservation_person_count}</td>
								<td>${reservation.dinning_num}</td>
								<td>
									<c:choose>
									    <c:when test="${reservation.reservation_cancel == 0}">
									        <form action="cancelReservation" method="post" onsubmit="return confirmCancel(this);">
						                        <input type="hidden" name="reservation_num" value="${reservation.reservation_num}">
						                        <button type="submit">취소하기</button>
						                    </form>
									    </c:when>
									    <c:otherwise>
									        이미 취소됨
									    </c:otherwise>
									</c:choose>
								</td>
							</tr>
						</c:forEach>
					</table>
				</section>
			</article>
		</div>
		<br>
		<br>
	</div>
	<script>
        window.onload = function() {
            // 현재 날짜를 YYYY-MM-DD 형식의 문자열로 가져옴.
            var currentDate = new Date().toISOString().split('T')[0];

            // 모든 예약 행을 반복하여 처리.
            var reservationRows = document.querySelectorAll('.reservation-row');
            reservationRows.forEach(function(row) {
                // 데이터 속성에서 예약 날짜를 가져옴.
                var reservationDate = row.getAttribute('data-reservation-date');
                // 예약 날짜가 현재 날짜보다 이전이면 '방문 완료'로 변경.
                if (reservationDate < currentDate) {
                    var cancelBtn = row.querySelector('form[action="cancelReservation"] button');
                    if (cancelBtn) {
                        cancelBtn.disabled = true; // 버튼을 비활성화.
                        cancelBtn.textContent = '방문 완료 쌩유~'; // 버튼 텍스트를 변경.
                    } else {
                        // 이미 '이미 취소됨' 상태일 경우, 추가적인 처리가 필요하면 여기에 작성.
                    }
                }
            });
        };
        
        function confirmCancel(formElement) {
            // confirm() 함수를 사용하여 사용자에게 확인을 요청.
            var confirmResponse = confirm("예약을 취소하시겠습니까? 리얼리 혼또니 레알 트루?????");
            // 사용자가 '확인'을 클릭하면 true를 반환하여 폼 제출.
            if (confirmResponse) {
                return true;
            }
            // 사용자가 '취소'를 클릭하면 false를 반환하여 폼 제출을 중단.
            return false;
        }
    </script>

	<script src="${pageContext.request.contextPath }/resources/js/mypage_calender.js"></script>
	<%@ include file="./include/body_bottom.jsp"%>
</body>
</html>