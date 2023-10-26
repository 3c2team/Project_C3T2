<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="${pageContext.request.contextPath }/resources/css/default.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/resources/css/review_from.css" rel="stylesheet" type="text/css">
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/jquery-3.7.0.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/review_from.js"></script>
<script type="text/javascript">
</script>
</head>
<body>
	<h1>리뷰쓰기</h1>
	
	<div class="ProductView">
		<div class="ProductImg" ><img src="${product.product_main_img_real_file }"></div>
		<div class="ProductContent">
			<div class="ProductName">
				<h2>${product.product_name }</h2>
			</div>
			<div class="ProductInfo">
				<p>${product.product_info }</p>
			</div>
		</div>
	</div>
	
	<div class="reviewForm">
		<form action="ReviewPro" name="review_form" method="post">
			<div class="starScore">
				<strong>상품은 만족하셨나요?</strong>
				<div class="Stars">
					<div class="star-rating space-x-4 mx-auto">
						<input type="radio" id="5-stars" name="rating" value="5" v-model="ratings"/>
						<label for="5-stars" class="star pr-4">★</label>
						<input type="radio" id="4-stars" name="rating" value="4" v-model="ratings"/>
						<label for="4-stars" class="star">★</label>
						<input type="radio" id="3-stars" name="rating" value="3" v-model="ratings"/>
						<label for="3-stars" class="star">★</label>
						<input type="radio" id="2-stars" name="rating" value="2" v-model="ratings"/>
						<label for="2-stars" class="star">★</label>
						<input type="radio" id="1-star" name="rating" value="1" v-model="ratings" />
						<label for="1-star" class="star">★</label>
					</div>
				</div>
				<input type="hidden" id="stars" value="dd">
			</div>
			<div class="reviewContent">
				<p>어떤 점이 좋았나요?</p>
				<div class="reviewBox">
					<textarea></textarea>
				</div>
				<div>
					<button class="fileUpload" type="button">사진 첨부하기</button>
				</div>
			</div>
			<div class="buttomBtn">
				<input type="button" id="cencle" value="취소">
				<input type="submit" id="submit" value="등록">
			</div>
		</form>
	</div>	
</body>
</html>