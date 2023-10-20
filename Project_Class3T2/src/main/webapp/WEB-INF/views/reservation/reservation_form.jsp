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
						<button class="button1">10:00 </button> 
						<button class="button1">11:00 </button>
						<button class="button1">12:00 </button>
						<button class="button1">13:00 </button>
						<button class="button1">14:00 </button>
						<button class="button1">15:00 </button>
						<button class="button1">16:00 </button>
						<button class="button1">17:00 </button>
						<button class="button1">18:00 </button>
						<button class="button1">19:00 </button>
						<button class="button1">20:00 </button>
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
			<form action="reservationSuccess">
				<div class="right">
					<h3 class="indent">예약자 성함 </h3>
					<input type="text" class="reservationInput" name="reservation_person_name" id="reservation_person_name">
					<h3 class="indent">안내 받으실 전화번호</h3>
					<input type="text" class="reservationInput" name="reservation_person_phone" id="reservation_person_phone">
		 		
					<!-- 선택 확인창 -->
		 			<table class="resConfirm" >
		 				<tr>
							<th colspan="2" width="300">예약확인</th>     		
				 		</tr>
				 		<tr>
				 			<th>예약일시</th>
				 			<td><span class="result" id="reservation_date"></span></td>
				 		</tr>
				 		<tr>
				 			<th>예약시간</th>
				 			<td><span class="result" id="reservation_time"></span></td>
				 		</tr>
				 		<tr>
				 			<th>예약인원</th>
				 			<td><span class="result" id="reservation_person_count"></span></td>
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