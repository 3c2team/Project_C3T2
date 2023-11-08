<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="./include/head.jsp"%>
<title>마이페이지-회원 탈퇴</title>
<style>
.radio input {
	width: 20px;
	height: 20px;
	min-width: 20px;
	margin-right: 8px;
	font-size: 14px;
	color: #404040;
	-webkit-border-radius: 0;
	cursor: pointer;
}

li {
	list-style: none;
	outline: none;
}

.cancel {
	color: #fff;
	background: gray;
	height: 48px;
	font-size: 14px;
	flex: initial;
	width: 456px;
	cursor: pointer;
}

tr {
	height: 40px;
}

.grayBolder {
	margin: 20px;
	border-width: 8px;
	border-style: solid;
	border-color: #ededed;
}

.myAgree {
	width: 20px;
	height: 20px;
}

.grayBolder2 {
	border-style: solid;
	border-color: #ededed;
}

div[align="center"] {
	width: 50%; /* 원하는 폭 값으로 조절 */
	margin: auto; /* 중앙 정렬 */
	position: relative;
	top: 10%;
}
tr td{text-align: left;}
</style>
</head>
<body>
	<%@ include file="./include/body_top.jsp"%>


	<div class="mypageContents">

		<div class="text-center mt50 mb50">	
			<h1>회원 탈퇴</h1>
			<hr>
			<h2>회원탈퇴 사유 선택</h2>
			<table>
				<tr>
					<td>
						<label class="radio"> <input type="radio" name="membershipWithdrawal" value="result1"><span>아이디 변경을 위해 탈퇴 후 재가입</span>
						</label>
					</td>
					<td width="40px"></td>
					<td>
						<label class="radio"> <input type="radio" name="membershipWithdrawal" value="result2"><span>상품 가격 불만</span>
						</label>
					</td>
				</tr>
				<tr>
<!-- 					<td> -->
<!-- 						<label class="radio">  -->
<!-- 							<input type="radio" name="membershipWithdrawal"  value="3"><span>장기간 부재(군입대, 유학 등)</span> -->
<!-- 						</label> -->
<!-- 					</td> -->
					<td>
						<label class="radio"> <input type="radio" name="membershipWithdrawal"  value="result3"><span>교환/환불/반품 불만</span>
						</label>
					</td>
					<td></td>
					<td>
						<label class="radio"> 
							<input type="radio" name="membershipWithdrawal" value="result4"><span>개인정보 누출 우려</span>
						</label>
					</td>
				</tr>
				<tr>
					<td>
						<label class="radio"> <input type="radio" name="membershipWithdrawal" value="result5"><span>상품의 다양성/품질 불만</span>
						</label>
					</td>
					<td></td>
					<td>
						<label class="radio"> <input type="radio" name="membershipWithdrawal" value="result6"><span>배송 불만</span>
						</label>
					</td>
<!-- 					<td> -->
<!-- 						<label class="radio"> <input type="radio" name="membershipWithdrawal" value="6"><span>상품 가격 불만</span> -->
<!-- 						</label> -->
<!-- 					</td> -->
				</tr>
				<tr>
					<td></td>
				</tr>
			</table>
			<br>
			<hr class="grayBolder">
			<br>
			<br> <input type="checkbox" name="chk-terms" class="myAgree"> <span>회원 탈퇴 안내를 모두 확인하였으며 회원 탈퇴에 동의합니다.</span>
			<br>
			<br>
			<hr class="grayBolder2">
			<p>회원탈퇴를 하시면, 보유하고 계신 포인트 및 할인쿠폰은 자동 소멸되어 재가입하실 경우에도 복원되지 않습니다.</p> <br> 
			<input type="button" class="cancel" value="취소" onclick="location.href='MypageDashboard'"> 
			<input type="button" class="submit" value="확인" id="확인" onclick="goBackTwoSteps()">
				
		</div>
		
	</div>




	<%@ include file="./include/body_bottom.jsp"%>
	
<script>
// 회원 탈퇴 절차를 처리
function goBackTwoSteps(){	
	// 선택된 회원 탈퇴 사유의 값을 가져옴
	let membershipWithdrawal =$("input[name='membershipWithdrawal']:checked").val();
	// 만약 회원 탈퇴 사유가 선택되지 않았다면 경고창을 띄우고 함수를 종료
	if(!membershipWithdrawal){
		alert("회원탈퇴 사유을 선택해 주세요.");
		return;
	}
	
	// 회원 탈퇴에 동의 체크박스가 선택되지 않았다면 경고창을 띄우고 함수를 종료
	if(!$(".myAgree").is(":checked")){
		alert("회원 탈퇴에 동의를 선택해 주세요.");
		return;
	}
	// 선택된 회원 탈퇴 사유의 텍스트를 가져옴.
	let membershipWithdrawalText =$("input[name='membershipWithdrawal']:checked").parent(".radio").text();
	console.log(" membershipWithdrawal : ",membershipWithdrawal , membershipWithdrawalText);
	
	
	$.ajax({
		url:"MypageMemberOut",
		type:"post",
		data:{
			select_num:membershipWithdrawal,
			select_text:$.trim(membershipWithdrawalText),			
		},
		success:function(res){
			console.log(" success : ", res);
			if(res){
				alert("회원 탈퇴가 정상처리 되었습니다.\n자동으로 로그아웃 처리됩니다.")
				location.href = "${pageContext.request.contextPath}"+"/Logout";
				return;
			}
			
			alert("회원 탈퇴에 실패 하였습니다.");
			location.reload();
		},
		error:function(err){
			console.error(" 에러 : ", err);
		}
	});
		
}


</script>
	
</body>
</html>