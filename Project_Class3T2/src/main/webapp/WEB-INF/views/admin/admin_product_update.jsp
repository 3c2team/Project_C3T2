<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">

<title>상품 수정</title>
<script src="${pageContext.request.contextPath }/resource/js/jquery-3.7.0.js"></script>
<script src="${pageContext.request.contextPath }/resource/js/admin_product.js"></script>
	
</head>
<body>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">상품 수정</h1>
		</div>
	</div>
	<div class="container">
		<form name="newProduct" action="" class="form-horizontal"method="post" enctype="multipart/form-data">
			<div class="form-group row">
				<label class="col-sm-2">상품 분류</label>
				<div class="com-sm-3">
					<input type="radio" name="category" >스테이크
					<input type="radio" name="category" >드링크 
					<input type="radio" name="category" >밥 
					<input type="radio" name="category" >배고파
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">상품 이름</label>
				<div class="com-sm-3">
					<input type="text" id="name" name="name" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">가격</label>
				<div class="com-sm-3">
					<input type="text" id="unitPrice" name="unitPrice" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">상세 내용</label>
				<div class="com-sm-5">
					<textarea name="description" cols="50" rows="2" class="form-control"></textarea>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">재고 수</label>
				<div class="com-sm-3">
					<input type="text" name="unitsInStock" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">상품 메인 이미지</label>
				<div>
					<input type="file" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">상품 서브 이미지</label>
				<div>
					<input type="file" class="form-control">
					<div id="button_add_result"></div>
					<input type="button" id="button_add" value="+">
				</div>
			</div>
			<div class="form-group row">
				<div class="col-sm-offset-2 col-sm-10">
					<input type="button" class="btn btn-primary" value="취소">
					<input type="submit" class="btn btn-primary" value="등록">
				</div>
			</div>
		</form>
	</div>
</body>
</html>