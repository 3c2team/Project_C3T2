$(function() {
	// 1. 아이디 입력창 체크
	$("#member_id").blur(function() {
			let id = $("#member_id").val();
			let regex = /^[A-Za-z0-9]{4,16}$/;
			
			if(id == "") {
				$("#checkIdResult").html("아이디를 입력해주세요.");
				$("#checkIdResult").css("color", "red");
			} else {
				if(!regex.exec(id)) { // 아이디 입력값 검증 실패 시 
					$("#checkIdResult").html("아이디는 영문소문자 또는 숫자 4~16자로 입력해 주세요.");
					$("#checkIdResult").css("color", "red");
				} else { // 아이디 입력값 검증 성공 시 
					$.ajax({
						url: "MemberCheckDupId",
						data: {
							id: id
						},
						success: function(result) {
							if($.trim(result) == "true") { // 아이디 중복
								$("#checkIdResult").html("이미 사용중인 아이디입니다.");
								$("#checkIdResult").css("color", "red");
							} else {
								$("#checkIdResult").html(id + "는 사용 가능한 아이디입니다.");
								$("#checkIdResult").css("color", "gray");
							}
						}
					});
				}
			}
		});
	
	$("#member_passwd").blur(function() {
			let passwd = $("#member_passwd").val();
			let msg = "";
			let color = "";
			let lengthRegex = /^[A-Za-z0-9\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\"]{8,16}$/;
				
			if(passwd == "") { // 비밀번호 미입력
				msg = "비밀번호를 입력해주세요.";
				color = "red";
			} else if(!lengthRegex.exec(passwd)) { // 비밀번호 길이 체크 위반
				msg = "영문 대소문자/숫자/특수문자 중 2가지 이상 조합, 8자~16자";
				color = "red";
			} else {
				let engUpperRegex = /[A-Z]/;
				let engLowerRegex = /[a-z]/;
				let numbRegex = /[\d]/;
				let specRegex = /[\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\"]/;
				
				let count = 0;
				
				if(engUpperRegex.exec(passwd)) count++; // 대문자가 포함되어 있을 경우
				if(engLowerRegex.exec(passwd)) count++; // 소문자가 포함되어 있을 경우
				if(numbRegex.exec(passwd)) count++; // 숫자가 포함되어 있을 경우
				if(specRegex.exec(passwd)) count++; // 특수문자가 포함되어 있을 경우
				
				// 복잡도 검사 결과 판별
				// 4점 : 안전, 3점 : 보통, 2점 : 위험, 1점 이하 : 사용 불가능한 패스워드!
				switch(count) {
					case 4 : 
						msg = "위험도가 낮은 비밀번호입니다.";
						color = "gray";
						break;
					case 3 :
						msg = "위험도가 보통인 비밀번호입니다.";
						color = "orange";
						break;
					case 2 :
						msg = "위험도가 높은 비밀번호입니다.";
						color = "red";
						break;
					case 1 :
					case 0 :
						msg = "영문 대소문자/숫자/특수문자 중 2가지 이상 조합, 8자~16자";
						color = "red";
				}
			}
			// 텍스트와 글자색상 변수를 활용하여 상태 변경
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
			color = "gray";
		}
		
		$("#checkPasswd2Result").html(msg);
		$("#checkPasswd2Result").css("color", color);
	});
	
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
	
	$("#member_phone_num").blur(function() {
			let phone_num = $("#member_phone_num").val();
			let msg = "";
			let color = "";
			let lengthRegex = /^[0-9]{3}[-][0-9]{4}[-][0-9]{4}$/;
				
			if(phone_num == "") {
				msg = "전화번호를 입력해주세요.";
				color = "red";
			} else if(!lengthRegex.exec(phone_num)) {
				msg = "000-0000-0000형식으로 작성해주세요.";
				color = "red";
			} else { // 아이디 입력값 검증 성공 시 
				$.ajax({
					url: "MemberCheckDupPhone",
					data: {
						phone_num: phone_num
					},
					success: function(result) {
						if($.trim(result) == "true") {
							$("#checkPhoneResult").html("이미 사용중인 전화번호입니다.");
							$("#checkPhoneResult").css("color", "red");
						} else {
							$("#checkPhoneResult").html(phone_num + "는 사용 가능한 전화번호입니다.");
							$("#checkPhoneResult").css("color", "gray");
						}
					}
				});
			}
			// 텍스트와 글자색상 변수를 활용하여 상태 변경
			$("#checkPhoneResult").html(msg);
			$("#checkPhoneResult").css("color", color);
		});
	
	$("#check_all").click(function() {
		if($("#check_all").is(":checked")) { // 전체선택 체크박스 체크 시
			$(":checkbox").prop("checked", true);
			$(":checkbox").prop("checked", false);
		}
	});
	
	
});