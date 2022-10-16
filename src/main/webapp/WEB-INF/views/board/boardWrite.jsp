<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Strap</title>
<!-- 부트스트랩 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- css -->
<link rel="stylesheet" type="text/css" href="/resources/css/common.css">
<!-- 썸대노트 -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<script src="/resources/js/summernote/lang/summernote-ko-KR.js"></script>
</head>
<body>
	<div class="wrap container">
			<!-- 헤더&메뉴바 -->
			<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
			<!-- 컨텐츠 -->
			<div class="contents">
				<div id="contents-wrap" style="height: 100%;">
					<form action="/board/boardWrite.strap" method="post" enctype="multipart/form-data">
					<table align="center" border="2" class="table table-bordered w-75">
						<tr>
							<th class="table-primary">제목</td>
							<td><input type="text" name="cBoardTitle"></td>
						</tr>
						<div id="summernote"><p>Hello Summernote</p></div>
						<tr>
							<th class="table-primary">내용</td>
							<td><textarea cols="135" rows="20" name="cBoardContents">${cBoard.cBoardContents }</textarea></td>
						</tr>
						<!-- <tr>
							<th class="table-primary">첨부파일</td>
							<td class="input-group mb-3"><input class="form-control" id="inputGroupFile02" type="file" name="reloadFile">
								<label class="input-group-text" for="inputGroupFile02">Upload</label>
							</td>
						</tr> -->
					</table>
				<table align="center">
				<tr colspan="2" align="center">
					<table align="center">
						<tr>
							<td colspan="2"><input class="btn btn-primary" type="submit" value="등록"> <a class="btn btn-secondary" href="javascript:history.go(-1);">취소</a></td>
						</tr>
					</table>
				</tr>
			</table>
		</form>
				</div>
			</div>
		<!-- 푸터 -->
		<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	</div>
	  <script>
    $(document).ready(function() {
        $('#summernote').summernote();
    });
  </script>
</body>
</html>