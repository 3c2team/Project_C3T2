<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link href="${pageContext.request.contextPath }/resources/css/store_top.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/resources/css/default.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/resources/css/product_detail.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/resources/css/bottom.css" rel="stylesheet" type="text/css">
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/jquery-3.7.0.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/product_detail.js"></script>
<script type="text/javascript">
	function productCount() {
		let product_count = $("#amounts").val();
		
// 		alert("주문 수량 : " + product_count);
		
		location.href="CartPro?proNum=${productDetail.product_num }&proCount=" + product_count;
	}
</script>
</head>
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
						<img src="${productDetail.product_main_img_real_file}" id="main_img">
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
									<div class="ImgReviewImg"><img src="${pageContext.request.contextPath }/resources/online_img/pasta1.jpg"></div>
									<div class="ImgReviewInfo">
										<span>아이디</span> | 
										<span>별점 갯수</span>
										<div>리뷰내용리뷰내용리뷰내용리뷰내용리뷰내용</div>
									</div>
								</li>
								<li class="ImgReview">
									<div class="ImgReviewImg"><img src="${pageContext.request.contextPath }/resources/online_img//pasta1.jpg"></div>
									<div class="ImgReviewInfo">
										<span>아이디</span> | 
										<span>별점 갯수</span>
										<div>리뷰내용리뷰내용리뷰내용리뷰내용리뷰내용</div>
									</div>
								</li>
								<li class="ImgReview">
									<div class="ImgReviewImg"><img src="${pageContext.request.contextPath }/resources/online_img/pasta1.jpg"></div>
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
							<c:forEach var="product_img" items="${productMiniImgList }">
								<li><a><img src="${product_img.product_image_real_file}" id="mini_img" onmouseover="changeImg(this)"></a></li>
							</c:forEach>
							<li><a><img src="${pageContext.request.contextPath }/resources/store_img/review_icon.png" onmouseover="changeImgOver()" onmouseout="changeImgOut()"></a></li>
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
						<p>온라인상품코드 ${productDetail.product_num }</p>
					</div>
					<div class="detailTopTitle">
						<p class="productName">${productDetail.product_name }</p>
					</div>
					<div class="productPrice">
						<b>${productDetail.product_price }</b>
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
										<button id="delBtn">-</button>
										<input type="number" id="amounts" value="1">
										<button id="addBtn">+</button>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
					<div class="detailTopSum">
						<p class="detailTopSumTitle">판매가</p>
						<p class="detailTopSumPrice"><span class="priceSum" id="my_sum">${productDetail.product_price }</span>&nbsp;원</p>
					</div>
					<div class="detailBtn">
						<button class="btn_white" onclick="productCount()">장바구니</button>
						<button class="btn_black" onclick="location.href='Pay'">구매하기</button>
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
				<div class="detailBottomTabItem">
					<a href="">상품상세정보</a>
				</div>
				<div class="detailBottomTabItem">
					<a href="#review">리뷰</a>
				</div>
				<div class="detailBottomTabItem">
					<a href="#QnA">Q&A</a>
				</div>
				<div class="detailBottomTabItem">
					<a href="">상품정보제공고시</a>
				</div>
			</div>
			<div class="detailInfoImgArea">
				<%-- 경로 변경하기 --%>
				<img class="detailInfoImg" src="${productInfoImg.product_image_real_file }">
			</div>
		</section>
		
		<section class="reviewContainer">
			<div>
				<div class="reviewTatle">
					<a name="review">상품리뷰</a>
				</div>
				<hr>
				<div>
					<div>
						<div class="reviewAve">
							<strong class="reviewAveStr">상품 총 평점</strong>
							<div class="reviewAveDashboard">
								<div class="reviewAveStar">
									<a>★★★★★</a>
									<span class="reviewAveScore"> 4.2</span><span class="reviewMaxScore">/  5</span>
									<span class="reviewCount">총 4건의 리뷰</span>
								</div>
								<div>
									<button class="reviewWrite">리뷰 쓰기</button>
								</div>
							</div>
						</div>
						
					</div>	
				</div>
			</div>
			<hr>
			<div>
				<div>
					<ul class="">
