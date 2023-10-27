<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/default.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/mypage.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/top.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bottom.css">
</head>
<body>
<header>
	<jsp:include page="../inc/top.jsp"></jsp:include>
</header>
	<main>	
	<div id="main_layout">
		<div class="mypageBox" id="mypage_dashboard">
			<span id="mypage_dashboard_info">
				<span id="col_1">
					<span>
						<jsp:include page="../inc/mypage_col_1.jsp" />
					</span>	
				</span>
				<span id="col_2">
					<ul>
						<jsp:include page="../inc/mypage_col_2.jsp" />
					</ul>
				</span>
			</span>
		</div>
		<!-- 마이페이지 컨텐츠 영역 -->
		<div id="mypage_container">
			<div class="mypageBox" id="mypage_sideMenu">
				<nav class="menu">
					<jsp:include page="../inc/mypage_box.jsp" />
				</nav>
			</div>
			<div class ="mypageContents">
				<div align="center">
				<br><br>
				<h1>상품 리뷰</h1><br>
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
   					<script src="${pageContext.request.contextPath }/resources/js/mypage_calender.js"></script>
					<div id="reservation_confirm_term_right">
						<div class="calanderWrap">
							<input type="date" id="startDate">
					         -  
					        <input type="date" id="endDate"> 
					        <button id="search_btn">조회</button>
						</div>
					</div>
				</div>
				<br><br>
				<!-- 리뷰 목록 테이블 -->
                    <article>
                        <section id="list_Form">
                            <table>
                                <!-- 테이블 헤더 -->
                                <tr id="tr_top">
                                    <th width="120px">주문일자</th>
                                    <th width="400px">배송자 주소</th>
                                    <th width="130px">배송자 성함</th>
                                    <th width="130px">배송 전 문자</th>
                                    <th width="130px">제품 번호</th>
                                </tr>
                                <!-- 리뷰 데이터 반복 출력 -->
                                <c:forEach var="OrderList" items="${OrderList}">
								    <tr>
								        <td>${OrderList.order_date}</td>
								        <td>${OrderList.receiver_address}</td>
								        <td>${OrderList.receiver_name}</td>
								        <td>${OrderList.receiver_request}</td>
								        <td>${OrderList.product_num}</td>
								    </tr>
								</c:forEach>
                            </table>
                        </section>
                    </article>
				</div>
				<br><br>
			</div>
		</div>
	</div>
	</main>
<footer id="footer">
	<jsp:include page="../inc/bottom.jsp"></jsp:include>
</footer>
</body>
</html>