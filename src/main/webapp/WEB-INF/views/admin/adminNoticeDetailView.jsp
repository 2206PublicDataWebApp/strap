<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Admin Notice Detail</title>
<!-- 	<script src="/resources/js/jquery-3.6.1.min.js"></script> -->
<!-- 	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous"> -->
<!-- 	<style> -->
<!-- /* 		#cl { background-color: #F9FFFF; } */ -->
<!-- 	</style> -->
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/adminHeader.jsp"></jsp:include>
	<div class="container">
	<div class="table-responsive">
		<table align="center" width="500" border="1" class="table table-bordered">
			<tr>
				<td id="cl" align="center" width="150">제목</td>
				<td>${notice.noticeTitle}</td>
			</tr>
			<tr>
				<td id="cl" align="center" width="150">작성자</td>
				<td>${notice.noticeWriter }</td>
			</tr>
			<tr>
				<td id="cl" align="center" width="150">작성일</td>
				<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${notice.nCreateDate}"/></td>
			</tr>
			<tr>
				<td id="cl" align="center" width="150">조회수</td>
				<td>${notice.noticeCount }</td>
			</tr>
			<tr height="300">
				<td id="cl" align="center" width="150">내용</td>
				<td>${notice.noticeContents }
				</td>
			</tr>
			<c:if test="${notice.noticeFilename ne null}"> <!-- 첨부파일 있을 때만 보이게 -->
			<tr>
				<td id="cl" align="center" width="150">첨부파일</td>
				<td>
			 		<img alt="본문이미지" src="/resources/nuploadFiles/${notice.noticeFileRename }" width="300" height="300">
				</td>
			</tr>
			</c:if>
<%-- 			<c:if test="${loginAdmin.adminName eq '관리자'}"> <!-- 관리자만 수정, 삭제 가능 --> --%>
			<tr>
				<td colspan="2" align="center">
					<button onclick="location.href='/notice/modifyView.kh?noticeNo=${notice.noticeNo }&page=${page}';" class="btn btn-info">수정</button>
					<button onclick="noticeRemove(${page});" class="btn btn-danger">삭제</button>
			</tr>
<%-- 			</c:if> --%>
		</table>
	</div>
	</div>
	<script>
		function noticeRemove(page) {
			event.preventDefault(); // 하이퍼링크 이동 방지
			if(confirm("(관리자) 공지사항을 정말 삭제하시겠습니까?")) {
				location.href="/notice/remove.kh?page="+page;
			}
		}
	</script>
</body>
</html>