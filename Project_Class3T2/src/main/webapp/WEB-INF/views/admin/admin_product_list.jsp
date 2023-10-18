<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<title>Tables - SB Admin</title>
<style type="text/css">
.btn-right{
	float: right;
}
#datatablesSimple{
	font-size: 18px;
}
</style>
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css"
	rel="stylesheet" />
<link href="${pageContext.request.contextPath }/resource/css/admin_style.css" rel="stylesheet" />
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
						<h1 class="mt-4">상품목록</h1>
					</div>
				</div>
				<div class="card mb-4">
					<div class="card-header">
						<i class="fas fa-table me-1"></i> 상품목록
					</div>
					<div class="card-body">
						<table id="datatablesSimple">
							<thead>
								<tr>
									<th>#</th>
									<th>상품번호</th>
									<th>상품이름</th>
									<th>상품설명</th>
									<th>찜갯수</th>
									<th>판매가</th>
									<th>재고</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<th><input type="checkbox" class="custom-control-input"></th>
									<th>1</th>
									<th>스테이크<span><button id="button_open_update"class="btn btn-light btn-right">수정</button></span></th>
									<th>맛잇음</th>
									<th>1000000</th>
									<th>1000000</th>
									<th>2000000</th>
								</tr>
							</tbody>
						</table>
						<button class="btn btn-primary">삭제</button>
						<button class="btn btn-primary" id="button_open">등록</button>
					</div>
				</div>
			</main>
		</div>
	</div>
	<script src="${pageContext.request.contextPath }/resource/js/jquery-3.7.0.js"></script>
	<script src="${pageContext.request.contextPath }/resource/js/admin_product.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="${pageContext.request.contextPath }/resource/js/admin_scripts.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"
		crossorigin="anonymous"></script>
	<script src="${pageContext.request.contextPath }/resource/js/admin_datatable.js"></script>
</body>
</html>
