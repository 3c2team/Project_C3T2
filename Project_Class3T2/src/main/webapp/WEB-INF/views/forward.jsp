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
	//��û �۾� ����/���� �� 
	// ���޹��� �����޼���(msg)�� ����ϰ�, ������ ������(targetURL)�� �̵� ó��
	alert("${msg}");
	if("${method}" == "POST") {
		location.href = "Post?targetURL=${targetURL}";
	} else {
		location.href = "${targetURL}";
	}
</script>
</body>
</html>