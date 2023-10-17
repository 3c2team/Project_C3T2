<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>J'ai Faim</title>
</head>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/resources/css/top.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/resources/css/bottom.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/resources/css/default.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/resources/css/login_temp.css">
<body>
	<div id="mainLayout">
		<header>
			<jsp:include page="../inc/top.jsp"></jsp:include>
		</header>
	</div>
	<main>
		<div class="main">
			<p class="sign" align="center">로그인</p>
			<form action="${pageContext.request.contextPath }/resources/main.jsp" class="form1">
				<input class="user" type="text" style="align-content: center" placeholder="아이디">
				<input class="pass" type="password" style="align-content: center" placeholder="비밀번호">
				<p class="submit" align="center">로그인</p>
				<div class="aTag" align="center">
					<a href="join" class="join" style="align-content: center">회원가입</a>
					<a href="idForgot"  class="idForgot" style="align-content: center">아이디찾기</a>
					<a href="passForgot"  class="passForgot" style="align-content: center">비밀번호찾기</a>
				</div>
			</form>
	    </div>
	</main>
	<footer id="footer">
		<jsp:include page="../inc/bottom.jsp"></jsp:include>
	</footer>
</body>
</html>