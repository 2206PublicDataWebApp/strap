<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티</title>
<!-- 부트스트랩 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- css -->
<link rel="stylesheet" type="text/css" href="/resources/css/common.css">
<style>
	.nav {
		justify-content: center; 
		padding: 40px; 
		margin-left: 50px;
	}
	.btn {
		height: 40px; 
		margin-right: 20px;
	}
	.btn-outline-primary {
		--bs-btn-border-color: black;
		--bs-btn-hover-bg: white;
		--bs-btn-hover-color: none;
	}
	.btn-primary {
		--bs-btn-bg: dodgerblue;
	}
	.nav-item {
		margin-top: -7px;
	}
	.nav-link {
		--bs-nav-link-color: dimgray;
		--bs-nav-link-hover-color: dodgerblue;
		--bs-nav-link-font-weight: bold;
	}
	.search {
		display:inline-block
	}
	.form-select {
		float: left; 
		width: 105%!important;
	}
	.form-control {
		float: left; width: 300px;
	}
	#search-btn {
		float: left; 
		border: none; 
		height: 38px; 
		width: 40px; 
		border: 1px solid #ced4da;
		border-top-right-radius: 8px; 
		border-bottom-right-radius: 8px;
		border-left: none; 
		background-color: white; 
		transform: translate(-5px, 0px);
	}
	.bi {
		background-color: white; 
		font-size: 25px;
	}
	.contents-noside {
		width: 1000px; 
		margin: auto; 
		height: 800px;
	}
	.table {
		text-align:center;
	}
	#title {
		text-align:left;
	}
	#table-list {
		text-decoration-line: none; 
		color: black;
	}
	#table-nList {
		text-align:center
	}
	#page {
		float: left;
	}
	.pagination {
		justify-content: center;
	}
	.page-link {
		color: black;
	}
	.bi {
		background: none;
		font-size: 16px;		
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
			<!-- 카테고리 -->
			<ul class="nav nav-pills">
				<button class="btn btn-outline-primary" onclick="location.href='/board/list.strap?page=${page}'">
					 <li class="nav-item">
					 	<a class="nav-link" href="#" title="all">전체</a>
					 </li>
				</button>
				<button class="btn btn-outline-primary" onclick="location.href='/board/free.strap?page=${page}'">
	  				<li class="nav-item">
	    				<a class="nav-link" href="#" title="free">자유글</a>
	  				</li>
	  			</button>
	  			<button class="btn btn-outline-primary" onclick="location.href='/board/review.strap?page=${page}'">
	  				<li class="nav-item">
	    				<a class="nav-link" href="#" title="review">후기글</a>
	  				</li>
	  			</button>
  			</ul>
  			<!-- 검색창 -->
  			<tr>
				<td colspan="6" align="center">
					<form action="/board/search.strap" method="get">
						<div align="center">
							<div class="search">
								<select class="form-select w-25" aria-label="Default select example" aria-label="Default select example" name="searchCondition">
									<option value="all"
										<c:if test="${searchCondition == 'all' }">selected</c:if>>전체</option>
									<option value="title"
										<c:if test="${searchCondition == 'title' }">selected</c:if>>제목</option>
									<option value="contents"
										<c:if test="${searchCondition == 'contents' }">selected</c:if>>내용</option>
									<option value="member"
										<c:if test="${searchCondition == 'member' }">selected</c:if>>작성자</option>									
								</select> 
							</div>
							<div class="search">
								<input class="form-control" aria-describedby="inputGroup-sizing-default" type="text" name="searchValue" value="${searchValue }">
							</div>	
							<div class="search">
								<button id="search-btn" type="submit" value="검색">
									<i class="bi bi-search"></i>
								</button>
							</div>
						</div>
					</form>
				</td>
			</tr>
				<div class="contents-noside">
					<table class="table">
						<tr>
							<th>번호</th>
							<th>카테고리</th>
							<th>제목</th>
							<th>작성자</th>
							<th>등록일</th>
							<th>조회</th>
							<th>추천</th>
						</tr>
						<!-- 공지사항 리스트 -->
						<c:if test="${!empty nList }">
							<c:forEach items="${nList }" var="notice" varStatus="i">
								<tr align="center">
									<td class="table-secondary">${i.count }</td>
									<td class="table-secondary">[공지]</td>
									<td id="title" class="table-secondary">
										<a id="table-list" href="/board/noticeDetail.strap?noticeNo=${notice.noticeNo }&page=${currentPage }">${notice.noticeTitle }</a>
									</td>
									<td class="table-secondary">${notice.noticeWriter }</td>
									<td class="table-secondary">
										<fmt:formatDate pattern="yyyy-MM-dd" value="${notice.nCreateDate }"/>
									</td>
									<td class="table-secondary">${notice.noticeCount }</td>
									<td class="table-secondary">&nbsp;&nbsp;&nbsp;</td>
								</tr>
							</c:forEach>
						</c:if>
						<!-- 게시글 리스트 -->
						<c:if test="${!empty bList }">
							<c:forEach items="${bList }" var="Board" varStatus="i">	
									<tr>
										<th scope="row">${Board.boardNo }</th>
										<td>[${Board.boardCategory }]</td>
										<td id="title">
											<a id="table-list" href="/board/detail.strap?boardNo=${Board.boardNo }&page=${currentPage }">${Board.boardTitle }</a>
										</td>
										<td>${Board.memberNick }</td>
										<td>${Board.boardDate }</td>
										<td>${Board.boardCount }</td>
										<td>${Board.boardLikeIt }</td>
									</tr>
							</c:forEach>
						</c:if>
						<!-- 게시글이 없을 때 -->
						<c:if test="${empty bList }">
							<tr>
								<td id="table-nList" colspan="6">게시글이 존재하지 않습니다</td>
							</tr>
						</c:if>
					</table>
						<!-- 페이징 처리 -->
							<div class="col-md-11 offset-md-5 py-4 text-center">
								<div id="page">
									<nav aria-label="Page navigation example">
	          					<ul class="pagination">
									<c:if test="${currentPage != 1 }">
										<li class="page-item">
											<a class="page-link" href="/board/${urlVal }.strap?page=${currentPage - 1 }&searchCondition=${searchCondition}&searchValue=${searchValue}">
												<span aria-hidden="true">&laquo;</span>
											</a>
										</li>
									</c:if>
									<c:forEach var="p" begin="${startNavi }" end="${endNavi }">
										<c:if test="${currentPage eq p }">
										<li class="page-item">
											<a class="page-link" href="#">${p }</a>
											</li>
										</c:if>
										<c:if test="${currentPage ne p }">
										<li class="page-item">
											<a class="page-link" href="/board/${urlVal }.strap?page=${p }&searchCondition=${searchCondition}&searchValue=${searchValue}">${p }</a>
										</li>
										</c:if>
									</c:forEach>
									<c:if test="${maxPage > currentPage }">
										<li class="page-item">
											<a class="page-link" href="/board/${urlVal }.strap?page=${currentPage + 1 }&searchCondition=${searchCondition}&searchValue=${searchValue}">
												<span aria-hidden="true">&raquo;</span>
											</a>
										</li>
									</c:if>
								</ul>
							</nav>
								</div>
								<div>
								<!-- 글쓰기 로그인 체크 -->
								<c:choose>
								<c:when test="${sessionScope.loginUser.memberNick == null }">
									<button type="button" class="btn btn-primary" onclick="writeCheck();">
										<i class="bi bi-pen">글쓰기</i>
									</button>
								</c:when>
								<c:otherwise>
									<button type="button" class="btn btn-primary" onclick="location.href='/board/writeView.strap'">
										<i class="bi bi-pen">글쓰기</i>
									</button>
								</c:otherwise>
								</c:choose>	
								</div>
							</div>
						</div>
				</div>
		</div>
	</div>
<!-- 푸터 -->
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
<script>
function writeCheck() {
	alert("로그인 후 이용해주세요");
	location.href="/member/loginView.strap"
}
</script>
</body>
</html>