<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
			<div class="categoryName"><h1>MEAL KIT</h1></div>
			<div class="categoryMenu">
<!-- 	            <a href="/Products?category=All" class="categoryLink">All</a> -->
	            <a href="?category=Steak" class="categoryLink">Steak</a>
	            <a href="?category=Pasta" class="categoryLink">Pasta</a>
	            <a href="?category=Soup" class="categoryLink">Soup</a>
	            <a href="?category=ets" class="categoryLink">ets</a>
        </div>
		</div>
		
		<%-- ================================================ --%>
		<div class="productListAll">
			<ul class="productList">
				<c:forEach var="product" items="${proList }">
					<li class="productListLi">
						<div class="product">
							<a class="productClick" href="ProductDetail?proNum=${product.product_num }">
								<img src="${product.product_main_img_real_file}">
								<strong>${product.product_name }</strong><br>
								<strong><span>${product.product_price }</span><span>원</span></strong>
<%-- 								<strong>${product.product_info }</strong> --%>
							</a>
						</div>
					</li>
				</c:forEach>
			</ul>
		</div>
		
	</main>
	<footer id="footer">
		<jsp:include page="../inc/bottom.jsp"></jsp:include>
	</footer>
</body>
</html>