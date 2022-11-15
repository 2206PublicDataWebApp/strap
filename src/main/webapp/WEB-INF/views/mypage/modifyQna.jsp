<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
<meta charset="UTF-8">
<title>스트랩 : 문의 수정</title>
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
					<span> 문의 수정 </span>
					<hr>
					<form action="/qna/modifyQna.strap" method="post">
						<div class="row">
							<div class="col-2">
								문의 유형
							</div>
							<div class="col">
								<input type="hidden" value="${qna.qnaNo }" name="qnaNo"/>
								<input type="hidden" value="QC1" name="qnaCode"/>
								<select class="form-select" id="selectQna" aria-label="Default select" name="qnaType">
									<option>문의 유형을 선택해주세요</option>
									<option value="QC1QT1" <c:if test="${qna.qnaType eq 'QC1QT1'}">selected</c:if>>로그인</option>
									<option value="QC1QT2" <c:if test="${qna.qnaType eq 'QC1QT2'}">selected</c:if>>정보수정</option>
									<option value="QC1QT3" <c:if test="${qna.qnaType eq 'QC1QT3'}">selected</c:if>>탈퇴</option>
									<option value="QC1QT4" <c:if test="${qna.qnaType eq 'QC1QT4'}">selected</c:if>>기타</option>
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
								<input type="text" class="form-control" id="qnaEmail" value="${member.memberEmail }"/>
							</div>
						</div>
						<hr>
						<div class="row">
							<div class="col-2">
								제목
							</div>
							<div class="col">
								<input class="form-control" id="qnaTitle" value="${qna.qnaTitle}" name="qnaTitle"/>
							</div>
						</div>
						<br>
						<div class="row">
							<div class="col-2">
								문의
							</div>
							<div class="col">
								<textarea class="form-control" id="qnaTextarea" style="height:350px;" name="qnaContents">${qna.qnaContents}</textarea>
							</div>
						</div>
						<hr>
						<div class="row">
							<div class="col text-center">
								<div>
									<button class="btn btn-dark" onclick="cancelBtn();">취소</button>
									<button class="btn btn-dark" type="submit">수정하기</button>
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
<script>
	$(function() {
		var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
		$("#qnaForm").submit(function() {
			if ($("#selectQna").val() == "") {
				alert('문의 유형을 선택해주세요.')
				return false
			} else if(exptext.test($("#qnaEmail").val()) == false) {
				alert('이메일형식이 올바르지 않습니다.\n다시 작성해주세요.\nex)example@naver.com')
				return false
			} else if($("#qnaTitle").val() == "") {
				alert('제목을 작성해주세요.')
				return false 
			} else if($("#qnaTextarea").val() == "") {
				alert('내용을 작성해주세요.')
				return false
			}
		});
	});
	
	function cancelBtn(){
		if(confirm("수정을 취소하시겠습니까?\n수정한 것 저장되지 않습니다.")){
			window.history.back();
		}
	}
</script>
</body>
</html>