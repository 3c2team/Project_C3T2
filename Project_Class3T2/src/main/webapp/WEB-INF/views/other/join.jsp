<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>J'ai Faim</title>
<!-- 공통 메소드들 정리해논 파일 -->
</head>
<script src="${pageContext.request.contextPath }/js/jquery-3.7.0.js"></script>
<link href="${pageContext.request.contextPath }/resources/css/join.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/top.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bottom.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/default.css">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
	window.onload = function() {
		
		// 1. 아이디 입력창 체크
		document.joinForm.id.onblur = function() {
			let id = document.joinForm.id.value;
			
			let msg = "";
			let color = "";
			
			if(id == "") {
				msg = "아이디 입력 필수!";
				color = " rgb(255, 111, 111)";
			} else if(id.length < 4 || id.length > 16) {
				msg = "4 ~ 16글자 필수!";
				color = "rgb(255, 111, 111)";
			} else {
				msg = "사용 가능한 아이디!";
				color = "rgb(72, 206, 21)";
			}
			document.querySelector("#checkIdResult1").innerHTML = msg;
			document.querySelector("#checkIdResult1").style.color = color;
		}
		
		// 2. 비밀번호 입력창 체크
		document.joinForm.passwd.onblur = function() {
			let passwd = document.joinForm.passwd.value;
			
			let msg = "";
			let color = "";
			
			if(passwd == "") {
				msg = "비밀번호 입력 필수!";
				color = "rgb(255, 111, 111)";
			} else if(passwd.length < 4 || passwd.length > 16) {
				msg = "4 ~ 16글자 필수!";
				color = "rgb(255, 111, 111)";
			} else {
				msg = "사용 가능한 비밀번호!";
				color = "rgb(72, 206, 21)";
			}
			
			// 텍스트와 글자색상 변수를 활용하여 상태 변경
			document.querySelector("#checkPasswdResult").innerHTML = msg;
			document.querySelector("#checkPasswdResult").style.color = color;
		}
		
		
		// 3. 비밀번호 확인 입력창 체크
		document.joinForm.passwd2.onblur = function() {
			let passwd = document.joinForm.passwd.value;
			let passwd2 = document.joinForm.passwd2.value;
			
			let msg = "";
			let color = "";
			
			if(passwd2 == "") {
				msg = "비밀번호 확인 입력 필수!";
				color = "rgb(255, 111, 111)";
			} else if(passwd != passwd2) {
				msg = "비밀번호 불일치!";
				color = "rgb(255, 111, 111)";
			} else {
				msg = "비밀번호 일치!";
				color = "rgb(72, 206, 21)";
			}
			
			// 텍스트와 글자색상 변수를 활용하여 상태 변경
			document.querySelector("#checkPasswd2Result").innerHTML = msg;
			document.querySelector("#checkPasswd2Result").style.color = color;
		}
		
		// 주소
		document.querySelector("#btnSearchAddress").onclick = function() {
			// 검색 버튼 클릭 시 새 창에서 주소검색 서비스가 실행(표시)됨
		    new daum.Postcode({
		        oncomplete: function(data) {
		            let address = data.address; // 기본 주소 저장
		            if(data.buildingName != '') { // 건물명이 있을 경우
		            	address += " (" + data.buildingName + ")";
		            }
		            // 주소 표시
		            document.joinForm.address1.value = address;
		            // 상세주소 항목으로 커서(포커스) 이동
		            document.joinForm.address2.focus();
		        }
		    }).open();
		}
		
		// 6. 셀렉트박스 선택 이벤트
		document.querySelector("#emailDomain").onchange = function() {
			// 셀렉트박스에서 선택된 항목 값을 email2 영역에 표시
			let domain = document.querySelector("#emailDomain").value;
			document.joinForm.email2.value = domain;
			
			// 만약, "직접 입력" 항목 선택 시 email2 영역에 커서 요청하고 입력 가능 상태로 변경하고
			// 아니면, email2 영역을 입력 불가능 상태로 변경
			if(domain == "") { // 직접입력 선택 시
				document.joinForm.email2.focus(); // 커서 요청
				document.joinForm.email2.readOnly = false; // 읽기 전용 해제
				document.joinForm.email2.style.background = ""; // 배경색 초기화
			} else {
				// readonly 속성을 true 로 변경(읽기 전용)
				// => 주의! 속성명이 단어의 조합일 경우 자바스크립트에서는 Camel-case 표기법 사용
				document.joinForm.email2.readOnly = true; // 읽기 전용으로 변경
				document.joinForm.email2.style.background = "lightgray";
			}
		}
	} // window.onload 이벤트 끝
	</script>
</head>
<body>
	<header>
		<!-- top.jsp 페이지를 현재 페이지에 삽입 -->
		<jsp:include page="../inc/top.jsp"></jsp:include>
	</header>
	<article>
		<p class="sign" align="center">회원가입</p>
		<%-- MemberJoinPro.me 서블릿 주소 요청 --%>
		<form action="MemberJoinPro.me" name="joinForm" method="post">
			<table>
				<tr>
					<th>이름</th>
					<td><input type="text" name="name" required size="20"></td>
				</tr>
				<tr>
					<th>ID</th>
					<td>
						<input type="text" name="id" placeholder="4 ~ 8글자 사이 입력" required size="20">
						<span id="checkIdResult1"></span>
					</td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td>
						<input type="password" name="passwd" placeholder="8 ~ 16글자 사이 입력" required size="20">
						<span id="checkPasswdResult"></span>
					</td>
				</tr>
				<tr>
					<th>비밀번호 확인</th>
					<td>
						<input type="password" name="passwd2" required size="20">
						<span id="checkPasswd2Result"></span>
					</td>
				</tr>
				<tr>
					<th>성별</th>
					<td>
						<div class="select">
    						<input type="radio" id="select" name="gender"><label for="select">남</label>
     						<input type="radio" id="select2" name="gender"><label for="select2">여</label>
						</div>
					</td>
				</tr>
				<tr>
					<th>주소</th>
					<td>
						<input type="text" name="address1" placeholder="기본주소" required size="25" onclick="searchAddress()">
						<input type="button" id="btnSearchAddress" value="주소검색" onclick="searchAddress()"><br>
						<input type="text" name="address2" placeholder="상세주소" required size="25">
					</td>
				</tr>
				<tr>
					<th>E-Mail</th>
					<td>
						<input type="text" name="email1" required size="10">&nbsp;@<input type="text" name="email2" required size="10">
						<select id="emailDomain">
							<option value="">직접입력</option>
							<option value="naver.com">naver.com</option>
							<option value="nate.com">nate.com</option>
							<option value="gmail.com">gmail.com</option>
							<option value="daum.net">daum.net</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>직업</th>
					<td>
						<select name="job">
							<option value="">항목을 선택하세요</option>
							<option value="개발자">개발자</option>
							<option value="DB엔지니어">DB엔지니어</option>
							<option value="아르바이트">아르바이트</option>
						</select>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center" >
						<input type="submit" value="가입">
						<input type="reset" value="초기화">
						<input type="button" value="돌아가기" onclick="">
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