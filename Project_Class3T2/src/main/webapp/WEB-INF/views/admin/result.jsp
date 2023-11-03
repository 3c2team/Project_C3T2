<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 

<style>
img {
	 -webkit-mask-image: linear-gradient(to top, transparent 0%, #000 2% 98%, transparent 100%);
}
</style>
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
			 <div id="sns" >
	            <a href="https://www.facebook.com/itwill.busan">
	               <img src="${pageContext.request.contextPath }/resources/main_img/facebook.png" title="페이스북 아이콘" width="40" height="40" align="right">
	            </a>
	            <a href="https://www.instagram.com/itwillbusan_official/">
	               <img src="${pageContext.request.contextPath }/resources/main_img/instagram.png" title="인스타그램 아이콘" width="40" height="40" align="right">
	            </a>
	            <a href="https://blog.naver.com/itwillbusan01">
	               <img src="${pageContext.request.contextPath }/resources/main_img/call.png" title="전화 아이콘" width="40" height="40" align="right">
	            </a>
	            <a href="https://cafe.naver.com/learntimes">
	               <img src="${pageContext.request.contextPath }/resources/main_img/twitter.png" title="트위터 아이콘" width="40" height="40" align="right">
	            </a>
	         </div>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/slide.css">
<script src="${pageContext.request.contextPath }/resources/js/main.js"></script>