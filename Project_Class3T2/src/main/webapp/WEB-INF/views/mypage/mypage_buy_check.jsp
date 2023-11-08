<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<style>
th, td {
      word-break: break-all;
      word-wrap: break-word;
      white-space: normal;
    }
</style>
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
					<button onclick="setAllPeriod()">전체기간</button>
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
							<th width="80px">주문번호</th>
							<th width="250px">배송자 주소</th>
							<th width="200px">요청 사항</th>
							<th width="80px">총 구매 가격</th>
							<th width="100px">구매 일자</th>
							<th width="250px">구매 상품목록</th>
						</tr>
						<!-- 총 가격이 포함된 주문 데이터 반복 출력 -->
						<c:forEach var="orderTotals" items="${orderTotals}">
						    <tr class="buy-row" data-buy-date="${orderTotals.order_date}">
						        <td>${orderTotals.merchant_uid}</td>
						        <td>${orderTotals.receiver_address}</td>
						        <td>${orderTotals.receiver_request}</td>
						        <td>${orderTotals.total_price}</td> <!-- 여기서는 총 가격을 표시 -->
						        <td><fmt:formatDate value="${orderTotals.order_date}" pattern="yyyy-MM-dd" /></td>
						        <td>${orderTotals.product_names}</td>
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
		<div class="text-center mt50" style=" display: flex;justify-content: space-around;">
      		${pagination}
    	</div>
		<br>
		<br>
	</div>




	<%@ include file="./include/body_bottom.jsp"%>
</body>
</html>