<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
	function logout() {
		// "로그아웃하시겠습니까?" 질문을 수행할 다이얼로그 표시
		let result = confirm("로그아웃하시겠습니까?");
		
		// 만약, result 값이 true 일 경우 "MemberLogout" 서블릿 주소 요청
		if(result) {
			location.href = "${pageContext.request.contextPath}"+"/Logout";
		}
	}
</script>
<div class="accountArea">
<c:choose>
	<c:when test="${empty sessionScope.sId }">
		<a href="${pageContext.request.contextPath}/ReservationSearch">비회원 예약 조회</a>&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="${pageContext.request.contextPath}/Login">Login</a>&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="${pageContext.request.contextPath}/JoinAgree">Join</a>
	</c:when>
	<c:otherwise>
		<%-- 아이디 클릭 - MemberInfo 서블릿 주소 요청 --%>
		<a href="${pageContext.request.contextPath}/MypageDashboard?id=${sessionScope.sId }">${sessionScope.sName }</a> 님&nbsp;&nbsp;&nbsp;&nbsp; 
		<a href="javascript:logout()">LogOut</a>
		| &nbsp;&nbsp;<a href="MainCart?id=${sessionScope.sId }">장바구니</a>
		<%-- 만약, 세션 아이디가 관리자("admin")일 경우 --%>
		<%-- 관리자페이지 클릭 - MemberAdminMain 서블릿 주소 요청 --%>
<%-- 		<c:if test="${sessionScope.sId eq 'admin' }"> --%>
<!-- 			| <a href="MemberAdminMain">관리자페이지</a> -->
<%-- 		</c:if> --%>
	</c:otherwise>
</c:choose>
<!-- 	<a href="Login">Login</a>&nbsp;&nbsp;&nbsp;&nbsp; -->
<!-- 	<a href="JoinAgree">Join</a> -->
	
<!-- 	<a href="">ㅁㅁ님</a> -->
<!-- 	<a href="">Logout</a> -->
</div>
<div class="logoArea">
	<a class="logo" href="${pageContext.request.contextPath}/Main">J'ai Faim</a>
</div>
<div class="mainMenuArea">
	<ul>
		<li><a href="${pageContext.request.contextPath}/About">ABOUT</a></li>
		<li><a href="${pageContext.request.contextPath}/Menu">MENU</a></li>
		<li><a href="${pageContext.request.contextPath}/News">NEWS/EVENT</a></li>
		<li><a href="${pageContext.request.contextPath}/Location">LOCATION</a></li>
		<li><a href="${pageContext.request.contextPath}/ReservationInfo">RESERVATION</a></li>
		<li><a href="${pageContext.request.contextPath}/OnlineStore">ONLINE STORE</a></li>
	</ul>
</div>