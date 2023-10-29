<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">

<title>상품 수정</title>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.7.0.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/admin_product.js"></script>
<script type="text/javascript">
$(function() {
	$("#${dbProduct.product_category_num }").prop("checked",true);
});
function add() {
	$("#add").append(
			"<input type='file'  class='form-control' accept='.jpg, .png'>"
		);
}
</script>
</head>
<body>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">상품 수정</h1>
		</div>
	</div>
	<div class="container">
		<form name="newProduct" action="AdminProductRagistPro" class="form-horizontal"method="post" enctype="multipart/form-data">
			<div class="form-group row">
				<label class="col-sm-2">상품 분류</label>
				<div class="com-sm-3">
					<label><input type="radio" name="product_category_num"  value="1">Stake</label>
					<label><input type="radio" name="product_category_num"  value="2">Pasta </label>
					<label><input type="radio" name="product_category_num" value="3">Soup </label>
					<label><input type="radio" name="product_category_num"  value="4">etc</label>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">상품 이름</label>
				<div class="com-sm-3">
					<input type="text" value="${dbProduct.product_name }" name="product_name" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">가격</label>
				<div class="com-sm-3">
					<input type="number" value="${dbProduct.product_price }" name="product_price" class="form-control" >
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">상세 내용</label>
				<div class="com-sm-5">
					<textarea name="product_info" cols="50" rows="15" class="form-control">${dbProduct.product_info }</textarea>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">상품 메인 이미지</label>
				<div>
					<input type="file" class="form-control" name="product_main_image" accept=".jpg, .png">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">상품 내용 이미지</label>
				<div>
					<input type="file" class="form-control" name="product_info_image" accept=".jpg, .png">
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2">상품 서브 이미지
				</label>
				<div>
					<input type="file" class="form-control" id="product_image"name="product_image" multiple accept=".jpg, .png">
					<br><span>다중 선택 가능</span>
				</div>
			</div>
			<div class="form-group row">
				<div class="col-sm-offset-2 col-sm-10">
				<input type="hidden" name="product_num" value="${dbProduct.product_num }">
					<input type="button" class="btn btn-primary" onclick="window.close()"value="취소">
					<input type="submit" onclick="isSubmit()" class="btn btn-primary" value="수정하기">
				</div>
			</div>
		</form>
	</div>
</body>
</html>