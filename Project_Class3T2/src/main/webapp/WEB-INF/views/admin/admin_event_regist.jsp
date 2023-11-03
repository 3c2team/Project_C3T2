<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>

<title>가계 수정</title>
<style type="text/css">
.fs-5{
	color: white; 
}
</style>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.7.0.js"></script>
</head>
<body class="bg-secondary">
	<div class="jumbotron">
		<div class="container">
		</div>
	</div>
	<div class="container">
		<form name="newProduct" onsubmit="return confirm('등록하시겠습니까?')" action="AdminEventRegistPro" class="form-horizontal"method="post" enctype="multipart/form-data">
<!-- 		<form name="newProduct" action="AdminProductRagistPro" class="form-horizontal"method="post"> -->
			<div class="form-group row">
				<p class="fw-bolder fs-4">가계이름</p>
			</div>
				<p class="fw-bolder fs-5">가계이름</p>
			<div class="form-group row">
				<p class="fw-bolder fs-4">대표자 성명</p>
				<div class="com-sm-3">
					<input type="text" required  name="event_subject" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<p class="fw-bolder fs-4">영업 시간</p>
				<div class="com-sm-5">
					 <select class="form-select" name="">
						<option>07:00</option>
						<option>08:00</option>
						<option>09:00</option>
						<option>10:00</option>
						<option>11:00</option>
						<option>12:00</option>
						<option>13:00</option>
						<option>14:00</option>
					</select> ~ 
					<select class="form-select" name="">
						<option>19:00</option>
						<option>20:00</option>
						<option>21:00</option>
						<option>22:00</option>
						<option>23:00</option>
						<option>24:00</option>
						<option>01:00</option>
						<option>02:00</option>
					</select>
<!-- 					<input type="text" required  name="event_subject" class="form-control">~<input type="text" required  name="event_subject" class="form-control"> -->
				</div>
			</div>
			<div class="form-group row">
				<div class="col-sm-offset-2 col-sm-10">
					<input type="submit" class="btn btn-primary" value="등록">
				</div>
			</div>
			 
			 
		</form>
	</div>
</body>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</html>