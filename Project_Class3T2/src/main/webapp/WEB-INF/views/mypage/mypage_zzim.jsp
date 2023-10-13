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
						<jsp:include page="../inc/mypage_col_1.jsp" />
					</span>	
				</span>
				<span id="col-2">
					<ul>
						<jsp:include page="../inc/mypage_col_2.jsp" />
					</ul>
				</span>
			</span>
		</div>
		<div id="mypageContainer">
			<div class="mypageBox" id="mypageSideMenu">
				<nav class="menu">
					<jsp:include page="../inc/mypage_box.jsp" />
				</nav>
			</div>
			<div class ="mypageContents">
			<div align="center">
			<br><br>
			<h1>찜</h1><br>
			</div>
			<h2>총 0개 상품</h2>
			<br><br><br><br>
			<div class="container" align="center">
			    <div class="item">
			        <img src="./img/pasta1.jpg" width = "200"/>
			        <p style="line-height: 0.3; text-align: left; font-family: 'Noto Serif KR', serif; font-weight: bold;">20,000원</p>
			        <p style="line-height: 0.3; text-align: left; font-family: 'Noto Serif KR', serif; font-weight: 100;">함박 스테이크 (2인분) 밀키트</p>
			        
			    </div>
			    <div class="item">
			        <img src="./img/pasta2.jpg" width = "200"/>
			        <p style="line-height: 0.3; text-align: left; font-family: 'Noto Serif KR', serif;">가격</p>
			        <p style="line-height: 0.3; text-align: left; font-family: 'Noto Serif KR', serif;">상품설명</p>
			    </div>
			    <div class="item">
			        <img src="./img/pasta3.jpg" width = "200"/>
			        <p style="line-height: 0.3; text-align: left; font-family: 'Noto Serif KR', serif;">가격</p>
			        <p style="line-height: 0.3; text-align: left; font-family: 'Noto Serif KR', serif;">상품설명</p>
			    </div>
			    <div class="item">
			        <img src="./img/pasta4.jpg" width = "200"/>
			        <p style="line-height: 0.3; text-align: left; font-family: 'Noto Serif KR', serif;">가격</p>
			        <p style="line-height: 0.3; text-align: left; font-family: 'Noto Serif KR', serif;">상품설명</p>
			    </div>
			</div>
		</div>
	</div>
</div>
</body>
<footer id="footer">
	<jsp:include page="../inc/bottom.jsp"></jsp:include>
</footer>
</html>