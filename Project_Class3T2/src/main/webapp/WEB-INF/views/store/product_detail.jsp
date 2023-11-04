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
		
		location.href="MainCart?proNum=${productDetail.product_num }&proCount=" + product_count;
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
						<c:forEach var="reviewList" items="${reviewList }">
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
										<c:if test="${not empty review_image }">
											<div class="ImgReviewImg"><img src="${reviewList.review_image }"></div>
										</c:if>
										<div class="ImgReviewInfo">
											<span>${reviewList.member_id }</span> | 
											<div class="bg_star" style="width: ${reviewList.review_star * 20 }%;"></div>
											<div>${reviewList.review_content }</div>
										</div>
									</li>
								</ul>
								<a class="ImgReviewMore" href="">${reviewCount }건 리뷰 더보기</a>			
							</div>
						</c:forEach>
					</div>
					<div class="detailTopMiniImg">
						<ul>
						<!-- 이미지 업로드 수 만큼 조절해야함 -->
							<c:forEach var="product_img" items="${productMiniImgList }">
								<li><a><img src="${product_img.product_image_real_file}" id="mini_img" onmouseover="changeImg(this)"></a></li>
							</c:forEach>
							<c:if test="${not empty reviewList }">
								<li><a><img src="${pageContext.request.contextPath }/resources/store_img/review_icon.png" onmouseover="changeImgOver()" onmouseout="changeImgOut()"></a></li>
							</c:if>
						</ul>					
					</div>
				</div>	<%-- 왼쪽 끝 --%>
				
				
				
				
				<%-- 오른쪽 --%>
				<div class="detailTopRigth">
					<div class="detailTopLikeShare">
						<!-- 찜하기 공유하기 버튼 -->
						<input type="hidden" name="product_num" value="${param.proNum }">
