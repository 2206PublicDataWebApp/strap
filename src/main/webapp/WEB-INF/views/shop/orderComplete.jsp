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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"/>
</head>
<style>
	th{
		text-align:right;
	}
</style>
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
			<div id="complete-header">
				<h1><i class="fa-regular fa-calendar-check"></i> 주문이 완료되었습니다.</h1><hr>
			</div>
			<div id="order-products-wrap">
				<div><h3>구매상품 정보</h3></div>
				<c:forEach items="${completeOrder.buyProducts }" var="product" varStatus="n" >
					<div class="oneCart row" style="margin: 10px auto;">
						<div class="pImg col-3" style="text-align:center;">
							<img src="${product.mainImgRoot }" style="width:80px;height:70px;">
						</div>
						<div class="cartInfo col-6">
							<div>
								<div class="pName">
									<span class="brandName">[${product.productBrand }]</span>
									<span class="pName">${product.productName }</span>
								</div>
							</div>
							<div>
								<div class="cartPrice-wrap">
									<span class='wonSymbol'>\</span>
									<span class="cartPrice">
										<fmt:formatNumber value="${product.productPrice}" pattern="#,###"/> 
									</span>
									<span class="pQty">
										${product.orderQty }개
									</span>
								</div>
							</div>
						</div>
						<div class="col-3">
							<span class='wonSymbol'>\</span>
							<span class="cartPrice">
								<fmt:formatNumber value="${product.productPrice * product.orderQty }" pattern="#,###"/> 
							</span>
						</div>
					</div>
					<input type="hidden" class="calPrice" value="${product.productPrice * product.orderQty }">
				</c:forEach>	
			</div>
			<div id="order-info" class="row">
				<div id="order-info" class="col-7" style="height:350px;margin:70px auto; border: 1px solid #c0c0c0;text-align:center;">
					<div id="orderInfo">
						<table>
							<tr>
								<th>주문번호 : </th>
								<td>${completeOrder.orderNo }</td>
							</tr>
							<tr>
								<th>주문자 : </th>
								<td>${loginUser.memberName }</td>
							</tr>
							<tr>
								<th>전화번호 : </th>
								<td>${completeOrder.contactPhone }</td>
							</tr>
							<tr>
								<th>배송지 : </th>
								<td>${completeOrder.address }</td>
							</tr>
							<tr>
								<th>배송방법 : </th>
								<td>일반택배</td>
							</tr>
							<tr>
								<th>배송메모 : </th>
								<td>${completeOrder.deliveryRequest }</td>
							</tr>
							<tr>
								<th>입금계좌 : </th>
								<td>${completeOrder.vBankName } / ${completeOrder.vBankNum } </td>
							</tr>
							<tr>
								<th>입금기한 : </th>
								<td>${completeOrder.vBankDueDate }</td>
							</tr>
						</table>
					</div>
				</div>
				<div id="paid-info" class="col-5"	>
					<div class="order-side" style="height:350px;margin:70px auto; border: 1px solid #c0c0c0;text-align:center;">
						 <h3>결제 금액</h3>
						 <div id="productsPrice-wrap">
						 	<span>상품금액</span>
						 	<div>
						 		<span class='wonSymbol'>\</span>
						 		<span id="productsPrice">
						 			<fmt:formatNumber value="${completeOrder.finalCost + completeOrder.discountAmount - completeOrder.deliveryFee }" pattern="#,###"/>
						 		</span>
						 	</div>
						 </div>
						 <div id="discountAmount-wrap">
						 	<span>할인 금액</span>
						 	<div>
						 		<span class='wonSymbol'>\</span>
						 		<span id="discountAmount">
						 			<fmt:formatNumber value="${completeOrder.discountAmount }" pattern="#,###"/>
						 		</span>
						 	</div>
						 </div>
						 <div id="deleiveryFee-wrap">
						 	<span>배송료</span>
						 	<div>
						 		<span class='wonSymbol'>\</span>
						 		<span id="deleiveryFee">
						 			<fmt:formatNumber value="${completeOrder.deliveryFee }" pattern="#,###"/>
						 		</span>
						 	</div>
						 </div>
						 <div id="finalCost-wrap">
						 	<span>최종 결제금액</span>
						 	<div>
						 		<span class='wonSymbol'>\</span>
						 		<span id=finalCost style="color:darkorange;font-weight:bold;font-size:30px;">
						 			<fmt:formatNumber value="${completeOrder.finalCost }" pattern="#,###"/> 
						 		</span>
						 	</div>
						 </div>
						 <div id="agreement" >
						 	<div  style="font-size:12px;">처리위탁 및 3자 제공 동의>></div>
						 	<div  style="font-size:12px;">결제대행서비스 이용 동의>></div>
						 </div>
					</div>
				</div>
				<div id="orderComBtn">
					<button onclick="location.href='/product/listView.strap';">쇼핑계속</button>
					<button onclick="location.href='/order/listView.strap';">주문내역</button>
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
</body>
</html>
