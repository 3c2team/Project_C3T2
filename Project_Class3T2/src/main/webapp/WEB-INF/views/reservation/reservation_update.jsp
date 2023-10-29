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
			<h1>예약 수정</h1>
			<form action="Main" method="post">
				<div id="calendarForm"></div>
				<table class="custom_calendar_table">
					<tr>
						<td class="td_left"><label for="reservation_person_name">예약자 성함</label></td>
						<td class="td_right"> <!-- 예약자 성함 get으로 넘긴 guest_num으로 세션 불러오기  -->
							<input type="text" name="reservation_person_name" value="${reservation.reservation_person_name }" readonly required />
						</td>
					</tr>
					<tr>
						<td class="td_left"><label for="reservation_guest_num">예약번호</label></td>
						<td class="td_right"> <!-- 예약자 성함 get으로 넘긴 guest_num으로 세션 불러오기  -->
							<input type="text" name="reservation_guest_num" value="${reservation.reservation_guest_num}" readonly required />
						</td>
					</tr>
					<tr>
						<td class="td_left"><label for="reservation_person_phone">예약자 전화번호</label></td>
						<td class="td_right">
							<input type="text" name="reservation_person_phone" value="${reservation.reservation_person_phone }" required />
						</td>
					</tr>
					<tr>
						<td class="td_left"><label for="reservation_date">예약일자</label>
							<input type="date" name="reservation_date" value="${reservation.reservation_date }" required>
							<input type="date" name="reservation_date" value="${reservation.reservation_time }" required>
						</td>
						<td class="td_right"><label for="reservation_date">예약시간</label>
						</td>
					</tr>
					<tr>
						<td class="td_left"><label for="board_file">첨부파일</label></td>
						<td class="td_right">
					</tr>
				</table>
				<section id="commandCell">
					<input type="submit" value="수정">&nbsp;&nbsp;
					<input type="reset" value="다시쓰기">&nbsp;&nbsp;
					<input type="button" value="취소" onclick="history.back()">
				</section>
			</form>
		</main>
		<footer id="footer">
			<jsp:include page="../inc/bottom.jsp"></jsp:include>
		</footer>
	</div>
</body>
</html>