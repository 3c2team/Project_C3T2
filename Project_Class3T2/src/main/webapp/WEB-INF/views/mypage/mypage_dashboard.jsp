<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="./include/head.jsp"%>
<title>마이페이지-홈</title>
</head>
<body>

	<%@ include file="./include/body_top.jsp"%>




	<div class="mypageContents">
		<div class="text-center mt50 mb50">
			<br><br><br><br><br><br>
			<h2><a>${loginUser.member_name}님 환영합니다.</a></h2><br>
			<h2><a>저희 JaiFaim에 찾아주셔서 감사합니다.</a></h2><br>
			<h2><a>소중한 하루를 더욱 특별하게 만들어 드리겠습니다.</a></h2><br>
		</div>
	</div>


	<%@ include file="./include/body_bottom.jsp"%>
</body>
</html>