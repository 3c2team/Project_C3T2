/**
 * 
 */
 
// ------------ 변수 --------------
// --------------------------------
 
// ------------ functions --------------
// --- 달력 관련 ---
function calendarMaker(target, date) {
	var nowDate = new Date();
	var thisMonth = new Date(nowDate.getFullYear(), nowDate.getMonth(), 1);
	var thisLastDay = new Date(nowDate.getFullYear(), nowDate.getMonth() + 1, 0);

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
	
	//
	calMoveEvtFn();
	$(target).find("#customSetDate").append(tag);
}


function calMoveEvtFn() {
    // 전달 클릭
    $(".custom_calendar_table").on("click", ".prev", function () {
        nowDate = new Date(nowDate.getFullYear(), nowDate.getMonth() - 1, nowDate.getDate());
		calendarMaker($('#calendarForm'), nowDate);
		
    });
    // 다음날 클릭
    $(".custom_calendar_table").on("click", ".next", function () {
        nowDate = new Date(nowDate.getFullYear(), nowDate.getMonth() + 1, nowDate.getDate());
        calendarMaker($('#calendarForm'), nowDate);
    });
    // 일자 선택 클릭
    $(".custom_calendar_table").on("click", "td", function () {
        $(".custom_calendar_table .select_day").removeClass("select_day");
        $(this).removeClass("select_day").addClass("select_day");
        
        validationCheck();
    });
}

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
	    "<tbody id='customSetDate' name='reservation_date'>" +
	    "</tbody>" +
	    "</table>";
	    
	
	
	return calendar_html_code;
}
//- ------------------------------------------------
// ---------- 날짜, 인원수 ajax로 체크 -----------
function validationCheck(){
	
	// 연, 월, 일 저장
    let selectYear = $("#select_year").text();
    let selectMonth = $("#select_month").text();
    let selectDay = $(".select_day").text();
    
    // 연월일 합쳐서 저장
    let selectedDay = selectYear + "-" +(("00" + selectMonth.toString()).slice(-2))+"-"+(("00" + selectDay.toString()).slice(-2)); // 연월일 불러오기
	$("#reservation_date").val(selectedDay);
	
	// 인원수 저장
	let count = $('input[name=reservation_person_count]:checked').val();
	$("#reservation_person_count").val(count);	
	
	
	// 인원수 받아서 disable 걸기
	$.ajax({
		type: "GET",
		url: "ReservationSchedule",
		data: {
			'selectedDay' : selectedDay,
			'count' : count
//			reservation_date, // 예약날짜 reservation_date
//			reservation_person_count // 예약인원 reservation_person_count
		},
		dataType: "JSON", // 리턴타입
		success: function(data) { // 불가능 시간 배열
			if(data.length < 1) return;
			
			// 전부 diabled 해제
			$.each($("input[name=reservation_time]"), (i, e) => {
				$(e).attr('disabled', false);	
			})

			// 예약 불가 시간만 disabled true			
			data.forEach((e, i) => {
				let time = e.RESERVATION_TIME;
				$.each($("input[name=reservation_time]"), (i2, e2) => {
					if(time === e2.dataset.value){
						$(e2).attr('disabled', true);
					}
				});
			});
		}
	});	
}


function emailEvtFn() {
			
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
}
 // -------------------------------------
 
 // ----------- DOM 랜더링 이후 ---------------
$(function(){
	calendarMaker($("#calendarForm"), new Date());	// 달력만들기
	$("#emailDomain").change(emailEvtFn);	// 이메일 이벤트
	$('.form_radio_btn1').on("change", validationCheck); // 인원수 이벤트
	
})
// ------------------------------
 /* TODO
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
	    personCountEvtFn();
	    
	    
	    $(target).find("#customSetDate").append(tag);
	
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
	            "<tbody id='customSetDate' name='reservation_date'>" +
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
	            
	            // 변수에 연, 월, 일 저장
	            let selectYear = $("#select_year").text();
	            let selectMonth = $("#select_month").text();
	            let selectDay = $(".select_day").text();
	            
	            selectedDay = selectYear + "-" +(("00"+selectMonth.toString()).slice(-2))+"-"+(("00"+selectDay.toString()).slice(-2)); // 연월일 불러오기
				$("#reservation_date").val(selectedDay);
	        });
	    }
	    
	    function personCountEvtFn(){
			$('.form_radio_btn1').on("click", function(){
				debugger;
			});
		}
	    
	}
});
*/
