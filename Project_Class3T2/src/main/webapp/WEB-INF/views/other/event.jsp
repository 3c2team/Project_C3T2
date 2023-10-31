<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>J'ai Faim</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/top.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bottom.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/default.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/event.css">
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.7.0.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/event.js"></script>
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
						<a href="Event" id="event" style="margin-left: 20px;">이벤트</a>
					</li>
				</ul>
				<div class="">
					<ul class="event">
						<c:forEach var="event" items="${eventList }">
							<li>
								<a href="EventDetail?event_num=${event.event_num }&pageNum=${pageNum }">
<%-- 									<img src="${saveDir }${event.event_image }"> --%>
 									<img src="${pageContext.request.contextPath }/resources/main_img/platter1.jpg">
								</a>
								<a href="EventDetail?event_num=${event.event_num }&pageNum=${pageNum }">${event.event_subject }</a>
							<p class="tx_brief"><fmt:formatDate value="${event.event_date }" pattern="yyyy-MM-dd"/></p>
							</li>
						</c:forEach>
					</ul>
				</div>
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