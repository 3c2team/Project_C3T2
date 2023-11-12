<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
<!DOCTYPE html>
<html>
<link href="${pageContext.request.contextPath }/resources/css/top.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/resources/css/default.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/resources/css/buttom.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/reservation.css">
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/reservation.js"></script>
<head>
<meta charset="UTF-8">
<title>Jai Faim</title>
</head>
<body>
	<div id="mainLayout">
	<header>
		<jsp:include page="../inc/top.jsp"></jsp:include>
	</header>
	<main>
		<h1>Reservation</h1>
		<form action="ReservationPro" method="post" id="custom_submit">
			<div id="calendarForm"></div>
			<table class="custom_reservation_form">
				<tr>
					<th>예약인원</th>
					<td>
						<input type="hidden" id="reservation_date" name="reservation_date">
						<input type="hidden" id="cal_count" name="cal_count">
						<input type="hidden" id="member_id" name="member_id" <c:if test='${not empty sessionScope.sId }'>value="${sessionScope.sId }"</c:if>>
						<div class="form_radio_btn1">
							<input id="radio1" type="radio" name="reservation_person_count" value="1" checked>
							<label for="radio1">1</label>
						</div>
						<div class="form_radio_btn1">
							<input id="radio2" type="radio" name="reservation_person_count" value="2">
							<label for="radio2">2</label>
						</div>
						<div class="form_radio_btn1">
							<input id="radio3" type="radio" name="reservation_person_count" value="3">
							<label for="radio3">3</label>
						</div>
						<div class="form_radio_btn1">
							<input id="radio4" type="radio" name="reservation_person_count" value="4">
							<label for="radio4">4</label>
						</div>
						<div class="form_radio_btn1">
							<input id="radio5" type="radio" name="reservation_person_count" value="5">
							<label for="radio5">5</label>
						</div>
						<div class="form_radio_btn1">
							<input id="radio6" type="radio" name="reservation_person_count" value="6">
							<label for="radio6">6</label>
						</div>
						<div class="form_radio_btn1">
							<input id="radio7" type="radio" name="reservation_person_count" value="7">
							<label for="radio7">7</label>
						</div>
						<div class="form_radio_btn1">
							<input id="radio8" type="radio" name="reservation_person_count" value="8">
							<label for="radio8">8</label>
						</div>
					</td>
				</tr>
				<tr>
					<th>예약시간</th>
					<td>
						<div class="form_radio_btn">
							<input id="radio_0" type="radio" name="reservation_time" value="10:00" checked>
							<label for="radio_0">10:00</label>
						</div>
						<div class="form_radio_btn">
							<input id="radio_1" type="radio" name="reservation_time" value="11:00">
							<label for="radio_1">11:00</label>
						</div>
						<div class="form_radio_btn">
							<input id="radio_2" type="radio" name="reservation_time" value="12:00">
							<label for="radio_2">12:00</label>
						</div>
						<div class="form_radio_btn">
							<input id="radio_3" type="radio" name="reservation_time" value="13:00">
							<label for="radio_3">13:00</label>
						</div>
						<div class="form_radio_btn">
							<input id="radio_4" type="radio" name="reservation_time" value="14:00">
							<label for="radio_4" >14:00</label>
						</div>
						<div class="form_radio_btn">
							<input id="radio_5" type="radio" name="reservation_time" value="15:00">
							<label for="radio_5">15:00</label>
						</div>
						<div class="form_radio_btn">
							<input id="radio_6" type="radio" name="reservation_time" value="16:00">
							<label for="radio_6">16:00</label>
						</div>
						<div class="form_radio_btn">
							<input id="radio_7" type="radio" name="reservation_time" value="17:00">
							<label for="radio_7">17:00</label>
						</div>
						<div class="form_radio_btn">
							<input id="radio_8" type="radio" name="reservation_time" value="18:00">
							<label for="radio_8">18:00</label>
						</div>
						<div class="form_radio_btn">
							<input id="radio_9" type="radio" name="reservation_time" value="19:00">
							<label for="radio_9">19:00</label>
						</div>
						<div class="form_radio_btn">
							<input id="radio_10" type="radio" name="reservation_time" value="20:00">
							<label for="radio_10">20:00</label>
						</div>
					</td>
				</tr>
				<tr>
					<th>예약자 성함</th>
					<td>
						<input type="text" class="input" name="reservation_person_name" placeholder="성함" size="20" required
							<c:if test="${not empty sessionScope.sId}">value="${sessionScope.sName }"</c:if>> <span id="checkIdResult"></span>
						
					</td> <!-- value= --> 
				</tr>
				<tr>
					<th>이메일</th>
					<td>
						<input type="text" class="input1" name="reservation_email1" id="reservation_email1" placeholder="아이디" size="20" required 
						<c:if test="${not empty sessionScope.sEmail}">value="${sessionScope.sEmail.split('@')[0]}"</c:if>>@
						<input type="text" class="input1" name="reservation_email2" id="reservation_email2" placeholder="주소" size="20" required 
						<c:if test="${not empty sessionScope.sEmail}">value="${sessionScope.sEmail.split('@')[1]}"</c:if>>
						<select id="emailDomain"> <!--   -->
							<option value="">직접입력</option>
							<option value="naver.com">naver.com</option>
							<option value="nate.com">nate.com</option>
							<option value="gmail.com">gmail.com</option>
						</select>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="button" value="예약하기" onclick="insertCheck()">
						<input type="button" value="돌아가기" onclick="history.back()">
					</td>
				</tr>
			</table>
		</form>
	</main>
	<footer id="footer">
		<jsp:include page="../inc/bottom.jsp"></jsp:include>
	</footer>
	</div>
	<script type="text/javascript">
		let dinningMax = '${dinningMax}';
		dinningMax = JSON.parse(dinningMax.replaceAll('=', ':').replaceAll('DINNING_MAX', '"DINNING_MAX"'));
		dinningMax = dinningMax.map(e => e.DINNING_MAX);
		
		function insertCheck() {
			let result = confirm("예약 하시겠습니까?");
			if(result){
				$("form").submit();
			}
		}
	</script>
</body>
</html>