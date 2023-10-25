<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/top.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bottom.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/default.css">
<style>
main {
	font-size: 1.1em;
}

.left-box {
  float: left;
  width: 50%;
  text-align: center;
}

.left-box p {
	margin-left: 15%;
}
.right-box {
  float: right;
  width: 50%;
  text-align: center;
}

.right-box p{
	margin-right: 15%;
}
</style>
</head>
<body>
	<div id="mainLayout">
		<header>
			<jsp:include page="../inc/top.jsp"></jsp:include>
		</header>
		<main style="margin-top: 5%">
			<div class='left-box'>
				<p style="font-weight: bold; font-size: 1.5em">런치</p>
				<p style="margin-top: -3%; font-size: 1em">Lunch</p>
				<p>카나페</p>
				<p style="margin-top: -2%; font-size: 0.6em">Canape</p>
				<p>포테이토 크림 수프</p>
				<p style="margin-top: -2%; font-size: 0.6em">Potato Cream Soup</p>
				<p>가든 샐러드</p>
				<p style="margin-top: -2%; font-size: 0.6em">Garden Salad</p>
				<p>새우 버섯 파스타</p>
				<p style="margin-top: -2%; font-size: 0.6em">Shrimp Mushroom Pasta</p>
				<p>뉴욕 스테이크</p>
				<p style="margin-top: -2%; font-size: 0.6em">New York Steak</p>
				<p>화이트 와인을 곁들인 크렘 브륄레</p>
				<p style="margin-top: -2%; font-size: 0.6em">Creme Brulee with White Wine</p>
				<p>마카롱</p>
				<p style="margin-top: -2%; font-size: 0.6em">Macaroon</p>
			</div>
			<div class='right-box'>
				<p style="font-weight: bold; font-size: 1.5em">디너</p>
				<p style="margin-top: -3%; font-size: 1em">Dinner</p>
				<p>브루스케타</p>
				<p style="margin-top: -2%; font-size: 0.6em">Bruschetta</p>
				<p>당근 수프</p>
				<p style="margin-top: -2%; font-size: 0.6em">Carrot Soup</p>
				<p>베이크드 까망베르</p>
				<p style="margin-top: -2%; font-size: 0.6em">Baked Camembert</p>
				<p>레몬 갈릭 틸라피아</p>
				<p style="margin-top: -2%; font-size: 0.6em">Lemon Garlic Tilapia</p>
				<p>프로세코</p>
				<p style="margin-top: -2%; font-size: 0.6em">Prosecco</p>
				<p>리코타와 오레가노를 곁들인 양고기</p>
				<p style="margin-top: -2%; font-size: 0.6em">Lamb with Ricotta, Oregano</p>
				<p> 단 포트와인을 곁들인 초콜릿 케이크</p>
				<p style="margin-top: -2%; font-size: 0.6em">Chocolate Cake with Sweet Port Wine</p>
			</div>
		</main>
	</div>
	<footer id="footer">
		<jsp:include page="../inc/bottom.jsp"></jsp:include>
	</footer>
</body>
</html>