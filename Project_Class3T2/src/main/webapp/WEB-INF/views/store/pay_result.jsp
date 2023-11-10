<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link href="${pageContext.request.contextPath }/resources/css/top.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/resources/css/default.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/resources/css/buttom.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/resources/css/about.css" rel="stylesheet" type="text/css">
<%-- <link href="${pageContext.request.contextPath }/resources/css/buttom.css" rel="stylesheet" type="text/css"> --%>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/reservation.css">
<body>
<!-- 	<h1>결제 완료</h1> -->
	
<%-- 	<c:forEach var="userOrderList" items="${userOrderList }"> --%>
	
<%-- 	</c:forEach> --%>
		<header>
			<jsp:include page="../inc/top.jsp"></jsp:include>
		</header>
<!-- 	<div id="mainLayout"> -->

		<main>
				<h2 class="sign" align="center">구매 내역(수정중)</h2>
				<table class="custom_table" >
					<tr>
						<th id="searchInfo" align="center">구매 상세 내역</th>
					</tr>
					<tr>
						<th>구매일자</th>
<%-- 						<td>${ }</td> --%>
					</tr>
					<tr>
						<th>상품명</th>
<%-- 						<td>${ }</td> --%>
					</tr>
					<tr>
						<th>상품 수량</th>
<%-- 						<td>${ }</td> --%>
					</tr>
					<tr>
						<th>상품 가격</th>
<%-- 						<td>${ }</td> --%>
					</tr>
					<tr>
						<td colspan="2" align="center">
							<input type="button" value="메인화면" onclick="location.href='./'">
							<input type="button" value="마이페이지" onclick="MypageDashboard">
						</td> <!-- ?reservation_guest_num=${reservation.reservation_guest_num} -->
					</tr>
				</table>
				
<%-- 				<h3>${userOrderList }</h3> --%>

<!-- 	<h3><a href="./">메인 화면으로 가기</a></h3> -->
<!-- 	<h3><a href="MypageDashboard">마이페이지로 가기</a></h3> -->
		</main>
			<footer id="footer">
				<jsp:include page="../inc/bottom.jsp"></jsp:include>
			</footer>
<!-- 	</div> -->
</body>
</html>