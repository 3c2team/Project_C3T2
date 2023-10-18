$(function() {
	// 1. 아이디 입력창 체크
	$("#member_id").blur(function() {
		let id = $("#member_id").val();
		let msg = "";
		let color = "";
		
		if(id == "") {
			msg = "아이디 입력 필수!";
			color = "red";
		} else if(id.length < 4 || id.length > 8) {
			// 정규표현식을 활용한 아이디 입력값 검증
			msg = "4 ~ 8글자 필수!";
			color = "red";
		} else {
			// 아이디 중복 검사를 위한 AJAX 활용 요청
// 			else if(id == "admin") {
// 				msg = "사용 불가능한 아이디!";
// 				color = "red";
// 			} else {
// 				msg = "사용 가능한 아이디!";
// 				color = "green";
// 			}
		}
		
		// 텍스트와 글자색상 변수를 활용하여 상태 변경
		$("#checkIdResult1").html(msg);
		$("#checkIdResult1").css("color", color);
		
	});
	
	// 2. 비밀번호 입력창 체크
	$("#member_passwd").blur(function() {
		let passwd = $("#member_passwd").val();
		let msg = "";
		let color = "";
		
		if(passwd == "") {
			msg = "비밀번호 입력 필수!";
			color = "red";
		} else if(passwd.length < 4 || passwd.length > 16) {
			// 정규표현식을 활용한 패스워드 입력값 검증
			msg = "4 ~ 16글자 필수!";
			color = "red";
		} else {
			msg = "사용 가능한 비밀번호!";
			color = "green";
		}
		
		// 텍스트와 글자색상 변수를 활용하여 상태 변경
		$("#checkPasswdResult").html(msg);
		$("#checkPasswdResult").css("color", color);
	});
	
	// 3. 비밀번호 확인 입력창 체크
	$("#member_passwd2").blur(function() {
		let passwd = $("#member_passwd").val();
		let passwd2 = $("#member_passwd2").val();
		
		let msg = "";
		let color = "";
		
		if(passwd2 == "") {
			msg = "비밀번호 확인 입력 필수!";
			color = "red";
		} else if(passwd != passwd2) {
			msg = "비밀번호 불일치!";
			color = "red";
		} else {
			msg = "비밀번호 일치!";
			color = "green";
		}
		
		// 텍스트와 글자색상 변수를 활용하여 상태 변경
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
		// 검색 버튼 클릭 시 새 창에서 주소검색 서비스가 실행(표시)됨
	    new daum.Postcode({
	        oncomplete: function(data) {
	            let address = data.address; // 기본 주소 저장
	            if(data.buildingName != '') { // 건물명이 있을 경우
	            	// 기본 주소에 건물명을 추가
	            	address += " (" + data.buildingName + ")";
	            }
	            
	            // 주소 표시
	            $("#member_address1").val(address);
	            
	            // 상세주소 항목으로 커서(포커스) 이동
	            $("#member_address2").focus();
	        }
	    }).open();
	});
	
	// 6. 셀렉트박스 선택 이벤트
	$("#member_emailDomain").change(function() {
		// 셀렉트박스에서 선택된 항목 값을 email2 영역에 표시
		$("#member_email2").val($("#member_emailDomain").val());
		
		// 만약, "직접 입력" 항목 선택 시 email2 영역에 커서 요청하고 입력 가능 상태로 변경하고
		// 아니면, email2 영역을 입력 불가능 상태로 변경
		if($("#member_emailDomain").val() == "") { // 직접입력 선택 시
			$("#member_email2").focus(); // 커서 요청
			$("#member_email2").css("background", ""); // 배경색 초기화
// 				$("#email2").attr("readonly", false); // 읽기 전용 상태 해제
			$("#member_email2").removeAttr("readonly"); // 읽기 전용 속성 제거(결과 동일)
		} else {
			// readonly 속성을 true 로 변경(읽기 전용)
			$("#member_email2").css("background", "lightgray"); // 배경색 초기화
			$("#member_email2").attr("readonly", true); // 읽기 전용으로 변경
		}
	});
	
	// 7. 전체선택 체크박스 이벤트
	$("#check_all").click(function() {
		if($("#check_all").is(":checked")) { // 전체선택 체크박스 체크 시
			// 체크박스 모두 체크
			$(":checkbox").prop("checked", true);
		} else { // 전체선택 체크박스 체크해제 시
			// 체크박스 모두 체크해제
			$(":checkbox").prop("checked", false);
		}
	});
	
	
});