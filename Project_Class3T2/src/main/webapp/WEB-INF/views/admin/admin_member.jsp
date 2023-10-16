<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>

<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
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
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
	crossorigin="anonymous"></script>
<link href="${pageContext.request.contextPath }/resources/css/admin_style.css" rel="stylesheet" />
</head>
<body class="body_gray">
	<jsp:include page="../inc/admin_laout_top.jsp"></jsp:include>
	<div id="layoutSidenav">
		<jsp:include page="../inc/admin_laout_bottom.jsp"></jsp:include>
		<main>
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
							<tr>
								<th>1</th>
								<th>강석진</th>
								<th>골든뷰?</th>
								<th>010-xxxx-xxxx</th>
								<th>1,000,000,000</th>
								<th>2023년 10월 12일</th>
							</tr>
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
	
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="${pageContext.request.contextPath }/resources/js/admin_scripts.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
		crossorigin="anonymous"></script>
	<script src="${pageContext.request.contextPath }/resources/demo/chart-pie-demo2.js"></script>
	<script src="${pageContext.request.contextPath }/resources/demo/chart-area-demo.js"></script>
<script src="${pageContext.request.contextPath }/resources/demo/chart-bar-demo.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"
		crossorigin="anonymous"></script>
	<script src="${pageContext.request.contextPath }/resources/js/admin_datatable.js"></script>
</body>
</html>
