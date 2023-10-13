<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>J'ai Faim</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/slide.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/top.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/bottom.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/default.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/event_popup.css">
<script src="${pageContext.request.contextPath }/js/jquery-3.7.0.js"></script>
<style>
.links li:nth-child(2) {
	opacity: .6; /* 불투명도 */
}

.links li:nth-child(2):hover {
	opacity: 1;
}

.links li:nth-child(3) {
	opacity: .6;
	float: right;
}

.links li:nth-child(3):hover {
	opacity: 1;
}
</style>
<script type="text/javascript">
// 화면로딩전
let counter = 1;

setInterval(function(){
	document.getElementById('radio' + counter).checked = true;
	counter++;
	if(counter > 4) {
		counter = 1;
	}
}, 4000);



$(function(){
	
	// 보이기 | 숨기기 
	$(window).scroll(scrollEvent);
	
	// popup event
// 	$(".popupBox").draggable({containment:'parent', scroll:false}); 
// 	let disp = document.cookie.indexOf("popToday=close") < 0 ? 'block' : 'none';
// 	document.getElementById("popup_layer").style.display = disp;
	
	// 슬라이드 counter 동기화
	$('.manualBtn').on('click', (e) => counter = $(e.target).attr('for').replace("radio", ""));
});


// functions
function scrollEvent() {
	let scroll = $(this).scrollTop();
	if(scroll == 0){
		$('#topBtn').fadeOut();
		$('#bottomBtn').fadeIn();
	} else if(scroll > 270){
		$('#topBtn').fadeIn();
		$('#bottomBtn').fadeOut();
	} else {
		$('#topBtn').fadeIn();
		$('#bottomBtn').fadeIn();
	}
}

function setCookie(name, value, expiredays) {
	var todayDate = new Date();
	todayDate.setDate( todayDate.getDate() + expiredays ); 
	document.cookie = name + "=" + value + "; path=/; expires=" + todayDate.toUTCString() + ";"
} 

function closeToday() { 
	setCookie( "popToday", "close" , 1); 
	$("#popup_layer").css("display", "none");
	closePop();
}
function closePop() { 
	document.getElementById("popup_layer").style.display = "none";
} 
</script>
</head>
<body>

	<div>
		<header>
			<jsp:include page="../inc/top.jsp"></jsp:include>
		</header>
		<main>
			<div id="popup_layer">
			  <div class="popupBox">
			      <div class="popupCont">
			          <h2>Popup</h2>
			          <p>
			          Lorem Ipsum is simply dummy text of the printing and typesetting industry.
			          Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,
			          when an unknown printer took a galley of type and 
			          scrambled it to make a type specimen book.
			          </p>
			      </div>
			      <div class="popupBtn">
			          <a id="chk_today" href="javascript:closeToday();" class="closeDay">하루동안 열지 않기</a> 
			          <a href="javascript:closePop();">Close</a>
			      </div>
			  </div>
			</div>
			<div class="slideBox">
                <div class="slider">
                    <div class="slides">
                        <input type="radio" name="radio-btn" id="radio1">
                        <input type="radio" name="radio-btn" id="radio2">
                        <input type="radio" name="radio-btn" id="radio3">
                        <input type="radio" name="radio-btn" id="radio4">
                        
                        <div class="slide first">
                            <img src="./img/news_1.jpg" alt="">
                        </div>
                        
                        <div class="slide">
                            <img src="./img/news_2.jpg" alt="">
                        </div>
                        
                        <div class="slide">
                            <img src="./img/news_3.jpg" alt="">
                        </div>
                        
                        <div class="slide">      
                            <img src="./img/news_4.jpg" alt="">
                        </div>
          
                        <div class="navigationAuto">
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
			
			<div class="container">
				<ul class="links">
					<li>
						<a href="${pageContext.request.contextPath }/news.jsp" id="notice">운영공지</a>
					</li>
					<li>
						<a href="${pageContext.request.contextPath }/event.jsp" id="event">이벤트</a>
					</li>
				</ul>
				<ul class="notice" style="margin: 5px 0 5px 100px;">
					<li>
						<a href="" id="notice_1">
						<img src="./img/news_1.jpg" style=" width:250px; height:150px; display:block;">
						<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor 
						incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud 
						exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
						</a>
					</li>
					<li>
						<a href="" id="notice_3">
						<img src="./img/news_3.jpg" style=" width:250px; height:150px; display:block;">
						<p>Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu 
						fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa 
						qui officia deserunt mollit anim id est laborum.</p>
						</a>
					</li>
					<li>
						<a href="" id="notice_1">
						<img src="./img/news_1.jpg" style=" width:250px; height:150px; display:block;">
						<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor 
						incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud 
						exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
						</a>
					</li>
