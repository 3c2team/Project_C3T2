<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<link href="${pageContext.request.contextPath }/resources/css/cart.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/resources/css/store_top.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/resources/css/default.css" rel="stylesheet" type="text/css">
<head>
<meta charset="UTF-8">
<title>장바구니</title>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/jquery-3.7.0.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript">

	$(function() {
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
			
			//전체를 각 글앞의 체크에 일괄 전달
            //prop()을 통해서는 element가 가지는 실제적인 상태(활성화, 체크, 선택여부)를 제어하는 업무에 적절하고 
            //attr()는 속성값이나 정보를 조회하는 업무에 적절하다
			$(".checkbox").prop("checked",chk);

		});
		
	});
	



</script>
</head>
		
<body >
	<header>
			<jsp:include page="../inc/store_top.jsp"></jsp:include>
	</header>

	<div class="cartBody" id="frame" >
		
		
			<div id="frame2">
				<span style="font-size: 18pt;, font-weight: bold; text-align: left;" onclick="fnPageChange('/')">장바구니</span>
				<span class="home"> 홈 > 장바구니</span>
				<span>${sessionScope.sId} </span>
			</div>
			<br>
									
			<!-- 상품 정보 테이블 -->
		
			<div >
				<table class="calculation1"  style="width: 100%; border-collapse : collapse;">
				
				<thead style="padding: 5px 0; ">
					<tr>
						<th colspan="10" style="text-align: left;  padding-left: 10px; font-size: 20px" >주문상품		</th>
					</tr>
					
					<tr style="border-collapse: collapse;">
						<th><input type="checkbox" name="checkbox" id="check_all" /></th>
						<th><span>이미지</span></th>
						<th style="width:450px"><span>상품정보</span></th>
						<th style="width: 100px;">판매가</th>
						<th style="width: 100px;">수량</th>
<!-- 						<th style="width: 70px;"><span>포인트</span></th> -->
						<th style="width: 100px;">배송구분</th>
						<th style="width: 100px;">배송비</th>
						<th style="width: 100px;">합계</th>
						<th>선택</th>
					</tr>
				</thead>
				
				<tbody> 
					<c:forEach var="productList" items="${productList}">
						<tr style="height: 90px; background-color: #fff;">
							<td style="text-align: left; text-align: center; border-right: none;">
								<input type="checkbox" name="checkbox" class="checkbox" proNum="${productList.product_num}"/>
							</td>
							<td style="border-left: none; border-right: none"><img style="width: 60%" src="${productList.product_main_img_real_file }"></td>	
							
							<td style="text-align: left; padding-left: 10px; border-left: none; font-weight: bold;" >${productList.product_name }</td>
							
							<td><span style="padding-left: 10px;">${productList.product_price }</span>원</td> <!-- 상품가격 -->
							
							<td style="width:80px;">
								<input type="number" class="cnt" style="text-align: right; width: 43px; margin-bottom: 5px;" min="1" max="30" step="1" value="${productList.product_count }">
								<button class="btn default" style="border-radius: 3px; size: 10px; color: black;">변경</button> 
							</td>
							
<!-- 							<td>-</td> -->
							<td>기본배송</td>
							<td>고정</td>
							<td><span>0</span>원</td>
							<td>
								<button type="submit" class="btn default" style="border-radius: 3px; width:90px; margin-bottom: 3px; font-size: 11px; color: #fff; background: gray;" >주문하기</button><br>
								<button class="btn default" style="border-radius: 3px; width:90px; margin-bottom: 3px; font-size: 11px; color: black;">관심상품</button><br>
								<button class="btn default" style="border-radius: 3px; width:90px; margin-bottom: 3px; font-size: 11px; color: black;" onclick="location.href='DeleteCartProduct?proNum=${productList.product_num}'">삭제</button><br>
<!-- 								<script type="text/javascript"> -->
<!-- // 								function confirmDelete() { -->
<!-- // 									"삭제 하시겠습니까?" 질문을 수행할 다이얼로그 표시 -->
<%-- // 									let result = confirm("삭제 하시겠습니까?" + ${productList.product_num}); --%>
									
