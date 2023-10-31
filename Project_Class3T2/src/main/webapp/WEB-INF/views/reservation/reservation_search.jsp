<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/top.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bottom.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/default.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/reservation_search.css">
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/reservation.js"></script>
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
				<form action="ReservationSearchInfo" method="post">
					<p class="sign" align="center">비회원 예약 조회</p>
					<div>
						<input type="text" class="user" name="reservation_guest_num" id="reservation_guest_num" placeholder="예약번호">
					</div>
					<div class="emailFull">
						<input type="text" class="email" name="reservation_email1" id="reservation_email1" placeholder="아이디" size="20" required
						>  @
						<input type="text" class="email" name="reservation_email2" id="reservation_email2" placeholder="메일주소" size="20" required
						>
						<select id="emailDomain" class="email"> <!-- <c:if test="${not empty sessionScope.sEmail1}">value="${sessionScope.sEmail1 }"</c:if> <c:if test="${not empty sessionScope.sEmail2}">value="${sessionScope.sEmail2 }"</c:if> -->
							<option value="">직접입력</option>
							<option value="naver.com">naver.com</option>
							<option value="nate.com">nate.com</option>
							<option value="gmail.com">gmail.com</option>
						</select>
						<input type="submit" class="btn_submit" id="btn_submit" value="조회">
					</div>
				</form>
	    	</div>
		</main>
		<footer id="footer">
			<jsp:include page="../inc/bottom.jsp"></jsp:include>
		</footer>
	</div>
</body>
</html>