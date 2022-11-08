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

</head>
<body>
<div class="wrap container">
<!-- 헤더&메뉴바 -->
	<div id="header" class="row">
		<div class="col">
		</div>
	</div>
<!-- 컨텐츠 -->
	<div id="contents" class="row">
		<div class="sidebar col-3" >
				<jsp:include page="/WEB-INF/views/common/sideBarAdmin.jsp"></jsp:include>
		</div>
		<div class="contents-side col">
			<div id="title">
					<h3>쿠폰관리</h3><hr>
			</div>
			<div id="searchArea" style="text-align:center;">
					<div id="search_border" style="border:2px solid darkorange;padding:3px; border-radius:4px; display:inline-block;height:40px;">
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
<!-- 푸터 -->
	<div id="footer" class="row">
		<div class="col">
			<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
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
