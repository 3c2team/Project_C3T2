<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.radio input{
		width: 20px;
	    height: 20px;
	    min-width: 20px;
	    margin-right: 8px;
	    font-size: 14px;
	    color: #404040;
	    -webkit-border-radius: 0;
	    cursor: pointer;
	}
	
	li{
		list-style: none;
	    outline: none;
	}
	.cancel{
		color: #fff;
    	background: gray; 
    	height: 48px;
	    font-size: 14px;
	    flex: initial;
	    width: 456px;
	    cursor: pointer;
	}
	
	tr{
		height : 40px;
	}
	.grayBolder{
		margin: 20px;
 		border-width: 8px;
 		border-style: solid; 
 		border-color: #ededed;
	}
	.myAgree{
		width: 20px;
	    height: 20px;
	}
	.grayBolder2{
 		border-style: solid; 
 		border-color: #ededed;
	}
	
	div[align="center"] {
	    width: 50%; /* 원하는 폭 값으로 조절 */
    	margin: auto; /* 중앙 정렬 */
    	position: relative;
        top: 10%;
	}
</style>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resource/css/default.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resource/css/mypage.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resource/css/top.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resource/css/bottom.css">
</head>
<body>
<header>
	<jsp:include page="../inc/top.jsp"></jsp:include>
</header>
	<main>	
	<div id="main_layout">
		<div class="mypageBox" id="mypage_dashboard">
			<span id="mypage_dashboard_info">
				<span id="col_1">
					<span>
						<jsp:include page="../inc/mypage_col_1.jsp" />
					</span>	
				</span>
				<span id="col_2">
					<ul>
						<jsp:include page="../inc/mypage_col_2.jsp" />
					</ul>
				</span>
			</span>
		</div>
		<div id="mypage_container">
			<div class="mypageBox" id="mypage_sideMenu">
				<nav class="menu">
					<jsp:include page="../inc/mypage_box.jsp" />
				</nav>
			</div>
			<br><br>
			<div align="center">
				<h1>회원 탈퇴</h1>
				<hr>
				<h2>회원탈퇴 사유 선택</h2>
				<table>
					<tr>
						<td>
							<li>
								<label class="radio">
									<input type="radio" name="radio"><span>아이디 변경을 위해 탈퇴 후 재가입</span>
								</label>
							</li>
						</td>
						<td  width="40px" >
						</td>
						<td>
							<li>
								<label class="radio">
									<input type="radio" name="radio"><span>상품 가격 불만</span>
								</label>
							</li>
						</td>
					</tr>
					<tr>
						<td>
							<li>
								<label class="radio">
									<input type="radio" name="radio"><span>장기간 부재(군입대, 유학 등)</span>
								</label>
							</li>
						</td>
						<td >
						</td>
						<td>
							<li>
								<label class="radio">
									<input type="radio" name="radio"><span>개인정보 누출 우려</span>
								</label>
							</li>
						</td>
					</tr>	
					<tr>
						<td>
							<li>
								<label class="radio">
									<input type="radio" name="radio"><span>상품의 다양성/품질 불만</span>
								</label>
							</li>
						</td>
						<td >
						</td>
						<td>
							<li>	
								<label class="radio">
									<input type="radio" name="radio"><span>상품 가격 불만</span>
								</label>
							</li>
						</td>
					</tr>	
					<tr>
						<td>
							<li>
								<label class="radio">
									<input type="radio" name="radio"><span>배송 불만</span>
								</label>
							</li>
						</td>
						<td>
						</td>
						<td>	
							<li>
								<label class="radio">
									<input type="radio" name="radio"><span>교환/환불/반품 불만</span>
								</label>
							</li>
						</td>
					</tr>		
				</table>
				<br>
				<hr class="grayBolder">
					<li><br><br>
						<input type="checkbox" name="chk-terms" class="myAgree">
						<span>회원 탈퇴 안내를 모두 확인하였으며 회원 탈퇴에 동의합니다.</span>
					</li><br><br><hr class="grayBolder2">
					<li>
				회원탈퇴를 하시면, 보유하고 계신 포인트 및 할인쿠폰은 자동 소멸되어 재가입하실 경우에도 복원되지 않습니다.
				</li>
				<br>
				<input type="button" class="cancel" value="취소">
				<input type="button" class="submit" value="확인" id="확인" onclick="goBackTwoSteps()">
			</div>
			<script type="text/javascript">
			function goBackTwoSteps() {
				alert("회원 탈퇴가 정상처리 되었습니다.")
				window.location.href="mypage_dashboard.jsp"
			}
			</script>
		</div>
	</div>
	</main>
<footer id="footer">
	<jsp:include page="../inc/bottom.jsp"></jsp:include>
</footer>
</body>
</html>