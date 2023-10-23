$(function() {
		$("#button_add").on("click",function() {
			$("#button_add_result").append(
				"<input type='file' class='form-control'>"
			);
		});
		$("#button_open").on("click",function() {
			window.open('AdminProductRegist','', 'width=200', 'height=4100');
		});
	});