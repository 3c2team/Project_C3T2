<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="./include/head.jsp"%>
<title>마이페이지-비밀번호 변경</title>
<style>
.passwd {
	display: block; /* input을 블록 요소로 변환 */
	margin-bottom: 10px; /* 아래쪽 간격 추가 */
}
</style>

</head>
<body>
	<%@ include file="./include/body_top.jsp"%>

	<div class="mypageContents">
		<div class="text-center mt50 mb50">	
			<h2>
				비밀번호를<br> 변경 하시렵니까?
			</h2>
			<input type="password" class="passwd" id="passwd"	style="margin: 0 auto;"	placeholder="비밀번호를 입력해 주세요">
			<br> 
			<input type="password" class="passwd" id="passwdConfirm"	style="margin: 0 auto;"  placeholder="비밀번호를 다시 입력해 주세요">
			<br>
			<input type="button" value="제출" class="submit" id="확인" onclick="passwordChange()">
		</div>
	</div>
	<script type="text/javascript">
		function passwordChange() {
		    var passwd = $("#passwd").val();
		    var passwdConfirm = $("#passwdConfirm").val();
	
		    // 정규 표현식
		    var regex = /^(?=.*[A-Za-z])(?=.*\d)|(?=.*[A-Za-z])(?=.*[@$!%*#?&])|(?=.*\d)(?=.*[@$!%*#?&]).{8,16}$/;
	
		    // 비밀번호 유효성 검사
		    if (!regex.test(passwd)) {
		        alert("비밀번호는 영문 대소문자/숫자/특수문자 중 2가지 이상 조합, 8자~16자로 설정해야 한다규.");
		        $("#passwd").focus();
		        return;
		    }
	
			if (passwd != passwdConfirm) {
				alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
				return;
			}
			
			
			$.ajax({
				url:"MypagePasswdChange",
				type:"post",
				data:{
					passwd
				},
				success:function(res){
					console.log(" success : ", res);
					if(res){
						alert("비밀번호 변경이 정상처리 되었습니다.")		
						window.location.href="MypageDashboard";
						return;
					}
					
				},
				error:function(err){
					console.error(" 에러 : ", err);
				}
			});
				
		}
		</script>

	<%@ include file="./include/body_bottom.jsp"%>
</body>
</html>