<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 수정</title>
<!-- 부트스트랩 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css"/>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
<script src="https://kit.fontawesome.com/422d96f707.js" crossorigin="anonymous"></script>
<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="/resources/js/jquery-3.6.1.min.js"></script>
<!-- css -->
<link rel="stylesheet" type="text/css" href="/resources/css/common.css">
</head>
<body>
<div class="wrap container">
		<!-- 헤더&메뉴바 -->
		<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
		<!-- 컨텐츠 -->
		<div class="contents">
			<div id="contents-wrap">
			<form action="/board/modify.strap" method="post" enctype="multipart/form-data">
				<input type="hidden" name="page" value="${page}">
				<input type="hidden" name="boardNo" value="${board.boardNo }">
		<table align="center" border="1">
			<tr>
				<td>제목</td>
				<td><input type="text" name="boardTitle" value="${board.boardTitle }"></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td><input type="text" name="memberNick" value="${member.memberNick }" readonly></td>
			</tr>
			<tr>
				<td>카테고리</td>
				<select name="boardCategory">
					<option value="">카테고리</option>
					<option value="잡담">잡담</option>
					<option value="매칭후기">매칭후기</option>
				</select>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea cols="30" rows="7" name="boardContents">
				${board.boardContents }</textarea></td>
			</tr>
			<div class="row">
					<div class="col" align="center">
						<button class="btn btn-primary" type="submit">수정 완료</button>
						<button class="btn btn-primary" onclick="boardCancel(${page})" >수정 취소</button>
					</div>
			</div>
		</table>
		
			
				
				</form>
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