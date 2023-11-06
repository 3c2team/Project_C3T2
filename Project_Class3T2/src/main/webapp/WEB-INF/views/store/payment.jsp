<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<script type="text/javascript">
//카카오페이 연동
function requestPay() {
	IMP.init('imp68757643'); // 객체 초기화. 가맹점 식별코드 전달

	IMP.request_pay({
    	pg: "kakaopay.TC0ONETIME",
    	pay_method: "card",
    	merchant_uid: "ORD" + getDateTimeString(),   // 주문번호
    	name: "${productPayList}",
    	amount: 1000,                         // 숫자 타입
    	buyer_email: "${Member.member_e_mail}",
    	buyer_name: "${Member.member_name}",
    	buyer_tel: "${Member.member_phone_num}",
    	buyer_addr: "${Member.member_address}",
    	buyer_postcode: "01181"
    }, function (rsp) { // callback
     	if(rsp.success) { // 결제 성공 시
 			console.log("rsp.imp_uid : " + rsp.imp_uid);
 			console.log("rsp.merchant_uid : " + rsp.merchant_uid);
 			console.log('${Member.member_name}');
 			location.href = "PaymentResult";
     	}
    });
}

// 현재 날짜 정보를 "yyyyMMdd" 형식의 문자열로 리턴하는 함수 정의
function getDateTimeString() {
	let now = new Date();
	// getFullYear() : 연도, getMonth() : 월(+1 필요), getDate() : 일 
	// => 문자열 결합(20231101)
	// => 단, 월과 일의 경우 1자리 일 때 앞자리 0 추가 필요
	let dateTime = "" + now.getFullYear() 
					+ (now.getMonth() + 1 < 10 ? "0" + (now.getMonth() + 1) : now.getMonth() + 1) 
					+ (now.getDate() < 10 ?  "0" + now.getDate() : now.getDate())
					+ (now.getHours() < 10 ?  "0" + now.getHours() : now.getHours())
					+ (now.getMinutes() < 10 ?  "0" + now.getMinutes() : now.getMinutes())
					+ (now.getSeconds() < 10 ?  "0" + now.getSeconds() : now.getSeconds())
					;
	console.log(dateTime); // 20231101172821
	return dateTime;
}
 
</script>
</head>
<body>
	<h1>payment</h1>
	
	<h1>${productPayList}</h1>
	
	<input type="button" value="결제하기" onclick="requestPay()">
	
</body>
</html>