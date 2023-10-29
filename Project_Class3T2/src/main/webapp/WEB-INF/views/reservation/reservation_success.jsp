<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/top.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bottom.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/default.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/reservation.css">
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
			<div class="info_table">
				<h2>감사합니다. 예약이 정상적으로 완료되었습니다.</h2>
				<h3>비회원으로 예약하신 경우, 예약번호를 반드시 기입해두시기 바랍니다.</h3>
				<h3>(예약 확인 시 예약번호를 입력하셔야만 확인이 가능합니다.)</h3>
				<h2>예약번호: 랜덤번호</h2>
					<!--// 특정 난수 생성에 사용할 클래스 정의
					// => 단, 별도의 사용자 클래스 정의 없이도 RandomStringUtils 클래스 접근하여 사용 가능
					public class GenerateRandomCode {
					// 파라미터로 전달받은 난수 길이에 해당하는 난수 생성을 수행하는 getRandomCode() 메서드 정의
					// => 파라미터 : 난수 길이(정수)   리턴타입 : String
					// => 인스턴스 생성없이 즉시 접근 가능하도록 static 메서드로 선언
					// => RandomStringUtils 클래스 활용(commons-lang3 라이브러리 필요)
					public static String getRandomCode(int length) {
						// RandomStringUtils 클래스의 static 메서드 randomAlphanumeric() 메서드 활용
						// => 알파벳, 숫자 조합 난수 생성 가능
						return RandomStringUtils.randomAlphanumeric(length);
					} -->
				<input type="button" value="홈으로" onclick="location.href='./'">
				<input type="button" value="예약조회" onclick="location.href = 'ReservationSearch'">
			</div>
		</main>
		<footer id="footer">
			<jsp:include page="../inc/bottom.jsp"></jsp:include>
		</footer>
	</div>
</body>
</html>