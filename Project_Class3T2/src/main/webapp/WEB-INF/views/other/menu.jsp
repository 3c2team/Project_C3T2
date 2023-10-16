<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>J'ai Faim</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/top.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/default.css">
<style type="text/css">
	 table{
	 	font-family: 'Sacramento', cursive;
	 	margin: 150px;
	 	margin-top: 100px;
	 }
	 td{
	 	font-size: 30px;
	 }
	 .categori{
	 	font-size: 25px;
	 	text-align: center;
		 margin-top: 40px;
	 }
	 .categori > a{
		 margin-left: 15px;
	 }
	 .bottom{
	 	background-color: #f8f8f8;
	 }
	 img {
	 	width: 600px;
	 	height: 550px;
	 	margin-left: 60px;
	 	margin-right: 60px;
	 }
</style>
</head>
<header>
	<jsp:include page="../inc/top.jsp"></jsp:include>
</header>
<body>
	<div class="categori">
		<a href="">pasta</a>
		<a href="">soup</a>
		<a href="">stake</a>
		<a href="">drink</a>
	</div>
	<table align="center">
		<tr>
			<td>
				<img src="./img/image1.jpg" >
				<!-- 메뉴 사진 실제에는 DB에 저장되어있는 사진을 꺼내오는 형식 -->
			</td>
			<td >
				MENU NAME<br><br>
				It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).
			</td>
		</tr>
		<tr>
			<td >
				MENU 한글<br><br>
				It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).
			</td>
			<td align="right">
				<img src="./img/image2.jpg" >
				<!-- 메뉴 사진 실제에는 DB에 저장되어있는 사진을 꺼내오는 형식 -->
			</td>
		</tr>
  	</table>
	<div class="bottom">
		<jsp:include page="../inc/bottom.jsp"></jsp:include>
	</div>
</body>
</html>