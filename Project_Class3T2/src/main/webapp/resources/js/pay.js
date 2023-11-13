
	//이메일 선택
	function siteSelect(emailChoice) {

		document.fr.mailUrl.value = emailChoice;

	}
	
	function checks() {
        var getMail = RegExp(/^[A-Za-z0-9_.-]+/);
        var getMailDomain = RegExp(/^[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+/);
//    	var getId= RegExp(/^[A-Za-z0-9]{4,16}$/);
//    	var getPw= RegExp(/^[A-Za-z0-9\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\"]{8,16}$/);
    	var getName= RegExp(/^[가-힣]+$/);
//    	var getPhone= RegExp(/^[0-9]{3}[-][0-9]{4}[-][0-9]{4}$/);


	// 아이디 공백 확인
//	if($("#member_id").val() == "") {
//		alert("아이디를 입력해주세요.");
//        $("#member_id").focus();
//        return false; 
//      }
           
           
	// 아이디 유효성검사
//	if(!getId.test($("#member_id").val())) {
//        alert("아이디는 영문소문자 또는 숫자 4~16자로 입력해 주세요.");
//        $("#member_id").val("");
//        $("#member_id").focus();
//        return false;
//      }

	// 비밀번호 공백 확인
//    if($("#member_passwd").val() == "") {
//		alert("비밀번호를 입력해주세요.");
//		$("#member_passwd").focus();
//        return false;
//      }
           

	// 아이디 비밀번호 같음 확인
//    if($("#member_id").val() == $("#member_passwd").val()) {
//        alert("아이디와 비밀번호가 같습니다");
//        $("#inputPassword").val("");
//        $("#inputPassword").focus();
//        return false;
//      }
      
      
	// 비밀번호 유효성검사
//    if(!getPw.test($("#member_passwd").val())) {
//        alert("비밀번호는 영문 대소문자/숫자/특수문자 중 2가지 이상 혼합해서 8자~16자로 입력해야 됩니다.");
//        $("#member_passwd").val("");
//        $("#member_passwd").focus();
//        return false;
//      }
           
	// 비밀번호 확인란 공백 확인
//    if($("#member_passwd2").val() == ""){
//        alert("비밀번호를 다시 입력해주세요.");
//        $("#member_passwd2").focus();
//        return false;
//      }
           
           
	// 비밀번호 확인
//    if($("#member_passwd").val() != $("#member_passwd2").val()){
//          alert("비밀번호가 다릅니다. 다시 입력해주세요.");
//          $("#member_passwd").val("");
//          $("#member_passwd2").val("");
//          $("#member_passwd").focus();
//          return false;
//      }
          
          
	// 이름 공백 검사
    if($("#receiver_name").val() == ""){
        alert("이름을 입력해주세요.");
        $("#receiver_name").focus();
        return false;
      }


	// 이름 유효성 검사
//    if(!getName.test($("#receiver_name").val())){
//        alert("이름은 한글만 입력 가능합니다.")
//        $("#receiver_name").val("");
//        $("#receiver_name").focus();
//        return false;
//      }
      
    // 주소 공백 확인
    if($("#addr1").val() == ""){
        alert("주소를 입력해주세요.");
        $("#addr1").focus();
        return false;
      }
      
  	if($("#addr2").val() == ""){
    	alert("상세주소를 입력해주세요.");
    	$("#addr2").focus();
    	return false;
  	}
      
      
	// 이메일 공백 확인
    if($("#eMail").val() == ""){
        alert("이메일을 입력해주세요.");
        $("#eMail").focus();
        return false;
      }
           
           
	// 이메일 유효성 검사
    if(!getMail.test($("#eMail").val())){
        alert("이메일 형식에 맞게 입력해주세요.")
        $("#eMail").val("");
        $("#eMail").focus();
        return false;
      }
      
	// 이메일 유효성 검사
    if(!getMailDomain.test($("#domainName").val())){
        alert("이메일 형식에 맞게 입력해주세요.")
        $("#domainName").val("");
        $("#domainName").focus();
        return false;
    }
    
	// 이메일 유효성 검사
//    if(!getPhone.test($("#member_phone_num").val())){
//        alert("전화번호 형식에 맞게 입력해주세요.")
//        $("#member_phone_num").val("");
//        $("#member_phone_num").focus();
//        return false;
//    }
};


