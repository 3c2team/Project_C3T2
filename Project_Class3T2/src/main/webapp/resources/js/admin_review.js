$("#delete_btn").on("click",function(){
	if(!confirm("삭제하시겠습니까?")){
		return false;
	}
});