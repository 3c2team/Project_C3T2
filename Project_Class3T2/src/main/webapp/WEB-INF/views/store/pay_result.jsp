<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/jquery-3.7.0.js"></script>
</head>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/top.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bottom.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/default.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/pay_result.css">
<body>
<!-- 	<h1>결제 완료</h1> -->
	
<%-- 	<c:forEach var="userOrderList" items="${userOrderList }"> --%>
	
<%-- 	</c:forEach> --%>
		<header>
			<jsp:include page="../inc/top.jsp"></jsp:include>
		</header>

		<main>
			<h2 class="sign" align="center">구매 내역</h2>
			<c:forEach var="userOrderList" items="${userOrderList }">
				<table class="custom_table" >
					<tr>
						<th id="paymentInfo" align="center">구매 상세 내역</th>
					</tr>
					<tr>
						<th class="">구매일자</th>
						<td>${userOrderList.order_date }</td>
					</tr>
					<tr>
						<th>상품명</th>
						<td>${userOrderList.product_name }</td>
					</tr>
					<tr>
						<th>상품 수량</th>
						<td>${userOrderList.product_count }</td>
					</tr>
					<tr>
						<th>상품 총 가격</th>
						<td>${userOrderList.product_price * userOrderList.product_count }</td>
					</tr>
					</table>
			</c:forEach>
			<table class="custom_table">
				<tr>
					<th>총 금액</th>
					<td> ${resultPrice + usePoint }</td>
				</tr>
				<tr>
					<th>사용 포인트</th>
					<td>-${usePoint }</td>
				</tr>
				<tr>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<th style="font-size: 13pt;"><b>총 결제 금액</b></th>
					<td> ${resultPrice }</td>
				</tr>
			</table>
			<div align="center">
				<input type="button" value="메인화면" onclick="location.href='./'">
				<input type="button" value="마이페이지" onclick="location.href='MypageDashboard'">
			</div>
	</main>
	
  	<footer id="footer">
  		<jsp:include page="../inc/bottom.jsp"></jsp:include>
 	</footer>
</body>
</html>