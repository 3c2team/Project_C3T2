<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>J'ai Faim</title>
<!-- 공통 메소드들 정리해논 파일 -->
</head>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/top.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bottom.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/default.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/join.css">
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.7.0.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/join.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
	<header>
	
		<!-- top.jsp 페이지를 현재 페이지에 삽입 -->
		<jsp:include page="../inc/top.jsp"></jsp:include>
	</header>
	<article>
		<p class="sign" align="center">회원가입</p>
		<%-- MemberJoinPro.me 서블릿 주소 요청 --%>
		<form action="JoinPro" name="joinForm" method="post" onsubmit="return checks()">
			<input type="hidden" name="c1" id="c1" value="${member.c1}">
			<input type="hidden" name="c2" id="c2" value="${member.c2}">
			<input type="hidden" name="c3" id="c3" value="${member.c3}">
			<input type="hidden" name="c4" id="c4" value="${member.c4}">
			<table style="margin-top: -9%">
				<tr>
					<th>이름</th>
					<td><input type="text" name="member_name" id="member_name" size="20"></td>
				</tr>
				<tr>
					<th>ID</th>
					<td>
						<input type="text" name="member_id" id="member_id" size="24">
						<br><span id="checkIdResult">영문소문자/숫자, 4~16자</span>
					</td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td>
						<input type="password" name="member_passwd" id="member_passwd" size="24">
						<br><span id="checkPasswdResult">영문 대소문자/숫자/특수문자 중 2가지 이상 조합, 8자~16자</span>
					</td>
				</tr>
				<tr>
					<th>비밀번호 확인</th>
					<td>
						<input type="password" name="member_passwd2" id="member_passwd2" size="24">
						<br><span id="checkPasswd2Result"></span>
					</td>
				</tr>
				<tr>
					<th>주소</th>
					<td>
						<input type="text" name="member_address1" id="member_address1" placeholder="기본주소" size="25">
						<input type="button" id="btnSearchAddress" value="주소검색"><br>
						<input type="text" name="member_address2" id="member_address2" placeholder="상세주소" size="25">
					</td>
				</tr>
				<tr>
					<th>E-Mail</th>
					<td>
						<input type="text" name="member_email1" id="member_email1" required size="10">&nbsp;@<input type="text" name="member_email2" id="member_email2" size="10">
						<select id="member_emailDomain">
							<option value="">직접입력</option>
							<option value="naver.com">naver.com</option>
							<option value="nate.com">nate.com</option>
							<option value="gmail.com">gmail.com</option>
							<option value="daum.net">daum.net</option>
						</select>
						<br><span style="color: gray;">인증번호를 이메일로 보내드리니 한번 더 확인 후 가입해주세요.</span>
					</td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td>
						<input type="text" name="member_phone_num" id="member_phone_num" size="20">
						<br><span id="checkPhoneResult">000-0000-0000</span>
					</td>
				</tr>
				<tr>
					<th>생일</th>
					<td><input type="date" name="member_birth" id="member_birth" size="20"></td>
				</tr>
				<tr>
					<th>성별</th>
					<td>
						<div class="select">
    						<input type="radio" id="select" name="member_gender" value="남"><label for="select">남</label>
     						<input type="radio" id="select2" name="member_gender" value="여"><label for="select2">여</label>
						</div>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center" >
						<!-- <button type="button" id="btnCheck" value="가입" onclick="checks()"> -->
<!-- 						<input type="button" id="btnTest" value="테스트"> -->
						<input type="submit" id="btnCheck" value="가입">
						<input type="reset" value="초기화">
<!-- 						<input type="button" value="돌아가기" onclick=""> -->
					</td>
				</tr>
			</table>
		</form>
	</article>
	<footer id="footer">
		<jsp:include page="../inc/bottom.jsp"></jsp:include>
	</footer>
</body>
</html>