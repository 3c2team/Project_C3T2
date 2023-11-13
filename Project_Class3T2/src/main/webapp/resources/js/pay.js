
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
    	var getPhone= RegExp(/^[0-9]{3}[-][0-9]{4}[-][0-9]{4}$/);
         
          
	// 이름 공백 검사
    if($("#member_name").val() == ""){
        alert("이름을 입력해주세요.");
        $("#member_name").focus();
        return false;
      }


	 // 이름 유효성 검사
    if(!getName.test($("#member_name").val())){
        alert("이름은 한글만 입력 가능합니다.")
        $("#member_name").val("");
        $("#member_name").focus();
        return false;
      }
      
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
  	
  	    // 전화번호 공백 확인
    if($("#phone").val() == ""){
        alert("전화번호를 입력해주세요.");
        $("#phone").focus();
        return false;
      }
    
	// 전화번호 유효성 검사
    if(!getPhone.test($("#phone").val())){
        alert("전화번호 형식에 맞게 입력해주세요.")
        $("#phone").val("");
        $("#phone").focus();
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
    

};


