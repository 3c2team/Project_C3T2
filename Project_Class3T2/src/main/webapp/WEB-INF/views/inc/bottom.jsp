<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="${pageContext.request.contextPath }/css/bottom.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/css/default.css" rel="stylesheet" type="text/css">
<script>
$(document).ready(function(){
   $.ajax({
        type: "GET",
        url: "Bottom",
        data: {},
        success: function (response) {
        	$('#logo').append(response.restaurant_name);
        	$('#name').append(response.restaurant_name);
        	$('#address').append(response.restaurant_address);
        	$('#ceo').append(response.ceo_name);
        	$('#call').append(response.restaurant_call);
        }
    })
});
</script>
	<div id="bottomArea">
		<div id="bottomLogoArea">
			<div id="sns" >
				<a href="https://www.facebook.com/itwill.busan">
					<img src="${pageContext.request.contextPath }/resources/main_img/facebook.png" title="페이스북 아이콘" width="40" height="40" align="right">
				</a>
				<a href="https://www.instagram.com/itwillbusan_official/">
					<img src="${pageContext.request.contextPath }/resources/main_img/instagram.png" title="인스타그램 아이콘" width="40" height="40" align="right">
				</a>
				<a href="https://blog.naver.com/itwillbusan01">
					<img src="${pageContext.request.contextPath }/resources/main_img/call.png" title="전화 아이콘" width="40" height="40" align="right">
				</a>
				<a href="https://cafe.naver.com/learntimes">
					<img src="${pageContext.request.contextPath }/resources/main_img/twitter.png" title="트위터 아이콘" width="40" height="40" align="right">
				</a>
			<a id="logo"></a>
			</div>
		</div>
		<div id="company">
			<ul>
				<li><a>이용약관</a> | <a>개인정보처리방침</a></li>
				<li><a id="name"></a> | <a id="address"></a></li>
				<li><a id="ceo">대표이사 : </a> | <a>사업자번호 : 190275438</a></li>
				<li><a href="" id="call">(+82) </a> | <a>info@jaifaim.com</a></li>
			</ul>
		</div>
	</div>
