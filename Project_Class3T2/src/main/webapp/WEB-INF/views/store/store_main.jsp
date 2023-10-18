<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link href="${pageContext.request.contextPath }/resource/css/store_top.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/resource/css/default.css" rel="stylesheet" type="text/css">
<%-- <link href="${pageContext.request.contextPath }/resource/css/store_default.css" rel="stylesheet" type="text/css"> --%>
<link href="${pageContext.request.contextPath }/resource/css/store_main.css" rel="stylesheet" />
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
<script src="${pageContext.request.contextPath }/resource/js/store_main.js"></script>
<body>
	<header>
		<jsp:include page="../inc/store_top.jsp"></jsp:include>
	</header>
	<main>
		<div id="mainLayout">
			<!-- 첫번째 BEST 슬라이더 -->
			<div class="title">BEST</div>
			<div class="container">
				<div class="bx">
					<h2>1</h2>
					<img src="${pageContext.request.contextPath }/resource/store_img/pasta1.jpg" />
					<p style="font-weight: bold;">20,000원</p>
	        		<p>함박 스테이크 (2인분) 밀키트</p>
				</div>
				<div class="bx">
					<h2>2</h2>
					<img src="${pageContext.request.contextPath }/resource/store_img/pasta2.jpg" />
					<p style="font-weight: bold;">20,000원</p>
	        		<p>함박 스테이크 (2인분) 밀키트</p>
				</div>
				<div class="bx">
					<h2>3</h2>
					<img src="${pageContext.request.contextPath }/resource/store_img/pasta3.jpg" />
					<p style="font-weight: bold;">20,000원</p>
	        		<p>함박 스테이크 (2인분) 밀키트</p>
				</div>
				<div class="bx">
					<h2>4</h2>
					<img src="${pageContext.request.contextPath }/resource/store_img/pasta4.jpg" />
					<p style="font-weight: bold;">20,000원</p>
	        		<p>함박 스테이크 (2인분) 밀키트</p>
				</div>
				<div class="bx">
					<h2>5</h2>
					<img src="${pageContext.request.contextPath }/resource/store_img/pasta5.jpg" />
					<p style="font-weight: bold;">20,000원</p>
	        		<p>함박 스테이크 (2인분) 밀키트</p>
				</div>
				<div class="bx">
					<h2>6</h2>
					<img src="${pageContext.request.contextPath }/resource/store_img/pasta6.jpg" />
					<p style="font-weight: bold;">20,000원</p>
	        		<p>함박 스테이크 (2인분) 밀키트</p>
				</div>
				<div class="bx">
					<h2>7</h2>
					<img src="${pageContext.request.contextPath }/resource/store_img/pasta7.jpg" />
					<p style="font-weight: bold;">20,000원</p>
	        		<p>함박 스테이크 (2인분) 밀키트</p>
				</div>
				<div class="bx">
					<h2>8</h2>
					<img src="${pageContext.request.contextPath }/resource/store_img/pasta8.jpg" />
					<p style="font-weight: bold;">20,000원</p>
	        		<p>함박 스테이크 (2인분) 밀키트</p>
				</div>
			</div>
			
			<!-- 두번째 NEW 슬라이더 -->
			<div class="title">NEW</div>
			<div class="container">
				
				<div class="bx">
					<img src="${pageContext.request.contextPath }/resource/store_img/steak1.jpg" />
					<p style="font-weight: bold;">20,000원</p>
	        		<p>함박 스테이크 (2인분) 밀키트</p>
				</div>
				<div class="bx">
					<img src="${pageContext.request.contextPath }/resource/store_img/steak2.jpg" />
					<p style="font-weight: bold;">20,000원</p>
	        		<p>함박 스테이크 (2인분) 밀키트</p>
				</div>
				<div class="bx">
					<img src="${pageContext.request.contextPath }/resource/store_img/steak3.jpg" />
					<p style="font-weight: bold;">20,000원</p>
	        		<p>함박 스테이크 (2인분) 밀키트</p>
				</div>
				<div class="bx">
					<img src="${pageContext.request.contextPath }/resource/store_img/steak4.jpg" />
					<p style="font-weight: bold;">20,000원</p>
	        		<p>함박 스테이크 (2인분) 밀키트</p>
				</div>
				<div class="bx">
					<img src="${pageContext.request.contextPath }/resource/store_img/steak5.jpg" />
					<p style="font-weight: bold;">20,000원</p>
	        		<p>함박 스테이크 (2인분) 밀키트</p>
				</div>
				<div class="bx">
					<img src="${pageContext.request.contextPath }/resource/store_img/steak6.jpg" />
					<p style="font-weight: bold;">20,000원</p>
	        		<p>함박 스테이크 (2인분) 밀키트</p>
				</div>
			</div>
			
			<!-- 세번째 HOT 슬라이더 -->
			<div class="title">HOT</div>
			<div class="container" >
				<div class="bx">
					<img src="${pageContext.request.contextPath }/resource/store_img/pasta1.jpg" />
					<p style="font-weight: bold;">20,000원</p>
	        		<p>함박 스테이크 (2인분) 밀키트</p>
				</div>
				<div class="bx">
					<img src="${pageContext.request.contextPath }/resource/store_img/pasta2.jpg" />
					<p style="font-weight: bold;">20,000원</p>
	        		<p>함박 스테이크 (2인분) 밀키트</p>
				</div>
				<div class="bx">
					<img src="${pageContext.request.contextPath }/resource/store_img/pasta3.jpg" />
					<p style="font-weight: bold;">20,000원</p>
	        		<p>함박 스테이크 (2인분) 밀키트</p>
				</div>
				<div class="bx">
					<img src="${pageContext.request.contextPath }/resource/store_img/pasta4.jpg" />
					<p style="font-weight: bold;">20,000원</p>
	        		<p>함박 스테이크 (2인분) 밀키트</p>
				</div>
				<div class="bx">
					<img src="${pageContext.request.contextPath }/resource/store_img/pasta5.jpg" />
					<p style="font-weight: bold;">20,000원</p>
	        		<p>함박 스테이크 (2인분) 밀키트</p>
				</div>
				<div class="bx">
					<img src="${pageContext.request.contextPath }/resource/store_img/pasta6.jpg" />
					<p style="font-weight: bold;">20,000원</p>
	        		<p>함박 스테이크 (2인분) 밀키트</p>
				</div>
				<div class="bx">
					<img src="${pageContext.request.contextPath }/resource/store_img/pasta7.jpg" />
					<p style="font-weight: bold;">20,000원</p>
	        		<p>함박 스테이크 (2인분) 밀키트</p>
				</div>
				<div class="bx">
					<img src="${pageContext.request.contextPath }/resource/store_img/pasta8.jpg" />
					<p style="font-weight: bold;">20,000원</p>
	        		<p>함박 스테이크 (2인분) 밀키트</p>
				</div>
			</div>
		</div>
	</main>
	<footer id="footer">
		<jsp:include page="../inc/bottom.jsp"></jsp:include>
	</footer>
</body>
</html>