<!-- 					<li> -->
<!-- 						<a href="" id="notice_3"> -->
<!-- 						<img src="./img/news_3.jpg" style=" width:250px; height:150px; display:block;"> -->
<!-- 						<p>Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu  -->
<!-- 						fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa  -->
<!-- 						qui officia deserunt mollit anim id est laborum.</p> -->
<!-- 						</a> -->
<!-- 					</li> -->
<!-- 					<li> -->
<!-- 						<a href="" id="notice_1"> -->
<!-- 						<img src="./img/news_1.jpg" style=" width:250px; height:150px; display:block;"> -->
<!-- 						<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor  -->
<!-- 						incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud  -->
<!-- 						exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p> -->
<!-- 						</a> -->
<!-- 					</li> -->
<!-- 					<li> -->
<!-- 						<a href="" id="notice_3"> -->
<!-- 						<img src="./img/news_3.jpg" style=" width:250px; height:150px; display:block;"> -->
<!-- 						<p>Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu  -->
<!-- 						fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa  -->
<!-- 						qui officia deserunt mollit anim id est laborum.</p> -->
<!-- 						</a> -->
<!-- 					</li> -->
<!-- 					<li> -->
<!-- 						<a href="" id="notice_1"> -->
<!-- 						<img src="./img/news_1.jpg" style=" width:250px; height:150px; display:block;"> -->
<!-- 						<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor  -->
<!-- 						incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud  -->
<!-- 						exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p> -->
<!-- 						</a> -->
<!-- 					</li> -->
<!-- 					<li> -->
<!-- 						<a href="" id="notice_3"> -->
<!-- 						<img src="./img/news_3.jpg" style=" width:250px; height:150px; display:block;"> -->
<!-- 						<p>Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu  -->
<!-- 						fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa  -->
<!-- 						qui officia deserunt mollit anim id est laborum.</p> -->
<!-- 						</a> -->
<!-- 					</li> -->
<!-- 					<li> -->
<!-- 						<a href="" id="notice_1"> -->
<!-- 						<img src="./img/news_1.jpg" style=" width:250px; height:150px; display:block;"> -->
<!-- 						<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor  -->
<!-- 						incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud  -->
<!-- 						exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p> -->
<!-- 						</a> -->
<!-- 					</li> -->
<!-- 					<li> -->
<!-- 						<a href="" id="notice_3"> -->
<!-- 						<img src="./img/news_3.jpg" style=" width:250px; height:150px; display:block;"> -->
<!-- 						<p>Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu  -->
<!-- 						fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa  -->
<!-- 						qui officia deserunt mollit anim id est laborum.</p> -->
<!-- 						</a> -->
<!-- 					</li> -->
<!-- 					<li> -->
<!-- 						<a href="" id="notice_1"> -->
<!-- 						<img src="./img/news_1.jpg" style=" width:250px; height:150px; display:block;"> -->
<!-- 						<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor  -->
<!-- 						incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud  -->
<!-- 						exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p> -->
<!-- 						</a> -->
<!-- 					</li> -->
<!-- 					<li> -->
<!-- 						<a href="" id="notice_3"> -->
<!-- 						<img src="./img/news_3.jpg" style=" width:250px; height:150px; display:block;"> -->
<!-- 						<p>Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu  -->
<!-- 						fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa  -->
<!-- 						qui officia deserunt mollit anim id est laborum.</p> -->
<!-- 						</a> -->
<!-- 					</li> -->
				</ul>
			</div>
		</main>
		
	</div>
	<footer id="footer">
		<jsp:include page="../inc/bottom.jsp"></jsp:include>
		<a id="topBtn" style="display:scroll; position:fixed; bottom:50px; right:15px;" href="#" title="맨 위로">
		<img src="./img/arrow_top.png" style="width: 20px; height: 20px"></a>
		<a id="bottomBtn" style="display:scroll; position:fixed; bottom:20px; right:15px;" href="#footer" title="맨 아래로">
		<img src="./img/arrow_bottom.png" style="width: 20px; height: 20px"></a>
	</footer>
</body>
</html>