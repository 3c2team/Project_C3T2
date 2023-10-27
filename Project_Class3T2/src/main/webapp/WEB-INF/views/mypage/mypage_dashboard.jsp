<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
						<a>WELCOME</a><br>
						<a><b>신혜리님</b></a>
					</span>	
				</span>
				<span id="col_2">
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
		<div id="mypage_container">
			<div class="mypageBox" id="mypage_sideMenu">
				<nav class="menu">
					<div id="menu">
						<ul>
							<li><a href="mypageDashboard">
								<b>마이페이지 홈</b></a>
							</li>
						</ul>
						<p><b>상품 구매</b></p>
						<ul>
							<li><a href="MypageBuyList">상품 구매 내역</a></li>
						</ul>
					</div>
					<div id="menu">
						<p><b>나의 주문정보</b></p>
						<ul>
							<li><a href="MypageCheckOrder">주문 조회</a></li>
							<li><a href="MypageCheckCancel">취소/반품 조회</a></li>
							<li><a href="MypageCheckPay">결제 조회</a></li>
						</ul>
					</div>
					<div id="menu">
						<p><b>나의 신상정보</b></p>
						<ul>
							<li><a href="MypagePoint">나의 상세정보</a></li>
						</ul>
					</div>
					<div id="menu">
						<p><b>나의 활동정보</b></p>
						<ul>
							<li><a href="MypageGoodsReview">상품 리뷰</a></li>
						</ul>
					</div>
					<div id="menu">
						<p><b>나의 관심정보</b></p>
						<ul>
							<li><a href="MypageBasket">장바구니</a></li>
							<li><a href="MypageZzim">찜</a></li>
						</ul>
					</div>
					<div id="menu">
						<p><b>나의 정보 관리</b></p>
						<ul>
							<li><a href="MypageMemberModify">개인정보 수정</a></li>
							<li><a href="MypagePasswdChange">비밀번호 변경</a></li>
							<li><a href="MypageMemberOut">회원 탈퇴</a></li>
						</ul>
					</div>	
				</nav>
			</div>
		</div>
	</div>
	</main>
<footer id="footer">
	<jsp:include page="../inc/bottom.jsp"></jsp:include>
</footer>
</body>
</html>