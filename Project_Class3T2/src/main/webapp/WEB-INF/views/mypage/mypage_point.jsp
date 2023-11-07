<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="./include/head.jsp"%>
<title>마이페이지-포인트 조회</title>
<style>
td {
	padding-left: 20px;
}
#pageList {
    margin-left: 40%;
    margin-top: 3%;
}
</style>
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
				</div>
				
				<form action="MypagePoint">
					<div id="reservation_confirm_term_right">
						<div class="calanderWrap">
							<input type="date" name="startDate" id="startDate"> - <input type="date" name="endDate" id="endDate">
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
							<tr class="point-row" data-point-date="<fmt:formatDate value="${point.point_date}" pattern="yyyy-MM-dd"/>">
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
									<a href="" style="font-size: 0.8em;">주문 내역 : ${point.order_detail_num}</a>
								</td>
								<td>
									<fmt:formatDate value="${point.point_date}" pattern="yyyy-MM-dd"/>
								</td>
							</tr>
						</c:forEach>
					</table>
				</section>
				<section id="pageList">
				<%-- <c:if test="${{pageInfo.pageNum <= 1 }">disabled</c:if> --%>
					<input type="button" value="이전" onclick="location.href='MypagePoint?pageNum=${pageInfo.pageNum - 1 }'">
					<a href="MypagePoint?pageNum=${i }">${i }</a>
					<c:forEach var="i" begin="${pageInfo.startPage }" end="${pageInfo.endPage }">
						<c:choose>
							<c:when test="${pageInfo.pageNum eq i }"> <%-- 현재 페이지일 경우(하이퍼링크 미표시 및 굵게) --%>
								<b>${i }</b>
							</c:when>
							<c:otherwise> <%-- 현재 페이지가 아닐 경우(하이퍼링크 표시) --%>
								<a href="MypagePoint?pageNum=${i }">${i }</a> 
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<%-- <c:if test="${pageInfo.pageNum >= pageInfo.maxPage }">disabled</c:if> --%>
					<input type="button" value="다음" onclick="location.href='MypagePoint?pageNum=${pageInfo.pageNum + 1 }'" >
				</section>
			</article>
		</div>
		<br>
		<br>
	</div>
	<%@ include file="./include/body_bottom.jsp"%>
	
	<script>
	document.addEventListener('DOMContentLoaded', function() {
	    setMonths(-3); // 기간 설정 함수 호출

	    // "조회" 버튼 클릭 시 적절한 함수를 호출하는 이벤트 리스너
	    document.getElementById('search_btn').addEventListener('click', function(event) {
	        event.preventDefault(); // 폼의 기본 제출 동작을 방지
	        filterItemsByDate('startDate', 'endDate', '.point-row', 'data-point-date');
	    });
	});
	</script>
	<script src="${pageContext.request.contextPath }/resources/js/mypage_calender.js"></script>
</body>
</html>