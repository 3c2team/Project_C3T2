<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="./include/head.jsp"%>
<title>마이페이지-</title>
</head>
<body>
	<%@ include file="./include/body_top.jsp"%>

	<div class="mypageContents">
	<div class="text-center mt50 mb50">			
			<h2>
				고객님의 개인정보 보호를 위해<br> 비밀번호를 다시 한번 입력해 주세요.
			</h2>
			<input type="text" class="passwd" placeholder="비밀번호를 입력해 주세요"> <br>
			<input type="button" value="제출" class="submit" id="확인" onclick="location.href='mypage_reservation_change2'">
		</div>
	</div>
	<script type="text/javascript">
		function out2() {
			window.location.href = "mypage_reservation_change2.jsp";
		}
	</script>



	<%@ include file="./include/body_bottom.jsp"%>
</body>
</html>