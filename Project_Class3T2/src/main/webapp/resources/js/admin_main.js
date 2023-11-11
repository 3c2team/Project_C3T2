$(function() {
	$("#btn_change").on("click",function(){
		$("#change").html("<input type='submit'style=' width: 90%' value='변경 완료' class='custom_input btn btn-primary'>")
		$("select").attr("disabled",false);
		$(".custom_input").not(".custom_not").attr("readonly",false);
		$(".custom_input").not(".custom_not").attr("disabled",false);
	});
	$(".custom_open").on("change",function(){
		$("#open").val($(this).val());
	});
	$(".custom_close").on("change",function(){
		$("#close").val($(this).val());
	});
	$("#new_restaurang").on("click",function(){
		$("#change").html("<input type='submit' id='submit_change' style=' width: 90%' value='등록 완료' class='custom_not custom_input btn btn-primary'>")
		$("select").attr("disabled",false);
		$(".custom_input").not(".custom_not").attr("readonly",false);
		$(".custom_input").not(".custom_not").attr("disabled",false);	
		$(".custom_input").not(".custom_not").val("");
		$("#result").hide();
		$("#append_id").after(
				"<tr>"
				+	"<th>관리자 아이디</th>"
				+	"<th>"
				+		"<input type='text' required name='admin_id' aria-label='Disabled input example' class='custom_input form-control-sm form-control'>"
				+	"</th>"
				+"<tr>"
				+"<tr>"
				+	"<th>관리자 비밀번호</th>"
				+	"<th>"
				+		"<input type='password' required id='pass' name='admin_passwd' aria-label='Disabled input example' class='custom_input form-control-sm form-control'>"
				+	"</th>"
				+"<tr>"
				+	"<th>비밀번호 확인</th>"
				+	"<th>"
				+		"<input type='password' required id='pass2' onkeyup='success_passwd()'name='admin_passwd' aria-label='Disabled input example' class='custom_input form-control-sm form-control'>"
				+		"<span  id='success_passwd'></span>"
				+	"</th>"
				+"<tr>"
				+"<tr>"
				+	"<th>관리자 닉네임</th>"
				+	"<th>"
				+		"<input type='text' required name='admin_name' aria-label='Disabled input example' class='custom_input form-control-sm form-control'>"
				+	"</th>"
				+"<tr>"
				+"<tr>"
				+	"<th>사업자 번호</th>"
				+	"<th>"
				+		"<input type='number' required name='admin_business_num' aria-label='Disabled input example' class='custom_input form-control-sm form-control'>"
				+	"</th>"
				+"<tr>"
		);
	});
});
function onSubmit() {
	let submit = $("#submit_change").val()
	if($("#submit").val() == submit){
		if(confirm("변경하시겠습니까?")){
			$(".custom_not").attr("disabled",false);
			return true;
		}
		return false;
	}
	
	if(confirm("등록하시겠습니까?")){
		if($("#pass").val()==$("#pass2").val()){
			$(".custom_not").attr("disabled",false);
			return true;
		}
		alert("비밀번호가 일치하여야 합니다.");
	}
	return false;
}
function success_passwd() {
	if($("#pass").val() == $("#pass2").val()){
		$("#success_passwd").html("<p class='text-success'>일치!</p>");
	}else{
		$("#success_passwd").html("<p class='text-danger'>불일치!</p>");
	}
}
