<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스트랩 : 로그인</title>
<script src="/resources/js/jquery-3.6.1.min.js"></script>
	<style>
			.loginView{
			margin:auto;
			text-align: center;
			width: 500px;
		}
	</style>
</head>
<body>
	<div class="loginView">
			<h3>로그인</h3>
			<hr>
			<input type="text" id="memberId" name="memberId" placeholder="아이디"><br>
			<input type="password" id="memberPwd" name="memberPwd" placeholder="비밀번호"><br><br>
			<button id="loginBtn" type="button">로그인</button><br>
			<button type="button">구글 로그인</button><br><br>
			<a href="/member/findId.strap"">아이디 찾기</a> <a href="/member/findPwd.strap">비밀번호 찾기</a><br><br>
			<button type="button" onclick="location.href='/member/enroll.strap'">회원 가입</button>
	</div>
	
	<script>
		$("#loginBtn").on("click",function(){
			var memberId = $("#memberId").val();
			var memberPwd = $("#memberPwd").val();
			$.ajax({
				url:"/member/login.strap",
				type:"post",
				data:{"memberId":memberId, "memberPwd":memberPwd},
				success:function(result){
					if(result == "ok"){
						location.href="/"
					} else{
						window.alert("아이디 또는 비밀번호를 확인해주세요")
					}
				}
			});
		})
	</script>
</body>
</html>