<!-- // 									 만약, result 값이 true 일 경우 "BoardDelete" 서블릿 주소 요청 -->
<!-- // 										if(result) { -->
<%-- // 											location.href="DeleteCartProduct?proNum=${productList.product_num}"; --%>
<!-- // 										} -->
<!-- // 								} -->
<!-- 								</script> -->
							</td>
						</tr>
					</c:forEach>
					
				</tbody>
				
				<tfoot> <!-- 상품 총 금액 -->
					<tr style="height: 60px;">
						<td colspan="5" style="border-right: none; text-align: left; padding-left: 10ox;">
							<span>[기본배송]</span>
						</td>
						<td colspan="5" style="border-right: none; text-align: left; padding-left: 10ox; border: solid 1px  #e0e0eb;">
							상품금액 <span>0</span> + <span>배송비 2,500 = 합계</span>&nbsp;<span style="font-weight: bold; font-size: 15pt">0</span>
						</td>
					</tr>
				</tfoot>
				</table>
				
				<div style="border: solid 1px #e0e0eb; padding: 15px 0; text-align: left; width: 100%;	">
					<img src="${pageContext.request.contextPath }/resources/store_img/warning.png" style="margin-left: 5px; position: relative; top: 4.5px;" width="15">
					<span style="font-size: 10pt; color:gray;">할인 적용 금액은 주문서작성의 결제 금액에서 확인이 가능합니다.</span>
				</div>
			</div>
	
			<div style="margin: 10px 0; text-align: left;">
				<span style="margin: 0 10px;" class = "btnfloat">선택 상품을 </span>
				<button class="btn default btnfloat" style=" color: black;" id="btnmemberdel">삭제하기</button>&nbsp;
				
				<button class="btn default backBtn btnfloat2" style="color: black; float: right;">장바구니 비우기</button>
<!-- 				<span class="clearboth"></span> -->
			</div>
			<br><br>
			
			<%-- 결제 예정금액 테이블 --%>
			<div align="center">
				<table class="calculation2" >
					<tr>
						<th style="width: 300px;">총 상품 금액</th>
						<th style="width: 300px;">총 배송비</th>
						<th style="width: 900px; padding: 22px 0; "><span>결제 예정 금액</span></th>
					</tr>
					
					<tr style="background-color: #fff">
						<td style="padding: 22px 0;"><span class="price">0</span>원</td>
						<td>+<span class="price">2,500</span>원</td>
						<td>=<span class="price">0</span>원</td>
					</tr>
				</table>
			</div>
			<br><br>
			
			<div align="center">
				<button class="btn default" id="allProduct" style="color: black;">전체상품주문</button>			
				<button class="btn default backBtn" id="productClear" style="color: black;">선택상품주문</button>			
				<button class="btn default footerbtn" id="footerBtn" style="color: black;" onclick="location.href='store_main.jsp'">쇼핑계속하기</button>			
				<span class="clearboth"></span>
			</div>
			
			<br><br>
			
			<div style="border: solid 1px #e0e0eb; padding: 10px 0; font-size: 12pt; background-color: #f5f5f0; padding-left: 10px;">
				이용안내
			</div>
			<div style="border: solid 1px #e0e0eb; height:350px; font-size: 12pt; padding-left: 10px; text-align: left;">
				<br>장바구니 이용안내
				<ol>
					<li class="lifont"> 선택하신 상품의 수량을 변경하시려면 수량 변경 후 [변경] 버튼을 누르시면 됩니다.</li>
					<li class="lifont"> [쇼핑계속하기] 버튼을 누르시면 쇼핑을 계속 하실 수 있습니다. </li> 
					<li class="lifont"> 장바구니와 관심상품을 이용하여 원하시는 상품만 주문하거나 관심상품으로 등록하실 수 있습니다. </li>			
				</ol>
				무이자할부 이용안내
				<ol>
					<li class="lifont"> 상품별 무이자할부 혜택을 받으시려면 무이자할부 상품만 선택하여 [주문하기] 버튼을 눌러 주문/결제 하시면 됩니다.</li>
					<li class="lifont"> [전체 상품 주문] 버튼을 누르시면 장바구니의 구분없이 선택된 모든 상품에 대한 주문/결제가 이루어집니다.</li>
					<li class="lifont"> 단, 전체 상품을 주문/결제하실 경우, 상품별 무이자 할부 혜택을 받으실 수 없습니다.</li>
					<li class="lifont"> 무이자 할부 상품은 장바구니에서 별도 무이자할부 상품 영역에 표시되어, 무이자 할부 상품 기준으로 배송비가 표시 됩니다.<br>
						실제 배송비는 함께 주문하는 상품에 따라 적용되오니 주문서 하단의 배송비 정보를 참고해주시기 바랍니다.
					</li>
				</ol>		
			</div>
		
		<br>	
		
		<footer id="footer">
			<jsp:include page="../inc/bottom.jsp"></jsp:include>
		</footer>
	</div>
</body>
</html>