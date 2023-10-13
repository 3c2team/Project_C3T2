<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<link href="${pageContext.request.contextPath }/resources/css/reservation.css" rel="stylesheet" type="text/css">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

</style>
</head>
<body>
		<header>
			<jsp:include page="../inc/top.jsp"></jsp:include>
		</header>
	<div id="mainLayout">
	<main>
	
		<h1 id="title">Reservation</h1>
	
	<!-- --------------------------------------------------------- -->
	
		<div class="left">
			<br>
			<h3 class="indent">예약일시</h3> 
 
			<jsp:include page="calender.jsp"></jsp:include>
  
			<h3 class="indent">예약인원</h3><br>
			<div class="center">
				<button class="button">1 </button> 
				<button class="button">2 </button>
				<button class="button">3 </button>
				<button class="button">4 </button>
				<button class="button">5 </button>
				<button class="button">6 </button>
				<button class="button">7 </button>
				<button class="button">8 </button>
			</div>
			<br>
			<h3 class="indent">예약시간</h3><br>
			<div class="center">
				<button class="button1">10:00 </button> 
				<button class="button1">10:30 </button>
				<button class="button1">11:00 </button>
				<button class="button1">11:30 </button>
				<button class="button1">12:00 </button>
				<button class="button1">12:30 </button>
				<button class="button1">13:00 </button>
				<button class="button1">13:30 </button>
				<button class="button1">14:00 </button>
				<button class="button1">14:30 </button>
				<button class="button1">15:00 </button>
				<button class="button1">15:30 </button>
			</div>
  
		</div>

<!-- --------------------------------------------------------- -->

		<div class="right">
			<br>
			
			<h3 class="indent">예약자 성함 </h3>
			<input type="text" class="indent"><br><br><br>
			
			<h3 class="indent">안내 받으실 전화번호</h3>
			<input type="text" class="indent"><br><br><br>
 
 			<table class="resConfirm" >
 				<tr>
					<th colspan="2" width="300">예약확인</th>     		
		 		</tr>
		 		<tr>
		 			<th>&nbsp;</th>
		 		</tr>
		 		<tr>
		 			<th>예약일시</th>
		 			<td><span class="result" id="">예약일시(span 태그 자리)</span></td>
		 		</tr>
		 		<tr>
		 			<th>예약시간</th>
		 			<td><span class="result" id="">예약시간(span 태그 자리)</span></td>
		 		</tr>
		 		<tr>
		 			<th>예약인원</th>
		 			<td><span class="result" id="">예약인원(span 태그 자리)</span></td>
		 		</tr>
			</table>
 
			<br><br><br><br>
			<p class="submit" align="center">예약하기</p>
  
		</div>
		</main>
 
	</div>
		<footer id="footer">
			<jsp:include page="../inc/bottom.jsp"></jsp:include>
		</footer>

</body>
</html>