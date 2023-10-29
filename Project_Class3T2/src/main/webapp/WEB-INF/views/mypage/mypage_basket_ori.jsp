<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"   %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="./include/head.jsp"%>
<title>마이페이지-장바구니</title>
<style>
.container2 {
	position: relative;
	display: flex;
	flex-wrap: wrap; /* 이미지가 빨간 선을 넘으면 다음 줄로 내려갑니다. */
}
.container2 img {
	max-width: 30%; /* 이미지의 최대 가로 크기를 제한합니다. 선의 위치에 따라 조정이 필요합니다. */
	margin: 10px; /* 이미지 간 간격을 주기 위한 마진 */
}
.line {
	position: absolute;
	top: 0;
	bottom: 0;
	left: 100%; /* 빨간 선의 위치를 화면의 70% 지점에 놓습니다. */
	width: 1px; /* 선의 너비 */
	background-color: white;
	z-index: 100; /* 선을 이미지 위에 위치시킵니다. */
}
.item {
	display: inline-block;
	margin: 10px;
	vertical-align: top;
}
.item img {
	display: block;
	max-width: 100%;
}
.itemDesc {
	text-align: left;
	font-family: 'Noto Serif KR', serif;
	line-height: 0.3;
}

.itemDesc.bold {
	font-weight: bold;
}
</style>

</head>
<body>
	
	
	<c:import url="./include/body_top.jsp" />
	
	
	<div class="mypageContents">
		<div class="text-center mt50 mb50">		
			<h1>장바구니</h1>
		</div>
		<h2 class="mb100"> 총 ${cartList.size()}개 상품</h2>
		<div class="container2" align="center">
			<div class="line"></div>
			
		  <c:forEach items="${cartList}" var="item">
		  	<div class="item">
				<img src="${pageContext.request.contextPath }/${item.product_main_img_real_file}" width="200" height="200">
				<p class="itemDesc bold"><fmt:formatNumber value="${item.product_price}" /></p>
				<p class="itemDesc">${item.product_name}</p>
			</div>
		  </c:forEach>
          <c:if test="${empty cartList }">                        	
                       <h3 class="text-center mt50" style="width: 100%">장바구니 내역이 없습니다.</h3>
          </c:if>
		</div>
	</div>


	<%@ include file="./include/body_bottom.jsp"%>

</body>
</html>