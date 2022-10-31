<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
<title>STRAP MAIN</title>
<!-- CDN -->
<!-- 부트스트랩 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" />
<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- css -->
<link rel="stylesheet" type="text/css" href="/resources/css/common.css">
<style>

input:disabled {
  background: #ccc;
}

</style>

</head>
<body>
<div class="wrap container">
<!-- 헤더&메뉴바 -->
	<div id="header" class="row">
		<div class="col">
			<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
		</div>
	</div>
<!-- 컨텐츠 -->
	<div id="contents" class="contents row">
		<div class="sidebar col-3" >
			<jsp:include page="/WEB-INF/views/common/sideBarShop.jsp"></jsp:include>
		</div>
		<div class="contents-side col">
			<div id="contents-wrap">
				<div id="title">
					<h2>나의 리뷰</h2><hr>
				</div>
				<div id="dateFilter">
				
					<div id="selectDate">
					필터링(${search.dayBefore })
						<div id="order-wrap">
							<span onclick="dateFilter(31);" 	id="order-aver">1개월</span>
							<span onclick="dateFilter(183);"	id="order-review">6개월</span>
							<span onclick="dateFilter(365);"	id="order-sales">1년</span>
							<span onclick="abled();" 			id="order-high-price">기간선택</span>
						</div>
					</div>
					<div id="inputDate">
						<form id="search-form" action="/review/list.strap" method="get">
							<input id="dayBefore"  name="dayBefore" type="hidden" value="0">
							<input id="startDate" class="dInput"  name="startDate" type="date"  value="${search.startDate }" disabled required> ~ 
							<input id="endDate"   class="dInput"  name="endDate" 	type="date" value="${search.endDate }" disabled required>
							<button id="dBtn"  disabled >검색</button>
						</form>
					</div>
				</div>
				<div id="list">
					<table>
						<tr>
							<th>상품평</th>
							<th>평점</th>
							<th>삭제</th>
							<th>날짜</th>
						</tr>
						<c:forEach items="${rList}" var="review">
							<tr>
								<td onclick="location.href='/product/detailView.strap?productNo=${review.productNo}';">${review.reviewContents }</td>
								<td>${review.reviewGrade }</td>
								<td><button type="button">삭제하기</button></td>
								<td>${review.reviewTime }</td>
							</tr>
						</c:forEach>
					</table>
				</div>
				<nav aria-label="Page navigation example" style="width:200px;margin:10px auto; border-style:none; color:gray;">
				  <ul class="pagination">
				    <li class="page-item">
				    <c:if test="${paging.startNavi > paging.startPage }">
				      <a class="page-link" href="/review/list.strap?page=${paging.startNavi-1 }&dayBefore=${search.dayBefore}<c:if test="${search.startDate ne null }">&startDate=${search.startDate}&endDate=${search.endDate}</c:if>"aria-label="<">
				        <span aria-hidden="true">&laquo;</span>
				      </a>
				     </c:if>
				    </li>
				    <c:forEach begin="${paging.startNavi }" end="${paging.endNavi }" var="n">
				    <li class="page-item"><a class="page-link" <c:if test="${paging.page eq n }">style="font-weight:bold;"</c:if>  href="/review/list.strap?page=${n }&dayBefore=${search.dayBefore}<c:if test="${search.startDate ne null }">&startDate=${search.startDate}&endDate=${search.endDate}</c:if>">${n }</a></li>
				    </c:forEach>
				    <c:if test="${paging.endNavi < paging.endPage }">
				    <li class="page-item">
				      <a class="page-link" href="/review/list.strap?page=${paging.endNavi+1 }&dayBefore=${search.dayBefore}<c:if test="${search.startDate ne null }">&startDate=${search.startDate}&endDate=${search.endDate}</c:if>" aria-label=">">
				        <span aria-hidden="true">&raquo;</span>
				      </a>
				    </li>
				    </c:if>
				  </ul>
				</nav>
			</div>
		</div>
	</div>
<!-- 푸터 -->
	<div id="footer" class="row">
		<div class="col">
			<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
		</div>
	</div>
</div>
<script>
//날짜필터링
var startDate = document.querySelector("#startDate");
var endDate = document.querySelector("#endDate");
var dBtn = document.querySelector("#dBtn");

function dateFilter(day){
	var searchForm = document.querySelector("#search-form");
	var dayBefore = document.querySelector("#dayBefore");
	dayBefore.value = day;
	
	startDate.disabled = true;	
	endDate.disabled = true;	
	dBtn.disabled = true;
	
	searchForm.submit();
}
function abled(){
	startDate.disabled = false;	
	endDate.disabled = false;	
	dBtn.disabled = false;	
	var dayBefore = document.querySelector("#dayBefore");
	dayBefore.value=0;
}

</script>
</body>
</html>
