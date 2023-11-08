<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<li>
	<span>회원 등급</span><br>
	<em> SILVER</em>
</li>
<li>
	<span>스토어 포인트</span><br>
	<em>   <fmt:formatNumber  value="${loginUser.member_point}"     />  P</em>
</li>
