$(function() {
		$("#button_add").on("click",function(){
			$("#button_add_result").append(
				"<input type='file'  class='form-control' accept='.jpg, .png'>"
			)
			
		});
		
		$("#button_open").on("click",function() {
			window.open('AdminProductRegist','', 'width=100', 'height=600');
		});
		$("#button_delete").on("click",function() {
			location.href="DeleteProductPro";
		});
	});