<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<jsp:forward>
</body>
<script>
	alert("로그인을 해주세요.");
	location.href="'${loginUrl}'";
</script>

</html>