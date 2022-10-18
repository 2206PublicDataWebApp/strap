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
 .oneProduct{
 	display:inline-block;
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
	<div id="contents" class="row">
		<div class="contents col">
			<div id="inner-header">
				<h1>Strap추천 보충제</h1><hr>
				<div id="search-wrap">
					<form id="search-form" action="/admin/productSearchView.strap" method="get">
						<input id="searchVal" name="searchVal" type="text" placeholder="상품검색">
						<button >검색</button>
					</form>
					<div id="order-wrap">
						<span id="order-grade">평점높은순</span>
						<span id="order-review">리뷰많은순</span>
						<span id="order-sales">판매량많은순</span>
						<span id="order-high-price">가격높은순</span>
						<span id="order-low-price">가격낮은순</span>
					</div>
				</div>
			</div>
			<div id="inner-contents">
				<c:forEach items="${pList }" var="product" varStatus="n">
					<div class="number" style="position:relative;top:20px; right:20px;width:50px;background-color:rgba(255,255,255,0.8)">${n.count }</div>
					<div class="product-wrap">
						<div class="oneProduct thumb">
							<img class="thumb-img" src="${product.mainImgRoot }" onerror="this.src='';" width="150px" height="150px">
						</div>
						<div class="oneProduct info">
							<div class="product-title">
								<span class="p-brand">[${product.productBrand }]</span>
								<span class="p-name"> ${product.productName }</span>
							</div>
							<div class="product-proce">
								<span class="p-price">\ ${product.productPrice }</span>
							</div>
							<div class="product-grade">
								<img src="">
								<span>${product.gradeAver }(${product.reviewCount })</span>
							</div>
						</div>
						<div class="oneProduct userMenu">
							<div class="p-menu-wrap">
								<img src="/resources/image/like.png" width="25px" height="25px">
								<img src="/resources/image/like2.png" width="25px" height="25px">
								<img src="/resources/image/cart.png" width="30px" height="30px">
							</div>
						</div>
					</div>
				</c:forEach>	
				<div id="paging-wrap">
					<c:if test="${paging.startNavi > paging.startPage }">
						<a href="/product/${url}.strap?page=${paging.startNavi-1 }&searchVal=${search.searchVal}"><</a>
					</c:if>
					<c:forEach begin="${paging.startNavi }" end="${paging.endNavi }" var="n">
						<a href="/product/${url }.strap?page=${n }&searchVal=${search.searchVal}">${n }</a>
					</c:forEach>
					<c:if test="${paging.endNavi < paging.endPage }">
						<a href="/product/${url }.strap?page=${paging.endNavi+1 }&searchVal=${search.searchVal}">></a>
					</c:if>					
				</div>			
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
//정렬

</script>
</body>
</html>
