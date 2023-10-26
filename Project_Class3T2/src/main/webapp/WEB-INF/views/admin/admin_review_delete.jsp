<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Tables - SB Admin</title>
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
</head>
<body class="sb-nav-fixed">
	<jsp:include page="../inc/admin_laout_top.jsp"></jsp:include>
	<div id="layoutSidenav">
		<jsp:include page="../inc/admin_laout_bottom.jsp"></jsp:include> 
		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid px-4 ">
					<div class="card-body">
						<h1 class="mt-4">리뷰삭제</h1>
					</div>
				</div>
				<div class="card mb-4">
					<div class="card-header">
						<i class="fas fa-table me-1"></i> 리뷰목록
					</div>
					<div class="card-body">
						<form action="AdminReviewDeletePro" method="post">
							<table id="datatablesSimple">
								<thead>
									<tr>
										<th>#</th>
										<th>상품번호</th>
										<th>작성자</th>
										<th>리뷰내용</th>
										<th>구매일자</th>
									</tr>
								</thead>
								<tbody>
								<c:forEach var="selectReviewList" items="${selectReviewList }">
									<tr>
										<th><input type="checkbox" name="review_num" value="${selectReviewList.review_num }"></th>
										<th>${selectReviewList.num }</th>
										<th>
											${selectReviewList.review_title }
										</th>
										<th>${selectReviewList.review_content }</th>
										<th>${selectReviewList.review_date }</th>
									</tr>
								</c:forEach>
								</tbody>
							</table>
							<input type="submit" value="삭제" id="delete_btn" class="btn btn-primary">
						</form>
					</div>
				</div>
			</main>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="${pageContext.request.contextPath }/resources/js/jquery-3.7.0.js"></script>
	<script src="${pageContext.request.contextPath }/resources/js/admin_review.js"></script>
	<script src="${pageContext.request.contextPath }/resources/js/admin_scripts.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"
		crossorigin="anonymous"></script>
	<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
		crossorigin="anonymous"></script>
	<script src="${pageContext.request.contextPath }/resources/js/admin_datatable.js"></script>
</body>
</html>
