<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>J'ai Faim</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/top.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bottom.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/default.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/slide.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/event_popup.css">
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.7.0.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/main.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/popup.js"></script>
<style>
img {
	 -webkit-mask-image: linear-gradient(to top, transparent 0%, #000 2% 98%, transparent 100%);
}
</style>
</head>
<body>
	<div id="mainLayout">
		<header>
			<jsp:include page="../inc/top.jsp"></jsp:include>
		</header>
		<main>
			<div id="popup_layer">
			  <div class="popupBox">
			      <div class="popupCont">
			          <h2>Event</h2>
			      </div>
			      <div class="popupBtn">
			          <a id="chk_today" href="javascript:closeToday();" class="closeDay">하루동안 열지 않기</a> 
			          <a href="javascript:closePop();">Close</a>
			      </div>
			  </div>
			</div>
			<div class="slideBox" style="height: 550px; position: relative; text-align: center;">
				<div class="slider" style="height: 550px;">
					<div class="slides">
						<input type="radio" name="radio-btn" id="radio1">
						<input type="radio" name="radio-btn" id="radio2">
						<input type="radio" name="radio-btn" id="radio3">
						<input type="radio" name="radio-btn" id="radio4">
						
						<div class="slide first">
							<img src="./resources/main_img/main.jpg" alt="" style="height: 550px;">
						</div>
						
						<div class="slide">
							<img src="./resources/main_img/kitchen.jpg" alt="" style="height: 550px;">
						</div>
                        
						<div class="slide">
							<img src="./resources/main_img/platter1.jpg" alt="" style="height: 550px;">
						</div>
						
						<div class="slide">
							<img src="./resources/main_img/platter2.jpg" alt="" style="height: 550px;">
						</div>
						
						<div class="navigationAuto" style="margin-top : 510px;">
							<div class="autoBtn1"></div>
							<div class="autoBtn2"></div>
							<div class="autoBtn3"></div>
							<div class="autoBtn4"></div>
						</div>
					</div>
					
					<div class="navigationManual">
						<label for="radio1" class="manualBtn"></label>
						<label for="radio2" class="manualBtn"></label>
						<label for="radio3" class="manualBtn"></label>
						<label for="radio4" class="manualBtn"></label>
					</div>
				</div>
			</div>
		</main>
	</div>
	<footer id="footer">
		<jsp:include page="../inc/bottom.jsp"></jsp:include>
	</footer>
</body>
</html>