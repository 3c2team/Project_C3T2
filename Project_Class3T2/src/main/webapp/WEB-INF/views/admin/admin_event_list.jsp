<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<title>이벤트 목록</title>
<style type="text/css">
.btn-right{
	float: right;
}
#datatablesSimple{
	font-size: 18px;
}
</style>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.7.0.js"></script>
<script type="text/javascript">
$(function () {
	$("#button_open").on("click",function(){
		window.open('AdminEventRegist','', "top=500,left=500,width=700, height=700");
	});
});
</script>
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
						<h1 class="mt-4">이벤트 목록</h1>
					</div>
				</div>
				<div class="card mb-4">
					<div class="card-header">
						<i class="fas fa-table me-1"></i> 이벤트 목록
					</div>
					<div class="card-body">
						<form action="AdminDeleteEventPro" method="post">
							<table id="datatablesSimple">
								<thead>
									<tr>
										<th>#</th>
										<th>등록번호</th>
										<th>이벤트 제목</th>
										<th>이벤트 내용</th>
										<th>등록날짜</th>
										<th>조회수</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="eventList" items="${eventList }">
										<tr>
											<th><input type="checkbox" name="checkbox" value="${eventList.event_num }" class="custom-control-input"></th>
											<th>${eventList.num }</th>
											<th>${eventList.event_subject }</th>
											<th>${eventList.event_content }</th>
											<th>${eventList.event_date }</th>
											<th>조회수 1 </th>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<input type="submit" id="delete_btn"class="btn btn-primary" value="삭제">
							<input type="button" class="btn btn-primary" value="등록" id="button_open">
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
