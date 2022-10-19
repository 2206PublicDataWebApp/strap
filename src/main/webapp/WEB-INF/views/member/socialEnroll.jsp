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
			<select name="memberCareer" id="memberCareer">
				<option value="1">1년 이하</option>
				<option value="1-2">1년~2년</option>
				<option value="2-3">2년~3년</option>
				<option value="3-5">3년~5년</option>
				<option value="5-10">5년~10년</option>
				<option value="10">10년 이상</option>
			</select><br><br>
			
			<label for="memberSBD">3대 기록</label><br>
			<select name="memberSBD" id="memberSBD">
				<option value="200">200 이하</option>
				<option value="200~300">200~300</option>
				<option value="300~350">300~350</option>
				<option value="350~400">350~400</option>
				<option value="400~450">400~450</option>
				<option value="450~500">450~500</option>
				<option value="500~600">500~600</option>
				<option value="600">600 이상</option>
			</select><br><br>
			
			<label for="memberGender">성별</label><br>
			<c:if test="${userInfo.get('memberGender') eq 'male'}">
				<input type="radio" id="memberGender" name="memberGender" value="M"  checked>Male<br><br>
			</c:if>
			<c:if test="${userInfo.get('memberGender') eq 'female'}">
				<input type="radio" id="memberGender" name="memberGender" value="F" checked>Female<br><br>
			</c:if>
			<c:if test="${userInfo.get('memberGender') eq null} ">
				<input type="radio" id="memberGender" name="memberGender" value="M">Male<br><br>
				<input type="radio" id="memberGender" name="memberGender" value="F">Female<br><br>
			</c:if>
	
	
			<button>가입하기</button>
			<input type="hidden" name="mId" value="${userInfo.get('memberId') }">
			<input type="hidden" name="mProfilePath" value="${userInfo.get('mProfilePath') }">
		</form>
	</div>
</body>
</html>