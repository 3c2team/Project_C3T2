<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="./include/head.jsp"%>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/mypage-search.css">
<title>마이페이지-상품 구매 내역</title>
<style>
    .product-names {
        display: -webkit-box;
        -webkit-line-clamp: 2; /* 두 줄까지만 표시 */
        -webkit-box-orient: vertical;
        overflow: hidden; /* 내용이 넘칠 경우 숨김 */
        text-overflow: ellipsis; /* 넘친 내용을 ...으로 표시 */
        max-height: 2em; /* 두 줄의 높이에 맞춤 (글꼴 크기에 따라 조정 필요) */
        line-height: 1.5em;
	    padding-top: 1em; /* 상단 패딩 추가 */
	    padding-bottom: 1em; /* 하단 패딩 추가 */
    }
    
    .receiver-request {
	    display: -webkit-box;
        -webkit-line-clamp: 2; /* 두 줄까지만 표시 */
        -webkit-box-orient: vertical;
        overflow: hidden; /* 내용이 넘칠 경우 숨김 */
        text-overflow: ellipsis; /* 넘친 내용을 ...으로 표시 */
        max-height: 2.5em; /* 두 줄의 높이에 맞춤 (글꼴 크기에 따라 조정 필요) */
	}
</style>
</head>
<body>
	<%@ include file="./include/body_top.jsp"%>
	

	
	<div class="mypageContents">
		<div class="text-center mt50 mb50">			
			<h1>상품 구매 내역</h1>			
		</div>
		<h2>기간 조회</h2>
		<div class="totalCount">전체 ${totalCount}건</div>
		<div class="reservationConfirmContainer">
			
		<form  id="frm">	
			<div class="reservationConfirmTerm">
				<div class="calendarContainer">
					<button type="button"   onclick="setToday(this)"  class="calendarContainer  ${pageMaker.searchType eq '1' ? 'active':''}" >오늘</button>
					<button type="button"  onclick="setMonths(this, -1)" class="calendarContainer ${pageMaker.searchType eq '-1' ? 'active':''} "  >1개월</button>
					<button type="button"  onclick="setMonths(this, -3)" class="calendarContainer ${pageMaker.searchType eq '-3' ? 'active':''} ">3개월</button>
					<button type="button"  onclick="setMonths(this,-6)"  class="calendarContainer ${pageMaker.searchType eq '-6' ? 'active':''} ">6개월</button>
					<button type="button"  onclick="setAllPeriod(this)" class="calendarContainer ${ (empty pageMaker.searchType) or (pageMaker.searchType eq 'NaN') ? 'active':''}"  >전체기간</button>
				</div>
				<input type="hidden" id="searchType" name="searchType">
				<div id="reservation_confirm_term_right">
					<div class="calanderWrap">
						<input type="date" id="startDate" name="startDate" value="${pageMaker.startDate}"> - <input type="date" id="endDate" name="endDate" 
						value="${pageMaker.endDate}">
						<button type="submit" id="search_btn">조회</button>
					</div>
				</div>
			</div>
		</form>	
			
			<br>
			<br>
			<!-- 리뷰 목록 테이블 -->
			<article>
				<section id="list_Form">
					<table>
						<!-- 테이블 헤더 -->
						<tr id="tr_top">
							<th width="80px">주문번호</th>
							<th width="300px">배송자 주소</th>
							<th width="200px">요청 사항</th>
							<th width="120px">총 구매 가격</th>
							<th width="100px">구매 일자</th>
							<th width="250px">구매 상품목록</th>
						</tr>
						<!-- 총 가격이 포함된 주문 데이터 반복 출력 -->
						<c:forEach var="orderTotals" items="${orderTotals}">
						    <tr class="buy-row text-center" data-buy-date="${orderTotals.order_date}">
						        <td>${orderTotals.merchant_uid}</td>
						        <td>${orderTotals.receiver_address}</td>
						        <td class="receiver-request">${orderTotals.receiver_request}</td>
						        <td class="text-right">
						          <fmt:formatNumber value="${orderTotals.total_price + 3000}" />						        
						        </td> <!-- 여기서는 총 가격을 표시 -->
						        <td><fmt:formatDate value="${orderTotals.order_date}" pattern="yyyy-MM-dd" /></td>
						        <td class="product-names">${orderTotals.product_names}</td>
						    </tr>
						</c:forEach>
						<c:if test="${totalCount ==0}">
							<tr>
								<td colspan="6" class="text-center">
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
		
		
			<div class="text-center mt50" style=" display: flex;justify-content: space-around;">
	      		${pagination}
	    	</div>
    
	</div>
		<script src="${pageContext.request.contextPath }/resources/js/mypage_calender.js"></script>




	<%@ include file="./include/body_bottom.jsp"%>
</body>
</html>