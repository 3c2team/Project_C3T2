<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<title>문의 내역</title>
<style type="text/css">
.btn-right {
	float: right;
}

table {
	font-size: 18px;
}
</style>

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
						<h1 class="mt-4">문의내역</h1>
					</div>
				</div>
				<div class="card mb-4">
					<div class="card-header">
						<i class="fas fa-table me-1"></i> 문의목록
					</div>
					<div class="card-body">
						<table id="datatablesSimple">
							<thead>
								<tr>
									<th>상품번호</th>
									<th>작성자</th>
									<th>문의내용</th>
									<th>문의날짜</th>
									<th>답변여부</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<th>1</th>
									<th>
										강석진<button class="btn btn-light btn-right"onclick="window.open('readMore.jsp','','width=200','height=500')">자세히보기</button>
									</th>
									<th>이것은 뭔가요?</th>
									<th>2023-10-11</th>
									<th>답변완료</th>
								</tr>
							</tbody>
						</table>
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
