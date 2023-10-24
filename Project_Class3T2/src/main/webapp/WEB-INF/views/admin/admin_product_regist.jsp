<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">

<title>상품 등록</title>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.7.0.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/admin_product.js"></script>
</head>
<body>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">상품 등록</h1>
		</div>
	</div>
	<div class="container">
		<form name="newProduct" action="AdminProductRagistPro" class="form-horizontal"method="post" enctype="multipart/form-data">
<!-- 		<form name="newProduct" action="AdminProductRagistPro" class="form-horizontal"method="post"> -->
			<div class="form-group row">
				<label class="col-sm-2">상품 분류</label>
				<div class="com-sm-3">
					<input type="radio" value="1" name="product_category_num" >스테이크
					<input type="radio" value="2" name="product_category_num" >드링크 
					<input type="radio" value="3" name="product_category_num" >
					<input type="radio" value="4" name="product_category_num" >
				</div> 
			</div>
			<div class="form-group row">
				<label class="col-sm-2">상품 이름</label>
				<div class="com-sm-3">
					<input type="text" name="product_name" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">가격</label>
				<div class="com-sm-3">
					<input type="text" name="product_price" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">상세 내용</label>
				<div class="com-sm-5">
					<textarea name="product_info" cols="50" rows="2" class="form-control"></textarea>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">상품 메인 이미지</label>
				<div>
					<input id="product_main_img" type="file" class="form-control" name="product_main_image">
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2">상품 서브 이미지<br>
				(다중 선택시 다중으로 들어감)</label>
				<div>
					<input type="file" class="form-control" id="product_image"name="product_image" multiple>
				</div>
			</div>
			<div class="form-group row">
				<div class="col-sm-offset-2 col-sm-10">
					<input id="product_image"type="submit" class="btn btn-primary" value="등록">
				</div>
			</div>
			 
			 
		</form>
	</div>
</body>
</html>