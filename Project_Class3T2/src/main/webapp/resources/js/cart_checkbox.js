$(function() {
	
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
    
    
    // 선택 상품 삭제
    $("#btnmemberdel").on("click",function(){
//        alert(product_num);
    	if(product_num == ""){
    		alert("선택한 상품이 없습니다.");
    	}else if(confirm("선택 상품을 삭제하시겠습니까?")){
           location.href="DeleteCartProduct?proNums=" + product_num;
       	}else{
          alert("삭제를 취소 하셨습니다.");
       	}
    });
    
    // 선택 상품 결제 페이지 이동
    $("#productClear").on("click", function() {
    	
    	if(product_num == ""){
    		alert("선택한 상품이 없습니다.");
    	}else if(confirm("결제창으로 이동 하시겠습니까?")){
//              location.href="SelectDeleteCart?proNum=" + product_num;
             location.href="PayPro?proNums=" + product_num;	
         }
//     	 else{
//             alert("삭제를 취소 하셨습니다.");
//          }
	});
        
    // 장바구니 비우기
    $("#productAllDelete").on("click", function() {
	// alert("장바구니를 비우시겠습니까?")

		if(confirm("장바구니를 비우시겠습니까?")){
	           location.href="productAllDelete";
	       }
	});
    
    // 선택상품 수량 변경
    $("#countChange").on("click", function() {
//     	alert("확인용");
		var productCount = $("#count").val();
		var productNumber = $("#productNumber").val();
		
		alert(productCount + ", " + productNumber);
		$.ajax({
			type:"POST",
			url:"CountChange",
			data:{
				productCount,
				productNumber
				},
			success:function(result){
				console.log("수량 변경 데이터 전송");
// 				$("#count").text(result);
				alert("수량 변경 완료");
				$("#resultPrice").text(result);
			}, error:function(){
				console.log("작업 실패");
			}
		});
	});
        
 });