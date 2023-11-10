/**
 * 
 */
 
 //상품 개별 삭제
function deleteCart(proNum) {
	
	let result = confirm("해당 상품을 삭제 하시겠습니까?");
	
	if(result){
        location.href="DeleteCartProduct?proNum=" + proNum;
//         location.href="CartPro?proNum=" + proNum;
    }else{
    	alert("삭제를 취소 하셨습니다.");
    }
}

// 관심 상품 등록
function favorite(favoriteProNum) {
	
// 	alert(favoriteProNum);
    location.href="MainCart?favoriteProNum=" + favoriteProNum;
//         location.href="CartPro?proNum=" + proNum;
  
//     alert("관심상품 등록이 완료 됐습니다.");
    
}


// 개별 상품 결제 페이지 이동
function orderPro(proNums){

	let result = confirm("결제창으로 이동 하시겠습니까?");
	
	if(result){
				
		location.href="PayPro?proNums=" + proNums;
	}
	
}

// 전체 상품 결제 페이지 이동
function AllPayProduct(sId) {
	
	let result = confirm("결제창으로 이동 하시겠습니까?")
	
	if(result){
// 		location.href="AllPayPro?sId=" + sId;
		location.href="PayPro?sId=" + sId;
	}
	
}