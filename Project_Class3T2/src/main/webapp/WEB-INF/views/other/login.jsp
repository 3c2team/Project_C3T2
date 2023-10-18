<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>J'ai Faim</title>
</head>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/top.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bottom.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/default.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/login_temp.css">
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.7.0.js"></script>
<script type="text/javascript">
// 	$(function() {
// 		$("#btn_submit").on("click",function(){
// 			let id = $("#id").val();
// 			let passwd = $("#passwd").val();
// 			if(id =="admin" && passwd == "1234"){
// 				location.href="adminLogin";
// 			}else{
// 				location.href="./";
// 			}
// 		});
// 	});
</script>
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
				<input class="user" type="text" id="id" style="align-content: center" placeholder="아이디">
				<input class="pass" type="password" id="passwd"style="align-content: center" placeholder="비밀번호">
				<p class="submit" id="btn_submit"align="center">로그인</p>
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