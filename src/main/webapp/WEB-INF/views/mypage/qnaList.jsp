<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
<link rel="icon" href="/resources/image/s.png">
<meta charset="UTF-8">
<title>스트랩 : 일반문의</title>
<!-- CDN -->
<!-- 부트스트랩 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" />
<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- css -->
<link rel="stylesheet" type="text/css" href="/resources/css/common.css">
<style>
.contents-side.col {
	padding-left: 15px;
}

/* .contents-side.col th, .contents-side.col td { */
/* 	height: 50px; */
/* } */


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

th{
	text-align: center;
}
td{
	text-align: center;
}
.qna-contents{
	text-decoration:none;
	color:black;
	cursor:pointer;
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
					<span> 문의 </span>
					<hr>
					<div class="row">
						<div class="col">
							<table class="table table-hover">
								<thead>
									<tr>
										<th scope="col" style="width:200px;">문의 유형</th>
										<th scope="col" style="width:400px;" >제목</th>
										<th scope="col" style="width:200px;">작성일</th>
										<th scope="col" style="width:200px;">처리상태</th>
										<th scope="col" style="width:200px;">처리상태</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${qList }" var="qna" varStatus="i">
										<c:if test="${not empty qList }">
											<tr>
												<th scope="row">${qna.qnaType }</th>
												<td><a class="qna-contents" id="qna-contents${i.index }" onclick="qnaFolding(this);">${qna.qnaTitle }</a></td>
												<td>${qna.qEnrollDate }</td>
												<td>
												<c:if test="${qna.answerStatus eq 'N' }">
													<button class="btn btn-dark" style="width:70px" onclick="location.href='/qna/modifyQnaView.strap?qnaNo=${qna.qnaNo}'">수정</button>
													<button class="btn btn-dark" style="width:70px" onclick="window.confirm('문의를 삭제하시겠습니까?');location.href='/qna/removeQna.strap?qnaNo=${qna.qnaNo}'">삭제</button>
												</c:if>
												<c:if test="${qna.answerStatus eq 'Y' }">
													<button class="btn btn-dark" style="width:70px" onclick="location.href='/qna/modifyQnaView.strap?qnaNo=${qna.qnaNo}'" disabled>수정</button>
													<button class="btn btn-dark" style="width:70px" onclick="window.confirm('문의를 삭제하시겠습니까?');location.href='/qna/removeQna.strap?qnaNo=${qna.qnaNo}'" disabled>삭제</button>
												</c:if>
												</td>
												<c:if test="${qna.answerStatus eq 'N' }">
													<td>답변 대기중</td>
												</c:if>
												<c:if test="${qna.answerStatus eq 'Y' }">
													<td>답변 완료!</td>
												</c:if>
											</tr>
											<tr class="qnaDetailArea" style="display:none">
												<td colspan="5" style="padding:10px 70px;text-align:left;">
													${qna.qnaContents }
												</td>
											</tr>
											<tr class="qnaDetailArea" style="margin-bottom:50px;display:none;">
												<td colspan="5" style="padding:10px 70px;background-color:#E7E7E7;text-align:left;">
													<c:if test="${qna.answerStatus eq 'N' }"><span>ㄴ답변 대기중입니다.</span></c:if>
													<c:if test="${qna.answerStatus eq 'Y' }"><span>ㄴ${qna.answerContents}</span></c:if>
												</td>
											</tr>
										</c:if>
									</c:forEach>
								</tbody>
							</table>
							<c:if test="${empty qList }">
								<br>
								<div class="row">
									<div class="col text-center">
										<h6>등록된 문의가 없습니다.</h6>
									</div>
								</div>
								<br>
							</c:if>
						</div>
					</div>
					<div class="row">
						<div class="col text-center">
							<button class="btn btn-dark" onclick="location.href='/mypage/qnaWriteFormView.strap'">문의하기</button>
						</div>
					</div>
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
//답변 펼치기
//답변 펼치기
function qnaFolding(thisBtn){
	console.log(thisBtn);
	var thisQuestionArea =thisBtn.parentElement.parentElement.nextSibling.nextElementSibling;
	var thisAnswerArea = thisBtn.parentElement.parentElement.nextSibling.nextElementSibling.nextElementSibling;
	if(thisQuestionArea.style.display =="none"){
		thisQuestionArea.style.display = "table-row";
		thisAnswerArea.style.display = "table-row";
	}else{
		thisQuestionArea.style.display = "none";
		thisAnswerArea.style.display = "none";
	}
}
</script>
</body>
</html>