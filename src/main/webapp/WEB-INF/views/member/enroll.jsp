<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스트랩 : 회원 가입</title>
<script src="/resources/js/jquery-3.6.1.min.js"></script>
</head>
<body>
	<h3>STRAP</h3>
	<hr>
	<label for="memberId">아이디</label><br>
	<input type="text" id="memberId" placeholder="영문,숫자 5~12자"><br>
	<label for="memberPwd">비밀번호</label><br>
	<input type="password" id="memberPwd" placeholder="영문,숫자 조합 최소 6자"><br>
	<input type="password" id="memberPwdCheck" placeholder="비밀번호 재입력"><br>
	<label for="memberPwd">이메일</label><br>
	<input type="email" id="memberEmail" placeholder="계정 분실시 활용됩니다."><br>
	
	<script>
		$("#memberId").on("blur", function(){
			var memberId = $("#memberId").val();
			$.ajax({
				url:"/strap/memberIdCheck.kh",
				type:"get",
				data:{"memberId" : memberId},
				success:function(result){
					if(result == "ok")
				},
				error:function(){
					
				}
			});
		});
	</script>
</body>
</html>