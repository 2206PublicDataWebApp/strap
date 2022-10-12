<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스트랩 : 아이디 찾기</title>
<script src="/resources/js/jquery-3.6.1.min.js"></script>
	<style>
		.findIdForm{
			margin:auto;
			text-align: center;
			width: 500px;
		}
		#certificationNumber{
			display: none;
		}
	</style>
</head>
<body>
	<div class="findIdForm">
		<h3>아이디 찾기</h3>
		<hr>
		<label for="memberEmail">이메일</label><br>
		<input type="email" id="memberEmail" name="memberEmail" placeholder="이메일"><br>
		<input type="text" id="certificationNumber" name="certificationNumber" placeholder="인증번호"><br>
		<button id="certificationBtn">인증요청</button>	
	</div>
	
	<script>
		$("#certificationBtn").on("click",function(){
			var memberEmail = $("#memberEmail").val();
			$.ajax({
				url:"/member/sendMail.strap",
				type:"get",
				data:{"memberEmail":memberEmail}
			});
			$("#certificationNumber").show();
			window.alert("입력하신 이메일 주소로 인증번호를 발송했습니다.");
		})
	</script>
</body>
</html>