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

if (${notice.notice_num })
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
			<section id="articleContentArea"> <%-- 본문이 표시될 영역 --%>
				<pre>${notice.notice_content }</pre>
			</section>
		</section>
		<section id="commandList">
			<hr>
			<a href="NoticeDetail?notice_num=${notice.notice_num - 1} &pageNum=1">${notice.notice_subject }</a>
			<input type="button" value="이전글" onclick="location.href='NoticeDetail?notice_num=${notice.notice_num -1 }&pageNum=1'">
			<h1>|</h1>
			<a href="NoticeDetail?notice_num=${notice.notice_num + 1 }&pageNum=1">${notice.notice_subject }</a>
			<input type="button" value="다음글" onclick="location.href='NoticeDetail?notice_num=${notice.notice_num + 1 }&pageNum=1'">
			<hr>
			<input type="button" id="list" value="목록" onclick="location.href='News?pageNum=${param.pageNum}'">
		</section>
	</section>
	<footer id="footer">
		<jsp:include page="../inc/bottom.jsp"></jsp:include>
		<a id="topBtn" style="display:scroll; position:fixed; bottom:50px; right:15px;" href="#" title="맨 위로">
		<img src="./img/arrow_top.png" style="width: 20px; height: 20px"></a>
		<a style="display:scroll; position:fixed; bottom:20px; right:15px;" href="#footer" title="맨 아래로">
		<img src="./img/arrow_bottom.png" style="width: 20px; height: 20px"></a>
	</footer>
</body>
</html>