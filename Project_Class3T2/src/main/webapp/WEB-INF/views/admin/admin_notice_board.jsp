<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	
	.right_button {
		margin-left: 10%;
	}
	
	td {
		padding: 100;
	}
</style>
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css"
	rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
	crossorigin="anonymous"></script>
<link href="${pageContext.request.contextPath }/resources/css/admin_style.css" rel="stylesheet" />
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.7.0.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/admin_notice.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/admin_scripts.js"></script>
</head>
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
					<div class="card mb-4">
						<table>
							<tr height="60px">
								<td>
									<span class="sb-sidenav fs-4">공지사항 조회</span>
								</td>
								<td align="right">
									<button id="open_notice_insert" class="bottun_margin  btn btn-dark">공지사항 등록</button>
								</td>
							<tr>
						</table>
						<div class="body_gray" align="center">
							<table>
								<tr height="80">
									<td>
										<select>
											<option>제목</option>
											<option>내용</option>
											<option>작성자</option>
										</select> 
										<input type="text" id="admin_select"size="20">
									</td>
								</tr>
							</table>
						</div>
						<div align="center">
							<button class="bottun_margin btn btn-secondary">초기화</button>
							<button class="bottun_margin btn btn-success">검색</button>
						</div>
						<table class="table">
							<thead>
								<tr>
									<th scope="col">공지번호</th>
									<th scope="col">공지제목</th>
									<th scope="col">공지내용</th>
									<th scope="col">공지날짜</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<th scope="row">1</th>
									<td>살려줘</td>
									<td>집에가고싶어ㅠ</td>
									<td>2023년10월12일</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</main>
		</div>
	</div>
</body>
</html>
