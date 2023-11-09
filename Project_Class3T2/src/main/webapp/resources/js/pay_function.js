 $(function() {
	
	// 체크박스 모두 선택 
    var product_num = [];
    $("#check_all").click(function() {
       
       if($("#check_all").is(":checked")) { // 전체선택 체크박스 체크 시
          // 체크박스 모두 체크
          $(":checkbox").prop("checked", true);
       } else { // 전체선택 체크박스 체크해제 시
          // 체크박스 모두 체크해제
          $(":checkbox").prop("checked", false);
       }
       
       //체크값 얻기
       var chk = $(this).is(":checked");
       console.log(chk);
       
       if($("input[name=checkbox]:checked").is(":checked")){
           $("input[name=checkbox]:checked").each(function() {
              product_num.push($(this).val());
           });
        }else{
        product_num = [];
           
        }
       
       //전체를 각 글앞의 체크에 일괄 전달
          //prop()을 통해서는 element가 가지는 실제적인 상태(활성화, 체크, 선택여부)를 제어하는 업무에 적절하고 
          //attr()는 속성값이나 정보를 조회하는 업무에 적절하다
       $(".checkbox").prop("checked",chk);
    });

    
    $(".checkbox").on("click",function(){
       if($(this).is(":checked")){
          product_num.push($(this).val());
          return;
       }
       for(let i = 0; i < product_num.length; i++){
          if(product_num[i] == $(this).val()){
             product_num.splice(i, 1);
             i--;
          }
       }
    });
    
    
    // 선택 상품 삭제 (ajax로 변경)
    $("#btnmemberdel").on("click",function(){
//        alert(product_num);

       if(product_num == ""){
	  	   	alert("선택하신 상품이 없습니다.")
       }else if(confirm("선택 상품을 삭제하시겠습니까?")){
//          location.href="PayPro?deleteProNum=" + product_num;
// 			alert("상품 번호 : " + product_num);
			location.href="ResultPay?deleteProNum=" + product_num;
			
// 			$.ajax({
// 				url:"PayProductDelete?deleteProNum=" + product_num,
// 				type:"POST",
// 				data:{product_num},
// 				success:function(result){
// 					console.log("접근 성공");
// 					console.log(result);
// 					location.href="ResultPay";
// 				},
// 				error:function(error){
// 					alert("삭제 실패")
// 				}
// 			});
       }else{
          	alert("삭제를 취소 하셨습니다.");
       }
    });
    
    // 포인트 사용 시
    $("#pointCheck").click(function() {
    	
		if($(this).is(":checked")){
			let memberPoint = $("#usePoint").val();
			let maxPoint = $("#pointCheck").val();
// 			alert(parseInt(memberPoint) + ", max : " + parseInt(maxPoint));
// 			console.log(typeof memberPoint <= typeof maxPoint)

			if(parseInt(memberPoint) <= parseInt(maxPoint)){
				$.ajax({
					type:"POST",
					url:"UsePoint",
					data:{memberPoint},
					success:function(result){
						console.log("포인트 넘어감");
						$("#checkedResult").text(result + "원");
					},
					error:function(){
						console.log("작업 실패")
					}
				});
			}else{
				alert("보유한 포인트만큼 사용 가능합니다.");
			}
	    }else{			
			$("#checkedResult").text($(".allPrice").val() + "원");
	    }
	});
 });