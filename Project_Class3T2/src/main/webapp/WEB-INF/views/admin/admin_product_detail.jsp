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
<script type="text/javascript">
$(function() {
	$("#${dbProduct.product_category_num }").prop("checked",true);
	
});
</script>
</head>
<body>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">상품 내용</h1>
		</div>
	</div>
	<div class="container">
		<div class="form-group row">
			<label class="col-sm-2">상품 분류</label>
			<div class="com-sm-3">
				<input type="radio" name="category"  id="1" value="1">Stake
				<input type="radio" name="category" id="2" value="2">Pasta 
				<input type="radio" name="category" id="3" value="3">Soup 
				<input type="radio" name="category" id="4" value="4">etc
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2">상품 이름</label>
			<div class="com-sm-3">
				${dbProduct.product_name }
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2">가격</label>
			<div class="com-sm-3">
				${dbProduct.product_price }원
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2">상세 내용</label>
			<div class="com-sm-5">
				<textarea rows="12" cols="35" readonly="readonly">${dbProduct.product_info }
				</textarea>
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2">상품 메인 이미지</label>
			<div id="main_file">
				${dbProduct.product_main_img }
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2">상품 서브(내용) 이미지</label>
			<div>
				<c:forEach var="dbProductImg" items="${dbProductImg }">
					<div class="sub_file">
						${dbProductImg.product_image}
					</div>
				</c:forEach>
			</div>
		</div>
		<div class="form-group row">
			<div class="col-sm-offset-2 col-sm-10">
				<input type="button" class="btn btn-primary" onclick="window.close()"value="취소">
				<input type="button" onclick="location.href='AdminProductUpdate?product_num=${dbProduct.product_num }'" class="btn btn-primary" value="수정하기">
			</div>
		</div>
	</div>
</body>
</html>