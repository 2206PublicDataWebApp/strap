<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" href="/resources/image/s.png">
<meta charset="UTF-8">
<title>스트랩 : 게시글 상세 정보</title>
<!-- 부트스트랩 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
<script src="https://kit.fontawesome.com/422d96f707.js" crossorigin="anonymous"></script>
<!-- 모달 부트스트랩 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8"
		crossorigin="anonymous"></script>
<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="/resources/js/jquery-3.6.1.min.js"></script>
<!-- css -->
<link rel="stylesheet" type="text/css" href="/resources/css/common.css">
<link rel="stylesheet" type="text/css" href="/resources/css/modal.css">
<script src="https://kit.fontawesome.com/9c36739346.js" crossorigin="anonymous"></script>
<style>
	.contents-noside {
		width: 1000px;
		margin: auto;
	}

	#bTitle1 {
		margin-top: 25px;
		background-color: #F8F8F8;
		border-bottom: 1px solid #ccc;
		padding: 1rem !important;
	}
	
	.bTitle2 {
		border-bottom: 1px solid #eee;
		padding: 1rem !important;
	}
	.bTitle3 {
		padding: 1rem !important;
		border-bottom: 1px solid #ccc;
   		margin-bottom: 25px;
	}
	
	.position-absolute {
		transform: translate(-15px, 15px);
	}
	
	.likeBtn-area {
		float: left;
		transform: translate(45px, 0px);
	}
	
	#likeBtn {
		padding: 14px 26px;
	}
	
	#likeBtn-img {
		color: blue;
		font-size: 24px;
	}
	
	#likeBtn-form {
		display: inline
	}
	
	#likeBtn-count {
		color: blue;
		font-weight: bold;
	}
	
	#rBtn {
		transform: translate(94px, 48px);
	}
	
	#updateBtn {
		display: none;
		margin-top: 10px;
	}
	
	#updateBtn2 {
		margin-top: 10px;
   		transform: translate(55px, 40px);
	}
	
	#reply-wrap {
    	margin: 0 auto;
	}
	
	#replyInfo-wrap{
		display: flex;
	}
	
	#oneReply {
    	margin-bottom: 15px;
    	border-bottom: 1px solid #ccc;
	}
	
	.reply-input {
		border: 1px solid #ddd;
	    padding: 12px 16px 20px;
	    border-radius: 8px;
	    background: #fcfcfc;
    	margin: 0 auto;
    	margin-bottom: 15px;
	}
	
	.reText {
	    height: 40px;
	    width: 92%;
	    font-size: smaller;
	}
	
	#rModify {
		list-style: none;
	    display: flex;
	    float: right;
	    padding-left: 1rem;
	}
	
	.btn-light {
		height: 45px;
	    margin-bottom: 5px;
	}   
	
	.reReply-input {
		border: 1px solid #ddd;
	    padding: 12px 16px 20px;
	    border-radius: 8px;
	    background: #fcfcfc;
	} 
	
	.reReply {
		width: 940px;
		margin-left: 35px;
	}
	
	#replyContents {
   	 	width: 92%;
    	font-size: smaller;
    	font-size: 15px;
	}
