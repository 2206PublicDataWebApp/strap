<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판</title>
<!-- 부트스트랩 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
			<!-- 카테고리 -->
			<ul class="nav nav-pills" style="justify-content: center; padding: 40px; transform: translate(40px, 10px);">
				<button type="button" style="height: 40px; margin-right: 20px; --bs-btn-hover-bg: white;" class="btn btn-outline-primary">
					 <li style="margin-top: -7px;" class="nav-item">
					 	<a class="nav-link" style="--bs-nav-link-color: black; --bs-nav-link-hover-color: blue;" href="#">전체</a>
					 </li>
				</button>
				<button type="button" style="height: 40px; margin-right: 20px; --bs-btn-hover-bg: white;" class="btn btn-outline-primary">
	  				<li style="margin-top: -7px;" class="nav-item" style="border-left: none;">
	    				<a class="nav-link" style="--bs-nav-link-color: black; --bs-nav-link-hover-color: blue;" href="#">잡담</a>
	  				</li>
	  			</button>
	  			<button type="button" style="height: 40px; margin-right: 20px; --bs-btn-hover-bg: white;" class="btn btn-outline-primary">
	  				<li style="margin-top: -7px;" class="nav-item" style="border-left: none;">
	    				<a class="nav-link" style="--bs-nav-link-color: black; --bs-nav-link-hover-color: blue;" href="#">매칭후기</a>
	  				</li>
	  			</button>
  			</ul>
  					<!-- 검색창 -->
						<form action="/board/search.strap" method="get" style="transform: translate(30%); margin-bottom: 50px;">
							<select style="float: left; width: 8%!important;" class="form-select w-25"
								aria-label="Default select example" aria-label="Default select example" name="searchCondition">
								<option value="all"
									<c:if test="${searchCondition == 'all' }">selected</c:if>>전체</option>
								<option value="title"
									<c:if test="${searchCondition == 'title' }">selected</c:if>>제목</option>
								<option value="contents"
									<c:if test="${searchCondition == 'contents' }">selected</c:if>>내용</option>
								<option value="member"
									<c:if test="${searchCondition == 'member' }">selected</c:if>>작성자</option>									
							</select> 
							<div style="height: 40px; display: contents" class="input-group mb-3">
								<input style="float: left; width: 30%!important;" 
											  class="form-control" aria-describedby="inputGroup-sizing-default" type="text" name="searchValue" value="${searchValue }"> 
								<button style="float: left; border:none; height:38px; width:40px; border: 1px solid #ced4da;
											   border-top-right-radius: 8px; border-bottom-right-radius: 8px;
											   border-left: none; background-color: white;" type="submit" value="검색">
									<i style="background-color: white; font-size: 25px;" class="bi bi-search"></i>
								</button>						
							</div>
						</form>
				<div class="contents-noside" style="width: 1000px; margin: auto; height: 800px;">
					<table class="table" style="text-align:center;">
						<tr>
							<th>번호</th>
							<th>카테고리</th>
							<th>제목</th>
							<th>작성자</th>
							<th>등록일</th>
							<th>조회</th>
							<th>추천</th>
							<!-- <th class="table-primary" style="text-align: center">비추천</th> -->
						</tr>
						<!-- 공지사항 리스트 -->
						<c:if test="${!empty nList }">
							<c:forEach items="${nList }" var="notice" varStatus="i">
								<tr align="center">
									<td class="table-secondary">${i.count }</td>
									<td class="table-secondary">공지</td>
									<td class="table-secondary">
										<a href="/admin/noticeDetailView.strap?noticeNo=${notice.noticeNo }&page=${currentPage }"
										style="text-decoration-line: none; color: black;">${notice.noticeTitle }</a>
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
									<td>${Board.boardCategory }</td>
									<td><a href="/board/detail.strap?boardNo=${Board.boardNo }&page=${currentPage }"
									style="text-decoration-line: none; color: black;">${Board.boardTitle }</a></td>
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
									<td colspan="6" style="text-align:center">게시글이 존재하지 않습니다</td>
								</tr>
							</c:if>
						</table>
					<!-- 페이징 처리 -->
							<div class="col-md-11 offset-md-5 py-5 text-center">
								<div style="float: left;">
									<nav aria-label="Page navigation example">
	          					<ul class="pagination" style="justify-content: center;">
									<c:if test="${currentPage != 1 }">
										<li class="page-item">
											<a class="page-link" href="/board/${urlVal }.strap?page=${currentPage - 1 }&searchCondition=${searchCondition}&searchValue=${searchValue}"><span aria-hidden="true">&laquo;</span></a>
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
											<a class="page-link" href="/board/${urlVal }.strap?page=${currentPage + 1 }&searchCondition=${searchCondition}&searchValue=${searchValue}"><span aria-hidden="true">&raquo;</span></a>
										</li>
									</c:if>
								</ul>
							</nav>
								</div>
								<div>
								<button type="button" class="btn btn-primary" onclick="location.href='/board/writeView.strap'">글쓰기</button>
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