<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/default.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/mypage.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/top.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bottom.css">
</head>
<body>
<header>
	<jsp:include page="../inc/top.jsp"></jsp:include>
</header>
	<main>	
	<div id="main_layout">
		<div class="mypageBox" id="mypage_dashboard">
			<span id="mypage_dashboard_info">
				<span id="col_1">
					<span>
						<jsp:include page="../inc/mypage_col_1.jsp" />
					</span>	
				</span>
				<span id="col_2">
					<ul>
						<jsp:include page="../inc/mypage_col_2.jsp" />
					</ul>
				</span>
			</span>
		</div>
		<div id="mypage_container">
				<div class="mypageBox" id="mypage_sideMenu">
					<nav class="menu">
						<jsp:include page="../inc/mypage_box.jsp" />
					</nav>
				</div>
				<div class ="mypageContents">
					<div align="center">
					<h2>회원 상세정보</h2><br><br>
					</div>
					<article>
					    <table border="1">
					        <thead>
					            <tr>
					                <th>회원 이름</th>
					                <td>${Member.member_name}</td>
					            </tr>
					            <tr>
					                <th>회원 ID</th>
					                <td>${Member.member_id}</td>
					            </tr>
					            <tr>
					                <th>주소</th>
					                <td>${Member.member_address}</td>
					            </tr>
					            <tr>
					                <th>이메일</th>
					                <td>${Member.member_email}</td>
					            </tr>
					            <tr>
					                <th>가입 날짜</th>
					                <td>${Member.member_insert_date}</td>
					            </tr> 
					            <tr>
					                <th>전화번호</th>
					                <td>${Member.member_phone_num}</td>
					             </tr>
					             <tr>
					                <th>생일</th>
					                <td>${Member.member_birth}</td>
					              </tr>
					              <tr>
					                <th>성별</th>
					                <td>${Member.member_gender}</td>
					              </tr>
					        	</thead>
					    	</table>
					    </article>
					   <input type="submit" value="정보 수정">
				<br><br>
			</div>
		</div>
	</div>
	</main>
<footer id="footer">
	<jsp:include page="../inc/bottom.jsp"></jsp:include>
</footer>
</body>
</html>