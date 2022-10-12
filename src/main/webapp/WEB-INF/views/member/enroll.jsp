<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스트랩 : 회원 가입</title>
<script src="/resources/js/jquery-3.6.1.min.js"></script>
<style>
		.registerForm{
			margin:auto;
			text-align: center;
			width: 500px;
		}
		span.id, span.pwd, span.pwdCheck{
			display:none;
			font-size:12px;
			top:12px;
			right:10px;
			
		}
		span.ok{color:green}
		span.error{color:red}
		span.guide{color:red}
	</style>
</head>
<body>
	<div class="registerForm">
		<form action="/member/register.strap" method="post">
			<h3>STRAP</h3>
			<hr>
			<label for="memberId">아이디</label><br>
			<input type="text" id="memberId" name="memberId" placeholder="영문,숫자 5~12자"><br>
			<span class="id ok">이 아이디는 사용 가능합니다.</span>
			<span class="id error">이 아이디는 사용 할 수 없습니다.</span>
			<span class="id guide">아이디는 5글자 이상입니다.</span><br>
			
			<label for="memberPwd">비밀번호</label><br>
			<input type="password" id="memberPwd" name="memberPwd"placeholder="영문,숫자 조합 최소 6자"><br>
			<span class="pwd ok">사용가능한 비밀번호입니다.</span>
			<span class="pwd guide">비밀번호는 영문,숫자 조합 최소 6자입니다.</span><br>
			
			<input type="password" id="memberPwdCheck" placeholder="비밀번호 재입력"><br>
			<span class="pwdCheck ok">비밀번호와 일치합니다</span>
			<span class="pwdCheck error">비밀번호와 일치하지 않습니다.</span><br>
			
			<label for="memberName">이름</label><br>
			<input type="text" id="memberName" name="memberName" placeholder="이름"><br><br>
			
			<label for="memberEmail">이메일</label><br>
			<input type="email" id="memberEmail" name="memberEmail" placeholder="계정 분실시 활용됩니다."><br><br>
			
			<label for="memberNick">닉네임</label><br>
			<input type="text" id="memberNick" name="memberNick"><br><br>
			
			<label for="memberCareer">운동경력</label><br>
			<input type="text" id="memberCareer" name="memberCareer"><br><br>
			
			<label for="memberSBD">3대 기록</label><br>
			<input type="text" id="memberSBD" name="memberSBD"><br><br>
			
			<label for="memberGender">성별</label><br>
			<input type="radio" id="memberGender" name="memberGender" value="M" >Male
			<input type="radio" id="memberGender" name="memberGender" value="F">Female<br><br>
	
			<button>가입하기</button>
		</form>
	</div>
	
	<script>
		$("#memberId").on("keyup", function(){
			var memberId = $("#memberId").val();
			$.ajax({
				url:"/member/memberIdCheck.strap",
				type:"get",
				data:{"memberId" : memberId},
				success:function(result){
					if(memberId.length > 4){
						if(result == "ok"){
							$(".id.guide").hide();
							$(".id.error").hide();
							$(".id.ok").show();
						} else {
							$(".id.guide").hide();
							$(".id.ok").hide();
							$(".id.error").show();
						}
					}else{
							$(".id.ok").hide();
							$(".id.error").hide();
							$(".id.guide").show();
													
					}
				},
				error:function(){
					
				}
			});
		});
		
		$("#memberPwd").on("keyup",function(){
			var memberPwd = $("#memberPwd").val();
			var regExt = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,12}$/;
			if(!regExt.test(memberPwd)){
				$(".pwd.ok").hide()
				$(".pwd.guide").show()
			}else{
				$(".pwd.guide").hide()
				$(".pwd.ok").show()
				
			}
			
			
		})
		
		$("#memberPwdCheck").on("keyup",function(){
			var memberPwd = $("#memberPwd").val();
			var memberPwdCheck = $("#memberPwdCheck").val();
			if(memberPwd == memberPwdCheck){
				$(".pwdCheck.error").hide();
				$(".pwdCheck.ok").show();
			}else{
				$(".pwdCheck.ok").hide();
				$(".pwdCheck.error").show();
			}
			
		})
	</script>
</body>
</html>