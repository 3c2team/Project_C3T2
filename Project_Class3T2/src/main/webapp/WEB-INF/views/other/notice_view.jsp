<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%-- JSTL 에서 제공하는 메서드(함수)를 사용하기 위해 functions 라이브러리 추가 --%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>J'ai Faim</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/top.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bottom.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/default.css">
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.7.0.js"></script>
<style>
#all {
	margin-left: 18%;
	margin-right: 0;
}

h2 {
	font-size: 2em;
	font-weight: bold;
	margin-bottom: 3%;
}

h1 {
	font-size: 1.5em;
	text-align: center;
	margin-right: 18%;
}
p {
	margin-left: 34%;
}
#articleContentArea{
	text-align: center;
	margin-right: 18%;
}
#list {
	margin-left: 76%;
	padding: 1% 1% 1% 1%;
}
</style>
<script type="text/javascript">
$(document).ready(function() {
    if(${notice.notice_num_pre} == 0) {
    	$('#pre').attr('disabled', 'disabled');
    	$("#preMent").prepend("등록된 게시글이 없습니다.");
    }
    if(${notice.notice_num_next} == 0) {
    	$('#next').attr('disabled', 'disabled');
    	$("#nextMent").prepend("등록된 게시글이 없습니다.");
    }
});
</script>
</head>
<body>
	<header>
		<jsp:include page="../inc/top.jsp"></jsp:include>
	</header>
	<section id="all">
		<section id="articleForm">
			<h2>공지사항</h2>
			<hr style="margin-right: 20%;">
			<section id="basicInfoArea">
			<h1>${notice.notice_subject }</h1>
			<p>관리자 &nbsp|&nbsp <fmt:formatDate value="${notice.notice_date }" pattern="yyyy.MM.dd"/> &nbsp|&nbsp 조회수 ${notice.notice_readcount }</p>
			</section>
			<section id="articleContentArea" style="width: 67vw;"> <%-- 본문이 표시될 영역 --%>
				<pre style="width: 64vw; white-space: pre-line;">${notice.notice_content }</pre>
			</section>
		</section>
		<section id="commandList">
			<hr style="margin-left: -2%; width: 67vw;">
			<div style="height: 10vh; width: 67vw; display: inline-block;">
				<div style="display: inline-block; float: left;">
					<h3 id="preMent"><a href="NoticeDetail?notice_num=${noticePre.notice_num} &pageNum=${param.pageNum}">${noticePre.notice_subject }</a>
					<br>
					<input type="button" id="pre" value="이전글" onclick="location.href='NoticeDetail?notice_num=${noticePre.notice_num }&pageNum=${param.pageNum}'"></h3>
				</div>
<!-- 				<div style="display: absolute;"> -->
<!-- 					<h1 style="margin-right: 0;">|</h1> -->
<!-- 				</div> -->
				<div style="display: inline-block; float: right; margin-right: 5%;">
					<h3 id="nextMent"><a href="NoticeDetail?notice_num=${noticeNext.notice_num }&pageNum=${param.pageNum}">${noticeNext.notice_subject }</a>
					<br>
					<input type="button" id="next" value="다음글" style="float:right;" onclick="location.href='NoticeDetail?notice_num=${noticeNext.notice_num }&pageNum=${param.pageNum}'"></h3>
				</div>
			</div>
			<hr style="margin-left: -2%; width: 67vw;">
			<input type="button" id="list" value="목록" onclick="location.href='News?pageNum=${param.pageNum}'">
		</section>
	</section>
	<footer id="footer">
		<jsp:include page="../inc/bottom.jsp"></jsp:include>
		<a id="topBtn" style="display:scroll; position:fixed; bottom:50px; right:15px;" href="#" title="맨 위로">
		<img src="${pageContext.request.contextPath }/resources/main_img/arrow_top.png" style="width: 20px; height: 20px"></a>
		<a style="display:scroll; position:fixed; bottom:20px; right:15px;" href="#footer" title="맨 아래로">
		<img src="${pageContext.request.contextPath }/resources/main_img/arrow_bottom.png" style="width: 20px; height: 20px"></a>
	</footer>
</body>
</html>