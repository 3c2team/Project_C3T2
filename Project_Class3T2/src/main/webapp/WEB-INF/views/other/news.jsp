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
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/notice.css">
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.7.0.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/news.js"></script>
<style>

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
				<p>운영 공지</p>
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
				<%-- <c:if test="${{pageInfo.pageNum <= 1 }">disabled</c:if> --%>
					<input type="button" value="이전" onclick="location.href='News?pageNum=${pageInfo.pageNum - 1 }'">
					<a href="News?pageNum=${i }">${i }</a>
					<c:forEach var="i" begin="${pageInfo.startPage }" end="${pageInfo.endPage }">
						<c:choose>
							<c:when test="${pageInfo.pageNum eq i }"> <%-- 현재 페이지일 경우(하이퍼링크 미표시 및 굵게) --%>
								<b>${i }</b>
							</c:when>
							<c:otherwise> <%-- 현재 페이지가 아닐 경우(하이퍼링크 표시) --%>
								<a href="News?pageNum=${i }">${i }</a> 
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<%-- <c:if test="${pageInfo.pageNum >= pageInfo.maxPage }">disabled</c:if> --%>
					<input type="button" value="다음" onclick="location.href='News?pageNum=${pageInfo.pageNum + 1 }'" >
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