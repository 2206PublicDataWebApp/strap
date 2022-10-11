<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<h3>로그인</h3>
		<hr>
		<div>
			<input type="text" id="memberId" placeholder="아이디"><br>
			<input type="password" id="memberPwd" placeholder="비밀번호"><br>
			<button>로그인</button><br>
			<a href="#">아이디 찾기</a> <a href="#">비밀번호 찾기</a><br>
			<button>구글 로그인</button><br>
			<button onclick="location.href='/strap/enroll.kh'">회원 가입</button>
		</div>
	</div>
</body>
</html>