<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>J'ai Faim</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/slide.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/top.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bottom.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/default.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/event_popup.css">
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
			<div class="slideBox">
                <div class="slider">
                    <div class="slides">
                        <input type="radio" name="radio-btn" id="radio1">
                        <input type="radio" name="radio-btn" id="radio2">
                        <input type="radio" name="radio-btn" id="radio3">
                        <input type="radio" name="radio-btn" id="radio4">
                        
                        <div class="slide first">
                            <img src="${pageContext.request.contextPath }/resources/main_img/main.jpg" alt="">
                        </div>
                        
                        <div class="slide">
                            <img src="${pageContext.request.contextPath }/resources/main_img/table_setting.jpg" alt="">
                        </div>
                        
                        <div class="slide">
                            <img src="${pageContext.request.contextPath }/resources/main_img/platter1.jpg" alt="">
                        </div>
                        
                        <div class="slide">      
                            <img src="${pageContext.request.contextPath }/resources/main_img/steak1.jpg" alt="">
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
						<a href="News" id="notice">운영공지</a>
					</li>
					<li>
						<a href="Event" id="event">이벤트</a>
					</li>
				</ul>
<%-- 				<h1>${eventList.event_num }</h1> --%>
				<ul class="event" style="margin: 5px 0 5px 100px;">
					<c:forEach var="event" items="${eventList }">
						<li>
							<a href="EventDetail?event_num=${event.event_num }&pageNum=${pageNum }">
								<img src="${saveDir }${event.event_image }" style="width:41%; height:180px; object-fit: cover;">
							</a>
							<a href="EventDetail?event_num=${event.event_num }&pageNum=${pageNum }">${event.event_subject }</a>
						</li>
					</c:forEach>
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