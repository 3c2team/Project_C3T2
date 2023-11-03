<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html>
<html>
<link href="${pageContext.request.contextPath }/resources/css/pay.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/resources/css/store_top.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/resources/css/default.css" rel="stylesheet" type="text/css">

<head>
<meta charset="UTF-8">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.7.0.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/pay.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/pay_phone_num.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
<title>상품결제</title>
<script type="text/javascript">
$(function() {
	
	// 배송정보 라디오버튼 선택
	
	$("input[name=memberInfo]:checked").focus();
	
    $("input[name=memberInfo]").change(function(){
	   if($("input[name=memberInfo]:checked").val()==1){
		   
		   $("#member_name").val("${Member.member_name}");
		   $("#phone").val("${Member.member_phone_num}");
		   $("#addr1").val("${Member.member_address1}");
		   $("#addr2").val("${Member.member_address2}");
		   $("#eMail").val("${sessionScope.Email1 }");
		   $("#domainName").val("${sessionScope.Email2}");
		   
// 		   alert(member_name);
		   
// 	         var proNums = $(".result_num").val();
// 	         location.href="PayPro?proNums=" + proNums;
// 	         $("#memberName").text(결과값);
			 
	   }else{
	         $("input[type=text]").val("");
	   }
    });
      	
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
			
			$.ajax({
				url:"DeletePayProduct?proNums=" + product_num,
				type:"GET",
				data:{product_num},
				success:function(result){
					location.href="PayPro";
				},
				error:function(error){
					alert("삭제 실패")
				}
				
				
			});

       }else{
          	alert("삭제를 취소 하셨습니다.");
       }
    
    
    });
    
    $("#pointCheck").click(function() {
		
		if($(this).is(":checked")){
			
			let memberPoint = $("#pointCheck").val();
// 			alert(memberPoint);
			
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
			$("#checkedResult").text($(".allPrice").val() + "원");
	    }
		
		
	});
           
        
 });
 
// function setDisplay(){
    
// 	if($("input:radio[id=member1]").is(":checked")){
//         $("#resultArea2").hide();
//         $("#resultArea1").show();
//         $("#member1").prop("checked", true);
//         $("#member2").prop("checked", false);
//     }else if($('input:radio[id=member2]').is(':checked')){
//     	$("#resultArea1").hide();
//         $("#resultArea2").show();
//         $("#member2").prop("checked", true);  
//         $("#member1").prop("checked", false);  
//     }
// }


// function setDisplay(){
//     if($('input:radio[id=member1]').is(':checked')){
//         $('#divId').hide();
//     }else{
//         $('#divId').show();
//     }
// }


</script>

</head>

<body>
	
	<form name="fr">
		<div id="frame">
		<header>
					<jsp:include page="../inc/store_top.jsp"></jsp:include>
		</header>
		
			<div >
				<span style="font-size: 16pt; font-weight: bold;">결제정보</span>
				<span class="home"> 홈 > 장바구니</span>
				<span></span>
			</div>
			<br>
			
			<div >
				<table class="calculation1" style="width: 100%">
				<thead>
					<tr>
						<th colspan="10" style="text-align: left; padding-left: 20px;  ">결제상품(${payAllPrice.count })</th>
					</tr>
					
					<tr style="font-size: 15px;">
	<!-- 					<th ><input type="checkbox" name="check" id="check" /></th> -->
						<th><input type="checkbox"  class="checkebox" id="check_all" /></th>
						<th style="width: 400px;"><span>이미지</span></th>
						<th ><span>상품정보</span></th>
						<th style="width: 100px;">판매가</th>
						<th>수량</th>
<!-- 						<th style="width: 70px">적립금</th> -->
						<th style="width: 80px;">배송구분</th>
						<th style="width: 70px;">배송비</th>
						<th style="width: 70px;">합계</th>
					</tr>
				</thead>
				
				<tbody>
					<c:forEach var="productPayList" items="${productPayList }">
						<input type="hidden" class="result_num" value="${productPayList.product_num}">
						<tr style="height: 90px; background-color: #fff; font-size: 15px;">
 							<td style="text-align: left; text-align: center; border-right: none;">
                       			 <input type="checkbox" name="checkbox" class="checkbox" id="${productPayList.product_num}" value="${productPayList.product_num}" proNum="${productPayList.product_num}"/>
                     		</td>
