<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>J'ai Faim</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/slide.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/top.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bottom.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/default.css">
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.7.0.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/event.js"></script>
<style>
.links li:nth-child(1) {
	opacity: .6; /* 불투명도 */
}

.links li:nth-child(1):hover {
	opacity: 1;
}

.links li:nth-child(2) {
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
</head>
<body>
	<div>
		<header>
			<jsp:include page="../inc/top.jsp"></jsp:include>
		</header>
		<main>
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
				</ul>
			</div>
		</main>
	</div>
	<footer id="footer">
		<jsp:include page="../inc/bottom.jsp"></jsp:include>
		<a id="topBtn" style="display:scroll; position:fixed; bottom:50px; right:15px;" href="#" title="맨 위로">
		<img src="./img/arrow_top.png" style="width: 20px; height: 20px"></a>
		<a style="display:scroll; position:fixed; bottom:20px; right:15px;" href="#footer" title="맨 아래로">
		<img src="./img/arrow_bottom.png" style="width: 20px; height: 20px"></a>
	</footer>
</body>
</html>