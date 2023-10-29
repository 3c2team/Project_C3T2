<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="./include/head.jsp"%>
<title>마이페이지-주문 조회</title>
</head>
<body>

	<%@ include file="./include/body_top.jsp"%>



	<div class="mypageContents">
		<div class="text-center mt50 mb50">			
			<h1>주문 조회</h1>
		</div>
		<h2>기간 조회</h2>
		<div class="reservationConfirmContainer">
			<div class="reservationConfirmTerm">
				<div class="calendarContainer">
					<button onclick="setToday()">오늘</button>
					<button onclick="setMonths(-1)">1개월</button>
					<button onclick="setMonths(-3)">3개월</button>
					<button onclick="setMonths(-6)">6개월</button>
				</div>
				<script src="${pageContext.request.contextPath }/resources/js/mypage_calender.js"></script>
				<div id="reservation_confirm_term_right">
					<div class="calanderWrap">
						<input type="date" id="startDate"> - <input type="date" id="endDate">
						<button id="search_btn">조회</button>
					</div>
				</div>
			</div>
			<br>
			<br>
			<article>
				<section id="list_Form">
					<table>
						<tr id="tr_top">
							<th width="120px">주문번호</th>
							<!-- 적립 or 소멸 -->
							<th width="400px">상품명</th>
							<th width="130px">수량</th>
							<!-- 개별 유효기간 등 -->
							<th width="130px">결제상태</th>
							<th width="130px">주문상태</th>
						</tr>
						
						
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