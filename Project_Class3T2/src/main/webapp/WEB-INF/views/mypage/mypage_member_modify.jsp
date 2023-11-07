<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="./include/head.jsp"%>
<title>마이페이지-회원수정</title>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.7.0.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
window.onload = function() {
	//주소 검색 버튼
	document.querySelector(".btnSearchAddress").onclick = function() {
		// 검색 버튼 클릭 시 새 창에서 주소검색 서비스가 실행(표시)됨
	    new daum.Postcode({
	        oncomplete: function(data) {
	            let address = data.address; // 기본 주소 저장
	            if(data.buildingName != '') { // 건물명이 있을 경우
	            	// 기본 주소에 건물명을 추가
	            	address += " (" + data.buildingName + ")";
	            }
	            
	            console.log("address : " +address);
	            $("#member_address1").val(address);
	            // 주소 표시
	            //document.myForm.address1.value = address;
	            
	            // 상세주소 항목으로 커서(포커스) 이동
	            //document.myForm.address2.focus();
	            $("#member_address2").focus();
	            
	        }
	    }).open();
	}
	
		
	document.querySelector("#emailDomain").onchange = function() {
		let domain = document.querySelector("#emailDomain").value;
		$("#email2").val(domain);
		
		if(domain == "") { // 직접입력 선택 시
			$("#email2").focus(); // 커서 요청
			$("#email2").attr("readOnly",false);
			$("#email2").css("background","");
		} else {
			$("#email2").attr("readOnly",true);
			$("#email2").css("background","lightgray");
	
		}
	}
} // window.onload 이벤트 끝

