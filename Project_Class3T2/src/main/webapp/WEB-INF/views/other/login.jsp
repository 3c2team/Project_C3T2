<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
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
			<form action="LoginPro" method="post" class="form1">
				<input class="user" type="text" name="member_id" id="id" value="${cookie.cookieId.value }" style="align-content: center" placeholder="아이디">
				<input class="pass" type="password" name="member_passwd" id="passwd"style="align-content: center" placeholder="비밀번호">
<!-- 				<p class="submit" id="btn_submit"align="center">로그인</p> -->
				<div class="privateCheck">
					<input type="checkbox" name="rememberId"
						<c:if test="${not empty cookie.cookieId.value }">
							checked="checked"
						</c:if>>
					<a>아이디 저장</a>
				</div>
				<div>
					<div class="roginArea">
						<div class="myLogin">
							<input type="submit" class="submit" id="btn_submit" value="로그인">
						</div>
						<div class="kakaoLogin">
							<a href="https://kauth.kakao.com/oauth/authorize?
										client_id=46389b0d2a4098beef5e03823cefb9a9
										&redirect_uri=http%3A%2F%2Flocalhost%3A8081%2Fc3t2%2Fkakao
										&response_type=code" id="kakaoLogin">
					            		Kakao 로그인
					        </a>
						</div>
					</div>
					<div class="aTag" align="center">
						<a href="JoinAgree" class="join" style="align-content: center">회원가입</a>
						<a href="IdForgot" class="idForgot" style="align-content: center">아이디찾기</a>
						<a href="PassForgot"  class="passForgot" style="align-content: center">비밀번호찾기</a>
					</div>
				</div>
			</form>
	    </div>
	</main>
	<footer id="footer">
		<jsp:include page="../inc/bottom.jsp"></jsp:include>
	</footer>
</body>
</html>