<%-- 						<c:forEach var="" items=""> --%>
							<li>
								<div class="reviewBox">
									<div class="reviewStar">
										<a>★★★★★ | 5</a>
									</div>
									<div class="reviewInfo">
										<%-- if 사진 있으면 넣고 없으면 빼고 --%>
										<div class="reviewImg">
											<img src="../store_img/steak7 (4).jpg">
										</div>
										<div class="reviewContent">
											리뷰내용리뷰내용리뷰내용리뷰내용리뷰내용리뷰내용리뷰내용리뷰내용리뷰내용리뷰내용리뷰내용리뷰내용리뷰내용리뷰내용
											리뷰내용리뷰내용리뷰내용리뷰내용
										</div>
									</div>
									<div class="reviewIdDate">
										아이디 | 리뷰쓴날
									</div>
								</div>
							</li>
							<li>
								<div class="reviewBox">
									<div class="reviewStar">
										<a>★★★★★ | 5</a>
									</div>
									<div class="reviewInfo">
										<%-- if 사진 있으면 넣고 없으면 빼고 --%>
										<div class="reviewImg">
											<img src="../store_img/steak7 (4).jpg">
										</div>
										<div class="reviewContent">
											리뷰내용리뷰내용리뷰내용리뷰내용리뷰내용리뷰내용리뷰내용리뷰내용리뷰내용리뷰내용리뷰내용리뷰내용리뷰내용리뷰내용
											리뷰내용리뷰내용리뷰내용리뷰내용
										</div>
									</div>
									<div class="reviewIdDate">
										아이디 | 리뷰쓴날
									</div>
								</div>
							</li>
							<li>
								<div class="reviewBox">
									<div class="reviewStar">
										<a>★★★★★ | 5</a>
									</div>
									<div class="reviewInfo">
										<%-- if 사진 있으면 넣고 없으면 빼고 --%>
										<div class="reviewImg">
											<img src="../store_img/steak7 (4).jpg">
										</div>
										<div class="reviewContent">
											리뷰내용리뷰내용리뷰내용리뷰내용리뷰내용리뷰내용리뷰내용리뷰내용리뷰내용리뷰내용리뷰내용리뷰내용리뷰내용리뷰내용
											리뷰내용리뷰내용리뷰내용리뷰내용
										</div>
									</div>
									<div class="reviewIdDate">
										아이디 | 리뷰쓴날
									</div>
								</div>
							</li>
							<li>
								<div class="reviewBox">
									<div class="reviewStar">
										<a>★★★★★ | 5</a>
									</div>
									<div class="reviewInfo">
										<%-- if 사진 있으면 넣고 없으면 빼고 --%>
										<div class="reviewImg">
											<img src="../store_img/steak7 (4).jpg">
										</div>
										<div class="reviewContent">
											리뷰내용리뷰내용리뷰내용리뷰내용리뷰내용리뷰내용리뷰내용리뷰내용리뷰내용리뷰내용리뷰내용리뷰내용리뷰내용리뷰내용
											리뷰내용리뷰내용리뷰내용리뷰내용
										</div>
									</div>
									<div class="reviewIdDate">
										아이디 | 리뷰쓴날
									</div>
								</div>
							</li>
<%-- 						</c:forEach> --%>
					</ul>
				</div>
			</div>
		</section>
		<section class="qnaContainer">
			<div class="qnaItem">
				<div class="qnaTatle">
					<a name="QnA">상품 Q&A</a>
				</div>
				<div class="qnaAve">
					<div>
						<button class="qnaWrite">문의 하기</button>
					</div>
				</div>
			</div>
			<hr>
			<div>
				<div>
					<ul class="">
<%-- 						<c:forEach var="" items=""> --%>
							<li>
								<div class="qnaBox">
									<div class="qnaAnswer">
										<span>답변완료</span>
									</div>
									<div class="qnaInfo">
										원산지 관련 문의
									</div>
									<div class="qnaIdDate">
										아이디 | 문의쓴날
									</div>
								</div>
							</li>
<%-- 						</c:forEach> --%>
						<li>
								<div class="qnaBox">
									<div class="qnaAnswer">
										<span>답변완료</span>
									</div>
									<div class="qnaInfo">
										원산지 관련 문의
									</div>
									<div class="qnaIdDate">
										아이디 | 리뷰쓴날
									</div>
								</div>
							</li><li>
								<div class="qnaBox">
									<div class="qnaAnswer">
										<span>답변완료</span>
									</div>
									<div class="qnaInfo">
										원산지 관련 문의
									</div>
									<div class="qnaIdDate">
										아이디 | 리뷰쓴날
									</div>
								</div>
							</li><li>
								<div class="qnaBox">
									<div class="qnaAnswer">
										<span>답변완료</span>
									</div>
									<div class="qnaInfo">
										원산지 관련 문의
									</div>
									<div class="qnaIdDate">
										아이디 | 리뷰쓴날
									</div>
								</div>
							</li>
					</ul>
				</div>
			</div>
		</section>
	</main>
	<footer id="footer">
		<jsp:include page="../inc/bottom.jsp"></jsp:include>
	</footer>
</body>
</html>