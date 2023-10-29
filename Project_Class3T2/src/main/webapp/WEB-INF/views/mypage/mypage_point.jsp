<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="./include/head.jsp"%>
<title>마이페이지-회원 상세정보</title>
<style>
table{width:100%; border: none;}
table, th, td {border-collapse : collapse;}
th,td{border: 1px solid #000;vertical-align : middle;height: 60px;}
th{border-left:none;}
td{border-right:none;}
input, select{height:30px;}
td{text-align: left; padding: 5px;}
#btnSearchAddress, button{cursor: pointer;}
</style>
</head>
<body>
<body>

	<%@ include file="./include/body_top.jsp"%>


	<div class="mypageContents">
		<div align="center">
			<h2>회원 상세정보</h2>
			<br>
			<br>
		</div>
		<article>
			<table >
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
						<td>${Member.member_e_mail}</td>
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
						<td>${Member.member_birth_day}</td>
					</tr>
					<tr>
						<th>성별</th>
						<td>${Member.member_gender}</td>
					</tr>
				</thead>
			</table>
		</article>
		<div class="text-center">
			<button type="button" class="mt30" onclick="location.href='MypageMemberModify'"> 정보 수정 </button> <br>
		</div>
		<br>
	</div>


	<%@ include file="./include/body_bottom.jsp"%>
</body>
</html>