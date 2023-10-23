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
	
	$("#delete_btn").on("click",function(){
		console.log($("#main_file").html());
		$("#main_file").html("<input type='file' class='form-control'>") ;
	});
});
</script>
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
					<input type="radio" name="category" id="1" value="Stake">Stake
					<input type="radio" name="category" id="2" value="Pasta">Pasta 
					<input type="radio" name="category" id="3" value="Soup">Soup 
					<input type="radio" name="category" id="4" value="etc">etc
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">상품 이름</label>
				<div class="com-sm-3">
					<input type="text" value="${dbProduct.product_name }" id="fd" name="name" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">가격</label>
				<div class="com-sm-3">
					<input type="text" value="${dbProduct.product_price }"id="unitPrice" name="unitPrice" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">상세 내용</label>
				<div class="com-sm-5">
					<textarea name="description"  cols="50" rows="2" class="form-control">${dbProduct.product_info }</textarea>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">상품 메인 이미지</label>
				<c:choose>
					<c:when test="${!empty dbProduct.product_main_img }">
						<div id="main_file">
							${dbProduct.product_main_img }
							<input type="button" value="삭제" id="delete_btn"><br>
						</div>
					</c:when>
					<c:otherwise>
						<div>
							<input type="file" class="form-control">
						</div>
					</c:otherwise>
				</c:choose>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">상품 서브 이미지</label>
				<c:choose>
					<c:when test="${!empty dbProduct.product_main_img }">
						<div id="main_file">
							<c:forEach var="dbProductImg" items="${dbProductImg }">
								<div>
									${dbProductImg.product_image}
									<input type="button" value="삭제" id="delete_btn"><br>
								</div>
							</c:forEach>
							<div id="button_add_result"></div>
							<input type="button" id="button_add" value="+">
						</div>
					</c:when>
					<c:otherwise>
					</c:otherwise>
				</c:choose>
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