<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스트랩 : 회원 가입</title>
<script src="/resources/js/jquery-3.6.1.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" />
<style>
	.registerForm{
		margin:50px auto;
		text-align: center;
		width: 500px;
		border: 1px solid gray;
		border-radius: 10px;
		box-shadow: 5px 5px 5px 5px gray;
	}
	span.id, span.pwd, span.pwdCheck, span.nick{
		display:none;
		font-size:12px;
		top:12px;
		right:10px;
		
	}
	span.ok{color:green;}
	span.error{color:red;}
	span.guide{color:red;}
	}
</style>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f500dcdba3f518947974ee0f54119e78&libraries=services"></script>

</head>
<body>
	<div class="registerForm">
		<form action="/member/register.strap" method="post">
			<br>
			<h3>STRAP</h3>
			<hr>
			<label for="memberId">아이디</label><br>
			<input type="text" id="memberId" name="memberId" placeholder="영문,숫자 5~12자" required><br>
			<span class="id ok">이 아이디는 사용 가능합니다.</span>
			<span class="id error">이 아이디는 사용 할 수 없습니다.</span>
			<span class="id guide">아이디는 5글자 이상입니다.</span><br>
			
			<label for="memberPwd">비밀번호</label><br>
			<input type="password" id="memberPwd" name="memberPwd"placeholder="영문,숫자 조합 최소 6자" required><br>
			<span class="pwd ok">사용가능한 비밀번호입니다.</span>
			<span class="pwd guide">비밀번호는 영문,숫자 조합 최소 6자입니다.</span><br>
			
			<input type="password" id="memberPwdCheck" placeholder="비밀번호 재입력"><br>
			<span class="pwdCheck ok">비밀번호와 일치합니다</span>
			<span class="pwdCheck error">비밀번호와 일치하지 않습니다.</span><br>
			
			<label for="memberName">이름</label><br>
			<input type="text" id="memberName" name="memberName" placeholder="이름" required><br><br>
			
			<label for="memberEmail">이메일</label><br>
			<input type="email" id="memberEmail" name="memberEmail" placeholder="계정 분실시 활용됩니다." required><br><br>
			
			<label for="memberNick">닉네임</label><br>
			<input type="text" id="memberNick" name="memberNick" placeholder="닉네임" required><br>
			<span class="nick ok">이 닉네임은 사용 가능합니다.</span>
			<span class="nick error">이 닉네임은 사용 할 수 없습니다.</span>
			<span class="nick guide">닉네임은 2글자 이상입니다.</span><br>
			
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
			
			<label>성별</label><br>
			<input type="radio" id="Male" name="memberGender" value="M" checked>Male
			<input type="radio" id="Female" name="memberGender" value="F">Female<br><br>
		
			<label>마이 짐</label><br>
			<input type="text" id="jymAddress" name="jymAddress" style="width: 280px;">
			<input type="text" id="jymTitle" name="jymTitle" style="width: 216px;">
			<button type="button" class="btn btn-dark" onclick="showMap();">검색</button><br><br>
			<button class="btn btn-dark" onclick="return loginCheck();">가입하기</button>
			<br><br><br>
		</form>
	</div>
<script>
	function showMap(){
		window.open("/member/showMap.strap",null,"width=700,height=600,resizable=no");
	}

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
		};
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
		};
	})

	$("#memberNick").on("keyup", function(){
		var memberNick = $("#memberNick").val();
		$.ajax({
			url:"/member/memberNickCheck.strap",
			type:"get",
			data:{"memberNick" : memberNick},
			success:function(result){
				if(memberNick.length > 1){
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
		if(	$(".id.ok").is(":visible") &&
			$(".pwd.ok").is(":visible") &&
			$(".pwdCheck.ok").is(":visible") &&
			$(".nick.ok").is(":visible")) {
			return true;
		} else {
			alert("회원 정보를 다시 확인해주세요");
			return false;
		}
	}
</script>
</body>
</html>