<!-- 							<td style="text-align: left; text-align: center; border-right: none;"> -->
<!-- 								<input type="checkbox" name="checkbox"> -->
<!-- 							</td> -->
							<td style="border-left: none; border-right: none;"><img style="width: 60%" src="${pageContext.request.contextPath }/resources${productPayList.product_main_img_real_file }"></td>
							<td style="text-align: left; padding-left: 10px; border-left: none; font-weight: bold; width: 40%">${productPayList.product_name }</td>
							<td><span style="padding-left: 10px;"><fmt:formatNumber value="${productPayList.product_price }" pattern="#,###" /></span>원</td> <!-- 상품가격 -->
							<td style="width: 80px;">
								<span><fmt:formatNumber value="${productPayList.product_count }" pattern="#,###" /></span> <!-- 수량 -->
							</td>
<!-- 							<td>-</td> 적립금 -->
							<td>기본배송</td>
							<td>고정</td>
							<td><span><fmt:formatNumber value="${productPayList.product_price  * productPayList.product_count }" pattern="#,###" /></span>원</td> <!-- 합계 -->
						</tr>
					</c:forEach>
				</tbody>
				
				<tfoot>
					<tr style="height: 60px;">
						<td colspan="5" style="border-right: none; text-align: left; padding-left: 10px;">
							<span>[기본배송]</span>
						</td>
						<td colspan="5" style="border-left: none; text-align: right; padding-right: 10px; width: 300px;">
							상품금액 <span><fmt:formatNumber value="${payAllPrice.allPrice }" pattern="#,###" /></span> + <span>배송비 3,000 = <br>합계</span>&nbsp;<span style="font-weight: bold; font-size: 15pt"><fmt:formatNumber value="${payAllPrice.allPrice + 3000 }" pattern="#,###" /></span> 
						</td>
					</tr>
				</tfoot>
				</table>
				
				<div style="border: solid 1px #e0e0eb; border-right: none; border-left: none; padding: 11 px 0; background-color: #fff;">
					<img src="resources/store_img/warning.png" style="margin-left: 5px; position: relative; top: 4.5px;" width="15">
					<span style="font-size: 10pt; color: red">상품의 옵션 및 수량 변경은 상품상세 또는 장바구니에서 가능합니다.</span>
				</div>
				
			</div>
				
			<div style="margin: 10px 0; padding-bottom: 50px; border-bottom: solid 1px gray;">
				<span style="margin: 0 10px;" class="btnfloat">선택상품을</span>
				<button type="button" class="btn default btnfloat" style="background-color: gray; color: #fff;" id="btnmemberdel">삭제하기</button>
				
				<button type="button" class="btn default btnfloat2" onclick="location.href='MainCart'">이전페이지</button>
				<span class="clearboth"></span>
			</div>
			<br><br>
			
			<%-- 배송 정보 --%>
			
			<span style="font-size: 12pt; display: inline-block; padding-bottom: 10px;">&nbsp;
			배송정보
			</span>
			
			
			<div id="resultArea1">
				<table class="delivery">
					<thead>
						<tr>
							<td class="deliverytd">배송지 선택</td>
							<td>
								<input type="radio" name="memberInfo" id="member1" value="1" checked >
								<label>회원정보와 동일</label>
								
								<input type="radio" name="memberInfo" id="member2" value="2" >
								<label>새로운 배송지</label>&nbsp;
			<!-- 					<button type="button" style="background-color: #fff; cursor: pointer; border-left-width: 0px;"></button> -->
							</td>
						</tr>
						
						<tr>
							<td class="deliverytd">받으시는 분&nbsp;<span style="color:red">*</span></td>
							<td id="memberName"><input type="text" id="member_name" value="${Member.member_name}"></td>
						</tr>
						
						<tr>
							<td class="deliverytd">주소&nbsp;<span style="color: red">*</span>
							</td>
							
							<td>
	<!-- 							<input type="text" id="postnum1" size="10" maxlength="5" />&nbsp; -->
								<input style="margin-bottom: 10px;" type="text" id="addr1" size="40" value="${Member.member_address1}">&nbsp;
								<button type="button" style="cursor: pointer; margin-bottom: 10px; background-color: #fff " onclick="search_address_window()">주소 검색</button> <br>
								<input type="text" id="addr2" size="40" value="${Member.member_address2}"/>
							</td>
						</tr>
						
						<tr>
							<td class="deliverytd">전화번호&nbsp;<span style="color:red">*</span></td>
							<td>
	<!-- 							<input name="phoneNum1" id ="phoneNum1" type="text" size="10" maxlength="3" >-<input name="phoneNum2" id ="phoneNum2" type="text" size="10" maxlength="4">-<input name="phoneNum3" id ="phoneNum3" type="text" size="10" maxlength="4"> -->
								<input type="text" name="phone" id="phone" value="${Member.member_phone_num}" placeholder="000-0000-0000">
								<span id="checkPhoneResult"></span><br>
							</td>
						
						</tr>
						
						<tr>
							<td class="deliverytd">이메일&nbsp;<span style="color: red">*</span></td>
							<td>
