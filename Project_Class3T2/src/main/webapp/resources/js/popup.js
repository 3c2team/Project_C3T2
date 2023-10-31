/**
 * 
 */
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