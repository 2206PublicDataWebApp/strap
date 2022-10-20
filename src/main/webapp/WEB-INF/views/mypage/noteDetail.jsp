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

</head>
<body>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>
	<div class="container">
		<div class="row">
			<div class="col">
				<p align="center" style=" font-size:34px; font-family:malgun gothic;">[ 쪽지 ]<p>
			</div>
		</div>
		<div class="row">
			<div class="col">
				보낸 사람 : ${noteBox.senderNick }
			</div>
		</div>
		<div class="row">
			<div class="col">
				보낸 시간 : <fmt:formatDate pattern="yyyy-MM-dd / hh:mm:ss" value="${noteBox.senderTime }"/>   ||   <button class="btn btn-warning" data-bs-toggle="modal" data-bs-target="#reportNote" id="btn-2">신고</button>
			</div>
		</div>
		<hr>
		<div class="row border border-secondary border-opacity-50">
			<div class="col">
				<div class="row">
					<div class="col">
						제목 : ${noteBox.noteTitle }
					</div>
				</div>
				<br>
				<div class="row">
					<div class="col">
						내용 : ${noteBox.noteContents }
					</div>
				</div>
			</div>
		</div>
		<br>
		<c:if test="${noteBox.noteAccept eq 'N' }">
			<div class="row text-center">
				<div class="col">
					<button class="btn btn-primary" id="accept">수락</button>
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
							<input type="text" id="chat-contents" required>
							<button class="btn btn-primary" id="chat-btn">입력</button>
						</div>
					</div>
					<br>
					<div class="row">
						<div class="col" align="center">
							<button class="btn btn-primary">일정잡기</button>
						</div>
					</div>
				</div>
			</div>
			<br>
		</c:if>
		
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
							<input type="text" id="chat-contents" required>
							<button class="btn btn-primary" id="chat-btn">입력</button>
						</div>
					</div>
					<br>
					<div class="row">
						<div class="col" align="center">
							<button class="btn btn-primary">일정잡기</button>
						</div>
					</div>
				</div>
			</div>
			<br>
		</c:if>
		
	</div>
	

<!--Report Modal -->
<div class="modal fade" id="reportNote" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
					<input type="hidden" value=${noteBox.senderId } name="reportMember">
					<input type="hidden" value=${noteBox.senderNick } name="reportMemberNick">
					<input type="hidden" value=${noteBox.noteTitle } name="noteTitle">
					<input type="hidden" value=${noteBox.noteContents } name="noteContents">
<%-- 					<input type="hidden" value=${. } name="memberId">  신고자 추가해야함--%>
						<div class="form-floating mb-3">
							<p>신고 종류</p>
							<select class="form-select" aria-label="Default select example" name="reportType">
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
							<textarea class="form-control" placeholder="신고 내용을 입력해주세요" id="notice-textarea" name="reportContents" style="height: 150px" required></textarea>
						</div>
					<button class="report-submit w-100 mb-2 btn btn-lg btn-danger">신고</button>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
	
	$.ajax({
		url : "/notebox/noteChatListView.strap",
		data : {
			"noteNo":'${noteBox.noteNo }', 
			"senderNick":'${noteBox.senderNick }'},
		datatype : "html",
		type : "get",
		success:function(data){
			$("#chat-column").html(data);
		},error:function(){
			alert("실패");
		}
	});

	$(document).ready(function () {
		$(".report-submit").on("click",function(){
			var params = $("#report-form").serialize();
			$.ajax({
				url : "/report/registerReport.strap",
				data : params,
				type : "post",
				success:function(data){
					if(window.confirm("정말로 신고하시겠습니까?")){
						opener.location.replace("/mypage/noteBoxListView.strap");
						window.close();
					}
				}
			});
		});
		
		$("#accept").on("click",function(){
			$(this).hide();
			$("#chat-window").show();
			$("#chat-area").show();
			
			$.ajax({
				url : "/notebox/noteChatListView.strap",
				data : {
					"noteNo":'${noteBox.noteNo }', 
					"senderNick":'${noteBox.senderNick }'},
				datatype : "html",
				type : "get",
				success:function(data){
					$("#chat-column").html(data);
					alert("수락 완료!");
				},error:function(){
					alert("실패");
				}
			});
		});
		
		$("#chat-btn").on("click",function(){
			var cContents = $("#chat-contents").val();
			$.ajax({
				url : "/notebox/registerChat.strap",
				data : {
					"noteNo":'${noteBox.noteNo }',
					"recipientId":'${noteBox.recipientId }',
					"senderId":'${noteBox.senderId }',
					"recipientNick":'${noteBox.recipientNick }',
					"senderNick":'${noteBox.senderNick }',
					"chatContents" : cContents},
				type : "get",
				success:function(data){
					cContents.val("");
					alert("쪽지 입력 성공");
				},error:function(){
					alert("쪽지 실패");
				}
			});
		});
	});
	
	
	
	
	
	
</script>

</body>
</html>