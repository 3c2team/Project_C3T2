<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath }/resources/css/store_top.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/resources/css/default.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/resources/css/online_store.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/resources/css/bottom.css" rel="stylesheet" type="text/css">
</head>
<body>
	<header>
		<jsp:include page="../inc/store_top.jsp"></jsp:include>
	</header>
	<main class="mainLayout">
		<div class="categoryMenuArea">
			<div class="categoryName"><h1>BEST</h1></div>
			<div class="categoryMenu">
				<a href="">All</a>
				<a href="">Steak</a>
				<a href="">Pasta</a>
				<a href="">Soup</a>
				<a href="">ets</a>
			</div>	
		</div>
		
		<%-- ================================================ --%>
		<div class="productListAll">
			<ul class="productList">
				<li class="productListLi">
					<div class="product">
						<img src="${pageContext.request.contextPath }/resources/online_img/soup1.jpg">
						<a>어쩌고저쩌고짱맛있는스테이크</a>
						<a>23,000원</a>
					</div>
				</li>
				<li class="productListLi">
					<div class="product">
						<img src="${pageContext.request.contextPath }/resources/online_img/soup1.jpg">
						<a>어쩌고저쩌고짱맛있는스테이크</a>
						<a>23,000원</a>
					</div>
				</li>
				<li class="productListLi">
					<div class="product">
						<img src="${pageContext.request.contextPath }/resources/online_img/soup1.jpg">
						<a>어쩌고저쩌고짱맛있는스테이크</a>
						<a>23,000원</a>
					</div>
				</li>
				<li class="productListLi">
					<div class="product">
						<img src="${pageContext.request.contextPath }/resources/online_img/soup1.jpg">
						<a>어쩌고저쩌고짱맛있는스테이크</a>
						<a>23,000원</a>
					</div>
				</li>
				<li class="productListLi">
					<div class="product">
						<img src="${pageContext.request.contextPath }/resources/online_img/soup1.jpg">
						<a>어쩌고저쩌고짱맛있는스테이크</a>
						<a>23,000원</a>
					</div>
				</li>
				<li class="productListLi">
					<div class="product">
						<img src="${pageContext.request.contextPath }/resources/online_img/soup1.jpg">
						<a>어쩌고저쩌고짱맛있는스테이크</a>
						<a>23,000원</a>
					</div>
				</li>
			</ul>
		</div>
		
	</main>
	<footer id="footer">
		<jsp:include page="../inc/bottom.jsp"></jsp:include>
	</footer>
</body>
</html>