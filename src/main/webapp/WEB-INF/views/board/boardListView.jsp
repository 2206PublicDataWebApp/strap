<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
			<ul class="nav nav-pills" style="justify-content: center; padding: 40px;">
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
						<form action="/board/search.strap" method="get" style="transform: translate(24%); margin-bottom: 50px;">
							<select style="float: left; width: 10%!important;" class="form-select w-25"
								aria-label="Default select example" name="searchCondition">
								<option value="all"
									<c:if test="${searchCondition eq 'all' }">selected</c:if>>전체</option>
								<option value="writer"
									<c:if test="${searchCondition eq 'writer' }">selected</c:if>>작성자</option>
								<option value="title"
									<c:if test="${searchCondition eq 'title' }">selected</c:if>>제목</option>
								<option value="contents"
									<c:if test="${searchCondition eq 'contents' }">selected</c:if>>내용</option>
							</select> 
							<div style="height: 40px; display: contents" class="input-group mb-3">
								<input style="float: left; width: 40%!important;" 
											  class="form-control" aria-describedby="inputGroup-sizing-default" type="text" name="searchValue" value="${searchValue }"> 
								<button style="float: left; border:none; height:38px; width:40px; border: 1px solid #ced4da;
											   border-top-right-radius: 8px; border-bottom-right-radius: 8px;
											   border-left: none; background-color: white;" type="submit">
									<i style="background-color: white; font-size: 25px;" class="bi bi-search"></i>
								</button>						
							</div>
						</form>
				<div class="contents-noside">
					<!-- 게시글 리스트 -->
					<table class="table table-hover table-fixed" align="center" border="2">
						<tr>
							<th class="table-primary" style="text-align: center">번호</th>
							<th class="table-primary" style="text-align: center">카테고리</th>
							<th class="table-primary" style="text-align: center">제목</th>
							<th class="table-primary" style="text-align: center">작성자</th>
							<th class="table-primary" style="text-align: center">등록일</th>
							<th class="table-primary" style="text-align: center">조회</th>
							<th class="table-primary" style="text-align: center">추천</th>
						</tr>
					
						<c:if test="${!empty bList }">
							<c:forEach items="${bList }" var="Board" varStatus="i">
								<tr>
									<th scope="row" style="text-align:center">${Board.boardNo }</th>
									<td style="text-align:center">${Board.boardCategory }</td>
									<td><a href="#" onclick="detailView(${boardWriter},${Board.boardNo },${currentPage });">${Board.boardTitle }</a></td>
									<td style="text-align:center">${Board.boardWriter }</td>
									<td style="text-align:center">${Board.boardDate }</td>
									<td style="text-align:center">${Board.boardCount }</td>
									<td style="text-align:center">${Board.boardLike }</td>
								</tr>
							</c:forEach>
					<tr align="center" height="20">
					<td align="center" colspan="6">
					<nav aria-label="Page navigation example" style="display: inline-block;">
							<ul class="pagination">
								<li class="page-item">
									<c:if test="${currentPage > 5}">
										<a class="page-link" href="/board/${urlVal }.strap?page=${startNavi - 1}&searchCondition=${searchCondition}&searchValue=${searchValue}" aria-label="Previous">
											<span aria-hidden="true">&laquo;</span>
										</a>
									</c:if>
								</li>
								<c:forEach var="p" begin="${startNavi }" end="${endNavi }">
									<li class="page-item"><a class="page-link" href="/board/${urlVal }.strap?page=${p }&searchCondition=${searchCondition}&searchValue=${searchValue}">${p }</a></li>
								</c:forEach>
								<c:if test="${maxPage-4 > currentPage }">
									<li class="page-item">
										<a class="page-link" href="/board/${urlVal }.strap?page=${endNavi + 1 }&searchCondition=${searchCondition}&searchValue=${searchValue}" aria-label="Next">
											<span aria-hidden="true">&raquo;</span>
										</a>
									</li>
								</c:if>
							</ul>
								</nav>
									</td>
									<td align="center">
										<button type="button" class="btn btn-primary" onclick="location.href='/board/writeView.strap'">글쓰기</button>
									</td>
								</tr>
							</c:if>
						</table>
					</div>
				</div>
			</div>
		</div>
		<!-- 푸터 -->
		<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	
</body>
</html>