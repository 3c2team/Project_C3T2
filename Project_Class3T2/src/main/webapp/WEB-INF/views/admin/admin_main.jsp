<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<title>메인</title>
<style type="text/css">
input{
	margin-top:10px;
}
table{
    width: 90%;	
}
#success_passwd{
	font-size: small;
	float: right;
}
.font{
	font-size: 15px;
}
</style>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.7.0.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/admin_main.js"></script>

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
						<h1 class="mt-4">메인</h1>
					</div>
					<ol class="breadcrumb mb-4">
						<li class="breadcrumb-item active">
						</li>
					</ol>
				</div>
				<div class="container-fluid px-4">
					<div class="row">
						<div class="col-xl-3 col-md-6">
							<div class="card bg-primary text-white mb-4">
								<div class="card-body">
									매출 정보
								</div>
								<div class="card-footer d-flex align-items-center justify-content-between">
									<a class="small text-white stretched-link" href="AdminSalesYear"></a>
									<div class="small text-white">
										<i class="fas fa-angle-right"></i>
									</div>
								</div>
							</div>
						</div>
						<div class="col-xl-3 col-md-6">
							<div class="card bg-warning text-white mb-4">
								<div class="card-body">
									상품 정보
								</div>
								<div class="card-footer d-flex align-items-center justify-content-between">
									<a class="small text-white stretched-link" href="AdminProductList"></a>
									<div class="small text-white">
										<i class="fas fa-angle-right"></i>
									</div>
								</div>
							</div>
						</div>
						<div class="col-xl-3 col-md-6">
							<div class="card bg-success text-white mb-4">
								<div class="card-body">
									공지 관리
								</div>
								<div class="card-footer d-flex align-items-center justify-content-between">
									<a class="small text-white stretched-link" href="AdminNoticeBoard"></a>
									<div class="small text-white">
										<i class="fas fa-angle-right"></i>
									</div>
								</div>
							</div>
						</div>
						<div class="col-xl-3 col-md-6">
							<div class="card bg-danger text-white mb-4">
								<div class="card-body">
									예약 정보
								</div>
								<div class="card-footer d-flex align-items-center justify-content-between">
									<a class="small text-white stretched-link" href="AdminReservationList"></a>
									<div class="small text-white">
										<i class="fas fa-angle-right"></i>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="card mb-4">
					<div class="card-body  fs-5">
					${sessionScope.sName }님 환영합니다.
					</div>
				</div>
				<div class="row">
					<div class="col-xl-6">
						<div id="result"class="card mb-4 ">
							<div class="card-header ">
								<i class="fas fa-chart-area me-1 "></i> 연간 매출
							</div>
							<div class="card-body">
								<canvas id="myAreaChart" width="100%" height="40"></canvas>
							</div>
						</div>
						<div class="card mb-4">
							<div class="card-header">
								<i class="fas fa-chart-area me-1"></i> 가게 정보
							</div>
							<div class="card-body">
								<form action="AdminRestaurantUpdatePro" onsubmit="return onSubmit()" method="POST">
									<table class="fs-5">
										<tr>
											<input type="hidden"  name ="restaurant_num" value="${selectRestaurant.restaurant_num }">
											<th width="150px">가게 이름/지점</th>
											<th><input type="text" style="float: left; width: 42%" required name="restaurant_name" value="${selectRestaurant.restaurant_name }" aria-label="Disabled input example" disabled readonly class="custom_not custom_input form-control-sm form-control">
												<input type="text" style="float: right; width: 42%" required name="restaurant_aim" value="${selectRestaurant.restaurant_aim }" aria-label="Disabled input example" disabled readonly class="custom_input form-control-sm form-control">
											</th>
										<tr>
											<th>가게 주소</th>
											<th><input type="text"  name="restaurant_address" required value="${selectRestaurant.restaurant_address }" aria-label="Disabled input example" disabled readonly class="custom_input form-control-sm form-control"></th>
										</tr>
										<tr>
											<th>대표자 성함</th>
											<th><input type="text" name="ceo_name" required value="${selectRestaurant.ceo_name }" aria-label="Disabled input example" disabled readonly class="custom_input form-control-sm form-control"></th>
										</tr>
										<tr>
											<th>예약 텀</th>
											<th>
												<input type="number" min="1" max="24" name="restaurant_reservation_time" required value="${selectRestaurant.restaurant_reservation_time }" aria-label="Disabled input example" style="float: left; width: 60%;" disabled readonly class="custom_input form-control-sm form-control">
												<span class="font">시간</span>
											</th>
										</tr>
										<tr>
											<th>가게 영업시간</th>
											<th><input style="float:left;width: 40%;" id="open" value="${selectRestaurant.restaurant_open_time }" name="restaurant_open_time"disabled type="text" aria-label="Disabled input example" readonly class="custom_not custom_input form-control-sm form-control">
												<span style="margin: auto;">~</span>
												<input style="float:right; width: 40%;" id="close" value="${selectRestaurant.restaurant_close_time }" name="restaurant_close_time"disabled type="text" aria-label="Disabled input example" readonly class="custom_not custom_input form-control-sm form-control">
											</th>
											<th><select class="form-select form-select-sm custom_open" disabled  aria-label="Small select example" style="float:left;margin-left:10px;width: 40%;">
												  <option disabled selected>오픈시간</option>
												  <option>08:00</option>
												  <option>09:00</option>
												  <option>10:00</option>
												  <option>11:00</option>
												  <option>11:00</option>
												  <option>13:00</option>
											</select>
											<select class="form-select form-select-sm custom_close"  disabled aria-label="Small select example" style="float:right;width: 40%;">
												  <option disabled selected>마감시간</option>
												  <option>20:00</option>
												  <option>21:00</option>
												  <option>22:00</option>
												  <option>23:00</option>
												  <option>24:00</option>
												  <option>01:00</option>
												  <option>02:00</option>
												  <option>03:00</option>
											</select></th>
										</tr>
										<tr id="append_id">
											<th>가게 전화번호</th>
											<th>
												<input type="number" name="phon0" required value="${selectRestaurant.phon0 }" aria-label="Disabled input example" disabled readonly style="float:left; width: 25%;" class="custom_input form-control-sm form-control">
												<input type="number" name="phon1" required value="${selectRestaurant.phon1 }" aria-label="Disabled input example" disabled readonly style="float:left; width: 29%;" class="custom_input form-control-sm form-control">
												<input type="number" name="phon2" required value="${selectRestaurant.phon2 }" aria-label="Disabled input example" disabled readonly style="float:left; width: 29%;" class="custom_input form-control-sm form-control">
											</th>
										</tr>
									</table>
								<span id="change" style="margin-top: 10xp;"><input type="button" style="float:left; width: 45%" id="btn_change" value="변경" class="custom_input btn btn-secondary">
								<input type="button" id="new_restaurang" style="float:right; width: 45%" value="새 지점 등록" class="custom_input btn btn-primary"></span>
								</form>
							</div>
						</div>	
					</div>
					<div class="col-xl-6">
						<div class="card mb-4">
							<div class="card-header">	
								
							</div>
							<div class="card-body">
								<jsp:include page="./result.jsp"></jsp:include>
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
<script
src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
crossorigin="anonymous"></script>
<script src="${pageContext.request.contextPath }/resources/js/admin_scripts.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
	crossorigin="anonymous"></script>
<script src="${pageContext.request.contextPath }/resources/demo/sales_year_chart.js"></script>
</body>
</html>
