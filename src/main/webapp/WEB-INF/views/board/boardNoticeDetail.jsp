<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 상세 정보</title>
<!-- 부트스트랩 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css"/>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
<script src="https://kit.fontawesome.com/422d96f707.js" crossorigin="anonymous"></script>
<!-- 모달 부트스트랩 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>
<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="/resources/js/jquery-3.6.1.min.js"></script>
<!-- css -->
<link rel="stylesheet" type="text/css" href="/resources/css/common.css">
<link rel="stylesheet" type="text/css" href="/resources/css/modal.css">
</head>
<body>
<div class="wrap container">
		<!-- 헤더&메뉴바 -->
		<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
		<!-- 컨텐츠 -->
		<div class="contents">
			<div id="contents-wrap">
			<div class="contents-noside" style="width: 1000px; margin: auto;">
		<!-- 작성자/조회수 -->
		<div class="position-relative" style="margin-bottom: 25px;">	
				${notice.noticeWriter }
			<div class="position-absolute top-0 end-0">
				조회수 ${notice.noticeCount }		
			</div>
		</div>
		<!-- 카테고리/제목/신고 -->
		<div class="position-relative">
			<div class="border border-success p-2 border-opacity-10" 
	     		 style="padding: 1rem!important; width: 850px; margin-bottom: 15px;">
					${notice.noticeTitle}
			</div>
		</div>
		<!-- 내용 -->
		<div class="border border-success p-2 border-opacity-10" style="padding: 1rem!important;">
			${notice.noticeContents }
		</div>
		<c:if test="${notice.noticeFilename ne null}"> <!-- 첨부파일 있을 때만 보이게 -->
							<tr>
								<td id="cl" align="center" width="150">첨부파일</td>
								<td>
							 		<img alt="본문이미지" src="/resources/nuploadFiles/${notice.noticeFileRename }" width="300" height="300">
								</td>
							</tr>
							</c:if>
		<div style="text-align: center;">
			<button onclick="location.href='/board/list.strap?page=${page}'" class="btn btn-outline-secondary">목록</button>
		</div>
	</div>
	</div>
</div>
</div>
<!-- 푸터 -->
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</body>
</html>