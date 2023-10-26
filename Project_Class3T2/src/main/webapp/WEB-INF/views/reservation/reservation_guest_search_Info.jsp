<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<html>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/top.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bottom.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/default.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/id_forgot.css">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="mainLayout">
		<header>
			<jsp:include page="../inc/top.jsp"></jsp:include>
		</header>
		<main>
			<h1>회원 상세정보</h1>
		<table border="1">
				<tr>
					<th>예약일자</th>
					<td>${reservation.reservation_date }${reservation.reservation_time }</td>
				</tr>
				<tr>
					<th>예약인원</th>
					<td>${reservation.reservation_person_count }</td>
				</tr>
				<tr>
					<th>이름</th>
					<td>${reservation.reservation_person_name }</td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td>${reservation.reservation_person_phone }</td>
				</tr>
<!-- 				<tr> -->
<!-- 					<th>E-Mail</th> -->
<%-- 					<td>${reservation.reservation_email1 }@${reservation.reservation_email2 }</td> --%>
<!-- 				</tr> -->
				<tr>
					<td colspan="2" align="center">
						<input type="button" value="돌아가기" onclick="history.back()">
						<input type="button" value="정보수정" onclick="location.href = 'MemberUpdateForm?id=${member.id}'">
						<%-- 
						일반 회원일 경우 회원탈퇴 버튼을 그대로 사용하고
						관리자일 경우 회원삭제 버튼을 표시하여 삭제할 회원의 아이디를 파라미터로 전달하여
						자바스크립트 confirmDelete() 함수 호출
						--%>
						<c:choose>
							<c:when test="${sessionScope.sId eq 'admin' }"> <%-- 관리자 --%>
								<input type="button" value="회원삭제" onclick="confirmDelete('${member.id }')">
							</c:when>
							<c:otherwise> <%-- 일반 회원 --%>
								<input type="button" value="회원탈퇴" onclick="location.href = 'MemberCheckoutForm'">
							</c:otherwise>
						</c:choose>
					</td>
				</tr>
			</table>
		</main>
		<footer id="footer">
			<jsp:include page="../inc/bottom.jsp"></jsp:include>
		</footer>
	</div>
</body>
</html>