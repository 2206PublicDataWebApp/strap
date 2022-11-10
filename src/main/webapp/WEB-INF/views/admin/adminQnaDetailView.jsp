<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Admin Qna Detail</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/adminHeader.jsp"></jsp:include>
	<div class="container">
			<br>
			<div class="row">
				<div class="col">
					<c:if test="${adminQna.contentsCode eq 'QC1'}">
						<div><h3>${adminQna.qnaNo} - ${adminQna.qnaTitle}</h3></div>
					</c:if>
					<c:if test="${adminQna.contentsCode eq 'QC2'}">
						<div><h3>${adminQna.qnaNo} - ${adminQna.qnaContents}</h3></div>
					</c:if>
				</div>
				<div class="col" align="right">
						<button onclick="location.href='/admin/adminQnaListView.strap?page=${page}'" class="btn btn-dark">목록으로</button>
				</div>
			</div>
			<br>
			<div class="row">
				<div class="col">
					<div class="table-responsive">
						<table align="center" width="500" border="2" class="table table-bordered">
							<c:if test="${adminQna.contentsCode eq 'QC2'}">
								<tr>
									<td id="cl" align="center" width="150">상품번호</td>
									<td>${adminQna.productNo}</td>
								</tr>
							</c:if>
							<tr>
								<td id="cl" align="center" width="150">작성자</td>
								<td>${adminQna.memberId }</td>
							</tr>
							<tr>
								<td id="cl" align="center" width="150">작성일</td>
								<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${adminQna.qEnrollDate}"/></td>
							</tr>
							<tr height="200px">
								<td id="cl" align="center" width="150">내용</td>
								<td>${adminQna.qnaContents }
								</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
			<hr>
			<c:if test="${adminQna.answerStatus eq 'N'}">
				<div class="row" >
					<div class="col">
						<form action="/admin/registerAdminQna.strap" method="post">
							<input type="hidden" value="${adminQna.qnaNo }" name="qnaNo">
							<input type="hidden" value="${page}" name="page">
							<div class="row text-center">
								<div class="col mb-3">
								<div class="mb-3 text-start">
									<h4>답변 작성</h4>
								</div>
								<textarea class="form-control" style="height:180px;" name="answerContents" ></textarea>
								</div>
							</div>
							<div class="row text-center">
								<div class="col">
									<button class="btn btn-dark" type="submit">답변 완료</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</c:if>
			<c:if test="${adminQna.answerStatus eq 'Y'}">
				<div class="row" >
					<div class="col">
						<form action="/admin/registerAdminQna.strap" method="post">
							<input type="hidden" value="${adminQna.qnaNo }" name="qnaNo">
							<input type="hidden" value="${page}" name="page">
							<div class="row text-center">
								<div class="col mb-3">
								<div class="mb-3 text-start">
									<h4>답변</h4>
								</div>
								<textarea id="qna-answer" class="form-control" style="height:180px;" name="answerContents" disabled>${adminQna.answerContents }</textarea>
								</div>
							</div>
							<div class="row text-center">
								<div class="col">
									<button id="qna-modify-done" class="btn btn-dark" type="submit" style="display:none;">수정 완료</button>
								</div>
							</div>
						</form>
							<div class="row text-center">
								<div class="col">
									<button id="qna-modify" class="btn btn-dark" onclick="textareaAble(this);">답변 수정</button>
								</div>
							</div>
					</div>
				</div>
			</c:if>
			
	</div>
	<script>
		function noticeRemove(page) {
			event.preventDefault(); // 하이퍼링크 이동 방지
			if(confirm("(관리자) 공지사항을 정말 삭제하시겠습니까?")) {
				location.href="/admin/removeNotice.strap?page="+page;
			}
		}
		
		function textareaAble(thisBtn){
			var target = document.getElementById('qna-answer');
			document.getElementById('qna-modify').style.display = "none"
			document.getElementById('qna-modify-done').style.display = "inline-block"
			target.disabled = false;
		}
	</script>
</body>
</html>