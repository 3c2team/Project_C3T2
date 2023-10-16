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
	
	// popup event
// 	$(".popupBox").draggable({containment:'parent', scroll:false}); 
// 	let disp = document.cookie.indexOf("popToday=close") < 0 ? 'block' : 'none';
// 	document.getElementById("popup_layer").style.display = disp;
	
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