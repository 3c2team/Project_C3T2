<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.7.0.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/admin_scripts.js"></script>
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
		
		<form name="newProduct" action="AdminQnaAnswerPro" onsubmit="return confirm('등록하시겠습니까?')" class="form-horizontal" method="post" 
		enctype="multipart/form-data">
			
			
			<div class="form-group row">
				<label class="col-sm-2">등록 분류</label>
				<div class="com-sm-3">
					<jsp:include page="../inc/admin_answer.jsp"></jsp:include>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">작성아이디</label>
				<div class="com-sm-3">
					${QnaBoardDetail.member_id }
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">상품 이름</label>
				<div class="com-sm-3">
					${QnaBoardDetail.product_name }
				</div>
			</div>

			<div class="form-group row">
				<label class="col-sm-2">작성자 이름</label>
				<div class="com-sm-3">
					${QnaBoardDetail.member_name }
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">문의 제목</label>
				<div class="com-sm-3">
					${QnaBoardDetail.qna_subject }
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2">문의 내용</label>
				<div class="com-sm-3">
					${QnaBoardDetail.qna_content }
				</div>
			</div>
			<hr>
			
			<div class="form-group row">
				<label class="col-sm-2">답변하기</label>
				<div class="com-sm-5">
				<input type="hidden" name="qna_num" value="${QnaBoardDetail.qna_num }">
				<c:choose>
					<c:when test="${empty QnaBoardDetail.qna_answer }">
						<textarea name="qna_answer" cols="50" rows="2" required class="form-control"></textarea>
					</c:when>
					<c:otherwise>
						<textarea name="qna_answer" cols="50" rows="2" readonly class="form-control">${QnaBoardDetail.qna_answer }</textarea>
					</c:otherwise>
				</c:choose>
				</div>
			</div>
			
				
			<div class="form-group row">
				<div class="col-sm-offset-2 col-sm-10">
				<c:choose>
					<c:when test="${empty QnaBoardDetail.qna_answer }">
						<input type="button"onclick="window.close()" class="btn btn-primary" value="취소" >
						<input type="submit"class="btn btn-primary" onclick="isSubmit()" value="등록" >
					</c:when>
					<c:otherwise>
						<input type="button"onclick="window.close()" class="btn btn-primary" value="확인" >
					</c:otherwise>
				</c:choose>
				</div>
			</div>
		</form>
	</div>
</body>
</html>