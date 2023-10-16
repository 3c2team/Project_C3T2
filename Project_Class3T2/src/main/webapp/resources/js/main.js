/**
 * main.js 
 */
let counter = 1;

setInterval(function(){
	document.getElementById('radio' + counter).checked = true;
	counter++;
	if(counter > 4) {
		counter = 1;
	}
}, 4000);

$(function(){
	// 슬라이드 counter 동기화
	$('.manualBtn').on('click', (e) => {
		debugger;
		counter = $(e.target).attr('for').replace("radio", "");
	});
});