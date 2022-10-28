<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Main</title>

</head>
<body>
	<jsp:include page="/WEB-INF/views/common/adminHeader.jsp"></jsp:include>
	<div class="container">
		<div class="row" align="center">
			<div class="col">
				<br>
				<p style="text-align:left; font-size:20px;">대시보드</p>
				<hr>
			</div>
		</div>
		<div class="row" align="center">
			<div class="col" align="left">
				<h3>문의</h3>
				<div class="container">
					<div class="table-responsive">
						<table align="center" border="1"
							class="table table-striped table-hover">
							<tr align="center">
								<th width="80">번호</th>
								<th>제목</th>
								<th width="100">작성자</th>
								<th width="150">작성일</th>
								<th width="100">조회수</th>
							</tr>
							<c:if test="${!empty nList }">
								<c:forEach items="${nList }" var="notice" varStatus="i">
									<tr align="center">
										<td>${i.count }</td>
										<td><a
											href="/admin/noticeDetailView.strap?noticeNo=${notice.noticeNo }&page=${currentPage }">${notice.noticeTitle }</a></td>
										<td>${notice.noticeWriter }</td>
										<td><fmt:formatDate pattern="yyyy-MM-dd"
												value="${notice.nCreateDate }" /></td>
										<td>${notice.noticeCount }</td>
									</tr>
								</c:forEach>
								<tr align="center" height="20">
									<td colspan="5"><c:if test="${currentPage != 1 }">
											<a
												href="/admin/${urlVal }.strap?page=${currentPage - 1 }&searchCondition=${searchCondition}&searchValue=${searchValue}"
												class="btn btn-primary">이전</a>
										</c:if> <c:forEach var="p" begin="${startNavi }" end="${endNavi }">
											<c:if test="${currentPage eq p }">
												<b class="btn btn-primary">${p }</b>
											</c:if>
											<c:if test="${currentPage ne p }">
												<a
													href="/admin/${urlVal }.strap?page=${p }&searchCondition=${searchCondition}&searchValue=${searchValue}"
													class="btn btn-light">${p }</a>
											</c:if>
										</c:forEach> <c:if test="${maxPage > currentPage }">
											<a
												href="/admin/${urlVal }.strap?page=${currentPage + 1 }&searchCondition=${searchCondition}&searchValue=${searchValue}"
												class="btn btn-primary">다음</a>
										</c:if></td>
								</tr>
							</c:if>
							<c:if test="${empty nList }">
								<tr>
									<td colspan="6" align="center"><b>데이터가 존재하지 않습니다.</b></td>
								</tr>
							</c:if>
						</table>
					</div>
				</div>
			</div>
			<div class="col" align="left">
				<h3>신고</h3>
				<div class="container">
					<div class="table-responsive">
						<table align="center" border="1"
							class="table table-striped table-hover">
							<tr align="center">
								<th width="80">번호</th>
								<th>제목</th>
								<th width="100">작성자</th>
								<th width="150">작성일</th>
								<th width="100">조회수</th>
							</tr>
							<c:if test="${!empty nList }">
								<c:forEach items="${nList }" var="notice" varStatus="i">
									<tr align="center">
										<td>${i.count }</td>
										<td><a
											href="/admin/noticeDetailView.strap?noticeNo=${notice.noticeNo }&page=${currentPage }">${notice.noticeTitle }</a></td>
										<td>${notice.noticeWriter }</td>
										<td><fmt:formatDate pattern="yyyy-MM-dd"
												value="${notice.nCreateDate }" /></td>
										<td>${notice.noticeCount }</td>
									</tr>
								</c:forEach>
								<tr align="center" height="20">
									<td colspan="5"><c:if test="${currentPage != 1 }">
											<a
												href="/admin/${urlVal }.strap?page=${currentPage - 1 }&searchCondition=${searchCondition}&searchValue=${searchValue}"
												class="btn btn-primary">이전</a>
										</c:if> <c:forEach var="p" begin="${startNavi }" end="${endNavi }">
											<c:if test="${currentPage eq p }">
												<b class="btn btn-primary">${p }</b>
											</c:if>
											<c:if test="${currentPage ne p }">
												<a
													href="/admin/${urlVal }.strap?page=${p }&searchCondition=${searchCondition}&searchValue=${searchValue}"
													class="btn btn-light">${p }</a>
											</c:if>
										</c:forEach> <c:if test="${maxPage > currentPage }">
											<a
												href="/admin/${urlVal }.strap?page=${currentPage + 1 }&searchCondition=${searchCondition}&searchValue=${searchValue}"
												class="btn btn-primary">다음</a>
										</c:if></td>
								</tr>
							</c:if>
							<c:if test="${empty nList }">
								<tr>
									<td colspan="6" align="center"><b>데이터가 존재하지 않습니다.</b></td>
								</tr>
							</c:if>
						</table>
					</div>
				</div>
			</div>
		</div>
		<hr>
		<h3>방문자</h3>
		<hr>
		<h3>배너</h3>
	</div>
	<script>
		var removeToast;
		function toast(string) {
		    const toast = document.getElementById("toast");
	
		    toast.classList.contains("reveal") ?
		        (clearTimeout(removeToast), removeToast = setTimeout(function () {
		            document.getElementById("toast").classList.remove("reveal")
		        }, 3000)) :
		        removeToast = setTimeout(function () {
		            document.getElementById("toast").classList.remove("reveal")
		        }, 3000)
		    toast.classList.add("reveal"),
		        toast.innerText = string
		}
	</script>
</body>
</html>