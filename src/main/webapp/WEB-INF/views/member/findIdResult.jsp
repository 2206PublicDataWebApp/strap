<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style>
		.findIdResultForm{
		margin:auto;
		text-align: center;
		width: 500px;
		}
	</style>

</head>
<body>
	<div class="findIdResultForm">
		<h3>아이디 찾기 결과</h3>
		<hr>
		<c:forEach items="${sList }" var="member">
			<input type="text" readonly="readonly" value="${member.memberId }         ${member.mRegisterDate}가입"><br>
		</c:forEach>
		<br>
		<button onclick="location.href='/member/findPwd.strap'">비밀 번호 찾기</button>
		<button onclick="location.href='/member/loginView.strap'">로그인</button>
		
	</div>
</body>
</html>