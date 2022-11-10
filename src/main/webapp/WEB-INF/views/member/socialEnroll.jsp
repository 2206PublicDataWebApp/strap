<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스트랩 : 소셜 회원 가입</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" />
	<style>
		.registerForm{
			margin: 50px auto;
			text-align: center;
			width: 500px;
			border: 1px solid gray;
			border-radius: 10px;
			box-shadow: 5px 5px 5px 5px gray;
		}
		span.nick{
			display:none;
			font-size:12px;
			top:12px;
			right:10px;
		}
		span.ok{color:green;}
		span.error{color:red;}
		span.guide{color:red;}
		#memberCareer, #memberSBD{width: 190px; text-align: center;}
		#Female{margin-left: 60px;}
	</style>
	<script src="/resources/js/jquery-3.6.1.min.js"></script>
</head>
<body>
	<div class="registerForm">
		<form action="/member/socialRegister.strap" method="post">
			<br>
			<h3>STRAP</h3>
			<hr>			
			<label for="memberName">이름</label><br>
			<input type="text" id="memberName" name="memberName" placeholder="이름" required><br><br>
			
			<label for="memberEmail">이메일</label><br>
			<input type="email" id="memberEmail" name="memberEmail" value="${userInfo.get('memberEmail') }" readonly><br><br>
						
			<label for="memberNick" >닉네임</label><br>
			<input type="text" id="memberNick" name="memberNick" placeholder="닉네임" required><br>
			<span class="nick ok">이 닉네임은 사용 가능합니다.</span>
			<span class="nick error">이 닉네임은 사용 할 수 없습니다.</span>
			<span class="nick guide">닉네임은 2~8글자입니다.</span>
			<br>
			
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
				<input type="radio" id="Male" name="memberGender" value="M"  checked>Male
				<input type="radio" id="Female" name="memberGender" value="F">Female<br><br>
			</c:if>
			<c:if test="${userInfo.get('memberGender') eq 'female'}">
				<input type="radio" id="Male" name="memberGender" value="M">Female
				<input type="radio" id="Female" name="memberGender" value="F" checked>Female<br><br>
			</c:if>
			<c:if test="${userInfo.get('memberGender') eq null} ">
				<input type="radio" id="Male" name="memberGender" value="M" checked>Male
				<input type="radio" id="Female" name="memberGender" value="F">Female<br><br>
			</c:if>
	
			<label for="memberJym">마이 짐</label><br>
			<input type="text" id="jymAddress" name="jymAddress" style="width: 280px;" readonly>
			<input type="text" id="jymTitle" name="jymTitle" style="width: 216px;" readonly>
			<button type="button" class="btn btn-dark" onclick="showMap();">검색</button>
			<br><br>
	
			<button class="btn btn-dark" onclick="return loginCheck();">가입하기</button>
			<input type="hidden" name="memberId" value="${userInfo.get('memberId') }">
			<input type="hidden" name="mProfilePath" value="${userInfo.get('mProfilePath') }">
			<br><br>
		</form>
	</div>
	<script>
		function showMap(){
			window.open("/member/showMap.strap",null,"width=700,height=600,resizable=no");
		}
		
		$("#memberNick").on("keyup", function(){
			var memberNick = $("#memberNick").val();
			$.ajax({
				url:"/member/memberNickCheck.strap",
				type:"get",
				data:{"memberNick" : memberNick},
				success:function(result){
					if(memberNick.length > 1 && memberNick.length < 9){
						if(result == "ok"){
							$(".nick.guide").hide();
							$(".nick.error").hide();
							$(".nick.ok").show();
						} else {
							$(".nick.guide").hide();
							$(".nick.ok").hide();
							$(".nick.error").show();
						} 
					}else{
						$(".nick.error").hide();
						$(".nick.ok").hide();
						$(".nick.guide").show();
					}
				},
				error:function(){
				}
			});
		});
		
		function loginCheck(){
			if(	$(".nick.ok").is(":visible")) {
				if($("#jymAddress").val().length == 0){
					alert("마이 짐을 입력해주세요.");
					return false;
				}
				return true;
			} else {
				alert("회원 정보를 다시 확인해주세요.");
				return false;
			}
		}
	</script>
</body>
</html>