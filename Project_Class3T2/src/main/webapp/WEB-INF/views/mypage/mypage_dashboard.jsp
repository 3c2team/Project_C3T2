<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath }/css/default.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/css/mypage.css" rel="stylesheet" type="text/css">
</head>
<header>
	<jsp:include page="../inc/top.jsp"></jsp:include>
</header>	
<body>
	<div id="main_layout">
		<div class="mypageBox" id="mypageDashBoard">
			<span id="mypage_dashboard_info">
				<span id="col-1">
					<span>
						<a>WELCOME</a><br>
						<a><b>신혜리님</b></a>
					</span>	
				</span>
				<span id="col-2">
					<ul>
						<li>
							<span>회원 등급</span><br>
							<em> SILVER</em>
						</li>
						<li>
							<span>스토어 포인트</span><br>
							<em> 6,000P</em>
						</li>
						<li>
							<span>작성한 리뷰</span><br>
							<em> 0개</em>
						</li>
					</ul>
				</span>
			</span>
		</div>
		<div id="mypageContainer">
			<div class="mypageBox" id="mypageSideMenu">
				<nav class="menu">
					<div id="menu">
						<ul>
							<li><a href="mypage_dashboard.jsp">
       							<b>마이페이지 홈</b></a>
       						</li>
						</ul>
						<p><b>나의 예약정보</b></p>
						<ul>
							<li><a href="mypage_reservation_check.jsp">예약 확인</a></li>
							<li><a href="mypage_reservation_change.jsp">예약 변경</a></li>
						</ul>
					</div>
					<div id="menu">
						<p><b>나의 주문정보</b></p>
						<ul>
							<li><a href="mypage_check_order.jsp">주문 조회</a></li>
							<li><a href="mypage_check_cancel.jsp">취소/반품 조회</a></li>
							<li><a href="mypage_check_pay.jsp">결제 조회</a></li>
						</ul>
					</div>
					<div id="menu">
						<p><b>나의 포인트정보</b></p>
						<ul>
							<li><a href="mypage_point.jsp">포인트 내역</a></li>
						</ul>
					</div>
					<div id="menu">
						<p><b>나의 활동정보</b></p>
						<ul>
							<li><a href="mypage_goods_review.jsp">상품 리뷰</a></li>
							<li><a href="mypage_goods_ask.jsp">상품 문의</a></li>
							<li><a href="mypage_reservation_ask.jsp">예약 문의</a></li>
						</ul>
					</div>
					<div id="menu">
						<p><b>나의 관심정보</b></p>
						<ul>
							<li><a href="mypage_basket.jsp">장바구니</a></li>
							<li><a href="mypage_zzim.jsp">찜</a></li>
						</ul>
					</div>
					<div id="menu">
						<p><b>나의 정보 관리</b></p>
						<ul>
							<li><a href="mypage_member_modify.jsp">개인정보 수정</a></li>
							<li><a href="mypage_passwd_change.jsp">비밀번호 변경</a></li>
							<li><a href="mypage_member_out.jsp">회원 탈퇴</a></li>
						</ul>
					</div>
				</nav>
			</div>
		</div>
	</div>
</body>
<footer id="footer">
	<jsp:include page="../inc/bottom.jsp"></jsp:include>
</footer>
</html>