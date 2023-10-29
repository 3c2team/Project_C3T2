<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="./include/head.jsp"%>
<title>마이페이지-비밀번호 변경</title>
</head>
<body>

	<%@ include file="./include/body_top.jsp"%>

  
	<div class="mypageContents">
		<div class="text-center mt50 mb50">	
			<h2>
				고객님의 개인정보 보호를 위해<br> 비밀번호를 다시 한번 입력해 주세요.
			</h2>
			
			<input type="password" class="passwd"  id="passwd"	placeholder="비밀번호를 입력해 주세요"> <br>
			<input type="button" value="제출" class="submit" id="확인" onclick="mypageChckConfirm()">
		</div>
	</div>
	
	<input type="hidden" id="redirectURL" value="${redirectURL}" >
	
	<%@ include file="./include/body_bottom.jsp"%>
	
<script>
function mypageChckConfirm(){	
	var redirectURL=$("#redirectURL").val();
	if(!redirectURL){
		//redirectURL 값이 없으면  MypageDashboard 페이지로 이동
		location.href="MypageDashboard";
	}
	var passwd=$("#passwd").val();
	
	if(passwd==""){
		alert("비밀번호를 입력해 주세요.");
		$("#passwd").focus();
		return;
	}
	
	$.ajax({
		url:"CheckMypageConfirm",
		type:"post",
		data:{passwd},
		success:function(res){
			console.log(" success : ", res);
			if(res){
				location.href=redirectURL;				
				return;
			}
			$("#passwd").val("");
			alert("비밀번호가 일치하지 않습니다.");
			
		},
		error:function(err){
			console.error(" 에러 : ", err);
		}
	});
		
}
</script>	
	
	
	
</body>
</html>