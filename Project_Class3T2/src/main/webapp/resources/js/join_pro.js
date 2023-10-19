$(document).ready(function(){
	$("#all").on('click', () => $("input[type=checkbox]").prop("checked", $("#all").prop("checked")));
});