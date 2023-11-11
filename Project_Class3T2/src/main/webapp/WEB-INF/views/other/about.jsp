<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>J'ai Faim</title>
</head>
<link href="${pageContext.request.contextPath }/resources/css/top.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/resources/css/default.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/resources/css/buttom.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/resources/css/about.css" rel="stylesheet" type="text/css">
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.7.0.js"></script>
<body>
	<div id="aboutLayout">
		<header>
			<jsp:include page="../inc/top.jsp"></jsp:include>
		</header>
	</div>
	<main>
	     <img src="./resources/main_img/about.jpg" style="max-width: 100%; height: auto;">
	     <img src="./resources/main_img/about2.jpg" style="max-width: 100%; height: auto;">
	</main>
	<footer id="footer">
		<jsp:include page="../inc/bottom.jsp"></jsp:include>
	</footer>
</body>
</html>