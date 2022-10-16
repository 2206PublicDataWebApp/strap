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
						<form action="/board/search.kh" method="get" style="transform: translate(24%); margin-bottom: 50px;">
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
					<table class="table table-bordered w-75" align="center" border="2">
						<tr>
							<th class="table-primary" style="width: 70px; text-align: center">번호</th>
							<th class="table-primary"
								style="width: 300px; text-align: center">제목</th>
							<th class="table-primary"
								style="width: 100px; text-align: center">글쓴이</th>
							<th class="table-primary"
								style="width: 100px; text-align: center">등록일</th>
							<th class="table-primary" style="width: 70px; text-align: center">조회</th>
							<th class="table-primary" style="width: 70px; text-align: center">추천</th>
						</tr>
						<%-- <c:if test="${!empty bList }">
							<c:forEach items="${bList }" var="board" varStatus="i">
								<tr>
									<td>${i.count }</td>
									<td><a
										href="/board/detail.kh?boardNo=${board.boardNo }&page=${currentPage }">${board.boardTitle }</a></td>
									<td>${board.boardWriter }</td>
									<td>${board.bCreateDate }</td>
									<td>${board.boardCount }</td>
								</tr>
							</c:forEach>
									<td colspan="6"><c:if test="${currentPage != 1 }">
										<a
											href="/board/${urlVal }.kh?page=${currentPage - 1 }&searchCondition=${searchCondition}&searchValue=${searchValue}">[이전]</a>
									</c:if> <c:forEach var="p" begin="${startNavi }" end="${endNavi }">
										<c:if test="${currentPage eq p }">
											<b>${p }</b>
										</c:if>
										<c:if test="${currentPage ne p }">
											<a
												href="/board/${urlVal }.kh?page=${p }&searchCondition=${searchCondition}&searchValue=${searchValue}">${p }</a>
										</c:if>
									</c:forEach> <c:if test="${maxPage > currentPage }">
										<a
											href="/board/${urlVal }.kh?page=${currentPage + 1 }&searchCondition=${searchCondition}&searchValue=${searchValue}">[다음]</a>
									</c:if></td>
						</c:if> --%>
						<c:if test="${empty bList }">
							<tr>
								<td colspan="6" align="center"><b>데이터가 존재하지 않습니다.</b></td>
							</tr>
						</c:if>
					</table>
					<nav style="display: flex; justify-content: center;" aria-label="Page navigation example">
						<div style="width: 500px;">
							<ul style="float: right;" class="pagination">
								<li class="page-item">
									<a class="page-link" href="#" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a>
								</li>
								<li class="page-item"><a class="page-link" href="#">1</a></li>
								<li class="page-item"><a class="page-link" href="#">2</a></li>
								<li class="page-item"><a class="page-link" href="#">3</a></li>
								<li class="page-item">
									<a class="page-link" href="#" aria-label="Next"><span aria-hidden="true">&raquo;</span></a>
								</li>
							</ul>
						</div>
						<div style="width: 300px;">
							<button type="button" style="float: right;" class="btn btn-primary" onclick="location.href='/board/writeView.strap';">글쓰기</button>
						</div>
					</nav>
				</div>
			</div>
		</div>
		<!-- 푸터 -->
		<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	</div>
</body>
</html>