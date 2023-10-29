<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<script>
	function logout() {
		// "로그아웃하시겠습니까?" 질문을 수행할 다이얼로그 표시
		let result = confirm("로그아웃하시겠습니까?");
		
		// 만약, result 값이 true 일 경우 "MemberLogout" 서블릿 주소 요청
		if(result) {
			location.href =  "${pageContext.request.contextPath}/"+"Logout";
		}
	}
</script>

<div class="mainLayout">

	<div class="accountArea">
		<c:choose>
			<c:when test="${empty sessionScope.sId }">
				<a href="${pageContext.request.contextPath}/ReservationSearch">비회원 예약 조회</a>&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="Login">Login</a>&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="JoinAgree">Join</a>
			</c:when>
			<c:otherwise>
		<%-- 아이디 클릭 - MemberInfo 서블릿 주소 요청 --%>
		<a href="${pageContext.request.contextPath}/mypage/MypageDashboard?id=${sessionScope.sId }">${sessionScope.sId }</a> 님&nbsp;&nbsp;&nbsp;&nbsp; 
		<a href="javascript:logout()">LogOut</a>
		<%-- 만약, 세션 아이디가 관리자("admin")일 경우 --%>
		<%-- 관리자페이지 클릭 - MemberAdminMain 서블릿 주소 요청 --%>
<%-- 		<c:if test="${sessionScope.sId eq 'admin' }"> --%>
<!-- 			| <a href="MemberAdminMain">관리자페이지</a> -->
<%-- 		</c:if> --%>
			</c:otherwise>
		</c:choose>
	</div>
	
	<div class="logoArea">
		<a class="logo" href="${pageContext.request.contextPath}/Main">J'ai Faim</a>
	</div>
	<div class="mainMenuArea">
		<div class="mainMenuAreaLeft">
			<div class="item"><a href="${pageContext.request.contextPath}/OnlineStore">ONLINE STORE</a></div>
			<div class="item"><a href="${pageContext.request.contextPath}/StoreBest">BEST</a></div>
			<div class="item"><a href="${pageContext.request.contextPath}/StoreHot">HOT</a></div>
			<div class="item"><a href="${pageContext.request.contextPath}/StoreNew">NEW</a></div>
			<div class="item"><a href="${pageContext.request.contextPath}/StoreKit">MEAL KIT</a></div>
<!-- 				<div class="mealKitSubmenu"> -->
<!-- 					<div class="mealKitItem"><a>All</a></div> -->
<!-- 					<div class="mealKitItem"><a>Steak</a></div> -->
<!-- 					<div class="mealKitItem"><a>Pasta</a></div> -->
<!-- 					<div class="mealKitItem"><a>Soup</a></div> -->
<!-- 					<div class="mealKitItem"><a>ets</a></div> -->
<!-- 				</div> -->
		</div>
		
<!-- 		<div class="mainMenuAreaRight"> -->
<!-- 			<a class="offlineReservation" href="Reservation">&nbsp;&nbsp;OFFLINE RESERVATION&nbsp;&nbsp;</a> -->
<!-- 		</div> -->
		
	</div>
</div>
