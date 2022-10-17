<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스트랩 : 소셜 회원 가입</title>
	<style>
		.registerForm{
			margin:auto;
			text-align: center;
			width: 500px;
		}
	</style>
</head>
<body>
	<div class="registerForm">
		<form action="/member/socialRegister.strap" method="post">
			<h3>STRAP</h3>
			<hr>			
			<label for="memberName">이름</label><br>
			<input type="text" id="memberName" name="memberName" placeholder="이름"><br><br>
						
			<label for="memberNick">닉네임</label><br>
			<input type="text" id="memberNick" name="memberNick" value="${userInfo.get('memberNick') }"><br><br>
			
			<label for="memberCareer">운동경력</label><br>
			<input type="text" id="memberCareer" name="memberCareer"><br><br>
			
			<label for="memberSBD">3대 기록</label><br>
			<input type="text" id="memberSBD" name="memberSBD"><br><br>
			
			<label for="memberGender">성별</label><br>
			<c:if test="${userInfo.get('memberGender') eq 'male'}">
				<input type="radio" id="memberGender" name="memberGender" value="M"  checked>Male<br><br>
			</c:if>
			<c:if test="${userInfo.get('memberGender') eq 'female'}">
				<input type="radio" id="memberGender" name="memberGender" value="F" checked>Female<br><br>
			</c:if>
	
			<button>가입하기</button>
			<input type="hidden" name="mId" value="${userInfo.get('memberId') }">
			<input type="hidden" name="mProfilePath" value="${userInfo.get('mProfilePath') }">
		</form>
	</div>
</body>
</html>