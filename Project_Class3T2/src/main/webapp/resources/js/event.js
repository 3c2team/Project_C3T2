// 화면로딩전
let counter = 1;

setInterval(function(){
	document.getElementById('radio' + counter).checked = true;
	counter++;
	if(counter > 4) {
		counter = 1;
	}
}, 4000);



$(function(){
	
	// 보이기 | 숨기기 
	$(window).scroll(scrollEvent);
	
	// 슬라이드 counter 동기화
	$('.manualBtn').on('click', (e) => counter = $(e.target).attr('for').replace("radio", ""));
});

// functions
function scrollEvent() {
	let scroll = $(this).scrollTop();
	if(scroll == 0){
		$('#topBtn').fadeOut();
		$('#bottomBtn').fadeIn();
	} else if(scroll > 270){
		$('#topBtn').fadeIn();
		$('#bottomBtn').fadeOut();
	} else {
		$('#topBtn').fadeIn();
		$('#bottomBtn').fadeIn();
	}
}

// AJAX + JSON 을 활용한 게시물 목록 무한 스크롤 구현
// 페이지 번호값 미리 저장(스크롤 목록 페이지 번호)
let pageNum = "${param.pageNum}"; // 파라미터 페이지번호 가져와서 저장
if(!pageNum) { // 페이지번호가 없을 경우 기본값 1로 설정
	pageNum = "1";
}
let endPage = "";
$(function() {
	$(window).scroll(function() { // 윈도우 스크롤 이벤트 처리
// 			console.log("window scroll");
		// 1. window 객체와 document 객체를 활용하여 스크롤 관련 값 가져와서 제어
		// => 스크롤바 현재 위치, 문서 표시되는 창(window)의 높이, 문서(document) 전체 높이
		let scrollTop = $(window).scrollTop();
		let windowHeight = $(window).height();
		let documentHeight = $(document).height();
		console.log("scrollTop : " + scrollTop + ", windowHeight : " + windowHeight + ", documentHeight : " + documentHeight);
		// => ex) scrollTop : 0, windowHeight : 484, documentHeight : 710
		//        scrollTop : 226.39999389648438, windowHeight : 484, documentHeight : 710
		
		// 2. 스크롤바 위치값 + 창 높이 + x 값이 문서 전체 높이 이상일 경우
		//    다음 페이지 게시물 목록 로딩하여 화면에 추가
		//    => 이 때, x 값의 역할은 스크롤바가 바닥에서 얼마만큼 떨어져 있을 지 결정
		//       (ex. x 가 0 이면 바닥에 닿았을 때(가급적 1 사용), x 가 50 이면 바닥에서 50 이하만큼 떨어져 있을 때)
		if(scrollTop + windowHeight + 1 >= documentHeight) {
// 				console.log("pageNum = " + pageNum);
			// 다음 페이지 로딩을 위한 load_list() 함수 호출
			// => 이 때, 페이지 번호값을 1만큼 증가시켜 파라미터로 함께 전달
			pageNum++;
			// 끝 페이지 번호보다 작거나 같을 경우에만 다음 페이지 로딩
			if(endPage != "" && pageNum <= endPage) {
// 					console.log("pageNum = " + pageNum + ", endPage = " + endPage);
				load_list(pageNum);
			}
		}
	});
});
function load_list(pageNum) {
	$.ajax({
		type: "GET",
		url: "EventListJson",
		data: {
			"pageNum" : pageNum,
		},
		dataType: "json", // 작업 성공 시 리턴받을 데이터의 타입을 JSON 형식으로 지정
		success: function(data) { // JSON 객체 데이터가 data 에 저장됨
			endPage = data.endPage;
			console.log("11111111111" + endPage);
			for(let event of data.eventList) { // 1개 게시물 정보가 board 변수에 저장됨
				let result = "<li>"
								+ "<a href='EventDetail?event_num=" + event.event_num + "&pageNum=" + pageNum + "'>"
									+ "<img src='" + saveDir + event.event_image + "'>" 
//										+ "<img src='${pageContext.request.contextPath }/resources/main_img/platter1.jpg'>"
								+ "</a>" 
								+ "<a href='EventDetail?event_num=" + event.event_num + "pageNum=" + pageNum + "'>" + event.event_subject + "</a>"
								+ "<p class='tx_brief'><fmt:formatDate value='" + event.event_date + "' pattern='yyyy-MM-dd'/></p>"
							+ "</li>";
				$(".event").append(result);
			}
		},
		error: function() {
			$(".event").append("<p>요청을 불러들이지 못하고 있습니다.</p>");
		}
	});
}