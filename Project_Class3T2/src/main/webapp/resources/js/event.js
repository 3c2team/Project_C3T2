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

function setCookie(name, value, expiredays) {
	var todayDate = new Date();
	todayDate.setDate( todayDate.getDate() + expiredays ); 
	document.cookie = name + "=" + value + "; path=/; expires=" + todayDate.toUTCString() + ";"
} 

function closeToday() { 
	setCookie( "popToday", "close" , 1); 
	$("#popup_layer").css("display", "none");
	closePop();
}
function closePop() { 
	document.getElementById("popup_layer").style.display = "none";
}