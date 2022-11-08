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
							<tr height="300">
								<td id="cl" align="center" width="150">내용</td>
								<td>${adminQna.qnaContents }
								</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
			<div class="row text-center">
				<div class="col">
					<div>
						<button class="btn btn-dark">답변 작성</button>
					</div>
				</div>
			</div>
	</div>
	<script>
		function noticeRemove(page) {
			event.preventDefault(); // 하이퍼링크 이동 방지
			if(confirm("(관리자) 공지사항을 정말 삭제하시겠습니까?")) {
				location.href="/admin/removeNotice.strap?page="+page;
			}
		}
	</script>
</body>
</html>