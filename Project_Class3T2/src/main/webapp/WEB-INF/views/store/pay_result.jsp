<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>결제 완료</h1>
	
<%-- 	<c:forEach var="userOrderList" items="${userOrderList }"> --%>
	
<%-- 	</c:forEach> --%>

	<h3>${userOrderList }</h3>

	<h3><a href="./">메인 화면으로 가기</a></h3>
	<h3><a href="MypageDashboard">마이페이지로 가기</a></h3>
</body>
</html>