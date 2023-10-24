<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/default.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/mypage.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/top.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bottom.css">
</head>
<body>
<header>
	<jsp:include page="../inc/top.jsp"></jsp:include>
</header>	
	<main>
	<div id="main_layout">
		<div class="mypageBox" id="mypage_dashboard">
			<span id="mypage_dashboard_info">
				<span id="col_1">
					<span>
						<jsp:include page="../inc/mypage_col_1.jsp" />
					</span>	
				</span>
				<span id="col_2">
					<ul>
						<jsp:include page="../inc/mypage_col_2.jsp" />
					</ul>
				</span>
			</span>
		</div>
		<div id="mypage_container">
			<div class="mypageBox" id="mypage_sideMenu">
				<nav class="menu">
					<jsp:include page="../inc/mypage_box.jsp" />
				</nav>
			</div>
			<div class ="mypageContents">
				<div align="center">
				<br><br>
				<h1>상품 구매 확인</h1><br>
				</div>
				<h2>기간 조회</h2>
<!-- 				<form action="MypageReservationCheck" method="Get"> -->
				    <table border="1">
				        <thead>
				            <tr>
				                <th>회원 번호</th>
				                <th>예약 날짜</th>
				                <th>수령 주소</th>
				                <th>수령자 이름</th>
				                <th>수령자 전화번호</th>
				                <th>요청 사항</th>
				                <th>제품 번호</th>
				            </tr>
				        </thead>
				        <tbody>
				            <c:forEach var="OrderList" items="${OrderList }">
				                <tr>
				                    <td>${OrderList.memberNum}</td>
				                    <td>${OrderList.orderDate}</td>
				                    <td>${OrderList.receiverAddress}</td>
				                    <td>${OrderList.receiverName}</td>
				                    <td>${OrderList.receiverPhone}</td>
				                    <td>${OrderList.receiver_request}</td>
				                    <td>${OrderList.product_num}</td>
				                </tr>
				            </c:forEach>
				        </tbody>
				    </table>
				    <input type="submit" value="예약 확인">
<!-- 				</form> -->
				<br><br>
			</div>
		</div>
	</div>
	</main>
<footer id="footer">
	<jsp:include page="../inc/bottom.jsp"></jsp:include>
</footer>
</body>
</html>