<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%-- <input type="hidden" name="targetURL" id="targetURL" value="${targetURL}"> --%>
<script type="text/javascript">
	//요청 작업 성공/실패 시 
	// 전달받은 오류메세지(msg)를 출력하고, 지정된 페이지(targetURL)로 이동 처리
	alert("${msg}");
	if("${method}" == "POST") {
		location.href = "Post?targetURL=${targetURL}";
	} else {
		location.href = "${targetURL}";
	}
</script>
</body>
</html>