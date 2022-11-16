<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스트랩 : 아이디 찾기</title>
<!-- CDN -->
<!-- 부트스트랩 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" />
<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- css -->
<link rel="stylesheet" type="text/css" href="/resources/css/common.css">
	<style>
		.findIdForm{
			margin:100px auto;
			text-align: center;
			width: 400px;
			height: 400px;
			border: 1px solid gray;
			border-radius: 10px;
			box-shadow: 5px 5px 5px 5px gray;
		}
		.findIdForm button,.findIdForm input{
			width: 250px;
			height: 40px;
		}
		.findIdForm label{
			margin-right : 200px;
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
			<br>
			<h3>아이디 찾기</h3>
			<hr>
			<label for="memberEmail">이메일</label><br>
			<input type="email" id="memberEmail" name="memberEmail" placeholder="이메일 입력"><br>
			<span class="email error">이메일 주소를 다시 확인해주세요</span>
			<input type="text" id="certificationNumber" name="certificationNumber" placeholder="인증번호 입력"><br><br>
			<button type="button" id="certificationBtn" class="btn btn-dark">인증요청</button><br><br>
			<button type="submit" id="findIdBtn" onclick="return numberCheck();" class="btn btn-dark" disabled="disabled">아이디 찾기</button>
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
				$.ajax({
					url:"/member/checkEmail.strap",
					type:"get",
					data:{"memberEmail":memberEmail},
					success:function(result){
						if(result.send =="no"){
							window.alert("해당 이메일로 가입한 아이디가 없습니다");
						}else{
							window.alert("입력하신 이메일 주소로 인증번호를 발송합니다.");
							$("#certificationNumber").show();
							$("#findIdBtn").removeAttr("disabled");
							$.ajax({
								url:"/member/sendMail.strap",
								type:"get",
								data:{"memberEmail":memberEmail},
								success:function(result){
									authNumber = result.num;
								},
								error:function(result){
									alert("인증번호 발송에 실패하였습니다. 관리자에게 문의 바랍니다.");
								}
							})
						}
					},
					error:function(result){
					}
				});
				}else{
					window.alert("이메일을 입력해주세요")
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