<!-- 						<button name="favoriteBtn">찜하기</button> -->
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
						<input type="hidden" id="productPrice" value="${productDetail.product_price }">
						<%-- 문제 1 주소에서 바로 Pronum 으로 검색하면 컨텐츠 안뜸 --%>
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
					<a href="#ProductDetail">상품상세정보</a>
				</div>
				<div class="detailBottomTabItem">
					<a href="#Review">상품리뷰</a>
				</div>
				<div class="detailBottomTabItem">
					<a href="#QnA">상품문의</a>
				</div>
				<div class="detailBottomTabItem">
					<a href="#Return">반품/교환정보</a>
				</div>
			</div>
			<div class="detailInfoImgArea" name="ProductDetail">
				<%-- 경로 변경하기 --%>
				<img class="detailInfoImg" src="${productInfoImg.product_image_real_file }">
			</div>
		</section>
		
		<section class="reviewContainer">
			<div>
				<div class="reviewTatle">
					<a name="Review">상품리뷰</a>
				</div>
				<hr>
				<div>
					<div>
						<div class="reviewAve">
							<strong class="reviewAveStr">상품 총 평점</strong>
							<div class="reviewAveDashboard">
								<div class="reviewAveStar">
									<div class="reviewStarMax">
										<div class="bg_star" style="width: ${AveReviewStar * 20 }%;">
										</div>									
									</div>
									<span class="reviewAveScore"> ${AveReviewStar }</span><span class="reviewMaxScore">/  5</span>
									<span class="reviewCount">총 ${reviewCount }건의 리뷰</span>
								</div>
								<div>
									<button class="reviewWrite" onclick="window.open('ReviewFrom?proNum=${productDetail.product_num }', 'review_from', 'width=500, height=800, location=no, status=no, scrollbars=no')">리뷰 쓰기</button>
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
						<c:choose>
							<c:when test="${empty reviewList }">
								<li>
									<div class="reviewBox">
												등록된 리뷰가 없습니다.
									</div>
								</li>								
							</c:when>
							<c:otherwise>
								<c:forEach var="reviewList" items="${reviewList }">
									<li>
										<div class="reviewBox">
											<div class="reviewStarMin">
												<div class="bg_star" style="width: ${reviewList.review_star * 20 }%;">
												</div>									
											</div>
											<div class="reviewInfo">
												<c:if test="${not empty reviewList.review_img_name }">
													<div class="reviewImg">
														<img src="${reviewList.review_img_name }">
													</div>
												</c:if>
												<div class="reviewContent">
													${reviewList.review_content }
												</div>
											</div>
											<div class="reviewIdDate">
												${reviewList.member_id } | ${reviewList.review_date }
											</div>
										</div>
									</li>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</ul>
				</div>
			</div>
		</section>
		<section class="qnaContainer">
			<div class="qnaItem">
				<div class="qnaTatle">
					<a name="QnA">상품 문의</a>
				</div>
				<div class="qnaAve">
					<div>
						<button class="reviewWrite" id="questionBtn" onclick="window.open('QuestionFrom?proNum=${productDetail.product_num }', 'question_from', 'width=600, height=800, location=no, status=no, scrollbars=no')">문의 하기</button>
					</div>
				</div>
			</div>
			<hr>
			<div>
				<div>
					<ul class="">
						<c:if test="${empty QnAList }">
							<li>
								<div class="reviewBox">
									등록된 문의글이 없습니다.
								</div>
							</li>
						</c:if>
						<c:forEach var="QnA" items="${QnAList }">
							<li>
								<div class="questionBox">
									<div class="qnaAnswer">
										<c:choose>
											<c:when test="${not empty QnA.question_answer }">
												<span>답변완료</span>
											</c:when>
											<c:otherwise>
												<span>답변대기</span>
											</c:otherwise>
										</c:choose>
									</div>
									<c:choose>
										<c:when test="${QnA.secret eq 0}">
											<div class="questionInfo" id="question_${QnA.question_num}">
												${QnA.question_content }
											</div>
											<div class="questionIdDate">
												${QnA.member_id } | ${QnA.question_date }
											</div>
										</c:when>
										<c:when test="${QnA.secret eq 1}">
											<div class="questionInfo secretQuestion">
												비밀글 입니다
											</div>
											<div class="questionIdDate">
											</div>
										</c:when>
									</c:choose>
								</div>
								<c:if test="${not empty QnA.question_answer }">
									<div class="answerBox" id="answer_${QnA.question_num}" style="display: none;">
										<div class="answerInfo">
											${QnA.question_answer }
										</div>
										<div class="answerIdDate">
											답변일자 ${QnA.question_answer_date }
										</div>
									</div>
								</c:if>
							</li>
						</c:forEach>
					</ul>
				</div>
			</div>
		</section>
		<section class="returnContainer">
			<div class="returnItem">
				<div class="returnTatle">
					<a name="Return">반품/교환정보</a>
				</div>
			</div>
			<hr>
			<div class="returnBox">
				<div class="returnInfo">
					<strong>J'ai Farm 반품/교환 안내</strong>
					<p>반품 시 먼저 판매자와 연락하셔서 반품사유, 택배사, 배송비, 반품지 주소 등을 협의하신 후 반품상품을 발송해 주시기 바랍니다.</p>
				</div>
				<div class="returnTable">
					<table cellspacing="0">
						<colgroup>
							<col width="150">
							<col width="410">
							<col width="150">
							<col>
						</colgroup>
						<tbody>
							<tr>
								<th scope="row" class="returnSub">판매자 지정택배사</th>
								<td colspan="3">CJ대한통운</td>
							</tr>
							<tr>
								<th scope="row" class="returnSub">반품배송비</th>
								<td>편도 3,000원 (최초 배송비 무료인 경우 6,000원 부과)</td>
								<th scope="row" class="returnSub">교환배송비</th>
								<td>6,000원</td>
							</tr>
							<tr>
								<th scope="row" class="returnSub">보내실 곳</th>
								<td colspan="3">부산광역시 부산진구 동천로 109 삼한골든게이트 7층</td>
							</tr>
							<tr>
								<th scope="row" rowspan="2" class="returnSub">반품/교환 사유에 따른 요청 가능 기간</th>
								<td colspan="3">
									"구매자 단순 변심은 상품 수령 후 7일 이내"
									<span>(구매자 반품배송비 부담)</span>
								</td>
							</tr>
							<tr>
								<td colspan="3">
									표시/광고와 상이, 계약 내용과 다르게 이행된 경우 상품 수령 후 3개월 이내 혹은 표시/광고와 다른 사실을 안 날로부터 30일 이내 
									<span>(판매자 반품 배송비 부담)</span>
									<br>둘 중 하나 경과 시 반품/교환 불가
								</td>
							</tr>
							<tr>
								<th scope="row" rowspan="7" class="returnSub">반품/교환 불가능 사유</th>
								<td colspan="3">
									<ul>
										<li><span>1.</span>반품요청기간이 지난 경우</li>
										<li><span>2.</span>구매자의 책임 있는 사유로 상품 등이 멸실 또는 훼손된 경우 <span class="_3OXYkEjCxo">(단, 상품의 내용을 확인하기 위하여 포장 등을 훼손한 경우는 제외)</span></li>
										<li><span>3.</span>구매자의 책임있는 사유로 포장이 훼손되어 상품 가치가 현저히 상실된 경우 <span class="_3OXYkEjCxo">(예: 식품, 화장품, 향수류, 음반 등)</span></li>
										<li><span>4.</span>구매자의 사용 또는 일부 소비에 의하여 상품의 가치가 현저히 감소한 경우 <span class="_3OXYkEjCxo">(라벨이 떨어진 의류 또는 태그가 떨어진 명품관 상품인 경우)</span></li>
										<li><span>5.</span>시간의 경과에 의하여 재판매가 곤란할 정도로 상품 등의 가치가 현저히 감소한 경우</li>
										<li><span>6.</span>고객의 요청사항에 맞춰 제작에 들어가는 맞춤제작상품의 경우 <span class="_3OXYkEjCxo">(판매자에게 회복불가능한 손해가 예상되고, 그러한 예정으로 청약철회권 행사가 불가하다는 사실을 서면 동의 받은 경우)</span></li>
										<li><span>7.</span>복제가 가능한 상품 등의 포장을 훼손한 경우 <span class="_3OXYkEjCxo">(CD/DVD/GAME/도서의 경우 포장 개봉 시)</span></li>
									</ul>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</section>
	</main>
	<footer id="footer">
		<jsp:include page="../inc/bottom.jsp"></jsp:include>
	</footer>
</body>
</html>