</style>
</head>
<body>
<div class="wrap container">
	<!-- 헤더&메뉴바 -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	<!-- 컨텐츠 -->
	<div class="contents">
		<div id="contents-wrap">
			<div class="contents-noside">
				<!-- 카테고리/제목 -->
				<div class="position-relative" id="bTitle1">
					[${board.boardCategory }] ${board.boardTitle }
					<div class="position-absolute top-0 end-0">
						${board.boardDate }
					</div>
				</div>
				<!-- 작성자/조회/추천 -->
				<div class="position-relative">
					<div class="bTitle2">
						${board.memberNick }
					</div>
					<div class="position-absolute top-0 end-0">
						조회수 ${board.boardCount } 추천수 ${board.boardLikeIt }
					</div>
				</div>
				<div class="bTitle3">
				<!-- 내용 -->
				<div class="bContents">
					${board.boardContents }
				</div>
					<!-- 추천/비추천 로그인 체크-->
					<div class="col-md-10 offset-md-5 py-4 text-center" style="height: 125px;">
						<c:choose>
							<c:when test="${empty sessionScope.loginUser.memberNick }">
								<div class="likeBtn-area">
									<button class="btn btn-outline-secondary" id="likeBtn" onclick="like_btn_check();">
										<i class="fa-regular fa-thumbs-up" id="likeBtn-img"></i>
										<span id="likeBtn-count"> ${board.boardLikeIt } </span>
									</button>
								</div>
							</c:when>
							<c:otherwise>
								<div class="likeBtn-area">
									<form action="/board/updateLike" method="post" id="likeBtn-form">
										<input type="hidden" name="memberNick" value="${sessionScope.loginUser.memberNick }" /> 
										<input type="hidden" name="boardNo" value="${board.boardNo }" /> 
										<input type="hidden" name="page" value="${page }" />
										<button type="submit" class="btn btn-outline-secondary" id="likeBtn">
											<i class="fa-regular fa-thumbs-up" id="likeBtn-img"></i>
											<span id="likeBtn-count"> ${board.boardLikeIt } </span>
										</button>
									</form>
								</div>
							</c:otherwise>
						</c:choose>
						<div>
						<c:choose>
							<c:when test="${sessionScope.loginUser.memberNick == null }">
								<button class="btn btn-outline-danger" onclick="reportCheck();" id="rBtn">신고</button>
							</c:when>
							<c:when test="${sessionScope.loginUser.memberNick eq board.memberNick }">
								<button class="btn btn-outline-danger" id="rBtn" style="display: none;">신고</button>
							</c:when>
							<c:otherwise>
								<button class="btn btn-outline-danger" data-bs-toggle="modal" data-bs-target="#reportNote" id="rBtn">신고</button>
							</c:otherwise>
						</c:choose>	
						</div>
						<!-- 게시글 수정/삭제 로그인 체크-->
						<div>
						<c:choose>
							<c:when test="${sessionScope.loginUser.memberNick == null }">
								<button class="btn btn-outline-secondary" id="updateBtn">수정</button>
								<button class="btn btn-outline-danger"  id="updateBtn">삭제</button>
							</c:when>
							<c:when test="${sessionScope.loginUser.memberNick ne board.memberNick }">
								<button class="btn btn-outline-secondary" id="updateBtn">수정</button>
								<button class="btn btn-outline-danger"  id="updateBtn">삭제</button>
							</c:when>
							<c:otherwise>
								<button onclick="location.href='/board/modifyView.strap?boardNo=${board.boardNo }&page=${page}';"
								class="btn btn-outline-secondary" id="updateBtn2">수정</button>
								<button onclick="boardRemove(${page});" class="btn btn-outline-danger" id="updateBtn2">삭제</button>
							</c:otherwise>
						</c:choose>	
						</div>
					</div>
				</div>
				<!-- 댓글출력 -->
				<div id="reply-wrap">
					<table id="reply-table" style="width: 980px;">
						<c:forEach items="${bReplyList }" var="bReply" varStatus="n">
							<tr class="one-reply-area">
								<td>
									<div id="oneReply" 
										<c:if test="${bReply.reReplyYn eq 'Y' }"> class="reReply" </c:if>>
										<div id="replyInfo-wrap">
											<p id="reWriter" class="replyInfo">${bReply.replyWriter }</p>&nbsp;&nbsp;&nbsp;
											<fmt:formatDate pattern="(yyyy-MM-dd HH:mm:ss)" value="${bReply.rCreateDate }"/>
										<div>
										<!-- 댓글메뉴 -->
										<div id="reply-menu">
											<ul id="rModify">
											<c:if test="${sessionScope.loginUser.memberNick eq bReply.replyWriter }">
													<!-- 댓글삭제 -->
													<c:choose>
														<c:when test="${bReply.replyContents =='작성자에 의해 삭제된 댓글입니다.'}">
															<li><a onclick="replyRemoveCheck();" id="rRemove" style="margin-left: 5px;">삭제</a></li>
														</c:when>
														<c:otherwise>
															<li><a onclick="replyRemove(this);" id="rDelete" style="margin-left: 5px;">삭제</a></li>
															<form action="/board/reply/remove.strap" method="post">
																<input type="hidden" name="page" value="${page }">
																<input type="hidden" name="boardNo" value="${board.boardNo }"> 
																<input type="hidden" name="replyNo" value="${bReply.replyNo }">
															</form>
														</c:otherwise>
													</c:choose>	
												 </c:if>
											</ul>
										</div>
										</div>
										</div>
										<div id="replyContents" style="height: 40px;">
											${bReply.replyContents }
											<!-- 댓글메뉴버튼 -->
											<c:if test="${bReply.rStatus ne 'N' }">
										</div>
										</c:if>
										<!-- 답글 버튼 -->
										<c:if test="${bReply.reReplyYn ne 'Y' and bReply.rStatus ne 'N'}">
											<div onclick="arcodian(this);" style="margin-bottom: 10px;">
												<a href="#">답글</a>
											</div>
											<!-- 답글 입력창 -->
											<div class="reReply-input" style="display: none; margin-bottom: 10px;">
											<strong style="padding-left:5px; font-size: smaller;">답글 쓰기</strong>
												<form onsubmit="return RFormCheck();" action="/board/reply/write.strap" method="post">
													<input type="hidden" name="page" value="${page }">
													<input type="text" 	 name="replyContents" id="replyContents"
													required oninvalid="this.setCustomValidity('내용을 입력해주세요.')" oninput="this.setCustomValidity('')" value="" placeholder=" 답글 작성 하시려면 로그인 해주세요."> 
													<input type="hidden" name="boardNo" value="${board.boardNo }"> 
													<input type="hidden" name="replyWriter" value="${loginUser.memberNick }"> 
													<input type="hidden" name="reReplyYn" value="Y"> 
													<input type="hidden" name="refReplyNo" value="${bReply.replyNo }">
													<button class="btn btn-light" onclick="reReplyCheck();">등록</button>
												</form>
											</div>
										</c:if>
									</div>
								</td>
							</tr>
						</c:forEach>
					</table>
				</div>
				<!-- 댓글 입력창 -->
				<div class="reply-input">
					<strong style="padding-left:5px; font-size: smaller;">댓글 쓰기</strong>
						<form onsubmit="return rFormCheck();" action="/board/reply/write.strap" method="post" style="margin-top: 10px;">
							<input type="hidden" name="page" value="${page }">
							<input class="reText" type="text" name="replyContents" id="replyContents"
							required oninvalid="this.setCustomValidity('내용을 입력해주세요.')" oninput="this.setCustomValidity('')" value="" placeholder=" 댓글 작성 하시려면 로그인 해주세요.">
							<input type="hidden" name="boardNo" value="${board.boardNo }"> 
							<input type="hidden" name="replyWriter" value="${loginUser.memberNick }"> 
							<input type="hidden" name="reReplyYn" value="N"> 
							<input type="hidden" name="refReplyNo" value="-1">
							<button class="btn btn-light">등록</button>
						</form>
				</div>
				<div style="text-align: center;">
					<button onclick="location.href='/board/list.strap?page=${page}'" class="btn btn-outline-secondary">목록</button>
				</div>
			</div>
		</div>
	</div>
