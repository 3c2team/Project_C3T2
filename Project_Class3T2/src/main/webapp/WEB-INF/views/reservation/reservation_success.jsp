<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<!DOCTYPE html>
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
			<div class="info_table">
				<h2>감사합니다. 예약이 정상적으로 완료되었습니다.</h2>
				<h3>비회원으로 예약하신 경우, 예약번호를 반드시 기입해두시기 바랍니다.</h3>
				<h3>(예약 확인 시 예약번호를 입력하셔야만 확인이 가능합니다.)</h3>
				<h2>예약번호: ${reservation.reservation_guest_num }</h2>
				<input type="button" value="홈으로" onclick="location.href='./'">
				<input type="button" value="예약조회" onclick="location.href = 'ReservationSearch'">
			</div>
		</main>
		<footer id="footer">
			<jsp:include page="../inc/bottom.jsp"></jsp:include>
		</footer>
	</div>
</body>
</html>