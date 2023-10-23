$(function() {
	// 1. 아이디 입력창 체크
	$("#member_id").blur(function() {
		let id = $("#member_id").val();
		let msg = "";
		let color = "";
		
		if(id == "") {
			msg = "아이디를 입력해 주세요.";
			color = "red";
		} else if(id.length < 6 || id.length > 12) {
			msg = "영문소문자/숫자, 6~12자";
			color = "red";
		}
		
		$("#checkIdResult1").html(msg);
		$("#checkIdResult1").css("color", color);
		
	});
	
    $("#checkId").click(function(){
    
        let member_id = $("#member_id").val();
         
        $.ajax({
            type:'post', //post 형식으로 controller 에 보내기위함!!
            url:"CheckId", // 컨트롤러로 가는 mapping 입력
            data: {"member_id":member_id}, // 원하는 값을 중복확인하기위해서  JSON 형태로 DATA 전송
            success: function(data){ 
                if(data == "N"){ // 만약 성공할시
                    result = "사용 가능한 아이디입니다.";
                    $("#checkIdResult1").html(result).css("color", "green");
                    $("#member_passwd").trigger("focus");
             }else{ // 만약 실패할시
                 result="이미 사용중인 아이디입니다.";
                     $("#checkIdResult1").html(result).css("color","red");
                     $("#member_id").val("").trigger("focus");
             }
         },
            error : function(error){alert(error);}
        });
    });    
	
	$("#member_passwd").blur(function() {
		let passwd = $("#member_passwd").val();
		let msg = "";
		let color = "";
		
		if(passwd == "") {
			msg = "비밀번호를 입력해 주세요.";
			color = "red";
		} else if(passwd.length < 8 || passwd.length > 16) {
			msg = "영문소문자/숫자, 8~16자";
			color = "red";
		} else {
			msg = "사용 가능합니다.";
			color = "green";
		}
		
		$("#checkPasswdResult").html(msg);
		$("#checkPasswdResult").css("color", color);
	});
	
	$("#member_passwd2").blur(function() {
		let passwd = $("#member_passwd").val();
		let passwd2 = $("#member_passwd2").val();
		
		let msg = "";
		let color = "";
		
		if(passwd2 == "") {
			msg = "비밀번호를 입력해주세요";
			color = "red";
		} else if(passwd != passwd2) {
			msg = "비밀번호가 일치하지 않습니다.";
			color = "red";
		} else {
			msg = "비밀번호가 일치합니다.";
			color = "green";
		}
		
		$("#checkPasswd2Result").html(msg);
		$("#checkPasswd2Result").css("color", color);
	});
	
//	// 4. 주민번호 입력창 체크
//	// => 주민번호가 입력될 때마다(= 키를 눌렀다 뗄 때마다) 이벤트 처리 - onkeyup
//	$("#member_jumin1").keyup(function() {
//		// 입력받은 주민번호 앞자리 길이가 6일 경우 뒷자리 입력창으로 커서 요청
//		if($("#member_jumin1").val().length == 6) {
//			$("#member_jumin2").focus();
//		}
//	})
	
//	$("#member_jumin2").keyup(function() {
//		// 입력받은 주민번호 뒷자리 길이가 7일 경우 뒷자리 입력창에서 커서 해제
//		if($("#member_jumin2").val().length == 7) {
//			$("#member_jumin2").blur();
//		}
//	});
	
	// 5. 주소 검색 버튼
	$("#btnSearchAddress").click(function() {
	    new daum.Postcode({
	        oncomplete: function(data) {
	            let address = data.address; // 기본 주소 저장
	            if(data.buildingName != '') { // 건물명이 있을 경우
	            	address += " (" + data.buildingName + ")";
	            }
	            
	            $("#member_address1").val(address);
	            
	            $("#member_address2").focus();
	        }
	    }).open();
	});
	
	$("#member_emailDomain").change(function() {
		$("#member_email2").val($("#member_emailDomain").val());
		
		if($("#member_emailDomain").val() == "") { // 직접입력 선택 시
			$("#member_email2").focus(); // 커서 요청
			$("#member_email2").css("background", ""); // 배경색 초기화
			$("#member_email2").removeAttr("readonly"); // 읽기 전용 속성 제거(결과 동일)
		} else {
			$("#member_email2").css("background", "lightgray"); // 배경색 초기화
			$("#member_email2").attr("readonly", true); // 읽기 전용으로 변경
		}
	});
	
	$("#check_all").click(function() {
		if($("#check_all").is(":checked")) { // 전체선택 체크박스 체크 시
			$(":checkbox").prop("checked", true);
			$(":checkbox").prop("checked", false);
		}
	});
	
	
});