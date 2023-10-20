<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>

<meta charset="utf-8" />

<title>공지 관리</title>
<style type="text/css">
.body_gray {
	background-color: #f8f8f8;
}

.white_box {
	margin: 20px;
}
</style>
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css"
	rel="stylesheet" />
<link href="${pageContext.request.contextPath }/resources/css/admin_style.css" rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
	crossorigin="anonymous"></script>
</head>
<body class="body_gray">
	<jsp:include page="../inc/admin_laout_top.jsp"></jsp:include>
	<div id="layoutSidenav">
		<jsp:include page="../inc/admin_laout_bottom.jsp"></jsp:include>
		<div id="layoutSidenav_content">
		<main >
		<div class="white_box">
			<div class="card mb-4">
				<div class="card-body">
					<h1>회원관리</h1>
				</div>
			</div>
			<div class="card mb-4">
				<table>
					<tr>
						<td class="card-body">
							<span class="sb-sidenav fs-4">회원목록 조회</span>
						</td>
					<tr>
				</table>
				<div class="body_gray" align="center"></div>
			</div>
		</div>
		<div class="white_box">
			<div class="card mb-4">
				<div class="card-body">
					<table id="datatablesSimple">
						<thead>
							<tr>
								<th>회원 번호</th>
								<th>회원 이름</th>
								<th>회원 주소</th>
								<th>회원 전화번호</th>
								<th>회원 포인트</th>
								<th>가입일</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="memberList" items="${memberList }">
								<tr>
									<th>${memberList.member_num }</th>
									<th>${memberList.member_name }</th>
									<th>${memberList.member_address }</th>
									<th>${memberList.member_address }</th>
									<th>${memberList.member_phone_num }</th>
									<th>${memberList.member_insert_date }</th>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-xl-6">
				<div class="card mb-4">
					<div class="card-header">
						<i class="fas fa-chart-area me-1"></i> 최근1년 이용자 탈퇴 수
					</div>
					<div class="card-body">
						<canvas id="myAreaChart" width="100%" height="40"></canvas>
					</div>
				</div>
			</div>
			<div class="col-xl-6">
				<div class="card mb-4">
					<div class="card-header">
						<i class="fas fa-chart-bar me-1"></i> 이용자 탈퇴이유
					</div>
					<div class="card-body">
						<canvas id="myPieChart" width="100%" height="40"></canvas>
					</div>
				</div>
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
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
		crossorigin="anonymous"></script>
	<script src="${pageContext.request.contextPath }/resources/demo/chart-pie-demo2.js"></script>
	<script src="${pageContext.request.contextPath }/resources/demo/chart-area-demo.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"
		crossorigin="anonymous"></script>
	<script src="${pageContext.request.contextPath }/resources/js/admin_datatable.js"></script>
</body>
</html>
