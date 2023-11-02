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
				</div>
				<div id="reservation_confirm_term_right">
					<div class="calanderWrap">
						<input type="date" id="startDate"> - <input type="date" id="endDate">
						<button id="search_btn">조회</button> <!--  "조회" 버튼을 클릭하면, filterReservationsByDate 함수가 호출 -->
					</div>
				<script src="${pageContext.request.contextPath }/resources/js/mypage_calender.js"></script>
				</div>
			</div>
			<br>
			<br>
			<!-- 리뷰 목록 테이블 -->
			<article>
				<section id="list_Form">
					<table>
						<!-- 테이블 헤더 -->
						<tr id="tr_top">
							<th width="120px">예약자 성함</th>
							<th width="200px">예약 날짜</th>
							<th width="130px">예약 시간</th>
							<th width="100px">예약 인원</th>
							<th width="100px">예약 테이블</th>
						</tr>
						<!-- 예약 내역 데이터 반복 출력 -->
						<c:forEach var="reservation" items="${reviews}">
							<tr class="reservation-row" data-reservation-date="${reservation.reservation_date}">
								<td>${reservation.reservation_person_name}</td>
								<td>${reservation.reservation_date}</td>
								<td>${reservation.reservation_time}</td>
								<td>${reservation.reservation_person_count}</td>
								<td>${reservation.dinning_num}</td>
								<td>
									<c:choose>
									    <c:when test="${reservation.reservation_cancel == 0}">
									        <form action="cancelReservation" method="post">
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

	<%@ include file="./include/body_bottom.jsp"%>
</body>
</html>