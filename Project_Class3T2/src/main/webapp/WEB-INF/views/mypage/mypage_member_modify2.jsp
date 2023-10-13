<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	window.onload = function() {
		
		document.querySelector("#emailDomain").onchange = function() {
			let domain = document.querySelector("#emailDomain").value;
			document.joinForm.email2.value = domain;
			
			if(domain == "") { // 직접입력 선택 시
				document.joinForm.email2.focus(); // 커서 요청
				document.joinForm.email2.readOnly = false; // 읽기 전용 해제
				document.joinForm.email2.style.background = ""; // 배경색 초기화
			} else {
				document.joinForm.email2.readOnly = true; // 읽기 전용으로 변경
				document.joinForm.email2.style.background = "lightgray";
			}
		}
	} // window.onload 이벤트 끝
</script>
<style>
	table, th, td {
	    border: none;
	    padding-top: 10px;     
    	padding-bottom: 30px;  
    	padding-left: 10px;     /* 좌측 패딩 */
   	 	padding-right: 50px;   /* 우측 패딩 */
	}
</style>
<link href="${pageContext.request.contextPath }/css/default.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/css/mypage.css" rel="stylesheet" type="text/css">
</head>
<header>
	<jsp:include page="../inc/top.jsp"></jsp:include>
</header>	
<body>
	<div id="main_layout">
		<div class="mypageBox" id="mypageDashBoard">
			<span id="mypage_dashboard_info">
				<span id="col-1">
					<span>
						<jsp:include page="../inc/mypage_col_1.jsp" />
					</span>	
				</span>
				<span id="col-2">
					<ul>
						<jsp:include page="../inc/mypage_col_2.jsp" />
					</ul>
				</span>
			</span>
		</div>
		<div id="mypageContainer">
			<div class="mypageBox" id="mypage_side_menu">
				<nav class="menu">
					<jsp:include page="../inc/mypage_box.jsp" />
				</nav>
			</div>
			<div class ="mypageContents">
			<div align="center">
			<br>
			<br>
			<h1>회원수정</h1>
			<br>
			<br>
				<form id="myForm">	
					<table border="1">
						<tr>
							<th>닉네임</th>
							<td>
								<input type="text" name="id" placeholder="4 ~ 8글자 사이 입력"size="20"><br>
								<span id="checkIdResult1"></span>
							</td>
						</tr>
						<tr>
							<th>전화번호</th>
							<td>
								<input type="text" name="id" placeholder="숫자만 입력"size="20"><br>
								<span id="checkIdResult1"></span>
							</td>
						</tr>
						<tr>
							<th>주소</th>
							<td>
								<input type="text" name="address1" placeholder="기본주소" readonly required size="25" onclick="searchAddress()">
								<input type="button" id="btnSearchAddress" value="주소검색" onclick="searchAddress()"><br>
								<input type="text" name="address2" placeholder="상세주소" size="25">
							</td>
						</tr>
						<tr>
							<th>E-Mail</th>
								<td>
									<input type="text" name="email1" required="required" size="10">@<input type="text" name="email2" required="required" size="10">
									<select id="emailDomain">
										<option value="">직접입력</option>
										<option value="naver.com">naver.com</option>
										<option value="nate.com">nate.com</option>
										<option value="gmail.com">gmail.com</option>
									</select>
								</td>
							</tr>
						<tr>
							<td colspan="2" align="center">
								<input type="submit" value="수정" onclick="out2()">
								<input type="reset" value="초기화">
							</td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	<script type="text/javascript">
	function out2() {
		alert("회원 수정 완료 됬습니다요")
		window.location.href="mypage_dashboard.jsp"
	}
	</script>
	</div>
</div>
</body>
<footer id="footer">
	<jsp:include page="../inc/bottom.jsp"></jsp:include>
</footer>
</html>