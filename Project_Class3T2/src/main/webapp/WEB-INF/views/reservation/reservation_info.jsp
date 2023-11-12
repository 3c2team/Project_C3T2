<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
<!DOCTYPE html>
<html>
<link href="${pageContext.request.contextPath }/resources/css/top.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/resources/css/default.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/resources/css/buttom.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/reservation.css">
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/reservation.js"></script>
<head>
<meta charset="UTF-8">
<title>Jai Faim</title>
</head>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
<script>
function checkAgree(){
	var agreeBox = document.getElementById("agreeTerms"); // 체크박스를 불러온다
	var isChecked = agreeBox.checked; // 체크박스의 true false
	
	if(!isChecked){ //약관동의를 하지 않은 경우
		alert("약관에 동의하셔야 예약이 가능합니다.");
		return false; //페이지 이동시키지 않는다
	}
	location.href="ReservationForm";
}


</script>
<body>
	<div id="mainLayout">
		<header>
			<jsp:include page="../inc/top.jsp"></jsp:include>
		</header>
		<main>
			<form>
				<div class="info_table">
					<h2>&lt; 예약 안내 &gt;</h2><br>
					<h3>- 예약 신청을 위한 페이지로 예약 신청 후 직원이 확인하여 예약 확정 문자를 보내드립니다.</h3>
					<h3>- 온라인 예약은 이용시간 기준 1일 전까지 예약 가능합니다.</h3>
					<h3>- 좌석 배치는 사전 예약순에 따르며 특정 좌석 지정은 불가합니다.</h3>
					<h3>- 홈페이지 예약은 최대 8인 이하 테이블에 한하며 9인 이상 단체는 유선으로 문의 부탁드립니다.</h3>
					<h3>- 예약 취소 및 변경을 원하실 경우 최소 하루 전까지 온라인으로 예약 취소 후 다시 이용해주시기 바랍니다.</h3>
<!-- 					<input type="checkbox" name="agree" onClick="agreeCheck(this.form)">&nbsp;예약 안내 약관에 동의 하십니까?<br><br> -->
					<input type="checkbox" id="agreeTerms"> <label for="agreeTerms">위 약관에 동의 합니다.(필수)</label><br> <br>
					<input type="button" id="checkButton" value="예약하기" onclick="return checkAgree();">
<!-- 					<a href="ReservationForm" onclick="return checkAgree();"><button>회원가입 페이지로 이동</button></a> -->
				</div>
			</form>
		</main>
		<footer id="footer">
			<jsp:include page="../inc/bottom.jsp"></jsp:include>
		</footer>
	</div>
</body>
</html>