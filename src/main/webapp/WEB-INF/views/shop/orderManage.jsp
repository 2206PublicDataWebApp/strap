<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
<meta charset="UTF-8">

<html>
<head>

<title>스트랩(관리자) : 주문관리</title>
<script src="/resources/js/jquery-3.6.1.min.js"></script>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css"> -->
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>
<style>
body {
	background-color: #EAEAEA;
}

#title-img {
	width: 250px;
	height: 100px;
	object-fit: contain;
	cursor: pointer;
	"
}

.navbar {
	background-color: black;
}

.nav-menu {
	font-weight: 1000;
	cursor: pointer;
}

.admin-title {
	text-decoration: none;
	color: black;
}

.admin-menu {
	color: white;
	text-decoration: none;
}

#admin-logout {
	color: black;
	text-decoration: none;
}

.pagination a {
	color: #c0c0c0;
	border-style: none;
}

.product-menu {
	width: 200px;
	background-color: black;
	padding: 6px;
	border-radius: 3px;
}

.p-menu {
	color: white;
	text-decoration: none;
}

.p-menu:hover {
	color: gray
}
</style>
</head>
<body>
<!-- 헤더&메뉴바 -->
<jsp:include page="/WEB-INF/views/common/adminHeader.jsp"></jsp:include>
<div class="wrap container">
	<!-- 컨텐츠 -->
	<div class="row text-center mt-3 mb-3">
		<div class="col">
			<span class="product-menu"><a class="p-menu" href="/admin/productView.strap">상품관리</a></span>
		</div>
		<div class="col">
			<span class="product-menu"><a class="p-menu" href="/admin/orderView.strap">주문관리</a></span>
		</div>
		<div class="col">
			<span class="product-menu"><a class="p-menu" href="/admin/couponView.strap">쿠폰관리</a></span>
		</div>
	</div>
	<div id="contents" class="row">
		<div class="contents-side col">
			<div id="contents-wrap">
				<div id="title">
					<div style="font-size:20px;">주문관리 (${paging.totalCount })</div><hr>
				</div>
				<div id="searchArea" style="text-align:center;">
					<div class="mb-3" id="search_border" style="border:2px solid darkorange;padding:3px; border-radius:4px; display:inline-block;height:40px;">
						<form id="search-form" action="/admin/orderView.strap" method="get">
							<input id="searchVal" 		name="searchVal" 		type="text" value="${search.searchVal }" placeholder=" 주문번호 or 회원아이디 검색." style="border-style:none; padding:4px; width:400px;">
							<input id="searchColumn"  	name="searchColumn" 	type="hidden">
							<input id="orderCondition"  name="orderCondition" 	type="hidden">
							<button style="background-color:white;border-style:none;" ><i class="fa-solid fa-magnifying-glass"></i></button>
						</form>
					</div>
				</div>
				<div id="productList">
					<table style="text-align:center; font-size:14px; width:100%;">
						<tr style="height:30px; border-bottom:1px solid #c0c0c0;">
								<th class="col-1">주문번호</th>
								<th class="col-1" >결제번호</th>
								<th class="col-1">회원아이디</th>
								<c:choose>
									<c:when test="${search.searchColumn eq 'final_cost' and search.orderCondition eq 'desc' }">
										<th class="col-1" onclick="orderSubmit('final_cost','asc');">주문금액<span>▽</span></th>
									</c:when>
									<c:otherwise>
										<th class="col-1" onclick="orderSubmit('final_cost','desc');">주문금액<span>△</span></th>
									</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${search.searchColumn eq 'order_status' and search.orderCondition eq 'desc' }">
										<th class="col-1" onclick="orderSubmit('order_status','asc');">주문상태<span>▽</span></th>
									</c:when>
									<c:otherwise>
										<th class="col-1" onclick="orderSubmit('order_status','desc');">주문상태<span>△</span></th>
									</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${search.searchColumn eq 'payment_method' and search.orderCondition eq 'desc' }">
										<th class="col-1" onclick="orderSubmit('payment_method','asc');">결제수단<span>▽</span></th>
									</c:when>
									<c:otherwise>
										<th class="col-1" onclick="orderSubmit('payment_method','desc');">결제수단<span>△</span></th>
									</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${search.searchColumn eq 'pay_complete' and search.orderCondition eq 'desc' }">
										<th class="col-1" onclick="orderSubmit('pay_complete','asc');">결제여부<span>▽</span></th>
									</c:when>
									<c:otherwise>
										<th class="col-1" onclick="orderSubmit('pay_complete','desc');">결제여부<span>△</span></th>
									</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${search.searchColumn eq 'order_cancel' and search.orderCondition eq 'desc' }">
										<th class="col-1" onclick="orderSubmit('order_cancel','asc');">취소여부<span>▽</span></th>
									</c:when>
									<c:otherwise>
										<th class="col-1" onclick="orderSubmit('order_cancel','desc');">취소여부<span>△</span></th>
									</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${search.searchColumn eq 'delivery_start' and search.orderCondition eq 'desc' }">
										<th class="col-1" onclick="orderSubmit('delivery_start','asc');">배송시작<span>▽</span></th>
									</c:when>
									<c:otherwise>
										<th class="col-1" onclick="orderSubmit('delivery_start','desc');">배송시작<span>△</span></th>
									</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${search.searchColumn eq 'delivery_complete' and search.orderCondition eq 'desc' }">
										<th class="col-1" onclick="orderSubmit('delivery_complete','asc');">배송완료<span>▽</span></th>
									</c:when>
									<c:otherwise>
										<th class="col-1" onclick="orderSubmit('delivery_complete','desc');">배송완료<span>△</span></th>
									</c:otherwise>
								</c:choose>
								<th class="col-1">운송장</th>
								<c:choose>
									<c:when test="${search.searchColumn eq 'order_date' and search.orderCondition eq 'desc' }">
										<th class="col-1" onclick="orderSubmit('order_date','asc');">주문일<span>▽</span></th>
									</c:when>
									<c:otherwise>
										<th class="col-1" onclick="orderSubmit('order_date','desc');">주문일<span>△</span></th>
									</c:otherwise>
								</c:choose>
						</tr>
						<c:forEach items="${oList}" var="order">
							<tr>
								<td>${order.orderNo }</td>
								<td>${order.payNo }</td>
								<td>${order.memberId }</td>
								<td>
									<fmt:formatNumber value="${order.finalCost }" pattern="#,###"/>
									<span>원</span>
								</td>
								<td>${order.orderStatus }</td>
								<td>${order.paymentMethod }</td>
								<td>${order.payComplete }</td>
								<td>${order.orderCancel }</td>
								<td>${order.deliveryStart }</td>
								<td>${order.deliveryComplete }</td>
								<td>${order.deliveryNo }</td>
								<td>${order.orderDate }</td>
							</tr>
						</c:forEach>						
					</table>
				</div>
				<nav aria-label="Page navigation example" style="width:200px;margin:10px auto; border-style:none;color:#c0c0c0;">
				  <ul class="pagination">
				    <li class="page-item">
				    <c:if test="${paging.startNavi > paging.startPage }">
				      <a class="page-link" href="/admin/${url}.strap?page=${paging.startNavi-1 }&searchVal=${search.searchVal}" aria-label="<">
				        <span aria-hidden="true">&laquo;</span>
				      </a>
				     </c:if>
				    </li>
				    <c:forEach begin="${paging.startNavi }" end="${paging.endNavi }" var="n">
				    <li class="page-item"><a class="page-link" <c:if test="${paging.page eq n }">style="font-weight:bold;color:darkorange"</c:if>  href="/admin/${url }.strap?page=${n }&searchVal=${search.searchVal}">${n }</a></li>
				    </c:forEach>
				    <c:if test="${paging.endNavi < paging.endPage }">
				    <li class="page-item">
				      <a class="page-link" href="/admin/${url }.strap?page=${paging.endNavi+1 }&searchVal=${search.searchVal}" aria-label=">">
				        <span aria-hidden="true">&raquo;</span>
				      </a>
				    </li>
				    </c:if>
				  </ul>
				</nav>
			</div>
		</div>
	</div>
</div>
</body>
<script>
//정렬
function orderSubmit(column,order){ 
	var searchForm = document.querySelector("#search-form");
	var columnName = document.querySelector("#searchColumn");
	var orderCon = document.querySelector("#orderCondition");
	columnName.value = column;
	orderCon.value = order;
	searchForm.submit();
}

</script>

</html>
