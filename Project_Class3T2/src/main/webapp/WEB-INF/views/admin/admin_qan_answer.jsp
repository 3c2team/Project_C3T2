<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">

<title>상품 등록</title>
</head>
<body>

	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">
				답변 등록
			</h1>
		</div>
	</div>
	
	<div class="container">
		
		<form name="newProduct" action="" class="form-horizontal" method="post" 
		enctype="multipart/form-data">
			
			
			<div class="form-group row">
				<label class="col-sm-2">작성아이디</label>
				<div class="com-sm-3">
					아이디
				</div>
			</div>

			<div class="form-group row">
				<label class="col-sm-2">작성자 이름</label>
				<div class="com-sm-3">
					이름
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2">문의 내용</label>
				<div class="com-sm-3">
					문의 내용
				</div>
			</div>
			<hr>
			
			<div class="form-group row">
				<label class="col-sm-2">답변하기</label>
				<div class="com-sm-5">
					<textarea name="description" cols="50" rows="2" class="form-control"></textarea>
				</div>
			</div>
			
				
			<div class="form-group row">
				<div class="col-sm-offset-2 col-sm-10">
					<input type="reset" class="btn btn-primary" value="취소" >
					<input type="submit"class="btn btn-primary" value="등록" >
				</div>
			</div>
		</form>
	</div>
</body>
</html>