$(function() {
	
	$("#button_open").on("click",function() {
		window.open('AdminProductRegist','상품등록', "top=500,left=500,width=700, height=700");
	});
	$("#button_delete").on("click",function() {
		location.href="DeleteProductPro";
	});
	
	
	$("#delete_btn").on("click",function (){
		$("#main_file").html("<input type='file' name='product_main_image' form-control' accept='.jpg, .png'>") ;
	});
});
function isSubmit() {
	if(!confirm("등록하시겠습니까?")){
		return false;
	}
}