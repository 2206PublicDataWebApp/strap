<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- CDN -->
<!-- 부트스트랩 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- css -->
<link rel="stylesheet" type="text/css" href="/resources/css/common.css">
<link rel="stylesheet" type="text/css" href="/resources/css/modal.css">
</head>
<body>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>
	<jsp:include page="/WEB-INF/views/common/adminHeader.jsp"></jsp:include>
	<div class="container">
		<div class="row" align="center">
			<div class="col">
				<br>
				<p style="text-align:left; font-size:20px;">배너 관리</p>
				<hr>
			</div>
		</div>
		<div class="row row-cols-auto" align="center">
			<div class="col">
				<button class="btn btn-dark">배너 생성</button>
			</div>
			<div class="col">
				<button class="btn btn-dark">배너 삭제</button>
			</div>
		</div>
	</div>
	
	<!--Banner Modal -->
	<div class="modal fade" id="banner" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">배너 생성</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="modal-body p-5 pt-0">
						<form id="banner-form">
							<input type="hidden" value="RC1" name="contentsCode"> 
							<input type="hidden" value=${noteBox.noteNo } name="contentsNo">
							<input type="hidden" value=${noteBox.senderId } name="reportMember">
							<input type="hidden" value=${noteBox.senderNick } name="reportMemberNick">
							<input type="hidden" value=${noteBox.noteTitle } name="noteTitle">
							<input type="hidden" value=${noteBox.noteContents } name="noteContents">
							<%-- 					<input type="hidden" value=${. } name="memberId">  신고자 추가해야함--%>
							<div class="form-floating mb-3">
								<p>배너 이름</p>
								<input type="text" class="form-control" id="banner-title" placeholder="배너 제목 입력">
							</div>
							<div class="mb-3">
								<p>배너 이미지</p>
								<input class="form-control" type="file" id="bannerFile" placeholder="신고 내용을 입력해주세요">
							</div>
							<button class="banner-submit w-100 mb-2 btn btn-lg btn-danger">등록</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	
</body>
</html>