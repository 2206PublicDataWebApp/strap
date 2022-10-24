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
	td button{
		width: 200px;
	}
	.change{
		width:  180px;
	}
	span.id, span.pwd, span.pwdCheck, span.nick, span.email{
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
					<!--  닉네임 수정 -->
					<tr id="change-nickTr" style="display: none;">
						<th>닉네임</th>
						<td colspan="2">
							<input id="memberNick" type="text">
							<span class="nick ok">이 닉네임은 사용 가능합니다.</span>
							<span class="nick error">이 닉네임은 사용 할 수 없습니다.</span>
							<span class="nick guide">닉네임은 2글자 이상입니다.</span>
							<br><br>
							<button class="btn btn-light" onclick="modifyNickCancel();">취소</button>
							<button class="btn btn-light" id="modifyNickFinishBtn" onclick="modifyNickFinish();" disabled>변경</button>
						</td>
					</tr>
					<tr id="emailTr">
						<th>이메일</th>
						<td>${loginUser.memberEmail }</td>
						<td><button class="btn btn-light" onclick="modifyEmail();">이메일 변경</button></td>
					</tr>
					<!-- 이메일 수정 -->
					<tr id="change-emailTr" style="display: none;">
						<th>이메일</th>
						<td colspan="2">
							<input id="memberEmail" type="email" placeholder="이메일 주소 입력">
							<span class="email error">이메일 주소를 다시 확인해주세요</span><br>
							<br><br>
							<button class="btn btn-light" onclick="modifyEmailCancel();">취소</button>
							<button class="btn btn-light" id="modifyEmailFinishBtn" onclick="modifyEmailFinish();">변경</button>
						</td>
					</tr>
					<tr id="careerTr">
						<th>운동경력</th>
						<td>
							<c:if test="${loginUser.memberCareer eq '1'}">
								1년 이하
							</c:if>
							<c:if test="${loginUser.memberCareer eq '1-2'}">
								1년~2년
							</c:if>
							<c:if test="${loginUser.memberCareer eq '2-3'}">
								2년~3년
							</c:if>
							<c:if test="${loginUser.memberCareer eq '3-5'}">
								3년~5년
							</c:if>
							<c:if test="${loginUser.memberCareer eq '5-10'}">
								5년~10년
							</c:if>
							<c:if test="${loginUser.memberCareer eq '10'}">
								10년 이상
							</c:if>
						</td>
						<td><button class="btn btn-light" onclick="modifyCareer();">운동경력 변경</button></td>
					</tr>
					<!-- 운동경력 수정 -->
					<tr id="change-careerTr" style="display: none;">
						<th>운동경력</th>
						<td colspan="2">
							<select name="memberCareer" id="memberCareer">
								<option value="1">1년 이하</option>
								<option value="1-2">1년~2년</option>
								<option value="2-3">2년~3년</option>
								<option value="3-5">3년~5년</option>
								<option value="5-10">5년~10년</option>
								<option value="10">10년 이상</option>
							</select><br><br>
							<button class="btn btn-light" onclick="modifyCareerCancel();">취소</button>
							<button class="btn btn-light" id="modifyCareerFinishBtn" onclick="modifyCareerFinish();">변경</button>
						</td>
					</tr>
					<tr id="SBDTr">
						<th>3대 기록</th>
						<td>
							<c:if test="${loginUser.memberSBD eq '200'}">
								200 이하
							</c:if>
							<c:if test="${loginUser.memberSBD ne '200'}">
								${loginUser.memberSBD}
							</c:if>
							
						</td>
						<td><button class="btn btn-light" onclick="modifySBD();">3대 기록 변경</button></td>
					</tr>
					<!-- 3대 기록 수정 -->
					<tr id="change-SBDTr" style="display: none;">
						<th>3대 기록</th>
						<td colspan="2">
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
							<button class="btn btn-light" onclick="modifySBDCancel();">취소</button>
							<button class="btn btn-light" id="modifySBDFinishBtn" onclick="modifySBDFinish();">변경</button>
						</td>
					</tr>
					<tr>
						<th>성별</th>
						<td colspan="2">
							<c:if test="${loginUser.memberGender eq 'M'}">
								남성
							</c:if>
							<c:if test="${loginUser.memberGender eq 'F'}">
								여성
							</c:if>
						</td>
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
					<tr id="introduceTr">
						<th width="200px;">자기 소개</th>
						<td width="600px;">${loginUser.memberIntroduce }</td>
						<td width="150px;"><button class="btn btn-light" onclick="modifyIntroduce();">자기소개 변경</button></td>
					</tr>
					<!-- 자기소개 변경 -->
					<tr id="change-introduceTr" style="display: none;">
						<th width="200px;">자기 소개</th>
						<td width="600px;">
						<textarea name="memberIntroduce" id="memberIntroduce" rows="10" cols="100"></textarea>
						<br><br>
						<button class="btn btn-light" onclick="modifyIntroduceCancel();">취소</button>
						<button class="btn btn-light" id="modifyIntroduceFinishBtn" onclick="modifyIntroduceFinish();">변경</button>
						</td>
						<td></td>
					</tr>
					<tr id="jymTr">
						<th>마이 짐</th>
						<td>${loginUser.memberJym }</td>
						<td><button class="btn btn-light" onclick="modifyJym();">마이 짐 변경</button></td>
					</tr>
					<!-- 마이짐 변경 -->
					<tr id="change-jymTr" style="display: none;">
						<th width="200px;">마이 짐</th>
						<td colspan="2">
						<input name="memberJym" id="memberJym" type="text" size="35">
						<button class="btn btn-light" onclick="showMap();">검색</button>
						<br><br>
						<button class="btn btn-light" onclick="modifyJymCancel();">취소</button>
						<button class="btn btn-light" id="modifyjymFinishBtn" onclick="modifyJymFinish();">변경</button>
						</td>
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
	function modifyEmail(){
		$("#emailTr").hide();
		$("#change-emailTr").show();
	}
	function modifyCareer(){
		$("#careerTr").hide();
		$("#change-careerTr").show();
	}
	function modifySBD(){
		$("#SBDTr").hide();
		$("#change-SBDTr").show();
	}
	function modifyIntroduce(){
		$("#introduceTr").hide();
		$("#change-introduceTr").show();
	}
	function modifyJym(){
		$("#jymTr").hide();
		$("#change-jymTr").show();
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
	function modifyNickCancel(){
		$("#memberNick").val("");
		$(".nick.ok").hide()
		$(".nick.guide").hide()
		$(".nick.error").hide()
		$("#change-nickTr").hide();
		$("#nickTr").show();
	}
	function modifyEmailCancel(){
		$("#memberEmail").val("");
		$("#certificationBtn").val("");
		$(".email.error").hide()
		$("#change-emailTr").hide();
		$("#emailTr").show();
	}
	function modifyCareerCancel(){
		$("#change-careerTr").hide();
		$("#careerTr").show();
	}
	function modifySBDCancel(){
		$("#change-SBDTr").hide();
		$("#SBDTr").show();
	}
	function modifyIntroduceCancel(){
		$("#change-introduceTr").hide();
		$("#introduceTr").show();
	}
	function modifyJymCancel(){
		$("#change-jymTr").hide();
		$("#jymTr").show();
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
							$("#pwd").val("");
							alert("비밀번호가 변경되었습니다.");
						}else{
							alert("현재 비밀번호가 일치하지 않습니다.")
						}
					}
				})
			}
		}
		
	}
	function modifyNickFinish(){
		var memberId = $("#memberId").text();
		var memberNick = $("#memberNick").val();
		if(memberNick ==""){
			alert("닉네임을 입력해주세요.")
		}else{
			if(confirm('닉네임을 변경하시겠습니까?')){
				$.ajax({
					url:"/member/myinfoNick.strap",
					type:"get",
					data:{"memberNick" : memberNick, "memberId" : memberId},
					success:function(result){
						if(result =='ok'){
							$("#change-nickTr").hide();
							$("#nickTr").show();
							$("#memberNick").val("");
							alert("닉네임이 변경되었습니다.")
							location.href="/mypage/myinfoView.strap"
						}else{
							alert("닉네임 변경에 실패하였습니다 관리자에게 문의해주세요.")
						}
					}
				})
			}
		}
		
	}

	function modifyEmailFinish(){
		var memberId = $("#memberId").text();
		var memberEmail = $("#memberEmail").val();
		if($(".email.error").css("display") == 'none' && memberEmail.length>1){
			if(confirm("이메일을 변경하시겠습니까?")){
			$.ajax({
				url:"/member/myinfoEmail.strap",
				type:"get",
				data:{"memberEmail" : memberEmail, "memberId" : memberId},
				success:function(result){
					console.log(result);
					if(result =='ok'){
						$("#change-emailTr").hide();
						$("#emailTr").show();
						$("#memberEmail").val("");
						alert("이메일이 변경되었습니다.")
						location.href="/mypage/myinfoView.strap"
					}else{
						alert("이메일 변경에 실패하였습니다 관리자에게 문의해주세요.")
					}
				}
			})
			} 
		}else{
			alert("이메일을 입력해주세요.")
		}
	}
	
	function modifyCareerFinish(){
		var memberId = $("#memberId").text();
		var memberCareer = $("#memberCareer").val();
			if(confirm("운동경력을 변경하시겠습니까?")){
				$.ajax({
					url:"/member/myinfoCareer.strap",
					type:"get",
					data:{"memberCareer" : memberCareer, "memberId" : memberId},
					success:function(result){
						console.log(result);
						if(result =='ok'){
							$("#change-careerTr").hide();
							$("#careerTr").show();
							alert("운동경력이 변경되었습니다.");
							location.href="/mypage/myinfoView.strap"
						}else{
							alert("운동경력 변경에 실패하였습니다 관리자에게 문의해주세요.")
						}
					}
				})
			} 
	}
	
	function modifySBDFinish(){
		var memberId = $("#memberId").text();
		var memberSBD = $("#memberSBD").val();
			if(confirm("3대 기록을 변경하시겠습니까?")){
				$.ajax({
					url:"/member/myinfoSBD.strap",
					type:"get",
					data:{"memberSBD" : memberSBD, "memberId" : memberId},
					success:function(result){
						console.log(result);
						if(result =='ok'){
							$("#change-SBDTr").hide();
							$("#SBDTr").show();
							alert("3대 기록이 변경되었습니다.");
							location.href="/mypage/myinfoView.strap"
						}else{
							alert("3대 기록 변경에 실패하였습니다 관리자에게 문의해주세요.")
						}
					}
				})
			} 
	}
	
	function modifyIntroduceFinish(){
		var memberId = $("#memberId").text();
		var memberIntroduce = $("#memberIntroduce").val();
			if(confirm("자기소개를 변경하시겠습니까?")){
				$.ajax({
					url:"/member/myinfoIntroduce.strap",
					type:"post",
					data:{"memberIntroduce" : memberIntroduce, "memberId" : memberId},
					success:function(result){
						console.log(result);
						if(result =='ok'){
							$("#change-introduceTr").hide();
							$("#introduceTr").show();
							alert("자기소개가 변경되었습니다.");
							location.href="/mypage/myinfoView.strap"
						}else{
							alert("자기소개 변경에 실패하였습니다 관리자에게 문의해주세요.")
						}
					}
				})
			} 
	}
	
	function modifyJymFinish(){
		var memberId = $("#memberId").text();
		var memberJym = $("#memberJym").val();
		if(memberJym.length > 1){
			
		if(confirm("마이짐을 변경하시겠습니까?")){
				$.ajax({
					url:"/member/myinfoJym.strap",
					type:"post",
					data:{"memberJym" : memberJym, "memberId" : memberId},
					success:function(result){
						console.log(result);
						if(result =='ok'){
							$("#change-jymTr").hide();
							$("#jymTr").show();
							alert("마이짐이 변경되었습니다.");
							location.href="/mypage/myinfoView.strap"
						}else{
							alert("마이짐 변경에 실패하였습니다 관리자에게 문의해주세요.")
						}
					}
				})
			} 
		}else{
			alert("마이짐을 검색해주세요");
		}	
	}
	function showMap(){
		window.open("/member/showMap.strap",null,"width=700,height=600,resizable=no");
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
						$("#modifyNickFinishBtn").attr("disabled",false);
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
	
	$("#memberEmail").on("keyup",function(){
		var memberEmail = $("#memberEmail").val()
		var regExt = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
		if(regExt.test(memberEmail)){
			$(".email.error").hide();
		}else{
			$(".email.error").show();
		}
	})
	
</script>
</body>
</html>