<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>

<html>
<head>
<title>스트랩 : 주문관리</title>
<!-- CDN -->
<!-- 부트스트랩 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" />
<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- css -->
<link rel="stylesheet" type="text/css" href="/resources/css/common.css">
<style>
 .pagination a{
	 	color:#c0c0c0;
	 	border-style:none;
 }
</style>
</head>
<body>
<div class="wrap container">
	<!-- 헤더&메뉴바 -->
	<div id="header" class="row">
		<div class="col">
<%-- 			<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include> --%>
		</div>
	</div>
	<!-- 컨텐츠 -->
	<div id="contents" class="row">
		<div class="sidebar col-3" >
				<jsp:include page="/WEB-INF/views/common/sideBarAdmin.jsp"></jsp:include>
		</div>
		<div class="contents-side col">
			<div id="contents-wrap">
				<div id="title">
					<h3>주문관리 (${paging.totalCount })</h3><hr>
				</div>
				<div id="searchArea" style="text-align:center;">
					<div id="search_border" style="border:2px solid darkorange;padding:3px; border-radius:4px; display:inline-block;height:40px;">
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
	<!-- 푸터 -->
	<div id="footer" class="row">
		<div class="col">
			<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
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
