<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/top.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bottom.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/default.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/id_forgot.css">
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
			<div class="main">
			<p class="sign" align="center">비회원 예약 조회</p>
				<input class="user" name="reservation_person_name" id="reservation_person_name" type="text" style="align-content: center" placeholder="예약번호">
				<input class="user" name="reservation_person_phone" id="reservation_person_phone" type="text" style="align-content: center" placeholder="예약자 전화번호">
				<input type="submit" class="submit" id="btn_submit" style="margin-left: 38%; margin-top: 5%" value="조회" onclick="location.href='ReservationGuestSearchInfo'">
	    	</div>
		</main>
		<footer id="footer">
			<jsp:include page="../inc/bottom.jsp"></jsp:include>
		</footer>
	</div>
</body>
</html>