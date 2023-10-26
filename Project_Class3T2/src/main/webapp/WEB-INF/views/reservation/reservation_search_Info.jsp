<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<html>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/top.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bottom.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/default.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/reservation.css">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="mainLayout">
		<header>
			<jsp:include page="../inc/top.jsp"></jsp:include>
		</header>
		<main>
			<div>
				<h2>예약 상세정보</h2>
				<table class="custom_table">
					<tr>
						<th>예약일자</th>
						<th>예약인원</th>
						<th>이름</th>
						<th>전화번호</th>
					</tr>
					<tr>
						<td>${reservation.reservation_date }&nbsp;${reservation.reservation_time }</td>
						<td>${reservation.reservation_person_count }</td>
						<td>${reservation.reservation_person_name }</td>
						<td>${reservation.reservation_person_phone }</td>
					</tr>
					<tr>
						<td colspan="2" align="center">
							<input type="button" value="돌아가기" onclick="./">
							<input type="button" value="예약취소" onclick="location.href ='ReservationCancle?guestNum=${reservation.reservation_guest_num}'">
							<input type="button" value="예약수정" onclick="location.href ='ReservationUpdate?guestNum=${reservation.reservation_guest_num}'">
						</td>
					</tr>
				</table>
			</div>
		</main>
		<footer id="footer">
			<jsp:include page="../inc/bottom.jsp"></jsp:include>
		</footer>
	</div>
</body>
</html>