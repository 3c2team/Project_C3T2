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
				<h2>&lt; 예약 안내 &gt;</h2><br>
				<h3>● 예약 신청을 위한 페이지로 예약 신청 후 직원이 확인하여 예약 확정 문자를 보내드립니다.</h3>
				<h3>● 온라인 예약은 이용시간 기준 1일 전 21시까지 신청 가능합니다.</h3>
				<h3>● 좌석 배치는 사전 예약순에 따르며 특정 좌석 지정은 불가합니다.</h3>
				<h3>● 홈페이지 예약은 최대 8인 이하 테이블에 한하며 9인 이상 단체는 유선으로 문의 부탁드립니다.</h3>
				<h3>● 예약 취소 및 변경을 원하실 경우 최소 하루 전까지 온라인으로 예약 취소 후 다시 이용해주시기 바랍니다.</h3>
				<input type="checkbox" required>&nbsp;예약 안내 약관에 동의 하십니까?<br><br>
				<input type="button" value="예약하기" onclick="location.href='ReservationForm'" > <!-- alert('약관에 동의하셔야 예약 가능합니다.'); -->
			</div>
		</main>
		<footer id="footer">
			<jsp:include page="../inc/bottom.jsp"></jsp:include>
		</footer>
	</div>
</body>
</html>