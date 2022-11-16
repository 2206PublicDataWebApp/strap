<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="/resources/image/s.png">
<title>스트랩(관리자) : 공지사항 수정</title>

</head>
<body>
	<jsp:include page="/WEB-INF/views/common/adminHeader.jsp"></jsp:include>
	<div class="container">
<!-- 		<div class="table-responsive"> -->
			<form action="/admin/noticeModify.strap" method="post" enctype="multipart/form-data">
				<input type="hidden" name="page" value="${page}">
				<input type="hidden" name="noticeNo" value="${notice.noticeNo }">
				<input type="hidden" name="noticeFilename" value="${notice.noticeFilename }">
				<input type="hidden" name="noticeFileRename" value="${notice.noticeFileRename }">
				<div class="row">
					<div class="col-2">
					</div>
					<div class="col" >
						<div class="form-floating">
							<input type="text" class="form-control" id="noticeTitleInput" name="noticeTitle" value="${notice.noticeTitle }" placeholder="제목 입력" required>
							<label for="noticeTitleInput"> 공지사항 제목</label>
						</div>
					</div>
					<div class="col-2">
					</div>
				</div>
				<br>
				<div class="row">
					<div class="col-2">
					</div>
					<div class="col">
						<c:if test="${not empty notice.noticeFilename }">
							사진 등록 (현재 파일 : ${notice.noticeFilename })
						</c:if>
						<c:if test="${empty notice.noticeFilename }">
							사진 등록 (현재 파일 : 파일 없음)
						</c:if>
						<input class="form-control" type="file" id="formProfile" name="reloadFile">
					</div>
					<div class="col-2">
					</div>
				</div>
				<br>
				<div class="row">
					<div class="col-2">
					</div>
					<div class="col" align="center" >
						<div class="form-floating">
							<textarea class="form-control" placeholder="내용을 입력해주세요" id="notice-textarea" name="noticeContents" style="height: 400px" required>${notice.noticeContents }</textarea>
							<label for="notice-textarea">내용 입력</label>
						</div>
					</div>
					<div class="col-2">
					</div>
				</div>
				<br>
				<div class="row">
					<div class="col" align="center">
						<button class="btn btn-primary" type="submit">수정 완료</button>
						<button class="btn btn-primary" onclick="noticeCancel(${page})" >수정 취소</button>
					</div>
				</div>
			</form>
<!-- 		</div> -->
	</div>
	<script>
		function noticeCancel(page){
			event.preventDefault(); // 하이퍼링크 이동 방지
			if(confirm("공지사항 수정을 취소하시겠습니까?\n수정사항이 저장되지 않습니다.")) {
				location.href="/admin/noticeListView.strap?page="+page;
			}
		}
	</script>
</body>
</html>