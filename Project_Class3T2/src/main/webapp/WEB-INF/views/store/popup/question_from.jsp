<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="${pageContext.request.contextPath }/resources/css/default.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/resources/css/question_from.css" rel="stylesheet" type="text/css">
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/jquery-3.7.0.js"></script>
</head>
<body>
	<div class="questionFormTitle">
		<h1>문의하기</h1>
	</div>
	<div class="questionForm">
		<form action="QuestionPro" name="question_form" method="post">
			<input type="hidden" name="product_num" id="product_num" value="${param.proNum }">
			<input type="hidden" name="member_id" id="member_id" value="${sessionScope.sId }">
			<div class="questionContent">
				<p>문의하실 내용을 입력하세요.</p>
				<div class="questionBox">
					<textarea id="question_content" name="question_content"></textarea>
				</div>
<!-- 				<div class="privateCheck"> -->
<!-- 					<input type="checkbox" id=""><a>비공개</a> -->
<!-- 				</div> -->
			</div>
			<div class="buttonBtn">
				<input type="button" id="cencle" value="취소" onclick="window.close();">
				<input type="submit" id="submit" value="등록">
			</div>
		</form>
	</div>	
	<div class="notice">
		<div class="noticeTitle">
			<h2>상품 문의 작성 유의사항</h2>
		</div>
		<ul>
			<li>상품 문의는 상품 및 상품 구매 과정(배송, 반품/취소, 교환/변경)에 대해 판매자에게 문의하는 게시판입니다.</li>
			<li>상품 및 상품 구매 과정과 관련 없는 비방/욕설/명예훼손성 게시글 및 상품과 관련 없는 광고글 등 부적절한 게시글 등록 시 글쓰기 제한 및 게시글이 삭제 조치 될 수 있습니다.</li>
			<li>전화번호, 이메일 등 개인 정보가 포함된 글 작성이 필요한 경우 판매자만 볼 수 있도록 비밀글로 문의해 주시기 바랍니다.</li>
			<li>상품에 대한 이용 후기는 리뷰에 남겨 주세요.</li>
		</ul>
		<p></p>
	</div>
</body>
</html>