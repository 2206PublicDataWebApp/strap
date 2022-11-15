<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스트랩 : 공지사항 상세 정보</title>
<!-- 부트스트랩 -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
<script src="https://kit.fontawesome.com/422d96f707.js"
	crossorigin="anonymous"></script>
<!-- 모달 부트스트랩 -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8"
	crossorigin="anonymous"></script>
<!-- jQuery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="/resources/js/jquery-3.6.1.min.js"></script>
<!-- css -->
<link rel="stylesheet" type="text/css" href="/resources/css/common.css">
<link rel="stylesheet" type="text/css" href="/resources/css/modal.css">
<style>
	.contents-noside {
		width: 1000px;
		margin: auto;
	}
	
	#nTitle1 {
		margin-top: 25px;
		background-color: #F8F8F8;
		border-bottom: 1px solid #ccc;
		padding: 1rem !important;
	}
	
	.nTitle2 {
		border-bottom: 1px solid #eee;
		padding: 1rem !important;
	}
	
	.nTitle3 {
		padding: 1rem !important;
	}
	
	.position-absolute {
		transform: translate(-15px, 15px);
	}
	
	.nContents {
		height: 150px;
	}
	
	#cl {
		align: center;
		width: 150px;
	}
	
	img {
		width: 300px; 
		height: 300px;
	}

	#list {
		text-align: center; 
		margin-top: 30px;
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
			<div class="contents-noside"">
				<!-- 카테고리/제목 -->
				<div class="position-relative" id="nTitle1">
					[공지] ${notice.noticeTitle}
					<div class="position-absolute top-0 end-0">
						<fmt:formatDate pattern="yyyy-MM-dd" value="${notice.nCreateDate }" />
					</div>
				</div>
				<!-- 작성자/조회 -->
				<div class="position-relative">
					<div class="nTitle2">${notice.noticeWriter }</div>
					<div class="position-absolute top-0 end-0">조회수 ${notice.noticeCount }</div>
				</div>
				<div class="nTitle3">
					<!-- 내용 -->
					<div class="nContents">${notice.noticeContents }</div>
					<c:if test="${notice.noticeFilename ne null}">
						<!-- 첨부파일 있을 때만 보이게 -->
						<tr>
							<td id="cl">첨부파일</td>
							<td><img alt="본문이미지" src="/resources/nuploadFiles/${notice.noticeFileRename }"></td>
						</tr>
					</c:if>
					<div id="list">
						<button onclick="location.href='/board/list.strap?page=${page}'" class="btn btn-outline-secondary">목록</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- 푸터 -->
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</body>
</html>