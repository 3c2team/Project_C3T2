<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="URI" value="${pageContext.request.requestURI}" /> 


<div id="menu">
	<ul>
		<li><a href="MypageDashboard" class="${fn:contains(URI,'dashboard') ? 'active':''}">
			<b>마이페이지 홈</b></a>
		</li>
	</ul>
	<p><b>상품 구매</b></p>
	<ul>
		<li><a href="MypageBuyList" class="${fn:contains(URI,'buy_check') ? 'active':''}">상품 구매 내역</a></li>
	</ul>
</div>
<div id="menu">
	<p><b>나의 주문정보</b></p>
	<ul>
		<li><a href="MypageReservationList" class="${fn:contains(URI,'reservation_ask') ? 'active':''}">예약 조회</a></li>
	</ul>
</div>
<div id="menu">
	<p><b>나의 신상정보</b></p>
	<ul>
		<li><a href="MypageDetail" class="${fn:contains(URI,'mypage_detail') ? 'active':''}">나의 상세정보</a></li>
	</ul>
</div>
<div id="menu">
	<p><b>나의 활동정보</b></p>
	<ul>
		<li><a href="MypageGoodsReview" class="${fn:contains(URI,'goods_review') ? 'active':''}">상품 리뷰</a></li>
	</ul>
</div>
<div id="menu">
	<p><b>나의 관심정보</b></p>
	<ul>
		<li><a href="MypageBasket" class="${fn:contains(URI,'basket') ? 'active':''}">장바구니</a></li>
		<li><a href="MypageZzim" class="${fn:contains(URI,'zzim') ? 'active':''}">찜</a></li>
	</ul>
</div>
<div id="menu">
	<p><b>나의 정보 관리</b></p>
	<ul>
		<li><a href="MypageMemberModify" class="${fn:contains(URI,'member_modify') ? 'active':''}">개인정보 수정</a></li>
		<li><a href="MypagePasswdChange" class="${fn:contains(URI,'passwd_change') ? 'active':''}">비밀번호 변경</a></li>
		<li><a href="MypageMemberOut" class="${fn:contains(URI,'member_out') ? 'active':''}">회원 탈퇴</a></li>
	</ul>
</div>