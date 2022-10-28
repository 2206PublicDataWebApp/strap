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
			<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
		</div>
	</div>
<!-- 컨텐츠 -->
	<div id="contents" class="row" style="width:60%; margin:50px auto;">
		<div class="contents col">
		<h1>주문이 완료되었습니다.</h1><hr>
		
<!-- 		임시복붙 -->
		<div><h3>구매상품 정보</h3></div>
		${completeOrder }
<%-- 						<c:forEach items="${completeOrder. }" var="cart" varStatus="n" > --%>
<!-- 							<div class="oneCart row" style="margin: 10px auto;"> -->
<!-- 								<div class="pImg col-3" style="text-align:center;"> -->
<%-- 									<img src="${cart.product.mainImgRoot }" style="width:80px;height:70px;"> --%>
<!-- 								</div> -->
<!-- 								<div class="cartInfo col-6"> -->
<!-- 									<div> -->
<!-- 										<div class="pName"> -->
<%-- 											<span class="brandName">[${cart.product.productBrand }]</span> --%>
<%-- 											<span class="pName">${cart.product.productName }</span> --%>
<!-- 										</div> -->
<!-- 									</div> -->
<!-- 									<div> -->
<!-- 										<div class="cartPrice-wrap"> -->
<!-- 												<span class='wonSymbol'>\</span> -->
<!-- 												<span class="cartPrice"> -->
<%-- 													<fmt:formatNumber value="${cart.product.productPrice}" pattern="#,###"/>  --%>
<!-- 												</span> -->
<!-- 												<span class="pQty"> -->
<%-- 													${cart.productAmount }개 --%>
<!-- 												</span> -->
<!-- 										</div> -->
<!-- 									</div> -->
<!-- 								</div> -->
<!-- 								<div class="col-3"> -->
<!-- 									<span class='wonSymbol'>\</span> -->
<!-- 									<span class="cartPrice"> -->
<%-- 										<fmt:formatNumber value="${cart.product.productPrice * cart.productAmount }" pattern="#,###"/>  --%>
<!-- 									</span> -->
<!-- 								</div> -->
<!-- 							</div> -->
<%-- 							<input type="hidden" class="calPrice" value="${cart.product.productPrice * cart.productAmount }"> --%>
<%-- 						</c:forEach>	 --%>
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
</html>
