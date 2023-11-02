<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="./include/head.jsp"%>
    <title>마이페이지-상품 리뷰</title>
</head>
<body>
    <%@ include file="./include/body_top.jsp"%>

    <div class="mypageContents">
        <div class="text-center mt50 mb50">
            <h1>상품 리뷰</h1>
        </div>
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
                            <th width="80px">주문번호</th>
                            <th width="200px">상품명</th>
                            <th width="300px">리뷰 내용</th>
                            <th width="100px">별점</th>
                            <th width="130px">리뷰 날짜</th>
                        </tr>
                        <!-- 리뷰 데이터 반복 출력 -->
                        <c:forEach var="review" items="${reviews}">
                            <tr class="review-row" data-review-date="${review.review_date}">
                                <td>${review.order_num}</td>
                                    <!-- 상품명을 클릭하면 productDetail 페이지로 이동 -->
                                <td>
					                <a href="${pageContext.request.contextPath}/ProductDetail?proNum=${review.product_num}">
					                    ${review.product_name}
					                </a>
						        </td>
                                <td>${review.review_content}</td>
<%--                                 <td>${review.review_star}</td> --%>
								<td>
                                    <c:forEach begin="1" end="${review.review_star}" var="star">
                                        ★
                                    </c:forEach>
                                    <c:forEach begin="${review.review_star + 1}" end="5" var="emptyStar">
                                        .
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
        <br>
        <br>
    </div>

    <script src="${pageContext.request.contextPath}/resources/js/mypage_calender.js"></script>
    <%@ include file="./include/body_bottom.jsp"%>
</body>
</html>