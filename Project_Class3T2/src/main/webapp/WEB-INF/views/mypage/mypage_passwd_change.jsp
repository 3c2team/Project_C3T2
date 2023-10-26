<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
					<br><br><br>
					<br>
					<h2 >고객님의 개인정보 보호를 위해<br>
					비밀번호를 다시 한번 입력해 주세요.</h2>
					<input type="text" class="passwd" placeholder="비밀번호를 입력해 주세요">
					<br><input type="button" value="제출" class="submit" id="확인" onclick="out2()">
				</div>
			</div>
		<script type="text/javascript">
		function out2() {
			var member_id = "ceh0218"
			var member_passwd = document.querySelector(".passwd").value;
			
			// AJAX를 사용하여 비밀번호 검증 요청
			$.post("/MypagePasswdChange", {member_id: member_id, member_passwd:member_passwd}, function(response) {
				if(response === "Success") {
					window.location.href = "mypage_member_modify2.jsp";
				} else {
					alert("비밀번호 일치하지 않습니다");
				}
			});
		}
		</script>
		</div>
	</div>
	</main>
<footer id="footer">
	<jsp:include page="../inc/bottom.jsp"></jsp:include>
</footer>
</body>
</html>