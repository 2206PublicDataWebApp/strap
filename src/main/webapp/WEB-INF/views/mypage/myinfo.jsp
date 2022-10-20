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
	.contents-side.col{
		padding-left: 15px;
	}
	.contents-side.col th, .contents-side.col td{
		height: 50px;
	}
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
	td button{
		width: 200px;
	}
	.change{
		width:  180px;
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
</head>
<body>
<div class="wrap container">
	<!-- 헤더&메뉴바 -->
	<div class="row">
		<div class="col">
			<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
		</div>
	</div>

	<div class="contents row">
		<div class="sidebar col-3" >
			<jsp:include page="/WEB-INF/views/common/sideBarMyPage.jsp"></jsp:include>
		</div>
		<div class="contents-side col">
			<div id="essential info">
				<span>기본 회원 정보(필수) </span>
				<hr>
				<table class="table">
					<tr>
						<th width="200px;">아이디</th>
						<td width="600px;" id="memberId">${loginUser.memberId }</td>
						<td width="150px;"></td>
					</tr>
					<tr id="pwdTr">
						<th>비밀번호</th>
						<td>**********</td>
						<td><button class="btn btn-light" onclick="modifyPwd();">비밀번호 변경</button></td>
					</tr>
					<!-- 비밀번호 수정 -->
					<tr id="change-pwdTr" style="display: none;">
						<th>비밀번호</th>
						<td colspan="2">
							<div >
								<label class="change pwd" for="pwd">현재 비밀번호</label><input type="password" id="pwd"><br>
								<label class="change newPwd" for="newPwd">신규 비밀번호</label><input type="password" id="newPwd">
								<span class="pwd ok">사용가능한 비밀번호입니다.</span>
								<span class="pwd guide">비밀번호는 영문,숫자 조합 최소 6자입니다.</span><br>
								<label class="change newPwdChek" for="newPwdCheck">신규 비밀번호 재 입력</label><input type="password" id="newPwdCheck">
								<span class="pwdCheck ok">비밀번호와 일치합니다</span>
								<span class="pwdCheck error">비밀번호와 일치하지 않습니다.</span><br><br>
								<button class="btn btn-light" onclick="modifyPwdCancel();">취소</button>
								<button class="btn btn-light" id="modifyPwdFinishBtn" onclick="modifyPwdFinish();" disabled>변경</button>
							</div>
						</td>
					</tr>
					<tr>
						<th>이름(실명)</th>
						<td colspan="2">${loginUser.memberName }</td>
					</tr>
					<tr id="nickTr">
						<th>닉네임</th>
						<td>${loginUser.memberNick }</td>
						<td><button class="btn btn-light" onclick="modifyNick();">닉네임 변경</button></td>
					</tr>
					<tr id="change-nickTr" style="display: none;">
						<th>닉네임</th>
						<td colspan="2">
							<input type="text"><br><br>
							<button class="btn btn-light" onclick="modifyNickCancel();">취소</button>
							<button class="btn btn-light" id="modifyNickFinishBtn" onclick="modifyNickFinish();" disabled>변경</button>
						</td>
					</tr>
					<tr>
						<th>이메일</th>
						<td>${loginUser.memberEmail }</td>
						<td><button class="btn btn-light" onclick="modifyEmail();">이메일 변경</button></td>
					</tr>
					<tr>
						<th>운동경력</th>
						<td>${loginUser.memberCareer }</td>
						<td><button class="btn btn-light" onclick="modifyCareer();">운동경력 변경</button></td>
					</tr>
					<tr>
						<th>3대 기록</th>
						<td>${loginUser.memberSBD }</td>
						<td><button class="btn btn-light" onclick="modifySBD();">3대 기록 변경</button></td>
					</tr>
					<tr>
						<th>성별</th>
						<td>${loginUser.memberGender }</td>
						<td></td>
					</tr>
				</table>			
			</div>
			<br><br><br>
			<div id="optional info">
				<span>추가 회원 정보(선택) </span>
				<hr>
				<table class="table" >
					<tr>
						<th>사진</th>
						<td></td>
						<td><button class="btn btn-light" onclick="modifyImg();">사진 변경</button></td>
					</tr>
					<tr>
						<th width="200px;">자기 소개</th>
						<td width="600px;"></td>
						<td width="150px;"><button class="btn btn-light" onclick="modifyIntroduce();">자기소개 변경</button></td>
					</tr>
					<tr>
						<th>마이 짐</th>
						<td>${loginUser.memberJym }</td>
						<td><button class="btn btn-light" onclick="modifyJym();">마이 짐 변경</button></td>
					</tr>
					<tr>
						<th>주소</th>
						<td></td>
						<td><button class="btn btn-light">주소 변경</button></td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col">
			<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
		</div>
	</div>
</div>
<script type="text/javascript">
	function modifyPwd(){
		$("#pwdTr").hide();
		$("#change-pwdTr").show();
	}
	function modifyNick(){
		$("#nickTr").hide();
		$("#change-nickTr").show();
	}
	function modifyPwdCancel(){
		$("#pwd").val("");
		$("#newPwd").val("");
		$("#newPwdCheck").val("");
		$(".pwd.ok").hide()
		$(".pwd.guide").hide()
		$(".pwdCheck.ok").hide()
		$(".pwdCheck.error").hide()
		$("#change-pwdTr").hide();
		$("#pwdTr").show();
	}
	function modifyPwdFinish(){
		var memberId = $("#memberId").text();
		var pwd = $("#pwd").val();
		var newPwd = $("#newPwd").val();
		if(pwd ==""){
			alert("현재 비밀번호를 입력해주세요.")
		}else{
			if(confirm('비밀번호를 변경하시겠습니까?')){
				$.ajax({
					url:"/member/myinfoPwd.strap",
					type:"post",
					data:{"pwd" : pwd, "newPwd" : newPwd, "memberId" : memberId},
					success:function(result){
						if(result =='ok'){
							$("#change-pwdTr").hide();
							$("#pwdTr").show();
							alert("비밀번호가 변경되었습니다.")
						}else{
							alert("현재 비밀번호가 일치하지 않습니다.")
						}
					}
				})
			}
		}
		
	}
	$("#newPwd").on("keyup",function(){
		var memberPwd = $("#newPwd").val();
		var regExt = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,12}$/;
		if(!regExt.test(memberPwd)){
			$(".pwd.ok").hide()
			$(".pwd.guide").show()
		}else{
			$(".pwd.guide").hide()
			$(".pwd.ok").show()
		};
	})
	
	$("#newPwdCheck").on("keyup",function(){
		var memberPwd = $("#newPwd").val();
		var memberPwdCheck = $("#newPwdCheck").val();
		if(memberPwd == memberPwdCheck){
			$(".pwdCheck.error").hide();
			$(".pwdCheck.ok").show();
			$("#modifyPwdFinishBtn").attr("disabled",false);
		}else{
			$(".pwdCheck.ok").hide();
			$(".pwdCheck.error").show();
		};
	})
</script>
</body>
</html>