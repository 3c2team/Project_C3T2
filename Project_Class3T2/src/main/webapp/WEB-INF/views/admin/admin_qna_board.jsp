<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
									<th>문의번호</th>
									<th>작성자</th>
									<th>비밀여부</th>
									<th>상품번호</th>
									<th>문의날짜</th>
									<th>답변여부</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="QnaBoardList" items="${QnaBoardList}">
									<tr>
										<th>${QnaBoardList.num}</th>
										<th>
											${QnaBoardList.member_id}(${QnaBoardList.member_name })
											<button class="btn btn-light btn-right go_detail" name="question_num" value="${QnaBoardList.question_num}">자세히보기</button>
										</th>
										<th>${QnaBoardList.secret}</th>
										<th>${QnaBoardList.product_name}</th>
										<th>${QnaBoardList.question_date}</th>
										<th>${QnaBoardList.question_is_answer}</th>
									</tr>
								</c:forEach>
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
	<script src="${pageContext.request.contextPath }/resources/js/jquery-3.7.0.js"></script>
	<script src="${pageContext.request.contextPath }/resources/js/admin_scripts.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"
		crossorigin="anonymous"></script>
	<script src="${pageContext.request.contextPath }/resources/js/admin_datatable.js"></script>
</body>
</html>
