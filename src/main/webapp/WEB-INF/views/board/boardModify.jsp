<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 수정페이지</title>
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
<style>
	hr {
	    margin: 1rem 0;
	    color: inherit;
	    border: 0;
	    border-top: 1px solid;
	    opacity: .25;
	}

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
	
	#bTitle2 {
		transform: translate(-15px, 12px);
		font-size: 18px;
	}
	
	#bCategory {
		font-size: large;
	    margin-right: 15px;
	}
	
	.btn-primary {
		background-color: dodgerblue;
	}
</style>
</head>
<script>
$(document).ready(function(){
	$('#summernote').summernote({
		height: 500,
		// 에디터 한글 설정
		lang: "ko-KR",
		// 에디터에 커서 이동 (input창의 autofocus라고 생각하시면 됩니다.)
		focus : true,
		toolbar: [
				// 글꼴 설정
				['fontname', ['fontname']],
				// 글자 크기 설정
				['fontsize', ['fontsize']],
				// 굵기, 기울임꼴, 밑줄,취소 선, 서식지우기
				['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
				// 글자색
				['color', ['forecolor','color']],
				// 표만들기
				['table', ['table']],
				// 글머리 기호, 번호매기기, 문단정렬
				['para', ['ul', 'ol', 'paragraph']],
				// 줄간격
				['height', ['height']],
				// 그림첨부, 링크만들기, 동영상첨부
				['insert',['picture','link','video']],
				// 코드보기, 확대해서보기, 도움말
				['view', ['codeview','fullscreen', 'help']]
			],
				// 추가한 글꼴
				fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋음체','바탕체'],
				// 추가한 폰트사이즈
				fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72'],
								
					callbacks: {	//여기 부분이 이미지를 첨부하는 부분
						onImageUpload : function(files) {
							uploadSummernoteImageFile(files[0],this);
						}	
					}
				});
				
			/**
			* 이미지 파일 업로드
			*/
			function uploadSummernoteImageFile(file, editor) {
				data = new FormData();
				data.append("file", file);
				$.ajax({
					data : data,
					type : "POST",
					url : "/board/uploadSummernoteImageFile",
					dataType : "json",
					contentType : false,
					enctype : 'multipart/form-data',
					processData : false,
					success : function(data) {
			        	//항상 업로드된 파일의 url이 있어야 한다.
						$('#summernote').summernote('insertImage', data.url);
					}
				});
			}
	//$('p').remove(); // 썸머노트 Contents에 필요 없는 <p> 태그 제거
});
</script>
<body>
<div class="wrap container">
	<!-- 헤더&메뉴바 -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	<!-- 컨텐츠 -->
	<div class="contents">
		<div id="contents-wrap">
			<div class="contents-noside">
				<form action="/board/modify.strap" method="post" enctype="multipart/form-data">
					<input type="hidden" name="page" value="${page}">
					<input type="hidden" name="boardNo" value="${board.boardNo }">
					<!-- 카테고리/제목 -->
					<div class="position-relative" id="bTitle1">
					<select name="boardCategory" id="bCategory">
						<option value="자유글">자유글</option>
						<option value="후기글">후기글</option>
					</select>
					<input type="text" name="boardTitle" value="${board.boardTitle }" required="required" style="width: 500px;"><br>
						<div class="position-absolute top-0 end-0" id="bTitle2">
							${sessionScope.loginUser.memberNick }
						</div>
					</div>
					<textarea id="summernote" class="note-editable" contenteditable="true" role="textbox"
					aria-multiline="true" spellcheck="true" name="boardContents">${board.boardContents }</textarea>
					<div class="row">
						<div class="col" align="center">
							<button class="btn btn-primary" type="submit">수정 완료</button>
							<button class="btn btn-secondary" onclick="boardCancel(${page})" >수정 취소</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<!-- 푸터 -->
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
<script>
		function boardCancel(page){
			event.preventDefault(); // 하이퍼링크 이동 방지
			if(confirm("수정을 취소하시겠습니까?")) {
				location.href="/board/list.strap?page="+page;
			}
		}
</script>
</body>
</html>