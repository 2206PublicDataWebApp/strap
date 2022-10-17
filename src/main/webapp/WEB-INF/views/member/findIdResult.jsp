<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스트랩 : 아이디 찾기 결과</title>
<!-- CDN -->
<!-- 부트스트랩 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" />
<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- css -->
<link rel="stylesheet" type="text/css" href="/resources/css/common.css">
	<style>
		.findIdResultForm{
			margin:100px auto;
			text-align: center;
			width: 400px;
			height: 400px;
			line-height: 50%;
		}
		.findIdResultForm button,.findIdResultForm input{
			width: 200px;
		}
	</style>

</head>
<body>
	<div class="findIdResultForm">
		<h3>아이디 찾기 결과</h3>
		<hr>
		<c:forEach items="${sList }" var="member">
			<input type="text" readonly="readonly" value="${member.memberId }      ${member.mRegisterDate}가입"><br><br><br>
		</c:forEach>
		<br>
		<button class="btn btn-primary" onclick="location.href='/member/findPwd.strap'">비밀 번호 찾기</button><br><br>
		<button class="btn btn-primary" onclick="location.href='/member/loginView.strap'">로그인</button>
		
	</div>
</body>
</html>