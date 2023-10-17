<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/resources/css/default.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/resources/css/mypage.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/resources/css/top.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/resources/css/bottom.css">
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
		<div id="mypage_container">
			<div class="mypageBox" id="mypage_sideMenu">
				<nav class="menu">
					<jsp:include page="../inc/mypage_box.jsp" />
				</nav>
			</div>
			<div class ="mypageContents">
				<div align="center">
				<br><br>
				<h1>주문 조회</h1><br>
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
    					<script src="${pageContext.request.contextPath }/resources/resources/js/mypage_calender.js"></script>
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
					<article>
						<section id="list_Form">
							<table>
								<tr id="tr_top">
									<th width="120px">주문번호</th> <!-- 적립 or 소멸 -->
									<th width="400px">상품명</th>
									<th width="130px">수량</th> <!-- 개별 유효기간 등 -->
									<th width="130px">결제상태</th>
									<th width="130px">주문상태</th>
								</tr>
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