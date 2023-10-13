<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<h1 id="pageTitle">예약 확인</h1>
<div class="reservation_confirm_container">
	<div class="reservation_confirm_term">
		<div id="reservation_confirm_term_left">
			<p>기간 조회</p>
			<div id="">
				<input type="radio" name="selPeriod" id="aa0" value="1개월">
				<label for="aa0"><span>1개월</span></label>
				<input type="radio" name="selPeriod" id="aa1" value="3개월">
				<label for="aa1"><span>3개월</span></label>
				<input type="radio" name="selPeriod" id="aa2" value="6개월">
				<label for="aa2"><span>6개월</span></label>
			</div>
		</div>
		<div id="reservation_confirm_term_right">
			<div class="calander_wrap">
				<input type="date">-<input type="date">
				<button id="searchBtn">조회</button>
			</div>
		</div>
	</div>
		<ul>
			<li>최대 6개월 단위로 조회가능</li>
		</ul>
		<div id="">
			<p>
				예약 내역이 없습니다.
			</p>
		</div>
</div>