</div>
<!--Report Modal -->
<div class="modal fade" id="reportNote" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">게시글 신고</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<div class="modal-body p-5 pt-0">
					<form id="report-form2">
						<input type="hidden" value="RC2" name="contentsCode"> 
						<input type="hidden" value="${board.boardNo }" name="boardNo">
						<input type="hidden" value="${board.boardNo }" name="contentsNo">
						<input type="hidden" value="${page }" name="page"> 
						<input type="hidden" value=${sessionScope.loginUser.memberNick } name="reportMember"> 
						<input type="hidden" value=${board.memberNick } name="reportMemberNick"> 
						<input type="hidden" value='${board.boardContents }' name="boardContents">
						<!-- 신고자 -->
						<input type="hidden" value=${sessionScope.loginUser.memberNick } name="memberNick">
						<div class="form-floating mb-3">
							<p>신고 종류</p>
							<select class="form-select" aria-label="Default select example" name="reportType" style="padding-top: 5px;">
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
						<button type="button" class="report-submit2 w-100 mb-2 btn btn-lg btn-danger" onclick="reportSubmit();">신고</button>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- 푸터 -->
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
<script>
// 추천 로그인 체크
function like_btn_check() {
	alert("로그인 후 이용해주세요");
	location.href="/member/loginView.strap"
}
// 신고 로그인 체크
function reportCheck() {
	alert("로그인 후 이용해주세요");
	location.href="/member/loginView.strap"
}

// 댓글 로그인 체크
function rFormCheck() {
	if(${sessionScope.loginUser.memberNick == null }) {
		alert("로그인 후 이용해주세요");
		location.href="/member/loginView.strap";
		return false;
	}
	return true;
}

// 답글 로그인 체크
function RFormCheck() {
	if(${sessionScope.loginUser.memberNick == null }) {
		alert("로그인 후 이용해주세요");
		location.href="/member/loginView.strap";
		return false;
	}
	return true;
}
// 게시글 삭제
function boardRemove(value) {
	event.preventDefault(); // 하이퍼링크 이동 방지
	if(confirm("게시글을 삭제하시겠습니까?")) {
		location.href="/board/remove.strap?page="+value;
	}
}


// 답글
function arcodian(reReply){
	event.preventDefault();
	// nextElementSibling > 다음 요소 선택하기
	var reReplyInput = reReply.nextElementSibling;
	var display = reReplyInput.style.display;
	if(display == "none"){
		reReplyInput.style.display="block";
	}else{
		reReplyInput.style.display="none";
	}
}
		
// 댓글 삭제 중복 방지
function replyRemoveCheck() {
	$("#rRemove").attr("disabled", true); 
}

// 댓글 삭제
function replyRemove(target){
	event.preventDefault();
	// parentNode.nextElementSibling > 부모노드 $("").parent() 다음 요소 선택
	var replyRemoveForm = target.parentNode.nextElementSibling;		
	if(confirm("정말 삭제하시겠습니까?")){
		replyRemoveForm.submit();
	}else {
			
	}
}

// 게시글 신고 
function reportSubmit() {
	// serialize
	// JQuery Ajax로 호출하기 전에 serialize를 해주면 form안에 값들을
	// 한 번에 전송 가능한 data로 만들 수 있어 많은 data를 보낼 때 유용하다
	var params2 = $("#report-form2").serialize();
	$.ajax({
		url : "/report/registerReport2.strap",
		data : params2,
		type : "post",
		success: function(){
			alert("신고 완료");
			location.reload();
		},
			error: function(){}
	});
}
</script>
</body>
</html>