<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<link href="${pageContext.request.contextPath }/resources/css/reservation.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/top.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bottom.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/default.css">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="mainLayout">
		<header>
			<jsp:include page="../inc/top.jsp"></jsp:include>
		</header>
				<div id="layoutSidenav">
				<div id="layoutSidenav_content">
				<main>
					<div class="container-fluid px-4 ">
						<div class="card-body">
							<h1 class="mt-4">예약조회</h1>
						</div>
					</div>
					<div class="card mb-4">
						<div class="card-header">
							<i class="fas fa-table me-1"></i>예약목록
						</div>
						<div class="card-body">
							<table id="datatablesSimple">
								<thead>
									<tr>
										<th>예약번호</th>
										<th>예약자성함</th>
										<th>예약시간</th>
										<th>예약테이블</th>
										<th>예약자전화번호</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="ReservationList" items="${ReservationList }">
										<tr>
											<th>${ReservationList.reservation_num }</th>
											<th>${ReservationList.reservation_person_name }</th>
											<th>${ReservationList.reservation_date }/${ReservationList.reservation_time } </th>
											<th>${ReservationList.reservation_person_count }</th>
											<th>${ReservationList.reservation_person_phone }</th>
											
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</main>
			</div>
		</div>
		<footer id="footer">
			<jsp:include page="../inc/bottom.jsp"></jsp:include>
		</footer>
	</div>
</body>
</html>