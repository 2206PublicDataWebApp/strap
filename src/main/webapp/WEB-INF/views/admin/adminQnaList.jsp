<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스트랩(관리자) : 문의</title>
<style>
.qnaContents{
	text-decoration:none;
	color:black;
}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/adminHeader.jsp"></jsp:include>
	<div class="container">
		<div id="essential info">
			<div class="row">
				<div class="col">
					<br>
					<p style="text-align:left; font-size:20px;">문의 - ${totalCount }</p>
				</div>
				<div class="col-2">
					<br>
					<select class="form-select" id="sortType" name="sort" aria-label="Default select example">
						<option value="" <c:if test="${qnaCode eq null }">selected</c:if>>전체</option>
						<option value="QC1" <c:if test="${qnaCode eq 'QC1' }">selected</c:if>>회원</option>
						<option value="QC2" <c:if test="${qnaCode eq 'QC2' }">selected</c:if>>상품</option>
					</select>
				</div>
				<hr>
			</div>
		</div>
		<div class="table-responsive">
			<table align="center" class="table table-hover">
				<tr align="center">
					<th width="80">번호</th>
					<th width="100"><a class="qnaContents" href="/admin/adminQnaListView.strap">문의 유형</a></th>
					<th width="150">문의 종류</th>
					<th>제목</th>
					<th width="130">작성자</th>
					<th width="150">작성일</th>
					<th width="100">처리 상태</th>
				</tr>
			<c:if test="${!empty aqList }">
				<c:forEach items="${aqList }" var="qna" varStatus="i">
					<tr align="center">
						<td>${qna.qnaNo }</td>
						<c:if test="${qna.contentsName eq '상품' }">
							<td><div style="background-color:#FFD8D8; border-radius:5px;"><a class="qnaContents" href="/admin/adminQnaSort.strap?qnaCode=QC2&searchCondition=${searchCondition}&searchValue=${searchValue}" ><b>${qna.contentsName }</b></a></div></td>
							<td>${qna.reportName }</td>
						</c:if>
						<c:if test="${qna.contentsName eq '회원' }">
							<td><div style="background-color:#D5D5D5; border-radius:5px;"><a class="qnaContents" href="/admin/adminQnaSort.strap?qnaCode=QC1&searchCondition=${searchCondition}&searchValue=${searchValue}" ><b>${qna.contentsName }</b></a></div></td>
							<td>${qna.reportName }</td>
						</c:if>
						<c:if test="${not empty qna.qnaTitle }">
							<td class="text-truncate" style="max-width: 300px;"><a class="qnaContents" href="/admin/adminQnaDetailView.strap?qnaNo=${qna.qnaNo }&page=${currentPage }">${qna.qnaTitle }</a></td>
						</c:if>
						<c:if test="${empty qna.qnaTitle }">
							<td class="text-truncate" style="max-width: 300px;"><a class="qnaContents" href="/admin/adminQnaDetailView.strap?qnaNo=${qna.qnaNo }&page=${currentPage }">${qna.qnaContents }</a></td>
						</c:if>
						<td>${qna.memberNick }</td>
						<td><fmt:formatDate pattern="yyyy-MM-dd" value="${qna.qEnrollDate }"/> </td>
						
						<c:if test="${qna.answerStatus eq 'N' }">
							<td>미처리</td>
						</c:if>
						<c:if test="${qna.answerStatus eq 'Y' }">
							<td>처리</td>
						</c:if>
					</tr>
				</c:forEach>
				<tr align="center" height="20">
					<td colspan="7">
						<c:if test="${currentPage != 1 }">
							<c:if test="${empty qnaCode }">
								<a href="/admin/${urlVal }.strap?page=${currentPage - 1 }&searchCondition=${searchCondition}&searchValue=${searchValue}" class="btn btn-dark">이전</a>
							</c:if>
							<c:if test="${not empty qnaCode }">
								<a href="/admin/${urlVal }.strap?page=${currentPage - 1 }&searchCondition=${searchCondition}&searchValue=${searchValue}&qnaCode=${qnaCode}" class="btn btn-dark">이전</a>
							</c:if>
						</c:if>
						<c:forEach var="p" begin="${startNavi }" end="${endNavi }">
							<c:if test="${currentPage eq p }">
								<b class="btn btn-dark">${p }</b>
							</c:if>
							<c:if test="${currentPage ne p }">
								<c:if test="${empty qnaCode }">
									<a href="/admin/${urlVal }.strap?page=${p }&searchCondition=${searchCondition}&searchValue=${searchValue}" class="btn btn-light">${p }</a>
								</c:if>
								<c:if test="${not empty qnaCode }">
									<a href="/admin/${urlVal }.strap?page=${p }&searchCondition=${searchCondition}&searchValue=${searchValue}&qnaCode=${qnaCode}" class="btn btn-light">${p }</a>
								</c:if>
							</c:if>
						</c:forEach>
						<c:if test="${maxPage > currentPage }">
							<c:if test="${empty qnaCode }">
								<a href="/admin/${urlVal }.strap?page=${currentPage + 1 }&searchCondition=${searchCondition}&searchValue=${searchValue}" class="btn btn-dark">다음</a>
							</c:if>
							<c:if test="${not empty qnaCode }">
								<a href="/admin/${urlVal }.strap?page=${currentPage + 1 }&searchCondition=${searchCondition}&searchValue=${searchValue}&qnaCode=${qnaCode}" class="btn btn-dark">다음</a>
							</c:if>
						</c:if>
					</td>
				</tr>
				<tr>
					<td colspan="7" align="center">
						<form action="/admin/adminQnaSearch.strap" method="get">
							<div align="center">
								<div style="display:inline-block;">
									<select name="searchCondition" class="btn btn-dark">
										<option value="all" <c:if test="${searchCondition eq 'all' }">selected</c:if>>전체</option>
										<option value="title" <c:if test="${searchCondition eq 'title' }">selected</c:if>>제목</option>
										<option value="contents" <c:if test="${searchCondition eq 'contents' }">selected</c:if>>내용</option>
									</select>
								</div>
								<div style="display:inline-block;">
									<input class="form-control" style="width:300px;" type="text" name="searchValue" value="${searchValue}">
								</div>	
								<div style="display:inline-block;">
									<input type="submit" value="검색" class="btn btn-dark">
								</div>
							</div>
						</form>
					</td>
				</tr>
			</c:if>
			<c:if test="${empty aqList }">
				<tr>
					<td colspan="7" align="center"><b>데이터가 존재하지 않습니다.</b></td>
				</tr>
			</c:if>
			</table>
		</div>
		<br>
	</div>

<script>
	$("#sortType").change(function(){
		console.log($(this).val()); //value값 가져오기
		if($(this).val() == ""){
			location.href="/admin/adminQnaListView.strap"
		} else if($(this).val() == "QC1"){
			location.href="/admin/adminQnaSort.strap?qnaCode=QC1&searchCondition=${searchCondition}&searchValue=${searchValue}"
		} else if($(this).val() == "QC2"){
			location.href="/admin/adminQnaSort.strap?qnaCode=QC2&searchCondition=${searchCondition}&searchValue=${searchValue}"
		}
	});
</script>
</body>
</html>