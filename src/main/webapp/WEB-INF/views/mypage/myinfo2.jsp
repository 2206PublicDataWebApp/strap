<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Member Informaiton</title>
<!-- CDN -->
<!-- 부트스트랩 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" />
<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- css -->
<link rel="stylesheet" type="text/css" href="/resources/css/common.css">
	<style>
	.registerForm{
		margin:0px auto;
		text-align: center;
		width: 500px;
	}
	.registerForm input{
		text-align: center;
	}
	.registerForm label{
		margin-right: 120px;
	}
	select.select{
		width: 185px;
	}
	#memberJym{
		margin-left: 115px;
	}
	</style>
</head>
<body>
<div class="wrap container">
	<!-- 헤더&메뉴바 -->
	<div class="row">
		<div class="col">
			<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
		</div>
	</div>

	<div class="row">
		<div class="sidebar col-3" >
			<jsp:include page="/WEB-INF/views/common/sideBarMyPage.jsp"></jsp:include>
		</div>
		<div class="contents-side col">
			<div class="registerForm">
				<form action="/member/register.strap" method="post">
				<br>
				<h3>정보 조회</h3>
				<hr>
				<label for="memberId">아이디</label><br>
				<input type="text" id="memberId" name="memberId" value="${loginUser.memberId }" readonly><br><br>
				
				<label for="memberName">이름</label><br>
				<input type="text" id="memberName" name="memberName" value="${loginUser.memberName }" readonly><br><br>
				
				<label for="memberEmail">이메일</label><br>
				<input type="email" id="memberEmail" name="memberEmail" value="${loginUser.memberEmail }" readonly><br><br>
				
				<label for="memberNick">닉네임</label><br>
				<input type="text" id="memberNick" name="memberNick" value="${loginUser.memberNick }" readonly><br><br>
				
				<label for="memberCareer">운동경력</label><br>
				<select class="career Select" name="memberCareer" id="memberCareer">
					<option value="1">1년 이하</option>
					<option value="1-2">1년~2년</option>
					<option value="2-3">2년~3년</option>
					<option value="3-5">3년~5년</option>
					<option value="5-10">5년~10년</option>
					<option value="10">10년 이상</option>
				</select><br><br>
				
				<label for="memberSBD">3대 기록</label><br>
				<select class="SBD Select" name="memberSBD" id="memberSBD">
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
				<c:if test="${loginUser.memberGender eq 'M' }">
				<input type="radio" id="memberGender" name="memberGender" value="M" checked>Male &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="radio" id="memberGender" name="memberGender" value="F">Female<br>
				<br>
				</c:if>
				<c:if test="${loginUser.memberGender eq 'F' }">
				<input type="radio" id="memberGender" name="memberGender" value="M">Male &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="radio" id="memberGender" name="memberGender" value="F" checked>Female<br>
				<br>
				</c:if>
			
				<label for="memberJym">마이 짐</label><br>
				<input type="text" id="memberJym" name="memberJym" size="35" value="${loginUser.memberJym }">
				<br><br>
				
				<button class="btn btn-primary" onclick="return loginCheck();">수정</button>
				<button class="btn btn-primary" onclick="return loginCheck();">탈퇴</button>
				<br><br>
			</form>
		</div>
		</div>
	</div>
	<div class="row">
		<div class="col">
			<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
		</div>
	</div>
</div>
</body>
</html>