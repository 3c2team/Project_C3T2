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
				<input type="text" class="user" name="reservation_guest_num" id="reservation_guest_num" style="align-content: center" placeholder="예약번호">
				<input type="text" class="user" name="reservation_person_phone" id="reservation_person_phone" style="align-content: center" placeholder="예약자 전화번호">
				<input type="button" class="submit" id="btn_submit" style="margin-left: 38%; margin-top: 5%" value="조회" 
					onclick="location.href='ReservationSearchInfo?reservation_guest_num=${reservation_guest_num}&reservation_person_phone=${reservation_person_phone}'">
	    	</div>
		</main>
		<footer id="footer">
			<jsp:include page="../inc/bottom.jsp"></jsp:include>
		</footer>
	</div>
</body>
</html>