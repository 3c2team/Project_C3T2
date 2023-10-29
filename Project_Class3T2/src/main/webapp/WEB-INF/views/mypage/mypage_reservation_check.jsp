<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="./include/head.jsp"%>
<title>마이페이지-상품 구매 확인</title>
</head>
<body>
	<%@ include file="./include/body_top.jsp"%>

	<div class="mypageContents">
		<div class="text-center mt50 mb50">		
			<h1>상품 구매 확인</h1>
			<br>
		</div>
		<h2>기간 조회</h2>
		<!-- 				<form action="MypageReservationCheck" method="Get"> -->
		<table border="1">
			<thead>
				<tr>
					<th>회원 번호</th>
					<th>예약 날짜</th>
					<th>수령 주소</th>
					<th>수령자 이름</th>
					<th>수령자 전화번호</th>
					<th>요청 사항</th>
					<th>제품 번호</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="OrderList" items="${OrderList }">
					<tr>
						<td>${OrderList.memberNum}</td>
						<td>${OrderList.orderDate}</td>
						<td>${OrderList.receiverAddress}</td>
						<td>${OrderList.receiverName}</td>
						<td>${OrderList.receiverPhone}</td>
						<td>${OrderList.receiver_request}</td>
						<td>${OrderList.product_num}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<input type="submit" value="예약 확인">
		<!-- 				</form> -->
		<br>
		<br>
	</div>


	<%@ include file="./include/body_bottom.jsp"%>
</body>
</html>
