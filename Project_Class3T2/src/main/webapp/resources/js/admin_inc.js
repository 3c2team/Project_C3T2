$(function() {	
	$("#changePage").on("change",function(){
			let page = $(this).val();
			location.href=page;
	});
});