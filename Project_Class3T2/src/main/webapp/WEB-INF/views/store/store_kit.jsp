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
	            <a href="/Products?category=Steak" class="categoryLink">Steak</a>
	            <a href="/Products?category=Pasta" class="categoryLink">Pasta</a>
	            <a href="/Products?category=Soup" class="categoryLink">Soup</a>
	            <a href="/Products?category=ets" class="categoryLink">ets</a>
        </div>
		</div>
		
		<%-- ================================================ --%>
		<div class="productListAll">
			<ul class="productList">
				<c:forEach var="product" items="${categoryList}">
					<li>${product.product_name} - ${product.product_price}</li>
 				</c:forEach>
			</ul>
		</div>
		
	</main>
	<footer id="footer">
		<jsp:include page="../inc/bottom.jsp"></jsp:include>
	</footer>
</body>
</html>