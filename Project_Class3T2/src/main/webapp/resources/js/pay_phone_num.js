// 전화번호 검증 이벤트
$(function() {
	$("#phone").on("blur", function() {
		let phone = $("#phone").val();
		let regex = /^(010|011|02|051)-[\d]{3,4}-[0-9]{4}$/;
		
		if(regex.exec(phone)) {
			$("#checkPhoneResult").html("사용 가능");
			$("#checkPhoneResult").css("color", "green");
		} else { // 정규표현식 패턴과 일치하지 않는 문자열 
			$("#checkPhoneResult").html("사용 불가능");
			$("#checkPhoneResult").css("color", "red");
		}
	});
});