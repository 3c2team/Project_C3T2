
	//주소 검색
//	function search_address_window() {
//		// 검색 버튼 클릭 시 새 창에서 주소검색 서비스가 실행(표시)됨
//	    new daum.Postcode({
//	        oncomplete: function(data) {
//	            
//	            let address = data.address;
//	            if(data.buildingName != ''){
//	            	address += " (" + data.buildingName + ")"
//	            }
//		
//				document.fr.address1.value = address;
//				
//				document.fr.address2.focus();
//	        }
//	    }).open();		
//		
//	}

	//이메일 선택
	function siteSelect(emailChoice) {

		document.fr.mailUrl.value = emailChoice;

	}


