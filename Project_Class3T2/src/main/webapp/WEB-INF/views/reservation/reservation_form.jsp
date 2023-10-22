<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<link href="${pageContext.request.contextPath }/resources/css/reservation.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/top.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bottom.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/default.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/reservation.css">
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/reservation.js"></script>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<header>
		<jsp:include page="../inc/top.jsp"></jsp:include>
	</header>
	
	<!-- 메인 레이아웃 -->
	<main>
		<div class="mainLayout">
			<h1 id="title">Reservation</h1>
			<div id="calendarForm"></div>

		<!-- 왼쪽 레이아웃 -->
				<div class="left">
					<h3 class="indent">예약시간</h3>
					<div class="center">
						<input type="button" class="button1" value="10:00">
						<input type="button" class="button1" value="11:00">
						<input type="button" class="button1" value="12:00">
						<input type="button" class="button1" value="13:00">
						<input type="button" class="button1" value="14:00">
						<input type="button" class="button1" value="15:00">
						<input type="button" class="button1" value="16:00">
						<input type="button" class="button1" value="17:00">
						<input type="button" class="button1" value="18:00">
						<input type="button" class="button1" value="19:00">
						<input type="button" class="button1" value="20:00">
					</div>
					<h3 class="indent">예약인원</h3>
					<div class="center">
						<button class="button" onclick="showPopup()">1 </button> 
						<button class="button" onclick="showPopup()">2 </button>
						<button class="button" onclick="showPopup()">3 </button>
						<button class="button" onclick="showPopup()">4 </button>
						<button class="button" onclick="showPopup()">5 </button>
						<button class="button" onclick="showPopup()">6 </button>
						<button class="button" onclick="showPopup()">7 </button>
						<button class="button" onclick="showPopup()">8 </button>
					</div>
				</div>
		
			<!-- 오른쪽 레이아웃 -->
			<form action="ReservationPro" name="reservationForm" method="post">
				<div class="right">
					<input type="checkbox" class="reservationInput" value="회원" name="reservation_is_member" id="reservation_is_member">
					<h3 class="indent">예약자 성함 </h3>
					<input type="text" class="reservationInput" name="reservation_person_name" id="reservation_person_name">
					<h3 class="indent">안내 받으실 전화번호</h3> <!-- 예약번호 받을 수단 이메일로 생각해보기 -->
					<input type="text" class="reservationInput" name="reservation_person_phone" id="reservation_person_phone">
		 		
					<!-- 선택 확인창 -->
		 			<table class="reservationConfirm" >
		 				<tr>
							<th colspan="2" width="300">예약확인</th>     		
				 		</tr>
				 		<tr>
				 			<th>예약일시</th>
				 			<td><span class="result" name="reservation_date"></span></td>
				 		</tr>
				 		<tr>
				 			<th>예약시간</th>
				 			<td><span class="result" name="reservation_time"></span></td>
				 		</tr>
				 		<tr>
				 			<th>예약인원</th>
				 			<td><span class="result" name="reservation_person_count"></span></td>
				 		</tr>
					</table>
					<button class="submit" >예약하기</button>
				</div>
			</form>	
		</div>
	</main>
	
	<footer id="footer">
		<jsp:include page="../inc/bottom.jsp"></jsp:include>
	</footer>
</body>
</html>