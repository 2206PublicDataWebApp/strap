<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스트랩 : 비밀번호 찾기</title>
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
			border: 1px solid gray;
			border-radius: 10px;
			box-shadow: 5px 5px 5px 5px gray;
		}
		.findIdResultForm button,.findIdResultForm input{
			width: 250px;
			height: 40px;
		}
		.findIdResultForm label{
			margin-right: 200px;
		}
		
		span.email, #certificationNumber{
			display:none;
			font-size:12px;
			top:12px;
			right:10px;
			
		}
		span.error{color:red}
		
	</style>
</head>
<body>
	<div class="findIdResultForm">
		<form action="/member/findPwdResult.strap" method="post">
			<br>
			<h3>비밀번호 찾기</h3>
			<hr>
			<label for="memberId">아이디</label><br>
			<input type="text" id="memberId" name="memberId" placeholder="아이디 입력"><br>
			<label for="memberEmail">이메일</label><br>
			<input type="email" id="memberEmail" name="memberEmail" placeholder="이메일 입력"><br>
			<span class="email error">이메일 주소를 다시 확인해주세요</span>
			<input type="text" id="certificationNumber" name="certificationNumber" placeholder="인증번호"><br><br>
			<button type="button" id="certificationBtn" class="btn btn-dark">인증요청</button><br><br>
			<button type="submit" id="findPwdBtn" class="btn btn-dark" onclick="return numberCheck();" disabled="disabled">비밀번호 찾기</button>	
		</form>
	</div>
	<script>
		$("#memberEmail").on("keyup",function(){
			var memberEmail = $("#memberEmail").val()
			var regExt = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
			if(regExt.test(memberEmail)){
				$(".email.error").hide();
			}else{
				$(".email.error").show();
			}
		});
		
		var authNumber = "";
		$("#certificationBtn").on("click",function(){
			var memberId = $("#memberId").val();
			var memberEmail = $("#memberEmail").val();
			if($(".email.error").css("display") == 'none' && memberEmail.length>1){
				console.log("아이디와 이메일 일치 시 인증번호 발송");
				$.ajax({
					url:"/member/idEmailCheck.strap",
					data:{"memberId":memberId, "memberEmail":memberEmail},
					type:"post",
					success:function(result){
						if(result.send=="ok"){
							console.log("일치");
							console.log(result);
							$("#certificationNumber").show();
							$("#findPwdBtn").removeAttr("disabled");
							authNumber = result.num;
							console.log(authNumber);
							window.alert("입력하신 이메일 주소로 인증번호를 발송했습니다.");
						} else {
							console.log("불일치")
							window.alert("아이디와 비밀번호를 확인해주세요");
						}
						
					}
				});
				}
		});
		
		function numberCheck(){
			var certificationNumber = $("#certificationNumber").val();
			if(authNumber ==  certificationNumber){
				window.alert("해당 이메일로 임시 비밀번호를 전송하였습니다. 확인을 누르면 로그인 페이지로 이동합니다.")
				return true;
			}else{
				window.alert("인증번호가 일치하지 않습니다.")
				return false;
			}
		}
	</script>
</body>
</html>