<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />

<title>예약조회</title>
<style type="text/css">
.btn-right {
	float: right;
}

table {
	font-size: 18px;
}
</style>
<script type="text/javascript">
function onSubmit() {
	if(confirm("삭제하시겠습니까?")){
		
	}
}
</script>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.7.0.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css"
	rel="stylesheet" />
<link href="${pageContext.request.contextPath }/resources/css/admin_style.css" rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
	crossorigin="anonymous"></script>
</head>
<body class="sb-nav-fixed">
	<jsp:include page="../inc/admin_laout_top.jsp"></jsp:include>
	<div id="layoutSidenav">
		<jsp:include page="../inc/admin_laout_bottom.jsp"></jsp:include>
		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid px-4 ">
					<div class="card-body">
						<h1 class="mt-4">예약조회</h1>
					</div>
				</div>
				<div class="card mb-4">
					<div class="card-header">
						<i class="fas fa-table me-1"></i> 예약목록
					</div>
					<div class="card-body">
						<form action="AdminReservationDeletePro" method="post">
							<table id="datatablesSimple">
								<thead>
									<tr>
										<th>#</th>
										<th>예약번호</th>
										<th>예약자성함</th>
										<th>예약시간</th>
										<th>예약테이블</th>
										<th>예약 번호</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="ReservationList" items="${ReservationList }">
										<c:if test="${ReservationList.reservation_cancel eq 0 }">
											<tr>
												<th><input type="checkbox" name="checkbox" value="${ReservationList.reservation_num }"></th>
												<th>${ReservationList.num }</th>
												<th>${ReservationList.reservation_person_name }</th>
												<th>${ReservationList.reservation_date }</th>
												<th>${ReservationList.dinning_num }</th>
												<th>${ReservationList.reservation_guest_num }</th>
											</tr>
										</c:if>
									</c:forEach>
								</tbody>
							</table>
							<input type="submit" id= "delete_btn"class="btn btn-primary" value="삭제">
						</form>
					</div>
				</div>
			</main>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="${pageContext.request.contextPath }/resources/js/admin_scripts.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"
		crossorigin="anonymous"></script>
	<script src="${pageContext.request.contextPath }/resources/js/admin_datatable.js"></script>
</body>
</html>
