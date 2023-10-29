<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="./include/head.jsp"%>
<title>마이페이지-상품 구매 내역</title>
</head>
<body>
	<%@ include file="./include/body_top.jsp"%>
	

	
	<div class="mypageContents">
		<div class="text-center mt50 mb50">			
			<h1>상품 구매 내역</h1>			
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
			<!-- 리뷰 목록 테이블 -->
			<article>
				<section id="list_Form">
					<table>
						<!-- 테이블 헤더 -->
						<tr id="tr_top">
							<th width="120px">주문일자</th>
							<th width="400px">배송자 주소</th>
							<th width="130px">배송자 성함</th>
							<th width="130px">배송 전 문자</th>
							<th width="130px">제품 번호</th>
						</tr>
						<!-- 리뷰 데이터 반복 출력 -->
						<c:forEach var="OrderList" items="${OrderList}">
							<tr>
								<td>${OrderList.order_date}</td>
								<td>${OrderList.receiver_address}</td>
								<td>${OrderList.receiver_name}</td>
								<td>${OrderList.receiver_request}</td>
								<td>${OrderList.product_num}</td>
							</tr>
						</c:forEach>
						<c:if test="${empty OrderList}">
							<tr>
								<td colspan="5" class="text-center">
									<div style="height:50px; line-height: 50px">상품 구매 내역이 없습니다.</div>
								</td>
							</tr>
						</c:if>
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