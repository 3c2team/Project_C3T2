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
	
	var popToday = getCookie("popToday");
    console.log(popToday);

    if (popToday == "close") {
        document.getElementById("popup_layer").style.display = "none";
    } else {
		document.getElementById("popup_layer").style.display = "block";
	}
});

// 쿠키 값 세팅하기
function setCookie(name, value, expiredays) {
	var todayDate = new Date();
	todayDate.setDate( todayDate.getDate() + expiredays ); 
	document.cookie = name + "=" + value + "; path=/; expires=" + todayDate.toUTCString() + ";"
} 

// 쿠키 값 가져오기
function getCookie(name) {
  let matches = document.cookie.match(new RegExp(
    "(?:^|; )" + name.replace(/([\.$?*|{}\(\)\[\]\\\/\+^])/g, '\\$1') + "=([^;]*)"
  ));
  return matches ? decodeURIComponent(matches[1]) : undefined;
}

// 하루동안 보지 않기(쿠키 세팅)
function closeToday() { 
	setCookie( "popToday", "close" , 1); 
	$("#popup_layer").css("display", "none");
	closePop();
}

// 팝업 닫기
function closePop() { 
	document.getElementById("popup_layer").style.display = "none";
}
