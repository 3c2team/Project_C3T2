<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="./include/head.jsp"%>
<title>마이페이지-포인트 조회</title>
<style>
td {
	padding-left: 10px;
}
#pageList {
    
    margin-left: -10%;
}
</style>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/mypage-search.css">
</head>
<body>
	<%@ include file="./include/body_top.jsp"%>
	<div class="mypageContents">
		<div class="text-center mt50 mb50">
			<h1>포인트 조회</h1>
		</div>
		<h2>기간 조회</h2>
		<div class="reservationConfirmContainer">
			<div class="reservationConfirmTerm">
				<div class="calendarContainer">
					<button onclick="setToday()">오늘</button>
					<button onclick="setMonths(-1)">1개월</button>
					<button onclick="setMonths(-3)">3개월</button>
					<button onclick="setMonths(-6)">6개월</button>
					<button type="button"  onclick="setAllPeriod(this)" class="calendarContainer ${ (empty pageMaker.searchType) or (pageMaker.searchType eq 'NaN') ? 'active':''}"  >전체기간</button>
				</div>
				<script src="${pageContext.request.contextPath }/resources/js/mypage_point_calender.js"></script>
				<form action="MypagePoint">
					<div id="reservation_confirm_term_right">
						<div class="calanderWrap">
							<c:if test="${startDate eq '1990-01-01'}">
							<input type="date" name="startDate" id="startDate"> - <input type="date" name="endDate" id="endDate" value="${endDate }">
							</c:if>
							<c:if test="${startDate ne '1990-01-01'}">
							<input type="date" name="startDate" id="startDate" value="${startDate }"> - <input type="date" name="endDate" id="endDate" value="${endDate }">
							</c:if>
							<button type="submit" id="search_btn">조회</button>
						</div>
					</div>
				</form>
			</div>
			<br>
			<br>
			<!-- 포인트 목록 테이블 -->
			<article>
				<section id="list_Form">
					<table>
						<!-- 테이블 헤더 -->
						<tr id="tr_top">
							<th width="130px">구분</th>
							<th width="140px">포인트 금액</th>
							<th width="410px">내역</th>
							<th width="140px">발생일</th>
						</tr>
						<!-- 포인트 데이터 반복 출력 -->
						<c:forEach var="point" items="${points}">
							<tr class="point-row text-center">
								<c:choose>
									<c:when test="${point.point_use eq 1}">
										<td id="use">적립</td>
										<td id="plus">+ ${point.point_amount}</td>
									</c:when>
									<c:otherwise>
										<td id="use">사용</td>
										<td id="plus">- ${point.point_amount}</td>
									</c:otherwise>
								</c:choose>
								<td>
									${point.point_ex}<br>
<%-- 									<a href="" style="font-size: 0.8em;">주문 내역 : ${point.order_detail_num}</a> --%>
								</td>
								<td>
									<fmt:formatDate value="${point.point_date}" pattern="yyyy-MM-dd"/>
								</td>
							</tr>
						</c:forEach>
					</table>
					<c:if test="${empty points }"> 
						<h3 class="text-center mt50" style="width: 100%">포인트 내역이 없습니다.</h3>
					</c:if>
				</section>
				<section id="pageList">
					<div class="text-center mt50" style=" display: flex;justify-content: space-around;">
						${pagination}
					</div>
				</section>
			</article>
		</div>
		<br>
		<br>
	</div>
	<%@ include file="./include/body_bottom.jsp"%>
</body>
</html>