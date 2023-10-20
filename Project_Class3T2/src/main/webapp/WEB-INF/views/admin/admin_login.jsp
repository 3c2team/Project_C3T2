<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<title>관리자 로그인</title>
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
<link href="${pageContext.request.contextPath }/resources/css/admin_style.css" rel="stylesheet" />
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.7.0.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/admin_login.js"></script>
<style type="text/css">
	body{
		background-image: url("${pageContext.request.contextPath }/resources/main_img/main.jpg");
		background-size : cover ;
	}
	.row {
		--bs-gutter-x: 1.5rem;
		--bs-gutter-y: 0;
		display: flex;
		flex-wrap: wrap;
		margin-top: 5%;
		margin-right: calc(-0.5 * var(--bs-gutter-x));
		margin-left: calc(-0.5 * var(--bs-gutter-x));
	}
	span{
		font-size: 70px;
		font-family: 'Sacramento', cursive;
		color: white;
	}
</style>
</head>
<body>
	<div id="layoutAuthentication">
		<div id="layoutAuthentication_content">
			<main>
				<div class="container">
					<div class="row justify-content-center">
						<div class="col-lg-5">
							<span>&nbsp;&nbsp; j'ai Farm</span>
							<div class="card shadow-lg border-0 rounded-lg mt-5">
								<div class="card-header">
									<h3 class="text-center font-weight-light my-4">관리자 로그인</h3>
								</div>
								<div class="card-body">
									<form action="AdminLoginPro">
										<div class="form-floating mb-3">
											<input class="form-control" type="text" name="admin_id" placeholder="name@example.com" /> 
											<label for="admin_id">관리자 아이디</label>
										</div>
										<div class="form-floating mb-3">
											<input class="form-control" name="admin_passwd" type="password" placeholder="Password" /> 
											<label for="admin_passwd">관리자 비밀번호</label>
										</div>
										<div
											class="d-flex align-items-center justify-content-between mt-4 mb-0">
											<input type="submit" class="btn btn-primary" value="로그인" >
										</div>
									</form>
								</div>
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
</body>
</html>
