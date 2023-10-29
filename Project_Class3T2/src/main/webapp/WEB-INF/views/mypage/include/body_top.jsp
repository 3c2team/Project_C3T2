<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<header>
	<%@ include file="../../inc/top.jsp"%>
</header>

<main>
	<div id="main_layout">
		<div class="mypageBox" id="mypage_dashboard">
			<span id="mypage_dashboard_info"> <span id="col_1">
				<span> 
					<%@ include file="../../inc/mypage_col_1.jsp"%>
				</span>
			</span> <span id="col_2">
					<ul>
						<%@ include file="../../inc/mypage_col_2.jsp"%>
					</ul>
			</span>
			</span>
		</div>
		<div id="mypage_container">
			<div class="mypageBox" id="mypage_sideMenu">
				<nav class="menu">
					<%@ include file="../../inc/mypage_box.jsp"%>
				</nav>
		</div>