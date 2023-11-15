/**
 * 
 */
 
// ------------ 변수 --------------
let nowDate = new Date();
// --------------------------------
 
// ------------ functions --------------
// --- 달력 관련 ---
function calendarMaker(target, date) {
	let thisMonth = new Date(nowDate.getFullYear(), nowDate.getMonth(), 1);
	let thisLastDay = new Date(nowDate.getFullYear(), nowDate.getMonth() + 1, 0);
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
	
	let tag = "<tr>";
	var cnt = 0;
	//빈 공백 만들어주기
	for (i = 0; i < thisMonth.getDay(); i++) {
	    tag += "<td></td>";
	    cnt++;
	}
	
	//날짜 채우기
	for (i = 1; i <= thisLastDay.getDate(); i++) {
		
		
	    if (cnt % 7 == 0) { tag += "<tr>"; }
		if(i == nowDate.getDate() + 1){ // 1일전까지만 예약가능
		    tag += "<td class='select_day'>" + i + "</td>";
		} else {
			let thisId = thisMonth.getFullYear() + "-" + (thisMonth.getMonth() + 1) + "-" + (i < 10 ? "0" + i : i);
			let thisDay = new Date(thisId);
			let today = new Date();
			today.setHours(9);
			today.setMinutes(0);
			today.setSeconds(0);
			
			let diferrenceDay = parseInt((thisDay - today) / 1000) * 1000;
			
			if(diferrenceDay < 1) {
				tag += "<td id=" + thisId + " class='noClick'>" + i + "</td>";
			} else {
				tag += "<td id=" + thisId + ">" + i + "</td>";
			}
		   
		}
	    cnt++;
	    if (cnt % 7 == 0) {
	        tag += "</tr>";
	    }
	}
	
	
	//
	$(target).find("#customSetDate").append(tag);
	calMoveEvtFn();
}


function calMoveEvtFn() {
    // 이전달 클릭
    $(".custom_calendar_table").on("click", ".prev", function () {
        nowDate = new Date(nowDate.getFullYear(), nowDate.getMonth() - 1, nowDate.getDate());
		calendarMaker($("#calendarForm"), nowDate);
		$(".custom_calendar_table .select_day").addClass("noClick");
		$(".custom_calendar_table .noClick").removeClass("select_day");
		$(".custom_calendar_table .noClick").readOnly=true;
		$(".custom_calendar_table .noClick").disable=true;
    });
    // 다음달 클릭
    $(".custom_calendar_table").on("click", ".next", function () {
        nowDate = new Date(nowDate.getFullYear(), nowDate.getMonth() + 1, nowDate.getDate());
        calendarMaker($("#calendarForm"), nowDate);
    });
    // 일자 선택 클릭
    $(".custom_calendar_table").on("click", "td", function () {
		if(!$(this).hasClass("noClick")) {
	        $(".custom_calendar_table .select_day").removeClass("select_day");
	        $(this).removeClass("select_day").addClass("select_day");
		}
		$("noClick").readOnly=true;
        
        validationCheck();
    });
    $("input:radio[name='reservation_person_count']").on("click", function(){
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
	$("#reservation_date").text(selectedDay);
	
	// 인원수 저장
	let count = $('input[name=reservation_person_count]:checked').val();
	$("#reservation_person_count").val(count);        
	$("#reservation_person_count").text(count);        
	
	let time = $('input[name=reservation_time]:checked').val();
	$("#reservation_time").val(time);
	$("#reservation_time").text(time);
	
	let arr = dinningMax;
	
	if(arr.indexOf(Number(count)) == -1){
        for (let cnt of arr) {
            if(count < cnt){
                count = cnt;
                break;
            }
        }        
	}
	$("#cal_count").val(count);
	
    // 인원수 받아서 disable 걸기
	$.ajax({
		type: "GET",
		url: "ReservationSchedule",
		data: {
		        'selectedDay' : selectedDay,
		        'count' : count
		},
		dataType: "JSON", // 리턴타입
		success: function(data) { // 불가능 시간 배열
		
			// 전부 diabled 해제
			$.each($("input[name=reservation_time]"), (i, e) => {
				$(e).attr('disabled', false);        
			})
//			$('input:radio[name=reservation_time]').eq(0).attr("checked", true);

			
			if(data.length < 1) return;
			
			// 예약 불가 시간만 disabled true                        
			data.forEach((e, i) => {
		        let time = e.RESERVATION_TIME;
		        $.each($("input[name=reservation_time]"), (i2, e2) => {
	                if(time === e2.value){
                        $(e2).attr('disabled', true);
	                }
//					$("input:radio[name='reservation_time']").attr('checked', false);
//					$("input:radio[name='reservation_person_count']").attr('checked', false);
		        });
			});
		}
	});        
}


function emailEvtFn() {
                        
    var getMail = RegExp(/^[A-Za-z0-9_.-]+/);
    var getMailDomain = RegExp(/^[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+/);
    
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
	
	// 이메일 공백 확인
    if($("#reservation_email1").val() == ""){
        alert("이메일을 입력해주세요.");
        $("#reservation_email1").focus();
        return false;
    }
           
           
	// 이메일 유효성 검사
    if(!getMail.test($("#reservation_email1").val())){
        alert("이메일 형식에 맞게 입력해주세요.")
        $("#reservation_email1").val("");
        $("#reservation_email1").focus();
        return false;
      }
      
	// 이메일 유효성 검사
    if(!getMailDomain.test($("#reservation_email2").val())){
        alert("이메일 형식에 맞게 입력해주세요.")
        $("#reservation_email2").val("");
        $("#reservation_email2").focus();
        return false;
    }
    return true;
}
 // -------------------------------------
 
 // ----------- DOM 랜더링 이후 ---------------
$(function(){
	calendarMaker($("#calendarForm"), new Date());        // 달력만들기
	$("#emailDomain").change(emailEvtFn);        // 이메일 이벤트
	$('.form_radio_btn1').on("change", validationCheck()); // 인원수 이벤트
})

