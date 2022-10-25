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
	<div id="contents" class="row" style="width:60%; margin:50px auto;">
		<div class="contents col">
			<div id="inner-header">
				<h1>Strap추천 보충제</h1>
				<h2>${paging.totalCount }개의 보충제가 기다리고 있습니다.</h2><hr>
				<div id="search-wrap">
					<form id="search-form" action="/product/search.strap" method="get">
						<input id="searchVal" name="searchVal" type="text" value="${search.searchVal }" placeholder="상품검색">
						<input id="searchColumn"  name="searchColumn" type="hidden">
						<input id="orderCondition"  name="orderCondition" type="hidden">
						<button >검색</button>
					</form>
					<div id="order-wrap">
						<span onclick="orderSubmit('grade_aver','desc');" 		id="order-aver">평점높은순</span>
						<span onclick="orderSubmit('review_count','desc');" 	id="order-review">리뷰많은순</span>
						<span onclick="orderSubmit('product_sales','desc');" 	id="order-sales">판매량많은순</span>
						<span onclick="orderSubmit('product_price','desc');" 	id="order-high-price">가격높은순</span>
						<span onclick="orderSubmit('product_price','asc');" 	id="order-low-price">가격낮은순</span>
					</div>
				</div>
			</div>
			<div id="inner-contents">
				<c:forEach items="${pList }" var="product" varStatus="n">
					<div class="number" style="position:relative;top:20px; right:20px;width:50px;background-color:rgba(255,255,255,0.8)">${n.count }</div>
					<div class="product-wrap">
						<div class="oneProduct thumb" onclick="location.href='/product/detailView.strap?productNo=${product.productNo}';">
							<img class="thumb-img" src="${product.mainImgRoot }" onerror="this.src='';" width="110px" height="100px">
						</div>
						<div class="oneProduct info" style="width:70%;">
							<div class="product-title" onclick="location.href='/product/detailView.strap?productNo=${product.productNo}';">
								<span class="p-brand">[${product.productBrand }]</span>
								<span class="p-name"> ${product.productName }</span>
							</div>
							<div class="product-proce">
								<span id="wonSymbol">\</span>
								<span class="p-price">${product.productPrice }</span>
							</div>
							<div class="product-grade">
								<span>★${product.gradeAver }(${product.reviewCount })</span>
							</div>
						</div>
						<div class="oneProduct userMenu">
							<div class="p-menu-wrap">
								<span id="${product.productNo }" class="likeBtn" onclick="loginCheck('${loginUser.memberId}',function(){controlLike('${loginUser.memberId}',${product.productNo });});"><i class="fa-regular fa-heart"></i></span>
								<span class="cartBtn" onclick="loginCheck('${loginUser.memberId}',function(){addCart('${loginUser.memberId }',${product.productNo },1);})"><i class="fa-solid fa-cart-shopping"></i></span>
							</div>
						</div>
					</div>
				</c:forEach>	
				<div id="paging-wrap">
					<c:if test="${paging.startNavi > paging.startPage }">
						<a href="/product/${url}.strap?page=${paging.startNavi-1 }&searchVal=${search.searchVal}&searchColumn=${search.searchColumn}&orderCondition=${search.orderCondition}"><</a>
					</c:if>
					<c:forEach begin="${paging.startNavi }" end="${paging.endNavi }" var="n">
						<a href="/product/${url }.strap?page=${n }&searchVal=${search.searchVal}&searchColumn=${search.searchColumn}&orderCondition=${search.orderCondition}">${n }</a>
					</c:forEach>
					<c:if test="${paging.endNavi < paging.endPage }">
						<a href="/product/${url }.strap?page=${paging.endNavi+1 }&searchVal=${search.searchVal}&searchColumn=${search.searchColumn}&orderCondition=${search.orderCondition}">></a>
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
function orderSubmit(column,order){
	var searchForm = document.querySelector("#search-form");
	var columnName = document.querySelector("#searchColumn");
	var orderCon = document.querySelector("#orderCondition");
	columnName.value = column;
	orderCon.value = order;
	searchForm.submit();
}

//로그인 체크
function loginCheck(loginId,action){
	event.preventDefault();
	if(loginId==""){
		alert("로그인을 해주세요.");
// 		location.href="/member/loginView.strap";		
	}else{
		action();
	}
}


///////찜 추가 및 삭제 함수
function controlLike(memberId,productNo){
	$.ajax({
		url:"/product/like.strap",
		data:{
			"memberId":memberId,
			"productNo":productNo
		},
		type:"get",
		success:function(result){
			if(result =="register"){
// 				alert("찜 완료되었습니다.");	
			}else{
// 				alert("찜 취소되었습니다.")
			}
			memberLikeView();
		},
		error:function(){}
	});
}

memberLikeView();
//찜아이콘을 동적으로 변화시켜줄 함수
function memberLikeView(){
	//1.로그인 유저의 찜목록을 가져온다!
	//2.상품번호를 id에 저장하고, 일치한다면 css를 붉게 물들인다.
	if('${loginUser.memberId}' != ""){
		$.ajax({
			url:"/product/member/likeList.strap",
			data:{
				"memberId":'${loginUser.memberId}'
			},
			type:"post",
			success: function(result){
				console.log(result);
				var likeBtnArr = document.querySelectorAll(".likeBtn");
				for(var j = 0; j<likeBtnArr.length; j++){
					likeBtnArr[j].style.color = "black";
					for(i in result){
						if(result[i].productNo ==likeBtnArr[j].id){
							likeBtnArr[j].style.color = "red";
						}
					}
				}
			},
			error: function(){}
		});
	}
}

//장바구니
function addCart(memberId,productNo,productAmount){
	$.ajax({
		url:"/cart/register.strap",
		data:{
			"memberId":memberId,
			"productNo":productNo,
			"productAmount":productAmount
		},
		type:"post",
		success:function(result){
			if(result == "success"){
				alert("상품이 장바구니에 추가되었습니다.");
			}else{
				
			}
		},
		error:function(){}
	});
	
}

</script>
</body>
</html>
