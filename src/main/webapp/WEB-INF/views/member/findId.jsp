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
	<div class="findIdForm">
		<form action="/member/findIdResult.strap" method="post">
			<h3>아이디 찾기</h3>
			<hr>
			<label for="memberEmail">이메일</label><br>
			<input type="email" id="memberEmail" name="memberEmail" placeholder="이메일"><br>
			<span class="email error">이메일 주소를 다시 확인해주세요</span>
			<input type="text" id="certificationNumber" name="certificationNumber" placeholder="인증번호"><br>
			<button type="button" id="certificationBtn">인증요청</button><br><br>
			<button type="submit" id="findIdBtn" onclick="return numberCheck();" disabled="disabled">아이디 찾기</button>
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
		})
	
		var authNumber = "";
		$("#certificationBtn").on("click",function(){
			var memberEmail = $("#memberEmail").val();
			if($(".email.error").css("display") == 'none' && memberEmail.length>1){
				console.log("유효한 이메일 형식");
				$.ajax({
					url:"/member/sendMail.strap",
					type:"get",
					data:{"memberEmail":memberEmail},
					success:function(result){
						if(result.send=="ok"){
							$("#certificationNumber").show();
							$("#findIdBtn").removeAttr("disabled");
							authNumber = result.num;
							console.log(authNumber);
							window.alert("입력하신 이메일 주소로 인증번호를 발송했습니다.");
						}else{
							window.alert("해당 이메일로 가입한 아이디가 없습니다");
						}
					}
				});
				}
			
		})
		
		function numberCheck(){
			var certificationNumber = $("#certificationNumber").val();
			if(authNumber ==  certificationNumber){
				return true;
			}else{
				window.alert("인증번호가 일치하지 않습니다.")
				return false;
			}
		}
		

	</script>
</body>
</html>