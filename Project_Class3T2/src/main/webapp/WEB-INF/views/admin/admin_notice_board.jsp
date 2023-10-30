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
	.bottun_margin {
		margin: 30px;
	}
	span {
		justify-content: center;
		align-items: center;
		display: flex;
	}
	tr{
		text-align: center;
	}
	.datatable-table th a{
		text-align: center;
	}
</style>
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css"
	rel="stylesheet" />
<script
	src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
	crossorigin="anonymous">
</script>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.7.0.js"></script>
<script type="text/javascript">
	
</script>
<link href="${pageContext.request.contextPath }/resources/css/admin_style.css" rel="stylesheet" />

<body class="body_gray">
	<jsp:include page="../inc/admin_laout_top.jsp"></jsp:include>
	<div id="layoutSidenav">
		<jsp:include page="../inc/admin_laout_bottom.jsp"></jsp:include>
		<div id="layoutSidenav_content">
			<main>
				<div class="white_box">
					<div class="card mb-4">
						<div class="card-body">
							<h1>공지사항 관리</h1>
						</div>
					</div>
					<div class="body_gray card mb-4">
						<table>
							<tr class="body_gray"  height="60px">
								<td>
									<span class="sb-sidenav fs-4">공지사항 조회</span>
								</td>
								<td align="right">
									<button id="open_notice_insert" class="bottun_margin  btn btn-dark">공지사항 등록</button>
								</td>
							<tr>
						</table>
						<div>
							<div class="card-body">
								<form action="AdminNoticeDelete" method="post">
									<table id="datatablesSimple">
										<thead>
											<tr>
												<th>#</th>
												<th>공지번호</th>
												<th>공지제목</th>
												<th>공지내용</th>
												<th>공지날짜</th>
												<th>조회수</th>
											</tr>
										</thead>
										<tbody >
										<c:forEach var="selectNoticeList" items="${selectNoticeList }">
											<tr>
												<th><input type="checkbox" name="checkbox" value="${selectNoticeList.notice_num }"></th>
												<th>${selectNoticeList.num }</th>
												<td>${selectNoticeList.notice_subject}</td>
												<td>${selectNoticeList.notice_content }</td>
												<td>${selectNoticeList.notice_date }</td>
												<td>${selectNoticeList.notice_readcount }</td>
											</tr>
										</c:forEach>
										</tbody>
									</table>
									<input type="submit" id="delete_btn"class="btn btn-primary" value="삭제">	
								</form>
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
		<script src="${pageContext.request.contextPath }/resources/js/admin_notice.js"></script>
	<script src="${pageContext.request.contextPath }/resources/js/admin_scripts.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"
		crossorigin="anonymous"></script>
	<script src="${pageContext.request.contextPath }/resources/js/admin_datatable.js"></script>
</body>
</html>
