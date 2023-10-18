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
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<style>
.container2 {
    position: relative;
    display: flex;
    flex-wrap: wrap; /* 이미지가 빨간 선을 넘으면 다음 줄로 내려갑니다. */
}

.container2 img {
    max-width: 30%; /* 이미지의 최대 가로 크기를 제한합니다. 선의 위치에 따라 조정이 필요합니다. */
    margin: 10px; /* 이미지 간 간격을 주기 위한 마진 */
}

.line {
    position: absolute;
    top: 0;
    bottom: 0;
    left: 100%; /* 빨간 선의 위치를 화면의 70% 지점에 놓습니다. */
    width: 1px; /* 선의 너비 */
    background-color: white;
    z-index: 100; /* 선을 이미지 위에 위치시킵니다. */
}
.item {
    display: inline-block;
    margin: 10px;
    vertical-align: top;
}

.item img {
    display: block;
    max-width: 100%;
}

.itemDesc {
    text-align: left;
    font-family: 'Noto Serif KR', serif;
    line-height: 0.3;
}

.itemDesc.bold {
    font-weight: bold;
}
</style>
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
					<h1>찜</h1><br>
				</div>
			<h2>총 0개 상품</h2>
			<br><br><br><br>
				<div class="container2" align="center">
			    	<div class="line"></div>
			        <div class="item">
				        <img src="${pageContext.request.contextPath }/resources/resources/online_img/soup1.jpg" width="200" height="200">
				        <p class="itemDesc bold">가격</p>
				        <p class="itemDesc">상품설명</p>
				    </div>
		        	<div class="item">
				        <img src="${pageContext.request.contextPath }/resources/resources/online_img/soup1.jpg" width="200" height="200">
				        <p class="itemDesc bold">가격</p>
				        <p class="itemDesc">상품설명</p>
				    </div>
		        	<div class="item">
				        <img src="${pageContext.request.contextPath }/resources/resources/online_img/soup1.jpg" width="200" height="200">
				        <p class="itemDesc bold">가격</p>
				        <p class="itemDesc">상품설명</p>
				    </div>
		        	<div class="item">
				        <img src="${pageContext.request.contextPath }/resources/resources/online_img/soup1.jpg" width="200" height="200">
				        <p class="itemDesc bold">가격</p>
				        <p class="itemDesc">상품설명</p>
				    </div>
		        	<div class="item">
				        <img src="${pageContext.request.contextPath }/resources/resources/online_img/soup1.jpg" width="200" height="200">
				        <p class="itemDesc bold">가격</p>
				        <p class="itemDesc">상품설명</p>
				    </div>
				    <div class="item">
				        <img src="${pageContext.request.contextPath }/resources/resources/online_img/soup1.jpg" width="200" height="200">
				        <p class="itemDesc bold">가격</p>
				        <p class="itemDesc">상품설명</p>
				    </div>
				</div>
			</div>
		</div>
	</div>
</main>
<footer id="footer">
	<jsp:include page="../inc/bottom.jsp"></jsp:include>
</footer>
</body>
</html>