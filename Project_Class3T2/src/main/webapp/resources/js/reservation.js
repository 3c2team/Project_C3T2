/**
 * 
 */
$(function(){
	$("#emailDomain").change(function() {
		
		$("#reservation_email2").val($("#emailDomain").val());
		
		if($("#emailDomain").val() == "") { // 직접입력 선택 시
			$("#reservation_email2").focus(); // 커서 요청
			$("#reservation_email2").css("background", ""); // 배경색 초기화
			$("#reservation_email2").removeAttr("readonly"); // 읽기 전용 속성 제거(결과 동일)
		} else {
			// readonly 속성을 true 로 변경(읽기 전용)
			$("#reservation_email2").css("background", "lightgray"); // 배경색 초기화
			$("#reservation_email2").attr("readonly", true); // 읽기 전용으로 변경
		}
	});
 
	$(function () {
	    calendarMaker($("#calendarForm"), new Date());
	});
	
	var nowDate = new Date();
	var selectedDay = "";
	function calendarMaker(target, date) {
	    if (date == null || date == undefined) {
	        date = new Date();
	    }
	    nowDate = date;
	    if ($(target).length > 0) {
	        var year = nowDate.getFullYear();
	        var month = nowDate.getMonth() + 1;
	        $(target).empty().append(assembly(year, month));
	    } else {
	        console.error("날짜 선택 필수!");
	        return;
	    }
	
	    var thisMonth = new Date(nowDate.getFullYear(), nowDate.getMonth(), 1);
	    var thisLastDay = new Date(nowDate.getFullYear(), nowDate.getMonth() + 1, 0);
	
	
	    var tag = "<tr>";
	    var cnt = 0;
	    //빈 공백 만들어주기
	    for (i = 0; i < thisMonth.getDay(); i++) {
	        tag += "<td></td>";
	        cnt++;
	    }
	
	    //날짜 채우기
	    for (i = 1; i <= thisLastDay.getDate(); i++) {
	        if (cnt % 7 == 0) { tag += "<tr>"; }
	
	        tag += "<td>" + i + "</td>";
	        cnt++;
	        if (cnt % 7 == 0) {
	            tag += "</tr>";
	        }
	    }
	    calMoveEvtFn();
	    $(target).find("#reservation_date").append(tag);
	
	    function assembly(year, month) {
	        var calendar_html_code =
	            "<table class='custom_calendar_table'>" +
	            "<colgroup>" +
	            "<col style='width:70px'/>" +
	            "<col style='width:70px'/>" +
	            "<col style='width:70px'/>" +
	            "<col style='width:70px'/>" +
	            "<col style='width:70px'/>" +
	            "<col style='width:70px'/>" +
	            "<col style='width:70px'/>" +
	            "</colgroup>" +
	            "<thead class='cal_date'>" +
	            "<th><button type='button' class='prev'><</button></th>" +
	            "<th colspan='5'><span id='select_year' name='select_year'>" + year + "</span>년 <span id='select_month' name='select_month'>" + month + "</span>월</th>" +
	            "<th><button type='button' class='next'>></button></th>" +
	            "</thead>" +
	            "<thead class='cal_week'>" +
	            "<th>일</th><th>월</th><th>화</th><th>수</th><th>목</th><th>금</th><th>토</th>" +
	            "</thead>" +
	            "<tbody id='reservation_date' name='reservation_date'>" +
	            "</tbody>" +
	            "</table>";
	        return calendar_html_code;
	    }
	
	    function calMoveEvtFn() {
	        // 전달 클릭
	        $(".custom_calendar_table").on("click", ".prev", function () {
	            nowDate = new Date(nowDate.getFullYear(), nowDate.getMonth() - 1, nowDate.getDate());
	            calendarMaker($(target), nowDate);
	        });
	        // 다음날 클릭
	        $(".custom_calendar_table").on("click", ".next", function () {
	            nowDate = new Date(nowDate.getFullYear(), nowDate.getMonth() + 1, nowDate.getDate());
	            calendarMaker($(target), nowDate);
	        });
	        // 일자 선택 클릭
	        $(".custom_calendar_table").on("click", "td", function () {
	            $(".custom_calendar_table .select_day").removeClass("select_day");
	            $(this).removeClass("select_day").addClass("select_day");
	            
//	            // 변수에 연, 월, 일 저장
	            let selectYear = $("#select_year").text();
	            let selectMonth = $("#select_month").text();
	            let selectDay = $(".select_day").text();
	            
	            selectedDay = selectYear + "-" +(("00"+selectMonth.toString()).slice(-2))+"-"+(("00"+selectDay.toString()).slice(-2)); // 연월일 불러오기
				console.log("예약일자 : " + selectedDay);
				$("#reservation_date").val(selectedDay);
//	//			alert(selectedDay);
				
	        });
	        
	    }
	    
	}
});

//$(document).ready( function()
//{
//	var bMove = false;
//	var startX = 0;
//	var scrollLeft = 0;
//	var slider = document.querySelector(".contents");
//
//	slider.addEventListener("mousedown", function(e){
//		bMove = true;
//		startX = e.pageX - slider.offsetLeft;
//		scrollLeft = slider.scrollLeft;
//	});
//
//	slider.addEventListener("mouseleave", function(){
//		bMove = false;
//	});
//
//	slider.addEventListener("mouseup", function(){
//		bMove = false;
//	});
//
//	slider.addEventListener("mousemove", function(e){
//		if( bMove )
//		{
//			const x = e.pageX - slider.offsetLeft;
//			const walk = x - startX;
//			slider.scrollLeft = scrollLeft - walk;
//		}
//	});
//} );
//
//$(document).ready( function()
//{
//	var bMove = false;
//	var startX = 0;
//	var scrollLeft = 0;
//	var slider = document.querySelector(".contents2");
//
//	slider.addEventListener("mousedown", function(e){
//		bMove = true;
//		startX = e.pageX - slider.offsetLeft;
//		scrollLeft = slider.scrollLeft;
//	});
//
//	slider.addEventListener("mouseleave", function(){
//		bMove = false;
//	});
//
//	slider.addEventListener("mouseup", function(){
//		bMove = false;
//	});
//
//	slider.addEventListener("mousemove", function(e){
//		if( bMove )
//		{
//			const x = e.pageX - slider.offsetLeft;
//			const walk = x - startX;
//			slider.scrollLeft = scrollLeft - walk;
//		}
//	});
//} );
