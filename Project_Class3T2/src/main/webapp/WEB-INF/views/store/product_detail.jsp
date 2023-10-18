<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link href="${pageContext.request.contextPath }/resources/css/store_top.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/resources/css/default.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/resources/css/order_detail.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/resources/css/bottom.css" rel="stylesheet" type="text/css">
<script src="${pageContext.request.contextPath }/resource/js/order_detail.js"></script>
<body>
	<header>
		<jsp:include page="../inc/store_top.jsp"></jsp:include>
	</header>
	<main class="mainLayout">
		<section class="detailContainer">
			<div class="detailTop">
			
				<%-- 왼쪽 시작 --%>
				<div class="detailTopLeft">
					<div class="detailTopMainImg">
						<img src="${pageContext.request.contextPath }/resource/online_img/pasta1.jpg" id="main_img">
						<div class="detailTopMainImgReview" id="main_img_review" style="visibility:hidden;">
							<div class="orderAveStar">
								<strong>
									구매자들의 평균 평점
									<span><b>★</b></span>
									<span>5</span>
								</strong>
							</div>
							<ul>
								<li class="ImgReview">
									<div class="ImgReviewImg"><img src="${pageContext.request.contextPath }/resource/online_img/pasta1.jpg"></div>
									<div class="ImgReviewInfo">
										<span>아이디</span> | 
										<span>별점 갯수</span>
										<div>리뷰내용리뷰내용리뷰내용리뷰내용리뷰내용</div>
									</div>
								</li>
								<li class="ImgReview">
									<div class="ImgReviewImg"><img src="${pageContext.request.contextPath }/resource/online_img//pasta1.jpg"></div>
									<div class="ImgReviewInfo">
										<span>아이디</span> | 
										<span>별점 갯수</span>
										<div>리뷰내용리뷰내용리뷰내용리뷰내용리뷰내용</div>
									</div>
								</li>
								<li class="ImgReview">
									<div class="ImgReviewImg"><img src="${pageContext.request.contextPath }/resource/online_img/pasta1.jpg"></div>
									<div class="ImgReviewInfo">
										<span>아이디</span> | 
										<span>별점 갯수</span>
										<div>리뷰내용리뷰내용리뷰내용리뷰내용리뷰내용</div>
									</div>
								</li>
							</ul>
							<a class="ImgReviewMore" href="">324건 리뷰 더보기</a>			
						</div>
					</div>
					<div class="detailTopMiniImg">
						<ul>
						<!-- 이미지 업로드 수 만큼 조절해야함 -->
							<li><a><img src="${pageContext.request.contextPath }/resource/online_img/pasta2.jpg" id="mini_img" onmouseover="changeImg(this)"></a></li>
							<li><a><img src="${pageContext.request.contextPath }/resource/online_img/pasta3.jpg" id="mini_img" onmouseover="changeImg(this)"></a></li>
							<li><a><img src="${pageContext.request.contextPath }/resource/online_img/pasta4.jpg" id="mini_img" onmouseover="changeImg(this)"></a></li>
							<li><a><img src="${pageContext.request.contextPath }/resource/online_img/pasta5.jpg" id="mini_img" onmouseover="changeImg(this)"></a></li>
							<li><a><img src="${pageContext.request.contextPath }/resource/online_img/pasta5.jpg" onmouseover="changeImgOver()" onmouseout="changeImgOut()"></a></li>
						</ul>					
					</div>
				</div>	<%-- 왼쪽 끝 --%>
				
				
				
				
				<%-- 오른쪽 --%>
				<div class="detailTopRigth">
					<div class="detailTopLikeShare">
						<!-- 찜하기 공유하기 버튼 -->
						<button name="like">
							<span class="likeBtn">찜하기</span>
						</button>
						<button name="share">
							<span class="likeBtn">공유하기</span>
						</button>
					</div>
					<div class="productNum">
						<p>온라인상품코드 @제품코드00@ ${product_number }</p>
					</div>
					<div class="detailTopTitle">
						<p class="productName">어쩌고저쩌고개짱맛있는스테이크 ${product_name }</p>
					</div>
					<div class="productPrice">
						<b>20,000 ${product_price }</b>
						<span>원</span>
					</div>
					<table class="detailTopInfo">
						<tbody>
							<tr>
								<th>적립예정 포인트</th>
								<td>0.5%()</td>
							</tr>
							<tr>
								<th>배송비</th>
								<td>3,000원</td>
							</tr>
							<tr>
								<th>수량</th>
								<td>
									<div class="formAmount">
										<button onclick="del()">-</button>
										<input type="number" name="amounts" value="1">
										<button onclick="add()">+</button>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
					<div class="detailTopSum">
						<p class="detailTopSumTitle">판매가</p>
						<p class="detailTopSumPrice"><span class="priceSum" id="my_sum">20,000</span>&nbsp;원</p>
					</div>
					<div class="detailBtn">
						<button class="btn_white">장바구니</button>
						<button class="btn_black">구매하기</button>
<!-- 						<button>정기 배송</button> -->
<!-- 						<button>재고 품절 상품</button> -->
<!-- 						<button>일시 판매종료</button> -->
<!-- 						<button>재입고 알림신청</button> -->
					</div>
				</div> <%-- 오른쪽 끝 --%>
			</div>
		</section>
		
		<%-- =========================================================================================================================== --%>
				
		<section class="detailContainer">
			<div class="detailBottomTab">
				<button name="productInfo" onclick="">상품상세정보</button>
				<button name="productReview" onclick="">리뷰</button>
				<button name="productQnA" onclick="">Q&A</button>
				<button name="productRaw" onclick="">상품정보제공고시</button>
			</div>
			<div class="detailInfoImgArea">
				<img class="detailInfoImg" >
			</div>
		</section>
		
	</main>
	<footer id="footer">
		<jsp:include page="../inc/bottom.jsp"></jsp:include>
	</footer>
</body>
</html>