<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/adminHeader.jsp"></jsp:include>
	<div class="container">
		<div class="table-responsive">
		<p align="center" style=" font-size:34px; font-family:malgun gothic;">[ 공지사항 관리 ]<p>
		<table align="center" border="1" width="" class="table table-striped table-hover">
			<tr>
<%-- 				<c:if test="${loginAdmin.adminName eq '관리자'}"> <!-- 관리자만 공지사항 등록 가능 --> --%>
				<td colspan="5" align="left">
					<button type="button" onclick="location.href='/admin/writeView.strap';" class="btn btn-primary">공지사항 등록</button>
				</td>
<%-- 				</c:if> --%>
			</tr>
			<tr align="center">
				<th width="80">번호</th>
				<th>제목</th>
				<th width="100">작성자</th>
				<th width="150">작성일</th>
				<th width="100">조회수</th>
<!-- 				<th width="155">기타</th> -->
			</tr>
		<c:if test="${!empty nList }">
			<c:forEach items="${nList }" var="notice" varStatus="i">
				<tr align="center">
					<td>${i.count }</td>
					<td><a href="/admin/noticeDetailView.strap?noticeNo=${notice.noticeNo }&page=${currentPage }">${notice.noticeTitle }</a></td>
					<td>${notice.noticeWriter }</td>
					<td><fmt:formatDate pattern="yyyy-MM-dd" value="${notice.nCreateDate }"/> </td>
					<td>${notice.noticeCount }</td>
<!-- 					<td> -->
<%-- 						<c:if test="${!empty notice.noticeFilename }"> --%>
<!-- 							첨부파일 -->
<%-- 						</c:if> --%>
<%-- 						<c:if test="${empty notice.noticeFilename }"> --%>
							
<%-- 						</c:if> --%>
<!-- 					</td> -->
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
				<td colspan="6" align="center">
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
</body>
</html>