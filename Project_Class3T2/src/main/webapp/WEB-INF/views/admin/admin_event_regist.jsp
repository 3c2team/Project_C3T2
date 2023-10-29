<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">

<title>이벤트 등록</title>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.7.0.js"></script>
</head>
<body>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">이벤트 등록</h1>
		</div>
	</div>
	<div class="container">
		<form name="newProduct" action="AdminEventRegistPro" class="form-horizontal"method="post" enctype="multipart/form-data">
<!-- 		<form name="newProduct" action="AdminProductRagistPro" class="form-horizontal"method="post"> -->
			<div class="form-group row">
				<label class="col-sm-2">등록 분류</label>
				<div class="com-sm-3">
					<jsp:include page="../inc/admin_answer.jsp"></jsp:include>
				</div> 
			</div>
			<div class="form-group row">
				<label class="col-sm-2">이벤트 제목</label>
				<div class="com-sm-3">
					<input type="text" name="event_subject" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">이벤트 내용</label>
				<div class="com-sm-5">
					<textarea name="event_content" cols="50" rows="15" class="form-control"></textarea>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">이벤트 이미지</label>
				<div>
					<input type="file" class="form-control" name="event_image" accept=".jpg, .png">
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
</html>