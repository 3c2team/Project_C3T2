<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/default.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/reservation.css">
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
			<h1>예약 내역 변경</h1>
			<form action="ReservationUpdatePro" method="post" id="custom_submit">
				<div id="calendarForm"></div>
				<table class="custom_reservation_form">
					<tr>
						<th>예약인원</th>
						<td>
							<input type="hidden" id="reservation_date" name="reservation_date">
							<input type="hidden" id="cal_count" name="cal_count">
							<div class="form_radio_btn">
								<input id="radio1" type="radio" name="reservation_person_count" value="1" <c:if test="${reservation.reservation_person_count eq '1' }">checked</c:if>>
								<label for="radio1">1</label>
							</div>
							<div class="form_radio_btn">
								<input id="radio2" type="radio" name="reservation_person_count" value="2" <c:if test="${reservation.reservation_person_count eq '2' }">checked</c:if>>
								<label for="radio2">2</label>
							</div>
							<div class="form_radio_btn">
								<input id="radio3" type="radio" name="reservation_person_count" value="3" <c:if test="${reservation.reservation_person_count eq '3' }">checked</c:if>>
								<label for="radio3">3</label>
							</div>
							<div class="form_radio_btn">
								<input id="radio4" type="radio" name="reservation_person_count" value="4" <c:if test="${reservation.reservation_person_count eq '4' }">checked</c:if>>
								<label for="radio4">4</label>
							</div>
							<div class="form_radio_btn">
								<input id="radio5" type="radio" name="reservation_person_count" value="5" <c:if test="${reservation.reservation_person_count eq '5' }">checked</c:if>>
								<label for="radio5">5</label>
							</div>
							<div class="form_radio_btn">
								<input id="radio6" type="radio" name="reservation_person_count" value="6" <c:if test="${reservation.reservation_person_count eq '6' }">checked</c:if>>
								<label for="radio6">6</label>
							</div>
							<div class="form_radio_btn">
								<input id="radio7" type="radio" name="reservation_person_count" value="7" <c:if test="${reservation.reservation_person_count eq '7' }">checked</c:if>>
								<label for="radio7">7</label>
							</div>
							<div class="form_radio_btn">
								<input id="radio8" type="radio" name="reservation_person_count" value="8"  <c:if test="${reservation.reservation_person_count eq '8' }">checked</c:if>>
								<label for="radio8">8</label>
							</div>
						</td>
					</tr>
					<tr>
						<th>예약시간</th>
						<td>
<!-- 						<포문 $레스토랑 오픈~ 마감> -->
<!-- 						<div class="form_radio_btn"> -->
<%-- 							<c:if test="${레스토랑 시간 }"> --%>
<!-- 								체크드 -->
<%-- 								<input id="radio-0" type="radio" name="reservation_time" value="10:00" <c:if test="${reservation.reservation_time eq '10:00' }">checked</c:if>> --%>
<!-- 								<label for="radio-0">10:00</label> -->
<%-- 							</c:if> --%>
<!-- 							</div> -->
						
							<div class="form_radio_btn">
								<input id="radio-0" type="radio" name="reservation_time" value="10:00" <c:if test="${reservation.reservation_time eq '10:00' }">checked</c:if>>
								<label for="radio-0">10:00</label>
							</div>
							<div class="form_radio_btn">
								<input id="radio-1" type="radio" name="reservation_time" value="11:00" <c:if test="${reservation.reservation_time eq '11:00' }">checked</c:if>>
								<label for="radio-1">11:00</label>
							</div>
							<div class="form_radio_btn">
								<input id="radio-2" type="radio" name="reservation_time" value="12:00" <c:if test="${reservation.reservation_time eq '12:00' }">checked</c:if>>
								<label for="radio-2">12:00</label>
							</div>
							<div class="form_radio_btn">
								<input id="radio-3" type="radio" name="reservation_time" value="13:00" <c:if test="${reservation.reservation_time eq '13:00' }">checked</c:if>>
								<label for="radio-3">13:00</label>
							</div>
							<div class="form_radio_btn">
								<input id="radio-4" type="radio" name="reservation_time" value="14:00" <c:if test="${reservation.reservation_time eq '14:00' }">checked</c:if>>
								<label for="radio-4">14:00</label>
							</div>
							<div class="form_radio_btn">
								<input id="radio-5" type="radio" name="reservation_time" value="15:00" <c:if test="${reservation.reservation_time eq '15:00' }">checked</c:if>>
								<label for="radio-5">15:00</label>
							</div>
							<div class="form_radio_btn">
								<input id="radio-6" type="radio" name="reservation_time" value="16:00" <c:if test="${reservation.reservation_time eq '16:00' }">checked</c:if>>
								<label for="radio-6">16:00</label>
							</div>
							<div class="form_radio_btn">
								<input id="radio-7" type="radio" name="reservation_time" value="17:00" <c:if test="${reservation.reservation_time eq '17:00' }">checked</c:if>>
								<label for="radio-7">17:00</label>
							</div>
							<div class="form_radio_btn">
								<input id="radio-8" type="radio" name="reservation_time" value="18:00" <c:if test="${reservation.reservation_time eq '18:00' }">checked</c:if>>
								<label for="radio-8">18:00</label>
							</div>
							<div class="form_radio_btn">
								<input id="radio-9" type="radio" name="reservation_time" value="19:00" <c:if test="${reservation.reservation_time eq '19:00' }">checked</c:if>>
								<label for="radio-9">19:00</label>
							</div>
							<div class="form_radio_btn">
								<input id="radio-10" type="radio" name="reservation_time" value="20:00" <c:if test="${reservation.reservation_time eq '20:00' }">checked</c:if>>
								<label for="radio-10">20:00</label>
							</div>
						</td>
					</tr>
					<tr>
						<th>예약자 성함</th>
						<td>
							<input type="text" class="input" name="reservation_person_name" id="reservation_person_name" value="${reservation.reservation_person_name }" required>
						</td>
					</tr>
					<tr>
						<th>예약번호</th>
						<td>
							<input type="text" class="input" name="reservation_guest_num" id="reservation_guest_num" value="${reservation.reservation_guest_num }" required />
						</td>
					</tr>
					<tr>
						<th>예약내역 받으실 이메일</th>
						<td>
							<input type="text" class="input" name="reservation_email1" id="reservation_email1" placeholder="아이디" size="20" required 
							value="${reservation.reservation_email1}">@
							<input type="text" class="input" name="reservation_email2" id="reservation_email2" placeholder="주소" size="20" required 
							value="${reservation.reservation_email2}">
							<select id="emailDomain" class="input">
								<option value="">직접입력</option>
								<option value="naver.com">naver.com</option>
								<option value="nate.com">nate.com</option>
								<option value="gmail.com">gmail.com</option>
							</select>
						</td>
					</tr>
					<tr>
						<td colspan="2" align="center">
							<input type="button" value="예약변경" onclick="updateCheck()">
							<input type="button" value="취소" onclick="history.back()">
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
		
		function updateCheck() {
			let result = confirm("예약 변경 하시겠습니까?");
			if(result){
				$("form").submit();
			}
		}
	</script>
</body>
</html>