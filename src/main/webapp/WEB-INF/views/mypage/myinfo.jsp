<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Member Informaiton</title>
<!-- CDN -->
<!-- 부트스트랩 -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" />
<!-- jQuery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- css -->
<link rel="stylesheet" type="text/css" href="/resources/css/common.css">
<!-- 다음주소API -->
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style>
.contents-side.col {
	padding-left: 15px;
}

.contents-side.col th, .contents-side.col td {
	height: 50px;
}

.registerForm {
	margin: 0px auto;
	text-align: center;
	width: 500px;
}

.registerForm input {
	text-align: center;
}

.registerForm label {
	margin-right: 120px;
}

select.select {
	width: 185px;
}

td button {
	width: 200px;
}

.change {
	width: 180px;
}

span.id, span.pwd, span.pwdCheck, span.nick, span.email {
	display: none;
	font-size: 12px;
	top: 12px;
	right: 10px;
}

span.ok {
	color: green;
}

span.error {
	color: red;
}

span.guide {
	color: red;
}

.imgDiv {
	width: 100px;
	height: 100px;
	border-radius: 30px;
	margin-left: 50px;
	margin-bottom: 25px;
	overflow: hidden;
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
			<div class="sidebar col-3">
				<jsp:include page="/WEB-INF/views/common/sideBarMyPage.jsp"></jsp:include>
			</div>
			<div class="contents-side col">
				<div id="essential info">
					<span>기본 회원 정보(필수) </span>
					<hr>
					<table class="table" style="table-layout: fixed;">
						<tr>
							<th width="250px;">아이디</th>
							<td width="750px;" id="memberId">${loginUser.memberId }</td>
							<td width="200px;"></td>
						</tr>
						<tr id="pwdTr">
							<th>비밀번호</th>
							<td>**********</td>
							<td><button class="btn btn-light" onclick="modifyPwd();">비밀번호
									변경</button></td>
						</tr>
						<!-- 비밀번호 수정 -->
						<tr id="change-pwdTr" style="display: none;">
							<th>비밀번호</th>
							<td colspan="2">
								<div>
									<label class="change pwd" for="pwd">현재 비밀번호</label><input
										type="password" id="pwd"><br> <label
										class="change newPwd" for="newPwd">신규 비밀번호</label><input
										type="password" id="newPwd"> <span class="pwd ok">사용가능한
										비밀번호입니다.</span> <span class="pwd guide">비밀번호는 영문,숫자 조합 최소
										6자입니다.</span><br> <label class="change newPwdChek"
										for="newPwdCheck">신규 비밀번호 재 입력</label><input type="password"
										id="newPwdCheck"> <span class="pwdCheck ok">비밀번호와
										일치합니다</span> <span class="pwdCheck error">비밀번호와 일치하지 않습니다.</span><br>
									<br>
									<button class="btn btn-light" onclick="modifyPwdCancel();">취소</button>
									<button class="btn btn-light" id="modifyPwdFinishBtn"
										onclick="modifyPwdFinish();" disabled>변경</button>
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
							<td><button class="btn btn-light" onclick="modifyNick();">닉네임
									변경</button></td>
						</tr>
						<!--  닉네임 수정 -->
						<tr id="change-nickTr" style="display: none;">
							<th>닉네임</th>
							<td colspan="2"><input id="memberNick" type="text">
								<span class="nick ok">이 닉네임은 사용 가능합니다.</span> <span
								class="nick error">이 닉네임은 사용 할 수 없습니다.</span> <span
								class="nick guide">닉네임은 2~8글자입니다.</span> <br>
							<br>
								<button class="btn btn-light" onclick="modifyNickCancel();">취소</button>
								<button class="btn btn-light" id="modifyNickFinishBtn"
									onclick="modifyNickFinish();" disabled>변경</button></td>
						</tr>
						<tr id="emailTr">
							<th>이메일</th>
							<td>${loginUser.memberEmail }</td>
							<td><button class="btn btn-light" onclick="modifyEmail();">이메일
									변경</button></td>
						</tr>
						<!-- 이메일 수정 -->
						<tr id="change-emailTr" style="display: none;">
							<th>이메일</th>
							<td colspan="2"><input id="memberEmail" type="email"
								placeholder="이메일 주소 입력"> <span class="email error">이메일
									주소를 다시 확인해주세요</span><br> <br>
							<br>
								<button class="btn btn-light" onclick="modifyEmailCancel();">취소</button>
								<button class="btn btn-light" id="modifyEmailFinishBtn"
									onclick="modifyEmailFinish();">변경</button></td>
						</tr>
						<tr id="careerTr">
							<th>운동경력</th>
							<td><c:if test="${loginUser.memberCareer eq '1'}">
								1년 이하
							</c:if> <c:if test="${loginUser.memberCareer eq '1-2'}">
								1년~2년
							</c:if> <c:if test="${loginUser.memberCareer eq '2-3'}">
								2년~3년
							</c:if> <c:if test="${loginUser.memberCareer eq '3-5'}">
								3년~5년
							</c:if> <c:if test="${loginUser.memberCareer eq '5-10'}">
								5년~10년
							</c:if> <c:if test="${loginUser.memberCareer eq '10'}">
								10년 이상
							</c:if></td>
							<td><button class="btn btn-light" onclick="modifyCareer();">운동경력
									변경</button></td>
						</tr>
						<!-- 운동경력 수정 -->
						<tr id="change-careerTr" style="display: none;">
							<th>운동경력</th>
							<td colspan="2"><select name="memberCareer"
								id="memberCareer">
									<option value="1">1년 이하</option>
									<option value="1-2">1년~2년</option>
									<option value="2-3">2년~3년</option>
									<option value="3-5">3년~5년</option>
									<option value="5-10">5년~10년</option>
									<option value="10">10년 이상</option>
							</select><br>
							<br>
								<button class="btn btn-light" onclick="modifyCareerCancel();">취소</button>
								<button class="btn btn-light" id="modifyCareerFinishBtn"
									onclick="modifyCareerFinish();">변경</button></td>
						</tr>
						<tr id="SBDTr">
							<th>3대 기록</th>
							<td><c:if test="${loginUser.memberSBD eq '200'}">
								200 이하
							</c:if> <c:if test="${loginUser.memberSBD ne '200'}">
								${loginUser.memberSBD}
							</c:if></td>
							<td><button class="btn btn-light" onclick="modifySBD();">3대
									기록 변경</button></td>
						</tr>
						<!-- 3대 기록 수정 -->
						<tr id="change-SBDTr" style="display: none;">
							<th>3대 기록</th>
							<td colspan="2"><select name="memberSBD" id="memberSBD">
									<option value="200">200 이하</option>
									<option value="200~300">200~300</option>
									<option value="300~350">300~350</option>
									<option value="350~400">350~400</option>
									<option value="400~450">400~450</option>
									<option value="450~500">450~500</option>
									<option value="500~600">500~600</option>
									<option value="600">600 이상</option>
							</select><br>
							<br>
								<button class="btn btn-light" onclick="modifySBDCancel();">취소</button>
								<button class="btn btn-light" id="modifySBDFinishBtn"
									onclick="modifySBDFinish();">변경</button></td>
						</tr>
						<tr>
							<th>성별</th>
							<td colspan="2"><c:if
									test="${loginUser.memberGender eq 'M'}">
								남성
							</c:if> <c:if test="${loginUser.memberGender eq 'F'}">
								여성
							</c:if></td>
						</tr>
						<tr id="jymTr">
							<th>마이 짐</th>
							<td>${loginUser.memberJym }</td>
							<td><button class="btn btn-light" onclick="modifyJym();">마이짐 변경</button></td>
						</tr>
						<!-- 마이짐 변경 -->
						<tr id="change-jymTr" style="display: none;">
							<th width="200px;">마이 짐</th>
							<td colspan="2">
								<input name="jymAddress" id="jymAddress" type="text" size="35">
								<input name="jymTitle" id="jymTitle" type="text" size="35">
								<button class="btn btn-light" onclick="showMap();">검색</button> <br>
								<br>
								<button class="btn btn-light" onclick="modifyJymCancel();">취소</button>
								<button class="btn btn-light" id="modifyjymFinishBtn" onclick="modifyJymFinish();">변경</button>
							</td>
						</tr>
					</table>
				</div>
				<br>
				<br>
				<br>
				<div id="optional info">
					<span>추가 회원 정보(선택) </span>
					<hr>
					<table class="table" style="table-layout: fixed;">
						<tr id="imgTr">
							<th width="250px">사진</th>
							<td width="750px;">
								<div class="imgDiv">
									<c:if test="${loginUser.mProfileRename eq null}">
										<img width="100%" height="100%" alt="프로필 사진"
											src="/resources/profileUploadFiles/default.png">
									</c:if>
									<c:if test="${loginUser.mProfileRename ne null}">
										<img width="100px" height="100px" alt="프로필 사진"
											src="/resources/profileUploadFiles/${loginUser.mProfileRename }">
									</c:if>
								</div>
							</td>
							<td width="200px;"><button class="btn btn-light"
									onclick="modifyImg();">사진 변경</button></td>
						</tr>
						<!-- 사진 변경 -->
						<tr id="change-imgTr" style="display: none;">
							<th width="250px">사진</th>
							<td width="750px;">
								<div class="imgDiv">
									<c:if test="${loginUser.mProfileRename eq null}">
										<img class="preview" width="100px" height="100px" alt="프로필 사진"
											src="/resources/profileUploadFiles/default.png">
									</c:if>
									<c:if test="${loginUser.mProfileRename ne null}">
										<img class="preview" width="100px" height="100px" alt="프로필 사진"
											src="/resources/profileUploadFiles/${loginUser.mProfileRename }">
									</c:if>
								</div> <br>
								<button id="defaultBtn" class="btn btn-light" id="">기본
									이미지</button> <label for="mProfileName" class="btn btn-light"
								style="display: inline-block; width: 200px;">사진 선택</label> <input
								id="mProfileName" name="mProfileName" type="file"
								accept="image/jpeg, image/jpg, image/png" hidden="hidden"
								multiple="multiple"> <input id="mProfileName"
								name="mProfileName" type="file"
								accept="image/jpeg, image/jpg, image/png" hidden="hidden"
								multiple="multiple"> <br>
							<br>
								<button class="btn btn-light" onclick="modifyImgCancel();">취소</button>
								<button class="btn btn-light" id="modifyImgFinishBtn"
									onclick="modifyImgFinish();">변경</button>
							</td>
							<td width="200px;"></td>
						</tr>
						<tr id="introduceTr">
							<th>자기 소개</th>
							<td>${loginUser.memberIntroduce }</td>
							<td><button class="btn btn-light" onclick="modifyIntroduce();">자기소개 변경</button></td>
						</tr>
						<!-- 자기소개 변경 -->
						<tr id="change-introduceTr" style="display: none;">
							<th>자기 소개</th>
							<td><textarea name="memberIntroduce" id="memberIntroduce"
									rows="10" cols="90">${loginUser.memberIntroduce }</textarea> <br>
							<br>
								<button class="btn btn-light" onclick="modifyIntroduceCancel();">취소</button>
								<button class="btn btn-light" id="modifyIntroduceFinishBtn" onclick="modifyIntroduceFinish();">변경</button></td>
							<td></td>
						</tr>
						
						<tr id="addrTr">
							<th>주소</th>
							<td>${loginUser.memberAddress }</td>
							<td><button class="btn btn-light" onclick="modifyAddr();">주소
									변경</button></td>
						</tr>
						<!-- 주소 변경 -->
						<tr id="change-addrTr" style="display: none;">
							<th>주소</th>
							<td colspan="2"><input name="memberAddress" id="memberAddress" type="text" size="35">
								<button class="btn btn-light" onclick="showAddr();">검색</button>
								<br>
							<br>
								<button class="btn btn-light" onclick="modifyAddrCancel();">취소</button>
								<button class="btn btn-light" id="modifyAddrFinishBtn" onclick="modifyAddrFinish();">변경</button></td>
						</tr>
					</table>
				</div>
				<br>
				<br>
				<br>
				<div id="Withdrawal">
					<span>탈퇴 </span>
					<hr>
					<table class="table" style="table-layout: fixed;">
						<tr>
							<th width="250px;">회원 탈퇴</th>
							<td width="750px;"></td>
							<td width="200px;"><button class="btn btn-light"
									onclick="withdrawal();">회원탈퇴</button></td>
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
		function withdrawal() {
			if (confirm("정말 회원탈퇴를 하시겠습니까?")) {
				var memberId = '${loginUser.memberId}';
				var form = document.createElement('form');
				form.setAttribute('method', 'post');
				form.setAttribute('action', '/member/withdrawal.strap');
				var input = document.createElement('input');
				input.setAttribute('type', 'hidden');
				input.setAttribute('name', 'memberId');
				input.setAttribute('value', memberId);
				form.appendChild(input);
				document.body.appendChild(form);
				form.submit();
				console.log($("form"));
				alert('회원 탈퇴되었습니다.');
			}
		}
		var formData = new FormData();
		function modifyImgFinish() {
			//선택된 사진이 있는지?
			if ($("#mProfileName")[0].files[0] != null) {
				if (confirm("사진을 변경하시겠습니까?")) {
					//preview img src에 따라 선택
					//선택한 이미지로
					if ($(".preview").attr("src") != "/resources/profileUploadFiles/default.png") {
						var memberId = $("#memberId").text();
						formData.append("mProfileName",
								$("#mProfileName")[0].files[0]);
						formData.append("memberId", memberId);
						$.ajax({
							url : "/member/profileImg.strap",
							type : "post",
							enctype : 'multipart/form-data',
							processData : false,
							contentType : false,
							data : formData,
							success : function(result) {
								if (result == "ok") {
									alert("프로필 사진이 변경되었습니다.");
									location.href = "/mypage/myinfoView.strap"
								}
							},
						})
					}
					//기본 이미지로
					else {
						changeDefaultImg();
					}
				}
				//선택된 사진이 없으면 기본이미지로 변경
			} else {
				if (confirm("기본 이미지로 변경하시겠습니까?")) {
					changeDefaultImg();
				}

			}
			;

			function changeDefaultImg() {
				$.ajax({
					url : "/member/profileDefaultImg.strap",
					type : "post",
					data : {
						"defaultImg" : "defaultImg"
					},
					success : function(result) {
						if (result == "ok") {
							alert("기본 이미지로 사진이 변경되었습니다.");
							location.href = "/mypage/myinfoView.strap"
						}
					},
				})
			}
			;
		}

		$("#mProfileName").on("change", function(e) {
			var img = e.target.files[0];
			if (img != null) {
				//URL.createObjectURL(img) 매개변수에 들어온 파일의 바이너리 데이터를 추출한다
				$(".preview").attr("src", URL.createObjectURL(img));
			}
		})
		$("#defaultBtn").on(
				"click",
				function() {
					$(".preview").attr("src",
							"/resources/profileUploadFiles/default.png");
				})

		function modifyPwd() {
			$("#pwdTr").hide();
			$("#change-pwdTr").show();
		}
		function modifyNick() {
			$("#nickTr").hide();
			$("#change-nickTr").show();
		}
		function modifyEmail() {
			$("#emailTr").hide();
			$("#change-emailTr").show();
		}
		function modifyCareer() {
			$("#careerTr").hide();
			$("#change-careerTr").show();
		}
		function modifySBD() {
			$("#SBDTr").hide();
			$("#change-SBDTr").show();
		}
		function modifyIntroduce() {
			var memberIntroduce = $("#memberIntroduce").val();
			memberIntroduce = memberIntroduce.replace(/<br>/g,'\n');
			$("#memberIntroduce").val(memberIntroduce);
			$("#introduceTr").hide();
			$("#change-introduceTr").show();
		}
		function modifyJym() {
			$("#jymTr").hide();
			$("#change-jymTr").show();
		}
		function modifyImg() {
			$("#imgTr").hide();
			$("#change-imgTr").show();
		}
		function modifyAddr() {
			$("#addrTr").hide();
			$("#change-addrTr").show();
		}
		function modifyPwdCancel() {
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
		function modifyNickCancel() {
			$("#memberNick").val("");
			$(".nick.ok").hide()
			$(".nick.guide").hide()
			$(".nick.error").hide()
			$("#change-nickTr").hide();
			$("#nickTr").show();
		}
		function modifyEmailCancel() {
			$("#memberEmail").val("");
			$("#certificationBtn").val("");
			$(".email.error").hide()
			$("#change-emailTr").hide();
			$("#emailTr").show();
		}
		function modifyCareerCancel() {
			$("#change-careerTr").hide();
			$("#careerTr").show();
		}
		function modifySBDCancel() {
			$("#change-SBDTr").hide();
			$("#SBDTr").show();
		}
		function modifyIntroduceCancel() {
			$("#change-introduceTr").hide();
			$("#introduceTr").show();
		}
		function modifyJymCancel() {
			$("#change-jymTr").hide();
			$("#jymTr").show();
		}
		function modifyAddrCancel() {
			$("#memberAddress").val("");
			$("#change-addrTr").hide();
			$("#addrTr").show();
		}
		function modifyImgCancel() {
			$("#change-imgTr").hide();
			$("#imgTr").show();
			//취소했을떄 preview 원래대로
			var mProfileRename = '${loginUser.mProfileRename}';
			if (mProfileRename == '') {
				var src = "default.png";
			} else {
				var src = '${loginUser.mProfileRename }';
			}
			$(".preview").attr("src", "/resources/profileUploadFiles/" + src);
		}
		function modifyPwdFinish() {
			var memberId = $("#memberId").text();
			var pwd = $("#pwd").val();
			var newPwd = $("#newPwd").val();
			if (pwd == "") {
				alert("현재 비밀번호를 입력해주세요.")
			} else {
				if (confirm('비밀번호를 변경하시겠습니까?')) {
					$.ajax({
						url : "/member/myinfoPwd.strap",
						type : "post",
						data : {
							"pwd" : pwd,
							"newPwd" : newPwd,
							"memberId" : memberId
						},
						success : function(result) {
							if (result == 'ok') {
								$("#change-pwdTr").hide();
								$("#pwdTr").show();
								$("#pwd").val("");
								alert("비밀번호가 변경되었습니다.");
							} else {
								alert("현재 비밀번호가 일치하지 않습니다.")
							}
						}
					})
				}
			}

		}
		function modifyNickFinish() {
			var memberId = $("#memberId").text();
			var memberNick = $("#memberNick").val();
			if ($(".nick.ok").css("display") == 'none') {
				alert("닉네임을 확인해주세요.")
			} else {
				if (confirm('닉네임을 변경하시겠습니까?')) {
					$.ajax({
						url : "/member/myinfoNick.strap",
						type : "get",
						data : {
							"memberNick" : memberNick,
							"memberId" : memberId
						},
						success : function(result) {
							if (result == 'ok') {
								$("#change-nickTr").hide();
								$("#nickTr").show();
								$("#memberNick").val("");
								alert("닉네임이 변경되었습니다.")
								location.href = "/mypage/myinfoView.strap"
							} else {
								alert("닉네임 변경에 실패하였습니다 관리자에게 문의해주세요.")
							}
						}
					})
				}
			}

		}

		function modifyEmailFinish() {
			var memberId = $("#memberId").text();
			var memberEmail = $("#memberEmail").val();
			if ($(".email.error").css("display") == 'none'
					&& memberEmail.length > 1) {
				if (confirm("이메일을 변경하시겠습니까?")) {
					$.ajax({
						url : "/member/myinfoEmail.strap",
						type : "get",
						data : {
							"memberEmail" : memberEmail,
							"memberId" : memberId
						},
						success : function(result) {
							console.log(result);
							if (result == 'ok') {
								$("#change-emailTr").hide();
								$("#emailTr").show();
								$("#memberEmail").val("");
								alert("이메일이 변경되었습니다.")
								location.href = "/mypage/myinfoView.strap"
							} else {
								alert("이메일 변경에 실패하였습니다 관리자에게 문의해주세요.")
							}
						}
					})
				}
			} else {
				alert("이메일을 입력해주세요.")
			}
		}

		function modifyCareerFinish() {
			var memberId = $("#memberId").text();
			var memberCareer = $("#memberCareer").val();
			if (confirm("운동경력을 변경하시겠습니까?")) {
				$.ajax({
					url : "/member/myinfoCareer.strap",
					type : "get",
					data : {
						"memberCareer" : memberCareer,
						"memberId" : memberId
					},
					success : function(result) {
						console.log(result);
						if (result == 'ok') {
							$("#change-careerTr").hide();
							$("#careerTr").show();
							alert("운동경력이 변경되었습니다.");
							location.href = "/mypage/myinfoView.strap"
						} else {
							alert("운동경력 변경에 실패하였습니다 관리자에게 문의해주세요.")
						}
					}
				})
			}
		}

		function modifySBDFinish() {
			var memberId = $("#memberId").text();
			var memberSBD = $("#memberSBD").val();
			if (confirm("3대 기록을 변경하시겠습니까?")) {
				$.ajax({
					url : "/member/myinfoSBD.strap",
					type : "get",
					data : {
						"memberSBD" : memberSBD,
						"memberId" : memberId
					},
					success : function(result) {
						console.log(result);
						if (result == 'ok') {
							$("#change-SBDTr").hide();
							$("#SBDTr").show();
							alert("3대 기록이 변경되었습니다.");
							location.href = "/mypage/myinfoView.strap"
						} else {
							alert("3대 기록 변경에 실패하였습니다 관리자에게 문의해주세요.")
						}
					}
				})
			}
		}

		function modifyIntroduceFinish() {
			var memberId = $("#memberId").text();
			var memberIntroduce = $("#memberIntroduce").val();
			console.log(memberIntroduce);
			memberIntroduce = memberIntroduce.replace(/(\n|\r\n)/g,'<br>');
			console.log(memberIntroduce);
			if (confirm("자기소개를 변경하시겠습니까?")) {
				$.ajax({
					url : "/member/myinfoIntroduce.strap",
					type : "post",
					data : {
						"memberIntroduce" : memberIntroduce,
						"memberId" : memberId
					},
					success : function(result) {
						console.log(result);
						if (result == 'ok') {
							$("#change-introduceTr").hide();
							$("#introduceTr").show();
							alert("자기소개가 변경되었습니다.");
							location.href = "/mypage/myinfoView.strap"
						} else {
							alert("자기소개 변경에 실패하였습니다 관리자에게 문의해주세요.")
						}
					}
				})
			}
		}

		function modifyJymFinish() {
			var memberId = $("#memberId").text();
			var jymAddress = $("#jymAddress").val();
			var jymTitle = $("#jymTitle").val();
			if (jymAddress.length > 1 && jymTitle.length > 1) {
				if (confirm("마이짐을 변경하시겠습니까?")) {
					$.ajax({
						url : "/member/myinfoJym.strap",
						type : "post",
						data : {
							"jymAddress" : jymAddress,
							"jymTitle" : jymTitle,
							"memberId" : memberId
						},
						success : function(result) {
							console.log(result);
							if (result == 'ok') {
								$("#change-jymTr").hide();
								$("#jymTr").show();
								alert("마이짐이 변경되었습니다.");
								location.href = "/mypage/myinfoView.strap"
							} else {
								alert("마이짐 변경에 실패하였습니다 관리자에게 문의해주세요.")
							}
						}
					})
				}
			} else {
				alert("마이짐을 검색해주세요");
			}
		}

		function modifyAddrFinish() {
			var memberId = $("#memberId").text();
			var memberAddr = $("#memberAddress").val();
			if (memberAddr.length > 1) {
				if (confirm("주소를 변경하시겠습니까?")) {
					$.ajax({
						url : "/member/myinfoAddr.strap",
						type : "post",
						data : {
							"memberAddr" : memberAddr,
							"memberId" : memberId
						},
						success : function(result) {
							console.log(result);
							if (result == 'ok') {
								$("#change-addrTr").hide();
								$("#addrTr").show();
								alert("주소가 변경되었습니다.");
								location.href = "/mypage/myinfoView.strap"
							} else {
								alert("주소 변경에 실패하였습니다 관리자에게 문의해주세요.");
							}
						}
					})
				}
			} else {
				alert("주소를 검색해주세요");
			}
		}

		//카카오지도API
		function showMap() {
			window.open("/member/showMap.strap", null,"width=700,height=600,resizable=no");
		}

		//주소API
		function showAddr() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
							// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

							// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
							// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
							var roadAddr = data.roadAddress; // 도로명 주소 변수
							var extraRoadAddr = ''; // 참고 항목 변수

							// 법정동명이 있을 경우 추가한다. (법정리는 제외)
							// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
							if (data.bname !== ''
									&& /[동|로|가]$/g.test(data.bname)) {
								extraRoadAddr += data.bname;
							}
							// 건물명이 있고, 공동주택일 경우 추가한다.
							if (data.buildingName !== ''
									&& data.apartment === 'Y') {
								extraRoadAddr += (extraRoadAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
							if (extraRoadAddr !== '') {
								extraRoadAddr = ' (' + extraRoadAddr + ')';
							}

							// 우편번호와 주소 정보를 해당 필드에 넣는다.
							document.getElementById("memberAddress").value = data.zonecode
									+ "," + roadAddr;
						}
					}).open();
		}
		
		$("#newPwd").on("keyup", function() {
			var memberPwd = $("#newPwd").val();
			var regExt = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,12}$/;
			if (!regExt.test(memberPwd)) {
				$(".pwd.ok").hide()
				$(".pwd.guide").show()
			} else {
				$(".pwd.guide").hide()
				$(".pwd.ok").show()
			}
			;
		})

		$("#newPwdCheck").on("keyup", function() {
			var memberPwd = $("#newPwd").val();
			var memberPwdCheck = $("#newPwdCheck").val();
			if (memberPwd == memberPwdCheck) {
				$(".pwdCheck.error").hide();
				$(".pwdCheck.ok").show();
				$("#modifyPwdFinishBtn").attr("disabled", false);
			} else {
				$(".pwdCheck.ok").hide();
				$(".pwdCheck.error").show();
			}
			;
		})

		$("#memberNick").on("keyup", function() {
			var memberNick = $("#memberNick").val();
			$.ajax({
				url : "/member/memberNickCheck.strap",
				type : "get",
				data : {
					"memberNick" : memberNick
				},
				success : function(result) {
					if (memberNick.length > 1 && memberNick.length < 9) {
						if (result == "ok") {
							$(".nick.guide").hide();
							$(".nick.error").hide();
							$(".nick.ok").show();
							$("#modifyNickFinishBtn").attr("disabled", false);
						} else {
							$(".nick.guide").hide();
							$(".nick.ok").hide();
							$(".nick.error").show();
						}
					} else {
						$(".nick.error").hide();
						$(".nick.ok").hide();
						$(".nick.guide").show();
					}
				},
				error : function() {
				}
			});
		});

		$("#memberEmail").on("keyup", function() {
			var memberEmail = $("#memberEmail").val()
			var regExt = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
			if (regExt.test(memberEmail)) {
				$(".email.error").hide();
			} else {
				$(".email.error").show();
			}
		})
	</script>
</body>
</html>