<%-- 								<c:set value="${fn:split(Member.member_e_mail, '@') }" var="mail"  />	 --%>
								
<%-- 								<input type="text" id="eMail" value="${mail[0]}" >@<input id="domainName" type="text" name="mailUrl" value="${mail[1]}" />&nbsp; --%>
								<input type="text" id="eMail" value="${sessionScope.Email1 }" >@<input id="domainName" type="text" name="mailUrl" value="${sessionScope.Email2}" />&nbsp;
	<%-- 							<input type="text" id="eMail" value="${Member.member_email1}" >@<input id="domainName" type="text" name="mailUrl" value="${Member.member_email2}" />&nbsp; --%>
								<select name="emailChoice" style="height: 20px;" onchange="siteSelect(this.value)">
									<option value="">-직접 입력-</option>
									<option value="naver.com">naver.com</option>
									<option value="gmail.com">gmail.com</option>
									<option value="daum.net">daum.net</option>
									<option value="nate.com">nate.com</option>
								</select>
								<span style="font-size: 10pt; color:gray;">
<!-- 									<p> 이메일을 통해 주문 처리과정을 보내드립니다.<br> -->
<!-- 										이메일 주소란에는 반드시 수신가능한 이메일 주소를 입력해 주세요 -->
<!-- 									</p> -->
								</span>
							</td>
						</tr>
						<tr>
							<td class="deliverytd">포인트</td>
							<td><input type="hidden" value="${Member.member_point}">${Member.member_point}&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" id="pointCheck" value="${Member.member_point}">포인트 사용하기</td>
						</tr>
						<tr>
							<td class="deliverytd">배송메세지</td>
							<td><textarea rows="5" cols="100"></textarea></td>
						</tr>
					</thead>
				</table>
			</div>
			
			<!-- ------------------------------------------------------------------------------------------- -->	
			
			<%-- 결제예정금액 테이블 --%>
			
			<br><br>
			<table class="calculation2">
				<tr>
					<th>총 상품금액</th>
					<th>총 배송비</th>
					<th style="width: 750px; padding: 22px 0;"><span>결제예정금액</span></th>
				</tr>
				
				<tr style="background-color: #fff;">
					<td style="padding: 23px 0;"><span class="price" ><fmt:formatNumber value="${payAllPrice.allPrice }" pattern="#,###" /></span>원</td>
					<td>+<span class="price">3,000</span>원</td>
					<td>=<span class="price"><fmt:formatNumber value="${payAllPrice.allPrice + 3000}" pattern="#,###" /></span>원</td>
				</tr>
			</table>
					<input type="hidden" class="allPrice" value="${payAllPrice.allPrice + 3000}">
			<br><br>
			
			<%-- 결제하기 --%>
			<div class="payArea">
				<div class="payment">
					<div style="padding: 18px 10px; font-size: 10pt; border-bottom: solid 1px #e0e0eb;">
						<input type="radio" name="cardradio" checked/><label>카카오페이</label>&nbsp;&nbsp;
						<input type="radio" name="cardradio"/><label>카드결제</label>&nbsp;&nbsp;
<!-- 						<input type="radio" name="cardradio"/><label>휴대폰 결제</label>&nbsp;&nbsp; -->
						<input type="radio" name="cardradio"/><label>무통장 입금</label>&nbsp;&nbsp;
<!-- 						<input type="radio" name="cardradio"/><label>에스크로(가장계좌)</label>&nbsp; -->
						
					</div>
					
					<div align="left">
						<img src="${pageContext.request.contextPath }/resources/store_img/warning.png" style="margin-left: 5px; position: relative; top: 6px;" width="15">
						<span style="font-size: 10pt; color: gray;">최소 결제 가능 금액은 결제금액에서 배송비를 제외한 금액입니다.</span><br>
						<img src="${pageContext.request.contextPath }/resources/store_img/warning.png" style="margin-left: 5px; position: relative; top: 6px;" width="15">
						<span style="font-size: 10pt; color: gray;">소액 결제의 경우 PG사 정책에 따라 결제 금액 제한이 있을 수 있습니다.</span><br>
					</div>
				</div>
				
				<div class="total">
					<span style="display:inline-block; padding: 20px 10px;">최종결제 금액</span><br>
					<span id="checkedResult" style="font-size: 25pt; font-weight: bold; padding: 0px 10px;">${payAllPrice.allPrice + 3000}원</span><br><br>
					<button type="submit" class="btn default" style="width:90%; height: 60px; margin-right: 10px; font-size: 12pt;">결제하기</button>
				</div>
			</div>
			<br><br>
			
			<%--이용안내 --%>
			
			
			<footer id="footer">
				<jsp:include page="../inc/bottom.jsp"></jsp:include>
			</footer>
		
		</div>

	</form>	
</body>
</html>	