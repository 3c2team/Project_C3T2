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
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.7.0.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/news.js"></script>
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
article h1 {
	text-align: center;
}

#listForm {
	width: 1724px;
	max-height: 610px;
	margin: auto;
}

h2 {
	text-align: center;
}

table {
	margin: auto;
	width: 1724px;
}

#tr_top {
	background: lightgray;
	text-align: center;
}

table td {
	text-align: center;
}


#pageList {
	margin: auto;
	width: 1724px;
	text-align: center;
}

#emptyArea {
	margin: auto;
	width: 1724px;
	text-align: center;
}

#buttonArea {
	margin: auto;
	width: 1715px;
	text-align: right;
	margin-bottom: 20px;
}

/* 제목 좌측 정렬 및 여백(20px) 설정 */
#subject {
	text-align: left;
	padding-left: 20px;
	
	/* 제목 길이 제한(잘린 부분은 ... 표시) */
	max-width: 450px;
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
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
				<section id="buttonArea">
					<form action="News">
						<select name="searchType">
							<option value="subject" <c:if test="${param.searchType eq 'subject' }">selected</c:if>>제목</option>
							<option value="content" <c:if test="${param.searchType eq 'content' }">selected</c:if>>내용</option>
							<option value="subject_content" <c:if test="${param.searchType eq 'subject_content' }">selected</c:if>>제목&내용</option>
						</select>
						<input type="text" name="searchKeyword" value="${param.searchKeyword }">
						<input type="submit" value="검색">
					</form>
				</section>
				<section id="listForm">
					<table>
						<tr id="tr_top">
							<th width="100px">번호</th>
							<th>제목</th>
							<th width="150px">작성자</th>
							<th width="150px">날짜</th>
							<th width="100px">조회수</th>
						</tr>
						<c:forEach var="notice" items="${noticeList }">
							<tr>
								<td>${notice.notice_num }</td>
								<td id="subject">
									<%-- 제목 하이퍼링크 추가(BoardDetail.bo), 파라미터 : 글번호, 현재페이지번호 --%>
									<a href="NoticeDetail?notice_num=${notice.notice_num }&pageNum=${pageNum }">${notice.notice_subject }</a>
								</td>
								<td>관리자</td>
								<td>
									<fmt:formatDate value="${notice.notice_date }" pattern="yy-MM-dd HH:mm"/>
								</td>
								<td>${notice.notice_readcount }</td>
							</tr>
						</c:forEach>
					</table>
				</section>
				<section id="pageList">
					<c:choose>
						<c:when test="${pageNum > 1 }"> <%-- 현재 페이지가 1보다 클 경우(버튼 동작) --%>
							<input type="button" value="이전" onclick="location.href='News?pageNum=${pageNum - 1 }'">
						</c:when>
						<c:otherwise> <%-- 현재 페이지 1 페이지보다 크지 않을 경우(버튼 비활성화) --%>
							<input type="button" value="이전" disabled>
						</c:otherwise>
					</c:choose>
					<c:forEach var="i" begin="${pageInfo.startPage }" end="${pageInfo.endPage }">
						<c:choose>
							<c:when test="${pageNum eq i }"> <%-- 현재 페이지일 경우(하이퍼링크 미표시 및 굵게) --%>
								<b>${i }</b>
							</c:when>
							<c:otherwise> <%-- 현재 페이지가 아닐 경우(하이퍼링크 표시) --%>
								<a href="News?pageNum=${i }">${i }</a> 
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:choose>
						<c:when test="${pageNum < pageInfo.maxPage }"> <%-- 현재 페이지가 1보다 클 경우(버튼 동작) --%>
							<input type="button" value="다음" onclick="location.href='News?pageNum=${pageNum + 1 }'">
						</c:when>
						<c:otherwise> <%-- 현재 페이지 1 페이지보다 크지 않을 경우(버튼 비활성화) --%>
							<input type="button" value="다음" disabled>
						</c:otherwise>
					</c:choose>
				</section>
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