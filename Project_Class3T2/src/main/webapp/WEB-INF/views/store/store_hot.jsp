<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
			<div class="categoryName"><h1>HOT</h1></div>
<!-- 			<div class="categoryMenu"> -->
<!-- 				<a href="">All</a> -->
<!-- 				<a href="Steak">Steak</a> -->
<!-- 				<a href="">Pasta</a> -->
<!-- 				<a href="">Soup</a> -->
<!-- 				<a href="">etc</a> -->
<!-- 			</div>	 -->
		</div>
		
		<%-- ================================================ --%>
		<div class="productListAll">
			<ul class="productList">
				<c:forEach var="product" items="${hotList }">
					<li class="productListLi">
						<div class="product">
							<a class="productClick" href="ProductDetail?proNum=${product.product_num }">
								<img src="${pageContext.request.contextPath}/resources${product.product_main_img_real_file}">
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