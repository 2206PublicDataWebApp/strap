<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
<meta charset="UTF-8">
<title>STRAP MyPage</title>
<!-- CDN -->
<!-- 부트스트랩 -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" />
<!-- jQuery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- css -->
<link rel="stylesheet" type="text/css" href="/resources/css/common.css">
<style>
.contents-side.col {
	padding-left: 15px;
}

.contents-side.col th, .contents-side.col td {
	height: 50px;
}

select.select {
	width: 185px;
}

td button {
	width: 200px;
}

span.id, span.pwd, span.pwdCheck, span.nick {
	display: none;
	font-size: 12px;
	top: 12px;
	right: 10px;
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
					<span> 문의 작성 </span>
					<hr>
					<form action="/qna/registerQna.strap" method="post">
						<div class="row">
							<div class="col-2">
								문의 유형
							</div>
							<div class="col">
								<input type="hidden" value="QC1" name="qnaCode"/>
								<select class="form-select" aria-label="Default select" name="qnaType">
									<option selected>문의 유형을 선택해주세요</option>
									<option value="QC1QT1">로그인</option>
									<option value="QC1QT2">정보수정</option>
									<option value="QC1QT3">탈퇴</option>
									<option value="QC1QT4">기타</option>
								</select>
							</div>
						</div>
						<hr>
						<div class="row">
							<div class="col-2">
								작성자
							</div>
							<div class="col">
								<input type="hidden" value="${member.memberId }" name="memberId">
								<input type="hidden" value="${member.memberName }" name="memberNick">
								${member.memberName }
							</div>
						</div>
						<br>
						<div class="row">
							<div class="col-2">
								이메일
							</div>
							<div class="col">
								<input type="text" class="form-control" value="${member.memberEmail }"/>
							</div>
						</div>
						<hr>
						<div class="row">
							<div class="col-2">
								제목
							</div>
							<div class="col">
								<input class="form-control" name="qnaTitle"/>
							</div>
						</div>
						<br>
						<div class="row">
							<div class="col-2">
								문의
							</div>
							<div class="col">
								<textarea class="form-control" style="height:350px;" name="qnaContents"></textarea>
							</div>
						</div>
						<hr>
						<div class="row">
							<div class="col text-center">
								<div>
									<input class="btn btn-dark"  type="reset" value="취소">
									<button class="btn btn-dark" type="submit">작성하기</button>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
		
		
		<div class="row">
			<div class="col">
				<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
			</div>
		</div>
	</div>
</body>
</html>