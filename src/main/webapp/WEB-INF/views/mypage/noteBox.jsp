<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
<title>STRAP MyPage</title>
<!-- CDN -->
<!-- 부트스트랩 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" />
<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- css -->
<link rel="stylesheet" type="text/css" href="/resources/css/common.css">

</head>
<body>
	<div class="wrap container">
		<!-- 헤더&메뉴바 -->
		<div class="row">
			<div class="col">
				<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
			</div>
		</div>
	
		<div class="row">
			<div class="sidebar col-3" >
				<jsp:include page="/WEB-INF/views/common/sideBarMyPage.jsp"></jsp:include>
			</div>
			<div class="contents-side col" width="300">
				<p align="center" style=" font-size:34px; font-family:malgun gothic;">[ 쪽지함 ]<p>
				<table align="center" border="1" width="" class="table table-striped table-hover">
					<tr>
					</tr>
					<tr align="center">
						<th width="150">번호</th>
						<th>제목</th>
						<th width="150">보낸 사람</th>
						<th width="150">보낸 날짜</th>
					</tr>
				<c:if test="${!empty nList }">
					<c:forEach items="${nList }" var="notebox" varStatus="i">
						<tr align="center">
							<td>${i.count }</td>
							<td><a href="/mypage/noteDetailView.strap?noteNo=${notebox.noteNo }"  onclick="window.open(this.href, '_blank', 'width=600, height=600, location = no'); return false">${notebox.noteTitle }</a></td>
							<td>${notebox.senderId }</td>
							<td><fmt:formatDate pattern="yyyy-MM-dd / hh:mm:ss" value="${notebox.senderTime }"/> </td>
						</tr>
					</c:forEach>
					<tr align="center" height="20">
						<td colspan="5">
							<c:if test="${currentPage != 1 }">
								<a href="/admin/${urlVal }.strap?page=${currentPage - 1 }&searchCondition=${searchCondition}&searchValue=${searchValue}" class="btn btn-primary">이전</a>
							</c:if>
							<c:forEach var="p" begin="${startNavi }" end="${endNavi }">
								<c:if test="${currentPage eq p }">
									<b class="btn btn-primary">${p }</b>
								</c:if>
								<c:if test="${currentPage ne p }">
									<a href="/admin/${urlVal }.strap?page=${p }&searchCondition=${searchCondition}&searchValue=${searchValue}" class="btn btn-light">${p }</a>
								</c:if>
							</c:forEach>
							<c:if test="${maxPage > currentPage }">
								<a href="/admin/${urlVal }.strap?page=${currentPage + 1 }&searchCondition=${searchCondition}&searchValue=${searchValue}" class="btn btn-primary">다음</a>
							</c:if>
						</td>
					</tr>
					<tr>
						<td colspan="5" align="center">
							<form action="/admin/noticeSearch.strap" method="get">
								<div align="center">
									<div style="display:inline-block;">
										<select name="searchCondition" class="btn btn-primary">
											<option value="all" <c:if test="${searchCondition eq 'all' }">selected</c:if>>전체</option>
											<option value="title" <c:if test="${searchCondition eq 'title' }">selected</c:if>>제목</option>
											<option value="contents" <c:if test="${searchCondition eq 'contents' }">selected</c:if>>내용</option>
										</select>
									</div>
									<div style="display:inline-block;">
										<input style="width:300px; height:33px;" type="text" name="searchValue" value="${searchValue}">
									</div>	
									<div style="display:inline-block;">
										<input type="submit" value="검색" class="btn btn-primary">
									</div>
								</div>
							</form>
						</td>
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
		<div class="row">
			<div class="col">
				<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
			</div>
		</div>
	</div>
</body>
</html>