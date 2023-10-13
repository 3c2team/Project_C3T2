<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.passwd {
	    display: block;  /* input을 블록 요소로 변환 */
	    margin-bottom: 10px;  /* 아래쪽 간격 추가 */
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
<!-- 		<div id="mypageContainer"> -->
			<div id="mypageContainer">
			<div class="mypageBox" id="mypageSideMenu">
				<nav class="menu">
					<jsp:include page="../inc/mypage_box.jsp" />
				</nav>
			</div>
			<div class ="mypageContents">
			<div align="center">
				<br>
				<br>
				<h2 >비밀번호<br>
				변경 하시렵니까?</h2>
				
				<input type="text" class="passwd" placeholder="비밀번호를 입력해 주세요">
				<input type="text" class="passwd" placeholder="비밀번호를 다시 입력해 주세요">
				<br><input type="button" value="제출" class="submit" id="확인" onclick="out2()">
			</div>
		</div>
		<script type="text/javascript">
		function out2() {
			alert("비밀번호 변경이 정상처리 되었습니다.")
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