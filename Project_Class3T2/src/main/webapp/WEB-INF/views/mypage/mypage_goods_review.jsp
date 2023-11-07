<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="./include/head.jsp"%>
    <title>마이페이지-상품 리뷰</title>
    <script>
    // 이미지 경로에서 날짜 부분을 제거하는 함수
    function removeDynamicPartFromImagePath(imagePath) {
    // 정규 표현식을 사용하여 '연도/월/일/e93_' 패턴을 찾아 제거.
    return imagePath.replace(/\/\d{4}\/\d{2}\/\d{2}\/e93_/, '');
	}
	
	// 페이지 로드 시 모든 이미지 경로를 업데이트.
	window.onload = function() {
	    var images = document.querySelectorAll('img[data-dynamic-path]');
	    images.forEach(function(img) {
	        var originalPath = img.getAttribute('src');
	        var updatedPath = removeDynamicPartFromImagePath(originalPath);
	        img.setAttribute('src', updatedPath);
	    });
	};
    </script>
</head>
<body>
    <%@ include file="./include/body_top.jsp"%>

    <div class="mypageContents">
        <div class="text-center mt50 mb50">
            <h1>상품 리뷰</h1>
        </div>
        <h2 class="mb100"> 총 ${pageMaker.totalCount}개 상품</h2>
        <h2>기간 조회</h2>
        <div class="reservationConfirmContainer">
            <div class="reservationConfirmTerm">
                <div class="calendarContainer">
                    <button onclick="setToday()">오늘</button>
                    <button onclick="setMonths(-1)">1개월</button>
                    <button onclick="setMonths(-3)">3개월</button>
                    <button onclick="setMonths(-6)">6개월</button>
                </div>
                <div id="reservation_confirm_term_right">
                    <div class="calanderWrap">
                        <input type="date" id="startDate"> - <input type="date" id="endDate">
                        <button id="search_btn">조회</button>
                    </div>
                </div>
            </div>
            <br>
            <br>
            <!-- 리뷰 목록 테이블 -->
            <article>
                <section id="list_Form">
                    <table>
                        <!-- 테이블 헤더 -->
                        <tr id="tr_top">
                            <th width="80px">리뷰번호</th>
                            <th width="100px">상품번호</th>
                            <th width="150px">상품 이미지</th>
                            <th width="250px">리뷰 내용</th>
                            <th width="100px">별점</th>
                            <th width="130px">리뷰 날짜</th>
                        </tr>
                        <!-- 리뷰 데이터 반복 출력 -->
                        <c:forEach var="review" items="${reviews}">
                            <tr class="review-row" data-review-date="${review.review_date}">
                                <td>${review.review_num}</td>
                                    <!-- 상품명을 클릭하면 productDetail 페이지로 이동 -->
                                <td>
					                <a href="${pageContext.request.contextPath}/ProductDetail?proNum=${review.product_num}">
					                    ${review.product_num}
					                </a>
						        </td>
						        <!--  리뷰 이미지 -->
						        <td>
						            <c:if test="${not empty review.review_image}">
						                <img src="${pageContext.request.contextPath}/resources${review.review_image}" alt="Review Image" style="max-width: 100px; max-height: 100px;"/>
						            </c:if>
						        </td>
                                <td>${review.review_content}</td>
								<!-- 평점 숫자를 별점으로 치환시키기 -->
								<td>
                                    <c:forEach begin="1" end="${review.review_star}" var="star">
                                        ★
                                    </c:forEach>
                                </td>
                                <td>${review.review_date}</td>
                            </tr>
                        </c:forEach>
                        
                        <c:if test="${empty reviews}">
                            <tr>
                                <td colspan="5" class="text-center">
                                    <div style="height:50px; line-height: 50px">등록된 리뷰가 없습니다.</div>
                                </td>
                            </tr>
                        </c:if>
                    </table>
                </section>
            </article>
        </div>
        <div class="text-center mt50" style=" display: flex;justify-content: space-around;">
      		${pagination}
    	</div>
        <br>
        <br>
    </div>

    <script src="${pageContext.request.contextPath}/resources/js/mypage_calender.js"></script>
    <%@ include file="./include/body_bottom.jsp"%>
</body>
</html>