function searchAddress(){
	// 검색 버튼 클릭 시 새 창에서 주소검색 서비스가 실행(표시)됨
    new daum.Postcode({
        oncomplete: function(data) {
            let address = data.address; // 기본 주소 저장
            if(data.buildingName != '') { // 건물명이 있을 경우
            	// 기본 주소에 건물명을 추가
            	address += " (" + data.buildingName + ")";
            }
            
            console.log("address : " +address);
            $("#member_address1").val(address);
            // 주소 표시
            //document.myForm.address1.value = address;
            
            // 상세주소 항목으로 커서(포커스) 이동
            //document.myForm.address2.focus();
            $("#member_address2").focus();
            
        }
    }).open();
}
</script>
<style>
table{width:100%;}
table, th, td {
	border: none;
/* 	padding-top: 10px;
	padding-bottom: 30px;
	padding-left: 10px; /* 좌측 패딩 */
	/* padding-right: 50px;  *//* 우측 패딩 */		 
	border-collapse : collapse;
}
th, td {border: 1px solid #000;vertical-align : middle;height: 60px;}
input, select{height:30px;}
td{text-align: left; padding: 5px}
input[readonly]{background: #eee;}
#btnSearchAddress, button{cursor: pointer;}
</style>
</head>
<body>

	<%@ include file="./include/body_top.jsp"%>



	<div class="mypageContents">
		<div class="text-center mt50 mb50">
			
			<h1 class="mb20">회원수정</h1>
			<form id="myForm">
				<table border="1">
					<tr>
						<th>id</th>
						<td>
							<input type="text" name="member_id" id="member_id"  placeholder="4 ~ 8글자 사이 입력" size="20" value="${Member.member_id}" readonly>
							<br> <span id="checkIdResult1"></span>
						</td>
					</tr>
					<tr>
						<th>이름</th>
						<td>
							<input type="text" name="member_name" id="member_name"	placeholder="4 ~ 8글자 사이 입력" size="20" value="${Member.member_name}">
							<br> 
							<span id="checkIdResult1"></span>
						</td>
					</tr>
					<tr>
						<th>전화번호</th>
						<td>	
							<input type="text" name="member_phone_num" id="member_phone_num" 
							oninput="oninputPhone(this)" maxlength="14"
							placeholder="숫자만 입력" size="20" value="${Member.member_phone_num}">
							<br>
							<span id="checkIdResult1"></span>
						</td>
					</tr>
					<tr>
						<th>주소</th>
						<td>
							<input type="text" name="address1" id="member_address1" class="btnSearchAddress"	placeholder="기본주소" style="width: 400px;"
								value="${Member.member_address1}"
							 required size="25" onclick="searchAddress()" > 
							<input type="button" id="btnSearchAddress"  class="btnSearchAddress" value="주소검색"								
							 onclick="searchAddress()">
								<br> 
							<input type="text" name="address2"   id="member_address2" placeholder="상세주소"  style="width: 400px;"
								value="${Member.member_address2}"
								required="required" size="25">
					   </td>
					</tr>
				
					<tr>
						<th>E-Mail</th>
						<td>
						   <c:set value="${fn:split(Member.member_e_mail, '@') }" var="mail"  />	
						
							<input type="text" name="email1" id="email1"	 required="required" size="10" value="${mail[0]}" >@
							<input type="text" name="email2" id="email2" 	required="required" size="10" value="${mail[1]}"  >
							<select id="emailDomain" style="height: 35px">
								<option value="">직접입력</option>
								<option value="naver.com">naver.com</option>
								<option value="nate.com">nate.com</option>
								<option value="gmail.com">gmail.com</option>
							</select>
						</td>
					</tr>
					<tr>
						<td colspan="2" class="text-center">
							<button type="button" onclick="memberModify()">수정</button>
							<button type="reset" >초기화</button>
						</td>
					</tr>
				</table>
			</form>
			
				
		</div>
	</div>
	
<script>
function memberModify(){	
	// 입력 필드에서 값을 가져옴.
	var member_name=$("#member_name").val();
	var member_phone_num=$("#member_phone_num").val();
	var member_address1=$("#member_address1").val();
	var member_address2=$("#member_address2").val();
	var email1=$("#email1").val();
	var email2=$("#email2").val();

	console.log("member_name ", member_name);
	
	// 이름이 비어있는지 확인.
	if(member_name==""){
		alert("이름을 입력해 주세요.");
		$("#member_name").focus();
		return;
	}
	if(member_phone_num==""){
		alert("전화번호를 입력해 주세요.");
		$("#member_phone_num").focus();
		return;
	}
	
	if(member_address1==""){
		alert("주소를 입력해 주세요.");
		$("#member_address1").focus();
		return;
	}
	
	if(email1==""){
		alert("이메일을 입력해 주세요.");
		$("#email1").focus();
		return;
	}
	if(email2==""){
		alert("이메일을 입력해 주세요.");
		$("#email2").focus();
		return;
	}

	// 모든 검증을 통과하면, AJAX를 통해 서버에 데이터를 전송
	$.ajax({
		url:"MypageMemberModify",
		type:"post",
		data:{
			member_name,
			member_phone_num,
			member_address1,
			member_address2,
			member_email1:email1,
			member_email2:email2
			
		},
		success:function(res){	// 요청이 성공하면 실행될 함수
			console.log(" success : ", res);
			if(res=="success"){				
				alert("회원 수정 완료 됬습니다요");		
				window.location.href="MypageDashboard";	
				return;
				
			}else if(res=="error_member_phone_num"){
				alert("이미 사용중인 전화번호입니다.");					
				$("#member_phone_num").focus();	// 전화번호 입력 필드에 포커스를 맞춤.
				return;
			}else if(res=="error_member_e_mail"){
				alert("이미 사용중인 이메일입니다");
				$("#email1").focus();
				return;
			}	
			
			alert("회원 수정에 실패 하였습니다.");
			location.reload(); 	// 페이지를 새로고침
		},
		error:function(err){
		
			alert("회원 수정에 오류 입니다.");
			console.error(" 에러 : ", err);
		}
	});
		
}
//전화번호 입력 필드에 입력이 있을 때마다 실행되는 함수
function oninputPhone(target) {
	// 입력된 값을 숫자만 남기고 모두 제거한 후,
    // 특정 패턴에 맞게 하이픈(-)을 추가하여 전화번호 형식으로 만듦
    target.value = target.value
        .replace(/[^0-9]/g, '')		// 숫자가 아닌 문자를 제거
        .replace(/(^02.{0}|^01.{1}|[0-9]{3,4})([0-9]{3,4})([0-9]{4})/g, "$1-$2-$3");
}

</script>	



	<%@ include file="./include/body_bottom.jsp"%>
</body>
</html>