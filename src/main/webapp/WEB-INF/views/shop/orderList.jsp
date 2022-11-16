<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>

<html>
<head>
<link rel="icon" href="/resources/image/s.png">
<title>스트랩 : 주문내역</title>
<!-- CDN -->
<!-- 부트스트랩 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" />
<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- css -->
<link rel="stylesheet" type="text/css" href="/resources/css/common.css">
<style>
body{
	font-size:16px;
}

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

 .pagination a{
 	color:#c0c0c0;
 	border-style:none;
 	
 
 }
 .pImg:hover{
 	cursor:pointer;
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
			<jsp:include page="/WEB-INF/views/common/sideBarMyPage.jsp"></jsp:include>
		</div>
		<div class="contents-side col-7">
			<div id="contents-wrap">
				<div id="title">
					<span>주문내역 (${paging.totalCount })</span><hr>
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
						<form id="search-form" action="/order/listView.strap" method="get">
							<input id="dayBefore"  name="dayBefore" type="hidden" value="0">
							<input id="startDate" class="dInput"  name="startDate" type="date"  value="${search.startDate }" disabled required> ~ 
							<input id="endDate"   class="dInput"  name="endDate" 	type="date" value="${search.endDate }" disabled required>
							<button id="dBtn" style="font-weight:bold;color:darkorange;background-color:white;border:1px solid darkorange; border-radius:4px;"  disabled >검색</button>
						</form>
					</div>
				</div>
				<div id="list">
					<c:forEach items="${oList }" var="order" varStatus="n" >
						<div style="margin: 0px auto;padding-bottom:5px;">
							<span class="orderDate" style="font-size:20px;font-weight:bold;">${order.orderDate }</span>
							<span class="orderNo" >주문번호: <a href="/order/completeView.strap?merchant_uid=${order.orderNo }" style="text-decoration:none;" >${order.orderNo } ></a></span>
						</div>
						<div class="orderBorder" style="border:1px solid gray;padding:12px;margin:5px 0px 30px;">
							<div style="margin: 0px auto;border-bottom:1px solid #c0c0c0; padding:4px;background-color:rgb(250,250,250);font-size:14px;font-weight:bold;">
								<span class="orderStatus"></span>
								<c:if test="${order.orderStatus eq 'paid'}">
<!-- 									<button style="font-weight:bold;color:gray;background-color:white;border:1px solid gray; border-radius:4px;float:right;" onclick="openCancelWindow();">결제취소</button> -->
								</c:if>
							</div>
							<div class="oneOrderWrap" style="border:1px solid solid #c0c0c0;">
								<c:forEach items="${order.buyProducts }" var="product" varStatus="n" >
									<div class="oneCart row" style="margin: 0px auto; border-bottom:1px solid #c0c0c0; padding:9px;">
										<div class="pImg col-3" style="text-align:center;margin:auto;">
											<img src="${product.mainImgRoot }" onclick="location.href='/product/detailView.strap?productNo=${product.productNo}';" style="width:80px;height:70px;">
										</div>
										<div class="cartInfo col-6" style="text-align:left;">
											<div class="pName" style="margin:auto;padding:5px 0px;font-size:14px;font-weight:bold;">
												<span class="brandName">[${product.productBrand }]</span>
												<span class="pName">${product.productName }</span>
											</div>
											<div class="cartPrice-wrap" style="margin:auto;">
													<span class="cartPrice">
														<fmt:formatNumber value="${product.productPrice }" pattern="#,###"/> 
													</span>
													<span class='wonSymbol'>원</span>
													<span> * </span>
													<span class="pQty">
														${product.orderQty }개
													</span>
											</div>
										</div>
										<div class="col-3" style="margin:auto;font-size:20px;font-weight:bold;"">
											<span class="cartPrice">
												<fmt:formatNumber value="${product.productPrice  * product.orderQty }" pattern="#,###"/> 
											</span>
											<span class='wonSymbol'>원</span>
										</div>
									</div>
									<input type="hidden" class="calPrice" value="${product.productPrice  * product.orderQty }">
								</c:forEach>
								<div class="">
									<span style="color:gray;">
										<i class="fa-solid fa-house"></i> 
									</span>
									<span>
										${order.address }
									</span>
									<button style="float:right;margin-top:5px; font-weight:bold;color:darkorange;background-color:white;border:1px solid darkorange; border-radius:4px;">배송조회</button>
								</div>
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
				    <li class="page-item"><a class="page-link" <c:if test="${paging.page eq n }">style="font-weight:bold;color:darkorange"</c:if>  href="/order/listView.strap?page=${n }&dayBefore=${search.dayBefore}<c:if test="${search.startDate ne null }">&startDate=${search.startDate}&endDate=${search.endDate}</c:if>">${n }</a></li>
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
	document.querySelector("#inputDate").style.display="none";
	
	searchForm.submit();
}
//날짜 직접입력
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

//주문상태 txt
orderStatusTxt();
function orderStatusTxt(){
	var statusTxt = "";
	<c:forEach items="${oList }" var="order" varStatus="n" >
		switch('${order.orderStatus}'){
		case "paid":
			statusTxt = "<span style='color:green;'>결제완료</span>";
			break;
		case "ready":
			statusTxt = "<span style='color:darkorange;'>입금대기</span>";
			break;
		case "cancelled":
			statusTxt = "<span style='color:red;'>결제취소</span>";
			break;
		}
		document.querySelectorAll(".orderStatus")['${n.count-1}'].innerHTML = statusTxt;
	</c:forEach>
}

//새끼창 띄우기
var new_window_width = 420;
var new_window_height = 560;
var positionX = ( window.screen.width / 2 ) - ( new_window_width / 2 );
var positionY = ( window.screen.height / 2 ) - ( new_window_height / 2 );
console.log(new_window_width);
console.log(new_window_height);
console.log(positionX);
console.log(positionY);
function openCancelWindow(){
	 window.open(
	          "/order/cancel/window.strap",
	          "Child",
	          "width=" + new_window_width + ", height=" + new_window_height + ", top=" + positionY + ", left=" + positionX
	        );
}

</script>
</body>
</html>
