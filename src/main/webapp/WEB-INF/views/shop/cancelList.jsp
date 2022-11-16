<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
<title>스트랩 : 취소/환불</title>
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
#order-wrap button{
	width:120px;
	height:auto;
	background-color : white;
	border: 2px solid gray;
	border-radius: 15px;
	margin:5px;
	padding:auto;
	font-size:13px;
	font-weight:bold;
	color:gray;
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
					<h2>취소 내역</h2><hr>
				</div>
				<div id="dateFilter" style="text-align:center;">
					<div id="selectDate">
						<div id="order-wrap">
							<button onclick="dateFilter(0);" 	<c:if test="${search.dayBefore eq 0 and search.startDate eq null}">style="border:2px solid darkorange; color:darkorange"</c:if>	 	id="order-aver">전체</button>
							<button onclick="dateFilter(31);" 	<c:if test="${search.dayBefore eq 31}">style="border:2px solid darkorange; color:darkorange"</c:if>	 	id="order-aver">1개월</button>
							<button onclick="dateFilter(183);" 	<c:if test="${search.dayBefore eq 183}">style="border:2px solid darkorange; color:darkorange"</c:if>	id="order-review">6개월</button>
							<button onclick="dateFilter(365);" 	<c:if test="${search.dayBefore eq 365}">style="border:2px solid darkorange; color:darkorange"</c:if>	id="order-sales">1년</button>
							<button onclick="abled();" 		    <c:if test="${search.startDate ne null}">style="border:2px solid darkorange; color:darkorange"</c:if>	id="order-high-price">기간선택</button>
						</div>
					</div>
					<div id="inputDate" <c:if test="${search.startDate eq null}">style="display:none;"</c:if>>
						<form id="search-form" action="/order/cancel/listView.strap" method="get">
							<input id="dayBefore"  name="dayBefore" type="hidden" value="0">
							<input id="startDate" class="dInput"  name="startDate" type="date"  value="${search.startDate }" disabled required> ~ 
							<input id="endDate"   class="dInput"  name="endDate" 	type="date" value="${search.endDate }" disabled required>
							<button id="dBtn" style="font-weight:bold;color:darkorange;background-color:white;border:1px solid darkorange; border-radius:4px;"  disabled >검색</button>
						</form>
					</div>
				<div id="list">
					<table>
						<tr>
							<th>구매상품</th>
							<th>상태</th>
							<th>상세조회</th>
							<th>날짜</th>
						</tr>
						<tr>
							<c:forEach items="${cancelList}" var="cancelOrder">
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</c:forEach>
						</tr>
					</table>
				</div>
				<nav aria-label="Page navigation example" style="width:200px;margin:10px auto; border-style:none; color:gray;">
				  <ul class="pagination">
				    <li class="page-item">
				    <c:if test="${paging.startNavi > paging.startPage }">
				      <a class="page-link" href="/order/cancel/listView.strap?page=${paging.startNavi-1 }&dayBefore=${search.dayBefore}<c:if test="${search.startDate ne null }">&startDate=${search.startDate}&endDate=${search.endDate}</c:if>"aria-label="<">
				        <span aria-hidden="true">&laquo;</span>
				      </a>
				     </c:if>
				    </li>
				    <c:forEach begin="${paging.startNavi }" end="${paging.endNavi }" var="n">
				    <li class="page-item"><a class="page-link" <c:if test="${paging.page eq n }">style="font-weight:bold;"</c:if>  href="/order/cancel/listView.strap?page=${n }&dayBefore=${search.dayBefore}<c:if test="${search.startDate ne null }">&startDate=${search.startDate}&endDate=${search.endDate}</c:if>">${n }</a></li>
				    </c:forEach>
				    <c:if test="${paging.endNavi < paging.endPage }">
				    <li class="page-item">
				      <a class="page-link" href="/order/cancel/listView.strap?page=${paging.endNavi+1 }&dayBefore=${search.dayBefore}<c:if test="${search.startDate ne null }">&startDate=${search.startDate}&endDate=${search.endDate}</c:if>" aria-label=">">
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
	document.querySelector("#inputDate").style.display="none";
	
	searchForm.submit();
}
function abled(){
	startDate.disabled = false;	
	endDate.disabled = false;	
	dBtn.disabled = false;	
	var dayBefore = document.querySelector("#dayBefore");
	dayBefore.value=0;
	for(var i=0; i<5; i++){
		document.querySelectorAll("#order-wrap button")[i].style.color="gray";
		document.querySelectorAll("#order-wrap button")[i].style.border="2px solid gray";
	}
	document.querySelectorAll("#order-wrap button")[4].style.color="darkorange";
	document.querySelectorAll("#order-wrap button")[4].style.border="2px solid darkorange";
	document.querySelector("#inputDate").style.display="block";
}

</script>
</body>
</html>
