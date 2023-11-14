<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.7.0.js"></script>
<script type="text/javascript">
$.ajax({
	type: "POST",
	url: "MemberPoint",
	data: {
		
	},
	success: function(point) {
		$("#point").text(point+"p");
	},
	error:function(){
		alert("실패");
	}
});
</script>
<li>
	<span>회원 등급</span><br>
	<em> GOLD</em>
</li>
<li>
	<span>스토어 포인트</span><br>
	<span id="point"></span>
</li>
</html>