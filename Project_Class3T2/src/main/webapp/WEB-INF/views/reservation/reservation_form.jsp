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
		<%-- 조회된 회원 정보를 테이블에 출력 --%>
		<%-- EL 을 사용하여 member 객체에 저장된 각 항목을 테이블에 출력 --%>
		<h1>Reservation</h1>
		<form action="ReservationPro" method="post" id="custom_submit">
			<div id="calendarForm"></div>
			<table>
				<tr>
					<th>예약시간</th>
					<td>
						<input type="hidden" id="reservation_date" name="reservation_date">
						<input type="hidden" id="member_id" name="member_id" <c:if test='${not empty sessionScope.sId }'>value="${sessionScope.sId }"</c:if>>
						<div class="form_radio_btn">
							<input id="radio-0" type="radio" name="reservation_time" value="10:00" checked>
							<label for="radio-0">10:00</label>
						</div>
						<div class="form_radio_btn">
							<input id="radio-1" type="radio" name="reservation_time" value="11:00">
							<label for="radio-1">11:00</label>
						</div>
						<div class="form_radio_btn">
							<input id="radio-2" type="radio" name="reservation_time" value="12:00">
							<label for="radio-2">12:00</label>
						</div>
						<div class="form_radio_btn">
							<input id="radio-3" type="radio" name="reservation_time" value="13:00">
							<label for="radio-3">13:00</label>
						</div>
						<div class="form_radio_btn">
							<input id="radio-4" type="radio" name="reservation_time" value="14:00">
							<label for="radio-4">14:00</label>
						</div>
						<div class="form_radio_btn">
							<input id="radio-5" type="radio" name="reservation_time" value="15:00">
							<label for="radio-5">15:00</label>
						</div>
						<div class="form_radio_btn">
							<input id="radio-6" type="radio" name="reservation_time" value="16:00">
							<label for="radio-6">16:00</label>
						</div>
						<div class="form_radio_btn">
							<input id="radio-7" type="radio" name="reservation_time" value="17:00">
							<label for="radio-7">17:00</label>
						</div>
						<div class="form_radio_btn">
							<input id="radio-8" type="radio" name="reservation_time" value="18:00">
							<label for="radio-8">18:00</label>
						</div>
						<div class="form_radio_btn">
							<input id="radio-9" type="radio" name="reservation_time" value="19:00">
							<label for="radio-9">19:00</label>
						</div>
						<div class="form_radio_btn">
							<input id="radio-10" type="radio" name="reservation_time" value="20:00">
							<label for="radio-10">20:00</label>
						</div>
					</td>
				</tr>
				<tr>
					<th>예약인원</th>
					<td>
						<div class="form_radio_btn">
							<input id="radio1" type="radio" name="reservation_person_count" value="1" checked>
							<label for="radio1">1</label>
						</div>
						<div class="form_radio_btn">
							<input id="radio2" type="radio" name="reservation_person_count" value="2">
							<label for="radio2">2</label>
						</div>
						<div class="form_radio_btn">
							<input id="radio3" type="radio" name="reservation_person_count" value="3">
							<label for="radio3">3</label>
						</div>
						<div class="form_radio_btn">
							<input id="radio4" type="radio" name="reservation_person_count" value="4">
							<label for="radio4">4</label>
						</div>
						<div class="form_radio_btn">
							<input id="radio5" type="radio" name="reservation_person_count" value="5">
							<label for="radio5">5</label>
						</div>
						<div class="form_radio_btn">
							<input id="radio6" type="radio" name="reservation_person_count" value="6">
							<label for="radio6">6</label>
						</div>
						<div class="form_radio_btn">
							<input id="radio7" type="radio" name="reservation_person_count" value="7">
							<label for="radio7">7</label>
						</div>
						<div class="form_radio_btn">
							<input id="radio8" type="radio" name="reservation_person_count" value="8">
							<label for="radio8">8</label>
						</div>
					</td>
				</tr>
				<tr>
					<th>예약자 성함</th>
					<td>
						<input type="text" name="reservation_person_name" placeholder="성함" size="20" required
							<c:if test="${not empty sessionScope.sId}">value="${sessionScope.sName }"</c:if>>
						
					</td> <!-- value= --> 
				</tr>
				<tr>
					<th>예약자 전화번호</th>
					<td>
						<input type="text" name="reservation_person_phone" placeholder="010-0000-0000" size="20" required
							<c:if test="${not empty sessionScope.sId}">value="${sessionScope.sPhone }"</c:if>>
					</td> <!-- value="${sessionScope.sPhone}" --> 
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="button" value="돌아가기" onclick="history.back()">
						<input type="submit" value="예약하기" >
					</td>
				</tr>
			</table>
		</form>
	</main>
	<footer id="footer">
		<jsp:include page="../inc/bottom.jsp"></jsp:include>
	</footer>
	</div>
</body>
</html>