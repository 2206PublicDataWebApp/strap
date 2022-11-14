<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Note</title>
<!-- CDN -->
<!-- 부트스트랩 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" />
<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- css -->
<link rel="stylesheet" type="text/css" href="/resources/css/common.css">
<link rel="stylesheet" type="text/css" href="/resources/css/modal.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">

<style>
	.container{
		max-width: 660px;
	}
	.contents-side.col{
		padding-left: 15px;
	}
	.contents-side.col th, .contents-side.col td{
		height: 50px;
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
	.profile-input{
	border:none;
}
	
</style>
</head>
<body>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
	<div class="container">
		<div class="row">
			<div class="contents-side col">
				<div id="essential info">
					<br>
					<span><h5> 쪽지 </h5></span>
				</div>
			</div>
			<div class="col text-end">
				<br>
				<button class="btn btn-dark" onclick="noteBoxBack();">목록으로</button>
				<button class="btn btn-warning" data-bs-toggle="modal" data-bs-target="#reportNote" id="btn-2">신고</button>
			</div>
		</div>
		<hr>
		<div class="row">
			<div class="col">
				보낸 사람 : ${noteBox.senderNick }
			</div>
		</div>
		<div class="row">
			<div class="col">
				보낸 시간 : <fmt:formatDate pattern="yyyy-MM-dd / hh:mm:ss" value="${noteBox.senderTime }"/>
			</div>
		</div>
		<hr>
		<!-- 수락 전  -->
		<c:if test="${noteBox.noteAccept eq 'N' }"> 
			<div class="row border border-secondary border-opacity-50">
				<div id="profile">
					<div class="row" id="info">
						<div class="col-5" id="info-img">
							<div class="imgDiv" style="height: 300px; margin-top: 10px;">
							<c:if test="${empty member.mProfilePath }">
								<img id="profileImg" width="100%" height="100%" style="margin:10px;border-radius:30px;" src="/resources/profileUploadFiles/default.png">
							</c:if>
							<c:if test="${not empty member.mProfilePath }">
								<img id="profileImg" width="100%" height="100%" style="margin:10px;border-radius:30px;" src="/resources/profileUploadFiles/${member.mProfileRename }">
							</c:if>
							</div>
						</div>
						<div class="col" id="info-detail">
							<table id="infoTable" class="table table-borderless">
								<tr>
									<th>닉네임</th>
									<td>
										<input class="profile-input" type="text" id="memberNick"  value="${member.memberName }" readonly>
									</td>
								</tr>
								<tr>
									<th>운동경력</th>
									<td>
										<input class="profile-input" type="text" id="memberCareer" value="${member.memberCareer}" readonly>
									</td>
								</tr>
								<tr>
									<th>3대 기록</th>
									<td>
										<input class="profile-input" type="text" id="memberSBD" value="${member.memberSBD}" readonly>
									</td>
								</tr>
								<tr>
									<th>마이짐</th>
									<td>
										<input class="profile-input" type="text" id="jymAddress" name="jymAddress" style="width: 250px;border:0;" value="${jymAddress}"  readonly><br>
										<input class="profile-input" type="text" id="jymTitle" name="jymTitle" style="width: 250px;border:0;" value="${jymTitle}" readonly>	
									</td>
								</tr>
								<tr>
									<th>성별</th>
									<td>
										<input class="profile-input" type="text" id="memberGender" name="memberGender" style="width: 250px;border: 0" value="${member.memberGender}" readonly> 
									</td>
								</tr>
								<tr>
									<th>매너점수</th>
									<td>
										<input class="profile-input" type="text" id="memberManner" name="membmerManner" value="${member.memberManner}" readonly>
									</td>
								</tr>
								<tr>
									<th>자기소개</th>
									<td><textarea class="profile-input" id="memberIntroduce"  readonly>${member.memberIntroduce}</textarea></td>
								</tr>
							</table>
						</div>
					</div>
				</div>
			</div>
			<br>
			<div class="row text-center">
				<div class="col">
					<button class="btn btn-dark" id="accept">수락</button>
				</div>
			</div>
			<div class="row text-center" id="chat-window" style="display:none;">
				<div class="col">
					<span id="chat-column">
						
					</span>
				</div>
			</div>
			<br>
			<div class="row text-center" id="chat-area" style="display:none;">
				<div class="col">
					<div class="row">
						<div class="col">
							<input class="form-control" type="text" id="chat-contents" required>
							<button class="btn btn-dark" id="chat-btn">입력</button>
						</div>
					</div>
					<br>
					<div class="row">
						<div class="col" align="center">
							<button class="btn btn-dark">일정잡기</button>
						</div>
					</div>
				</div>
			</div>
			<br>
		</c:if>
		<!-- 수락 후 -->
		<c:if test="${noteBox.noteAccept eq 'Y' }">
			<div class="row text-center">
				<div class="col">
					<button class="btn btn-primary" id="accept" style="display:none;">수락</button>
				</div>
			</div>
			<div class="row text-center" id="chat-window" style="display:block;">
				<div class="col">
					<span id="chat-column">
						
					</span>
				</div>
			</div>
			<br>
			<div class="row text-center" id="chat-area" style="display:block;">
				<div class="col">
					<div class="row">
						<div class="col">
						</div>
						<div class="col-auto">
							<input class="form-control" type="text" id="chat-contents" required>
						</div>
						<div class="col-auto">
							<button class="btn btn-dark" id="chat-btn">입력</button>
						</div>
						<div class="col">
						</div>
					</div>
					<hr>
					<c:if test="${noteBox.recipientId eq memberId }"> 
						<div class="row">
							<div class="col" align="center">
								<h6>날짜 :</h6> 
								<input type="date" id="meet-date" required/>
							</div>
							<div class="col" align="center">
								시간 : <input class="timepicker" id="meet-time" required/>
							</div>
							<div class="col" align="center">
								메모 : <input type="text" id="meet-memo"  placeholder="ex)헬스장, 운동부위" required/>
							</div>
						</div>
					</c:if>
					<c:if test="${noteBox.recipientId ne memberId }"> 
						<div class="row" style="display:none;">
							<div class="col-auto" align="center">
								<h6>날짜 :</h6> 
								<input type="date" id="meet-date" required/>
							</div>
							<div class="col-auto" align="center">
								시간 : <input class="timepicker" id="meet-time" required/>
							</div>
							<div class="col-auto" align="center">
								메모 : <input type="text" id="meet-memo"  placeholder="ex)헬스장, 운동부위" required/>
							</div>
						</div>
					</c:if>
					<br>
					<div class="row">
						<div class="col" align="right" >
							<c:if test="${noteBox.recipientId eq memberId }"> 
								<button class="btn btn-dark" onclick="matchSchedule();">일정잡기</button>
							</c:if>
							<c:if test="${noteBox.recipientId ne memberId }"> 
								<button class="btn btn-dark" disabled>일정잡기</button>
							</c:if>
						</div>
						<div class="col" align="left">
							<button class="btn btn-dark" onclick="window.close();">닫기</button>
						</div>
					</div>
				</div>
			</div>
			<br>
		</c:if>
		
	</div>


	<!--Report Modal -->
	<div class="modal fade" id="reportNote" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">쪽지 신고</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="modal-body p-5 pt-0">
						<form id="report-form">
							<input type="hidden" value="RC1" name="contentsCode"> 
							<input type="hidden" value=${noteBox.noteNo } name="contentsNo">
							<input type="hidden" value=${noteBox.senderId }	name="reportMember"> 
							<input type="hidden" value=${noteBox.senderNick } name="reportMemberNick">
							<input type="hidden" value=${noteBox.noteContents }	name="noteContents">
							<%-- 					<input type="hidden" value=${. } name="memberId">  신고자 추가해야함--%>
							<div class="form-floating mb-3">
								<p>신고 종류</p>
								<select id="report-type" class="form-select" aria-label="Default select example" name="reportType">
									<option value="" selected>신고 유형 선택</option>
									<option value="RT1">영리목적/홍보성</option>
									<option value="RT2">불법정보</option>
									<option value="RT3">음란/선정성</option>
									<option value="RT4">욕설/인신공격</option>
									<option value="RT5">직거래</option>
									<option value="RT6">표시광고위반</option>
									<option value="RT7">판매방식 부적합</option>
									<option value="RT8">게시물 정책위반</option>
									<option value="RT9">기타</option>
								</select>
							</div>
							<div class="mb-3">
								<textarea class="form-control" placeholder="신고 내용을 입력해주세요"
									id="notice-textarea" name="reportContents"
									style="height: 150px" required></textarea>
							</div>
							<button class="report-submit w-100 mb-2 btn btn-lg btn-danger">신고</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
	
	$('.timepicker').timepicker({
	    timeFormat: 'HH:mm',
	    interval: 30,
	    minTime: '8',
	    maxTime: '9:00pm',
	    defaultTime: '8',
	    startTime: '8:00',
	    dynamic: false,
	    dropdown: true,
	    scrollbar: true
	});
	
	//쪽지 대화 
// 	setInterval(function(){ // 주기적으로 반복
		console.log("${noteBox}");
		$.ajax({
			url : "/notebox/noteChatListView.strap",
			data : {
				"noteNo":'${noteBox.noteNo }', 
				"senderNick":'${noteBox.senderNick }',
				"recipientId":'${noteBox.recipientId }',
				"recipientNick":'${noteBox.recipientNick }'},
			datatype : "json",
			type : "get",
			success:function(data){
				var noteNo = data.noteNo;
				var senderNick = data.senderNick;
				var recipientId = data.recipientId;
				var recipientNick = data.recipientNick;
				var ncList = data.ncList;
				var memberId = data.memberId;
				var url = "/notebox/noteChatView.strap?noteNo="+noteNo+"&senderNick="+senderNick+"&recipientId="+recipientId+"&recipientNick="+recipientNick+"&ncList="+ncList+"&memberId="+memberId;
				const encoded = encodeURI(url);
				$("#chat-column").load(encoded);
				
	// 			alert("성공");
			},error:function(data){
				console.log(data)
	// 			alert("실패");
			}
		});
// 	}, 5000);
	
	
	// 신고 ajax
	$(document).ready(function () {
		$(".report-submit").on("click",function(){
			if ($("#report-type").val() == "") {
				alert('신고 유형을 선택해주세요.')
				return false
			} else if($("#notice-textarea").val() == "") {
				alert('내용을 작성해주세요.')
				return false
			}
			var params = $("#report-form").serialize();
			$.ajax({
				url : "/report/registerReport.strap",
				data : params,
				type : "post",
				success:function(data){
					if(window.confirm("정말로 신고하시겠습니까?")){
						location.replace("/mypage/noteBoxListView.strap");
						window.close();
					} else {
						$('#reportNote').modal('hide');
					}
				}
			});
		});
		
		// 수락 ajax
		$("#accept").on("click",function(){
			$(this).hide();
			$.ajax({
				url : "/notebox/acceptNote.strap",
				data : {
					"noteNo":'${noteBox.noteNo }'},
				type : "post",
				success:function(data){
					console.log(data)
// 					$("#chat-column").html(data);
					$("#chat-window").show();
					$("#chat-area").show();
					alert("수락 완료!");
					location.reload(true);
				},error:function(request, status, error){
					console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			});
		});
		
		// 쪽지 입력 ajax
		$("#chat-btn").on("click",function(){
			var cContents = $("#chat-contents");
			if('${memberId }' == '${noteBox.senderId }'){
				var senderNick = '${noteBox.senderNick }';
			} else {
				var senderNick = '${noteBox.recipientNick }';
			}
			console.log(senderNick);
			$.ajax({
				url : "/notebox/registerChat.strap",
				data : {
					"noteNo":'${noteBox.noteNo }',
					"senderId":'${noteBox.senderId }',
					"senderNick":senderNick,
					"chatContents" : cContents.val()},
				type : "get",
				success:function(data){
					console.log(data);
// 					alert("쪽지 입력 성공");
					cContents.val("");
					location.reload(true);
				},error:function(){
// 					alert("쪽지 실패");
				}
			});
		});
		
		var now_utc = Date.now() // 지금 날짜를 밀리초로
		//getTimezoneOffset()은 현재 시간과의 차이를 분 단위로 반환
		var timeOff = new Date().getTimezoneOffset()*60000; // 분단위를 밀리초로 변환
		//new Date(now_utc-timeOff).toISOString()은 '2022-05-11T18:09:38.134Z'를 반환
		var today = new Date(now_utc-timeOff).toISOString().split("T")[0]; //2022-05-11
		$("#meet-date").attr("min", today);
	});
	
	// 일정 잡기
	function matchSchedule(){
		var meetDate = $("#meet-date")
		var meetTime = $("#meet-time")
		var meetMemo = $("#meet-memo").val()
		var meetDateTime = meetDate.val()+ " " + meetTime.val();
		if(meetDate.val()==""){
			alert("날짜를 선택하세요");
		}else if(meetMemo==""){
			alert("메모를 작성해주세요");
		}else if(meetDate.val()!="" && meetMemo!="")
		$.ajax({
			url : "/schedule/registerSchedule.strap",
			data : {
				"matchMemberId" : '${noteBox.recipientId }',
				"matchMemberNick" : '${noteBox.recipientNick }',
				"memberId" : '${noteBox.senderId }',
				"memberNick" : '${noteBox.senderNick }',
				"matchDetail" : meetMemo,				
				"meetDate" : meetDateTime,
			},
			type : "post",
			success:function(result){
				console.log(result);
				if(result == "success"){
					alert("일정이 등록되었습니다");
					opener.location.href="/mypage/scheduleView.strap"
					window.close();
				} else {
					alert("값이 없음");
				}
			},
			error:function(result){
				alert(result);
				alert("전송 실패");
			}
		});
	};
	
	
	function noteBoxBack(){
		location.href="/mypage/noteBoxListView.strap";
	}
	
	
</script>

</body>
</html>