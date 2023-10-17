<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/resources/css/default.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/resources/css/mypage.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/resources/css/top.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/resources/css/bottom.css">
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
			window.location.href = "mypage_reservation_change2.jsp";
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