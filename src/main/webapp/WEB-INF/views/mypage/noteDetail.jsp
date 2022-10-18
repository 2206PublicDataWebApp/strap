<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">

<style>
#main-form {
	margin-left: 10%;
	margin-right: 10%;
}

textarea.form-controls {
	min-height: calc(1.5em + 2rem + 2px);
	border: #333;
	border: 1px solid #ced4da;
	border-radius: .25rem;
}

.form-controls:focus {
	color: #212529;
	background-color: #fff;
	border-color: #86b7fe;
	outline: 0;
	box-shadow: 0 0 0 .25rem rgba(13, 110, 253, .25)
}

#btn-2 {
	height: 40px;
	border: 0;
	color: white;
	background-color: rgb(209, 24, 79);
}

#btn-2 {
	color: #fff;
	background-color: rgb(209, 24, 79);
	border-color: rgb(209, 24, 79)
}

#btn-2:hover {
	color: #fff;
	background-color: rgb(216, 50, 100);
	border-color: rgb(216, 50, 100)
}

.btn-outline-primary {
	color: rgb(209, 24, 79);
	border-color: rgb(209, 24, 79)
}

.btn-outline-primary:hover {
	color: #fff;
	background-color: rgb(209, 24, 79);
	border-color: rgb(209, 24, 79)
}

#cutline {
	visibility: hidden;
}

#thumbnailzone {
	position: relative;
	width: auto;
	height: 200px;
	border: 1px solid #aaa;
	border-radius: .25rem;
}

#thumbnailzone img {
	position: absolute;
	width: 100%;
	height: 100%;
	object-fit: cover;
	/* border-radius: 5%; */
	top: 50%;
	left: 50%;
	margin-top: 0;
	transform: translate(-50%, -50%);
	!important
}

#thumbnailzone .form-label {
	width: 100%;
}

#thumbnailzone input {
	position: relative;
	width: 100%;
}

#ingHidden {
	visibility: hidden;
	height: 0px;
	width: 0px;
}
</style>
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
				보낸 사람 : ${noteBox.senderId }
			</div>
		</div>
		<div class="row">
			<div class="col">
				보낸 시간 : <fmt:formatDate pattern="yyyy-MM-dd / hh:mm:ss" value="${noteBox.senderTime }"/> || <button class="btn btn-warning" data-bs-toggle="modal" data-bs-target="#reportNote" id="btn-2">신고</button>
			</div>
		</div>
		<hr>
		<div class="row">
			<div class="col">
				제목 : ${noteBox.noteTitle }
			</div>
		</div>
		<div class="row">
			<div class="col">
				내용 : ${noteBox.noteContents }
			</div>
		</div>
		<br>
		<div class="row text-center">
			<div class="col">
				<button class="btn btn-primary">수락</button>
				<button class="btn btn-danger">거절</button>
			</div>
		</div>
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
					<form action="/fridge/register.kh" method="post">
					<input type="hidden" value="RC1" name="contentsCode">
					<input type="hidden" value=${noteBox.noteNo } name="noteNo">
					<input type="hidden" value=${noteBox.senderId } name="senderId">
					<input type="hidden" value=${noteBox.noteTitle } name="noteTitle">
					<input type="hidden" value=${noteBox.noteContents } name="noteContents">
<%-- 					<input type="hidden" value=${. } name="memberId">  신고자 추가해야함--%>
					<br>
						<div class="form-floating mb-3">
							<p>신고 종류</p>
							<select class="form-select" aria-label="Default select example">
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
							<textarea class="form-control" placeholder="신고 내용을 입력해주세요" id="notice-textarea" name="noticeContents" style="height: 150px"></textarea>
						</div>
					<button class="w-100 mb-2 btn btn-lg btn-danger" type="submit">신고</button>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
	
	
	
</body>
</html>