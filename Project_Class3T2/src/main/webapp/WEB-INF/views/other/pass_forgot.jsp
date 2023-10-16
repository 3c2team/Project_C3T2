<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>J'ai Faim</title>
</head>
<link href="${pageContext.request.contextPath }/resources/css/pass_forgot.css" rel="stylesheet" type="text/css">
<body>
	<div id="mainLayout">
		<header>
			<jsp:include page="../inc/top.jsp"></jsp:include>
		</header>
	
	</div>
	<main>
	<div class="main">
		<p class="sign" align="center">비밀번호 찾기</p>
		<form class="form1">
			<input class="user" type="text" align="center" placeholder="아이디">
			<input class="phone" type="text" align="center" placeholder="전화번호">
			<p class="submit" align="center">전화번호 인증</p>
			<a href="${pageContext.request.contextPath }/join.jsp" class="join" align="center">회원가입</a>
			<a href="${pageContext.request.contextPath }/id_forgot.jsp"  class="idForgot" align="center">아이디찾기</a>
		</form>
    </div>
	</main>
	<footer id="footer">
		<jsp:include page="../inc/bottom.jsp"></jsp:include>
	</footer>
	
</body>
</html>