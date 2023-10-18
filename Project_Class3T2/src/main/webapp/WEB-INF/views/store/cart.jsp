<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

</head>
		
<body >
		
	<div class="cartBody" id="frame" >
		<header>
				<jsp:include page="../inc/store_top.jsp"></jsp:include>
		</header>
		
		
			<div id="frame2">
				<span style="font-size: 18pt;, font-weight: bold; text-align: left;" onclick="fnPageChange('/')">장바구니</span>
				<span class="home"> 홈 > 장바구니</span>
				<span> </span>
			</div>
			<br>
									
			<!-- 상품 정보 테이블 -->
		<form action="Pay" method="post">	
			<div >
				<table class="calculation1"  style="width: 100%; border-collapse : collapse;">
				
				<thead style="padding: 5px 0; ">
					<tr>
						<th colspan="10" style="text-align: left;  padding-left: 10px; font-size: 20px" >주문상품		</th>
					</tr>
					
					<tr style="border-collapse: collapse;">
						<th><input type="checkbox" name="checkbox" id="check"/></th>
						<th><span>이미지</span></th>
						<th style="width:450px"><span>상품정보</span></th>
						<th style="width: 100px;">판매가</th>
						<th>수량</th>
						<th style="width: 70px;"><span>포인트</span></th>
						<th style="width: 70px;">배송구분</th>
						<th style="width: 70px;">배송비</th>
						<th style="width: 70px;">합계</th>
						<th>선택</th>
					</tr>
				</thead>
				
				<tbody> 
					<tr style="height: 90px; background-color: #fff;">
						<td style="text-align: left; text-align: center; border-right: none;">
							<input type="checkbox" name="checkbox"/>
						</td>
						<td style="border-left: none; border-right: none"><img style="width: 60%" src="${pageContext.request.contextPath }/resources/store_img/steak2.jpg"></td>	
						
						<td style="text-align: left; padding-left: 10px; border-left: none; font-weight: bold;">짱짱맛 스테이크</td>
						
						<td><span style="padding-left: 10px;">35,000</span>원</td> <!-- 상품가격 -->
						
						<td style="width:80px;">
							<input type="number" style="text-align: right; width: 43px; margin-bottom: 5px;" min="1" max="99" step="1" value="1">
							<button class="btn default" style="border-radius: 3px; size: 10px; color: black;">변경</button> <!-- 수량 변경 -->
						</td>
						
						<td>-</td>
						<td>기본배송</td>
						<td>고정</td>
						<td><span>0</span>원</td> <!-- 합계 -->
									
						<td>
							<button type="submit" class="btn default" style="border-radius: 3px; width:90px; margin-bottom: 3px; font-size: 11px; color: #fff; background: gray;" >주문하기</button><br>
							<button class="btn default" style="border-radius: 3px; width:90px; margin-bottom: 3px; font-size: 11px; color: black;">관심상품</button><br>
							<button class="btn default" style="border-radius: 3px; width:90px; margin-bottom: 3px; font-size: 11px; color: black;">삭제</button><br>
						</td>
					</tr>
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
		</form>	
			<div style="margin: 10px 0; text-align: left;">
				<span style="margin: 0 10px;" class = "btnfloat">선택 상품을 </span>
				<button class="btn default btnfloat" style=" color: black;">삭제하기</button>&nbsp;
				
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