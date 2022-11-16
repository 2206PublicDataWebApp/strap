<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
<meta charset="UTF-8">

<html>
<head>
<title>스트랩(관리자) : 쿠폰관리</title>
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
#title-img{
 	width:250px;
 	height: 100px;
 	object-fit: contain;
	cursor: pointer;"
}

.navbar{
	background-color:black;
}
.nav-menu{
	font-weight: 1000;
	cursor:pointer;
}
.admin-title{
	text-decoration:none;
	color:black;
}
.admin-menu{
	color: white;
	text-decoration:none;
}
#admin-logout{
	color: black;
	text-decoration:none;
}
 .pagination a{
	 	color:#c0c0c0;
	 	border-style:none;
 }
.product-menu{
	width:200px;
	background-color:black;
	padding:6px;
	border-radius:3px;
}
.p-menu{
	color:white;
	text-decoration:none;
}
.p-menu:hover{
	color:gray
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
			<div id="title">
				<div style="font-size:20px;">쿠폰관리(${paging.totalCount })</div><hr>
			</div>
			<div id="searchArea" style="text-align:center;">
					<div class="mb-3" id="search_border" style="border:2px solid darkorange;padding:3px; border-radius:4px; display:inline-block;height:40px;">
						<form id="search-form" action="/admin/couponView.strap" method="get">
							<input id="searchVal" name="searchVal" type="text" value="${search.searchVal }" placeholder=" 쿠폰명 or 쿠폰설명 검색." style="border-style:none; padding:4px; width:400px;">
							<input id="searchColumn"  	name="searchColumn" 	type="hidden">
							<input id="orderCondition"  name="orderCondition" 	type="hidden">
							<button style="background-color:white;border-style:none;" ><i class="fa-solid fa-magnifying-glass"></i></button>
						</form>
					</div>
				</div>
			<div id="adminCouponBtnWrap" style="background-color:rgb(250,250,250);padding:12px;text-align:center;">
					<button style="width:150px;font-weight:bold;color:white;background-color:darkorange;border-style:none;border-radius:4px;" onclick="location.href='/admin/coupon/registerView.strap';">쿠폰등록</button>
			</div>
			<div id="couponList">
				<table style="text-align:center; font-size:14px; width:100%;">
					<tr style="height:30px; border-bottom:1px solid #c0c0c0;">
					<c:choose>
						<c:when test="${search.searchColumn eq 'coupon_no' and search.orderCondition eq 'desc' }">
							<th class="col-1" onclick="orderSubmit('coupon_no','asc');">쿠폰번호<span>▽</span></th>
						</c:when>
						<c:otherwise>
							<th class="col-1" onclick="orderSubmit('coupon_no','desc');">쿠폰번호<span>△</span></th>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${search.searchColumn eq 'coupon_name' and search.orderCondition eq 'desc' }">
							<th class="col-1" onclick="orderSubmit('coupon_name','asc');">쿠폰이름<span>▽</span></th>
						</c:when>
						<c:otherwise>
							<th class="col-1" onclick="orderSubmit('coupon_name','desc');">쿠폰이름<span>△</span></th>
						</c:otherwise>
					</c:choose>
					
					
					<c:choose>
						<c:when test="${search.searchColumn eq 'price_condition' and search.orderCondition eq 'desc' }">
							<th class="col-1" onclick="orderSubmit('price_condition','asc');">할인방법<span>▽</span></th>
						</c:when>
						<c:otherwise>
							<th class="col-1" onclick="orderSubmit('price_condition','desc');">할인방법<span>△</span></th>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${search.searchColumn eq 'discount_amount' and search.orderCondition eq 'desc' }">
							<th class="col-1" onclick="orderSubmit('discount_amount','asc');">할인액<span>▽</span></th>
						</c:when>
						<c:otherwise>
							<th class="col-1" onclick="orderSubmit('discount_amount','desc');">할인액<span>△</span></th>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${search.searchColumn eq 'discount_ratio' and search.orderCondition eq 'desc' }">
							<th class="col-1" onclick="orderSubmit('discount_ratio','asc');">할인율<span>▽</span></th>
						</c:when>
						<c:otherwise>
							<th class="col-1" onclick="orderSubmit('discount_ratio','desc');">할인율<span>△</span></th>
						</c:otherwise>
					</c:choose>
					
					
					
					
					<c:choose>
						<c:when test="${search.searchColumn eq 'price_condition' and search.orderCondition eq 'desc' }">
							<th class="col-1" onclick="orderSubmit('price_condition','asc');">최저주문액<span>▽</span></th>
						</c:when>
						<c:otherwise>
							<th class="col-1" onclick="orderSubmit('price_condition','desc');">최저주문액<span>△</span></th>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${search.searchColumn eq 'brand_condition' and search.orderCondition eq 'desc' }">
							<th class="col-1" onclick="orderSubmit('brand_condition','asc');">대상 브랜드<span>▽</span></th>
						</c:when>
						<c:otherwise>
							<th class="col-1" onclick="orderSubmit('brand_condition','desc');">대상 브랜드<span>△</span></th>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${search.searchColumn eq 'product_condition' and search.orderCondition eq 'desc' }">
							<th class="col-1" onclick="orderSubmit('product_condition','asc');">대상 상품<span>▽</span></th>
						</c:when>
						<c:otherwise>
							<th class="col-1" onclick="orderSubmit('product_condition','desc');">대상 상품<span>△</span></th>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${search.searchColumn eq 'coupon_period' and search.orderCondition eq 'desc' }">
							<th class="col-1" onclick="orderSubmit('coupon_period','asc');">유효기간(일)<span>▽</span></th>
						</c:when>
						<c:otherwise>
							<th class="col-1" onclick="orderSubmit('coupon_period','desc');">유효기간(일)<span>△</span></th>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${search.searchColumn eq 'coupon_regi_date' and search.orderCondition eq 'desc' }">
							<th class="col-1" onclick="orderSubmit('coupon_regi_date','asc');">쿠폰 등록일<span>▽</span></th>
						</c:when>
						<c:otherwise>
							<th class="col-1" onclick="orderSubmit('coupon_regi_date','desc');">쿠폰 등록일<span>△</span></th>
						</c:otherwise>
					</c:choose>
					<th class="col-1" >쿠폰 이미지</th>
					<th class="col-1" >쿠폰 수정</th>
					
					</tr>
					
					<c:forEach items="${couponList}" var="coupon">
						<tr>
							<th>${coupon.couponNo }</th>
							<th>${coupon.couponName }</th>
							<th>${coupon.discountMethod }</th>
							<th>${coupon.discountAmount }</th>
							<th>${coupon.discountRatio }</th>
							<th>${coupon.priceCondition }</th>
							<th>${coupon.brandCondition }</th>
							<th>${coupon.productCondition }</th>
							<th>${coupon.couponPeriod }</th>
							<th>${coupon.couponRegiDate }</th>
							<th><img src="${coupon.couponImgRoot }" width="120px" height="70px"></th>
							<th>수정▷</th>
						</tr>
					</c:forEach>
				</table>
			</div>
			<nav aria-label="Page navigation example" style="width:200px;margin:10px auto; border-style:none; color:#c0c0c0;">
				  <ul class="pagination">
				    <li class="page-item">
				    <c:if test="${paging.startNavi > paging.startPage }">
				      <a class="page-link" href="/admin/productView.strap?page=${paging.startNavi-1 }&searchVal=${search.searchVal}" aria-label="<">
				        <span aria-hidden="true">&laquo;</span>
				      </a>
				     </c:if>
				    </li>
				    <c:forEach begin="${paging.startNavi }" end="${paging.endNavi }" var="n">
				    <li class="page-item"><a class="page-link" <c:if test="${paging.page eq n }">style="font-weight:bold;color:darkorange"</c:if>  href="/admin/productView.strap?page=${n }&searchVal=${search.searchVal}">${n }</a></li>
				    </c:forEach>
				    <c:if test="${paging.endNavi < paging.endPage }">
				    <li class="page-item">
				      <a class="page-link" href="/admin/productView.strap?page=${paging.endNavi+1 }&searchVal=${search.searchVal}" aria-label=">">
				        <span aria-hidden="true">&raquo;</span>
				      </a>
				    </li>
				    </c:if>
				  </ul>
			</nav>
		</div>
	</div>
</div>
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
</body>
</html>
