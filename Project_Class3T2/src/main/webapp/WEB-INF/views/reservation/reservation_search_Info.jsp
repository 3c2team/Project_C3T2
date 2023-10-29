<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<html>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/top.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bottom.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/default.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/reservation.css">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
	function check() {
		let result = confirm("예약 취소 하시겠습니까?");
		if(result){
			location.href='ReservationDelete';
		}
	}
</script>
<body>
		<header>
			<jsp:include page="../inc/top.jsp"></jsp:include>
		</header>
	<div id="mainLayout">
		<main>
			<div>
				<h2 class="sign" align="center">예약 상세 조회</h2>
				<input type="hidden" name="${reservation.reservation_guest_num }">
				<table class="custom_calendar_table">
					<tr>
						<th>예약일자</th>
						<td>${reservation.reservation_date }&nbsp;${reservation.reservation_time }</td>
					</tr>
					<tr>
						<th>예약인원</th>
						<td>${reservation.reservation_person_count }</td>
					</tr>
					<tr>
						<th>이름</th>
						<td>${reservation.reservation_person_name }</td>
					</tr>
					<tr>
						<th>전화번호</th>
						<td>${reservation.reservation_person_phone }</td>
					</tr>
					<tr>
						<td colspan="2" align="center">
							<input type="button" value="메인으로" onclick="location.href='./'">
							<input type="button" value="예약취소" onclick="check()">
							<input type="button" value="예약수정" onclick="location.href ='ReservationUpdate'">
						</td> <!-- ?reservation_guest_num=${reservation.reservation_guest_num} -->
					</tr>
				</table>
			</div>
		</main>
	</div>
		<footer id="footer">
			<jsp:include page="../inc/bottom.jsp"></jsp:include>
		</footer>
</body>
</html>