/*!
    * Start Bootstrap - SB Admin v7.0.7 (https://startbootstrap.com/template/sb-admin)
    * Copyright 2013-2023 Start Bootstrap
    * Licensed under MIT (https://github.com/StartBootstrap/startbootstrap-sb-admin/blob/master/LICENSE)
    */
    // 
// Scripts
// 

window.addEventListener('DOMContentLoaded', event => {

    // Toggle the side navigation
    const sidebarToggle = document.body.querySelector('#sidebarToggle');
    if (sidebarToggle) {
        // Uncomment Below to persist sidebar toggle between refreshes
        // if (localStorage.getItem('sb|sidebar-toggle') === 'true') {
        //     document.body.classList.toggle('sb-sidenav-toggled');
        // }
        sidebarToggle.addEventListener('click', event => {
            event.preventDefault();
            document.body.classList.toggle('sb-sidenav-toggled');
            localStorage.setItem('sb|sidebar-toggle', document.body.classList.contains('sb-sidenav-toggled'));
        });
    }

});
$(function() {
	$("#delete_btn").on("click",function(){
		if(!confirm("삭제하시겠습니까?")) return false;
		if(!$("input[name=checkbox]").is(":checked")){
			alert("선택된 체크박스가 없습니다");
			return false;
		}
	});
	$(".go_detail").on("click",function(){
		window.open('AdminQnaAnswer?qna_num='+$(this).val(),'공지등록', "top=500,left=500,width=700, height=700");
	});
});


