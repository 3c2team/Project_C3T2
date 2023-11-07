<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link href="${pageContext.request.contextPath }/resources/css/store_top.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/resources/css/default.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/resources/css/bottom.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/resources/css/online_store.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/resources/css/slick.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/resources/css/slick-theme.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/jquery-3.7.0.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/slick.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/store_main.js"></script>
<body>
	<header>
		<jsp:include page="../inc/store_top.jsp"></jsp:include>
	</header>
	<main class="mainLayout">
		<div class="categoryMenuArea">
			<div class="categoryName"><h1>BEST</h1></div>
		</div>
		<div class="bestListArea">
			<c:forEach items="${bestList }" var="best" begin="0" end="9" varStatus="status">
				<div class="best${status.count} productBest">
					<a class="productClick" href="ProductDetail?proNum=${best.product_num}">
						<img src="${best.product_main_img_real_file}">
						<div class="bestCount">${status.count}</div>
						<strong>${best.product_name }</strong><br>
						<strong><span>${best.product_price }</span><span>원</span></strong>
<%-- 								<strong>${product.product_info }</strong> --%>
					</a>
				</div>
			</c:forEach>
		</div>
	</main>
	<footer id="footer">
		<jsp:include page="../inc/bottom.jsp"></jsp:include>
	</footer>
</body>
</html>











