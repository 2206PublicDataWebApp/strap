<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>

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
					<h3>주문내역</h3><hr>
				</div>
				<div id="dateFilter">
					<div id="selectDate">
						<div id="order-wrap">
							<button onclick="dateFilter(31);" 	id="order-aver">1개월</button>
							<button onclick="dateFilter(183);"	id="order-review">6개월</button>
							<button onclick="dateFilter(365);"	id="order-sales">1년</button>
							<button onclick="abled();" 			id="order-high-price">기간선택</button>
						</div>
					</div>
					<div id="inputDate">
						<form id="search-form" action="/order/listView.strap" method="get">
							<input id="dayBefore"  name="dayBefore" type="hidden" value="0">
							<input id="startDate" class="dInput"  name="startDate" type="date"  value="${search.startDate }" disabled required> ~ 
							<input id="endDate"   class="dInput"  name="endDate" 	type="date" value="${search.endDate }" disabled required>
							<button id="dBtn"  disabled >검색</button>
						</form>
					</div>
				</div>
				<div id="list">
					<c:forEach items="${oList }" var="order" varStatus="n" >
						<div style="margin: 0px auto;border-bottom:1px solid #c0c0c0;padding-bottom:5px;">
							<span class="orderDate" style="font-size:20px;font-weight:bold;">${order.orderDate }</span>
							<span class="orderNo">주문번호:  ${order.orderNo }</span>
						</div>
						<div style="margin: 0px auto;border-bottom:1px solid #c0c0c0;padding-bottom:5px;">
							<span class="orderStatus">주문상태: ${order.orderStatus }</span>
						</div>
						<div class="oneOrderWrap" style="border:1px solid solid #c0c0c0; border-radius:7px;margin-bottom:40px;">
							<c:forEach items="${order.buyProducts }" var="product" varStatus="n" >
								<div class="oneCart row" style="margin: 0px auto; border-bottom:1px solid #c0c0c0; padding:9px; background-color:rgb(255,253,244);">
									<div class="pImg col-3" style="text-align:center;margin:auto;">
										<img src="${product.mainImgRoot }" style="width:80px;height:70px;">
									</div>
									<div class="cartInfo col-6" style="text-align:center;">
										<div class="pName" style="margin:auto;padding:5px;font-size:14px;font-weight:bold;">
											<span class="brandName">[${product.productBrand }]</span>
											<span class="pName">${product.productName }</span>
										</div>
										<div class="cartPrice-wrap" style="margin:auto;">
												<span class='wonSymbol'>\</span>
												<span class="cartPrice">
													<fmt:formatNumber value="${product.productPrice }" pattern="#,###"/> 
												</span>
												<span> * </span>
												<span class="pQty">
													${product.orderQty }개
												</span>
										</div>
									</div>
									<div class="col-3" style="margin:auto;font-size:20px;font-weight:bold;"">
										<span class='wonSymbol'>\</span>
										<span class="cartPrice">
											<fmt:formatNumber value="${product.productPrice  * product.orderQty }" pattern="#,###"/> 
										</span>
									</div>
								</div>
								<input type="hidden" class="calPrice" value="${product.productPrice  * product.orderQty }">
							</c:forEach>
							<div class="">
								<span style="color:gray;">
									<i class="fa-solid fa-house"></i> 
								</span>
								${order.address }
							</div>
						</div>
					</c:forEach>
				</div>
				<nav aria-label="Page navigation example" style="width:200px;margin:10px auto; border-style:none; color:gray;">
				  <ul class="pagination">
				    <li class="page-item">
				    <c:if test="${paging.startNavi > paging.startPage }">
				      <a class="page-link" href="/order/listView.strap?page=${paging.startNavi-1 }&dayBefore=${search.dayBefore}<c:if test="${search.startDate ne null }">&startDate=${search.startDate}&endDate=${search.endDate}</c:if>"aria-label="<">
				        <span aria-hidden="true">&laquo;</span>
				      </a>
				     </c:if>
				    </li>
				    <c:forEach begin="${paging.startNavi }" end="${paging.endNavi }" var="n">
				    <li class="page-item"><a class="page-link" <c:if test="${paging.page eq n }">style="font-weight:bold;"</c:if>  href="/order/listView.strap?page=${n }&dayBefore=${search.dayBefore}<c:if test="${search.startDate ne null }">&startDate=${search.startDate}&endDate=${search.endDate}</c:if>">${n }</a></li>
				    </c:forEach>
				    <c:if test="${paging.endNavi < paging.endPage }">
				    <li class="page-item">
				      <a class="page-link" href="/order/listView.strap?page=${paging.endNavi+1 }&dayBefore=${search.dayBefore}<c:if test="${search.startDate ne null }">&startDate=${search.startDate}&endDate=${search.endDate}</c:if>" aria-label=">">
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
