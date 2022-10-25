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
	<div id="contents" class="row">
		<div class="contents col">
			<div id="inner-header">
				<h1>장바구니(${cList.size() })</h1>
			</div>
			<div id="inner-contents">
				<c:forEach items="${cList }" var="cart" varStatus="n" >
					<div class="oneCart row">
						<div class="pImg col-3">
							<img src="${cart.product.mainImgRoot }" style="width:150px;height:150px;">
						</div>
						<div class="cartInfo col-6">
							<div>
								<div class="pName">
									<span class="brandName">[${cart.product.productBrand }]</span>
									<span class="pName">${cart.product.productName }</span>
								</div>
								<div class="cartCheck">
									<input  class="cartCheck" type="checkbox" name="cartCheck" onchange="cartCheck(this,'${loginUser.memberId }',${cart.productNo });" <c:if test="${cart.cartCheck eq 'Y'}">checked</c:if>>
									<button type="button" onclick="removeCart(${cart.productNo},'${loginUser.memberId }');">X</button>
								</div>
							</div>
							<div>
								<div class="qtyCon">
									<button class="downQty" type="button" onclick="if(document.querySelectorAll('.qty')[${n.count-1}].value > 1)document.querySelectorAll('.qty')[${n.count-1}].value--; calCartPrice(${n.count-1},${cart.product.productPrice });modifyCartQty(${n.count-1 },${cart.productNo });calCartTotalPrice();">-</button>
									<input class="qty" type="text" width="60px" value="${cart.productAmount }" readonly style="width:50px;text-align:center;" onChange="alert('!');">
									<button class="upQty" type="button" onclick="document.querySelectorAll('.qty')[${n.count-1}].value++; calCartPrice(${n.count-1},${cart.product.productPrice });modifyCartQty(${n.count-1 },${cart.productNo });calCartTotalPrice();">+</button>
								</div>
								<div class="cartPrice-wrap">
										<span class='wonSymbol'>\</span>
										<span class="cartPrice">
											<fmt:formatNumber value="${cart.product.productPrice * cart.productAmount }" pattern="#,###"/> 
										</span>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>	
			</div>
			<hr>
			<h3>상품 구매 가격</h3>
			<div id="totalPrice-wrap">
				<h2>
					<span class='wonSymbol'>\</span>
					<span id="totalPrice">
					</span>
				</h2>
			</div>
			<div id="cartBtn">
				<button>쇼핑계속</button>
				<button onclick="if(confirm('선택 상품을 구매하시겠습니까?')) location.href='/orderView.strap';">구매하기</button>
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

// 가격 계산
function calCartPrice(n,price){
	var cartPriceTag = document.querySelectorAll(".cartPrice")[n];
	var totalPrice = document.querySelectorAll('.qty')[n].value * price;
	cartPriceTag.innerText = totalPrice.toLocaleString();
}

// 장바구니 총 가격 계산
calCartTotalPrice();
function calCartTotalPrice(){
	var $totalPrice = document.querySelector("#totalPrice");
	var sumPrice = 0;
	for(var i = 0; i<'${cList.size()}'; i++){
		if(document.querySelectorAll(".cartCheck")[2*i+1].checked){
			var temp = document.querySelectorAll(".cartPrice")[i].innerHTML.replace(/,/g,"");
			sumPrice += Number(temp);
		}
	}
	$totalPrice.innerText = sumPrice.toLocaleString();
}

// 장바구니 수량변경 ajax
function modifyCartQty(n,productNo){
	var productAmount = document.querySelectorAll(".qty")[n].value;
	var memberId = '${loginUser.memberId}';
	$.ajax({
		url:"/cart/modify.strap",
		data:{
			"productAmount":productAmount,
			"memberId":memberId,
			"productNo":productNo
		},
		type:"get",
		success:function(result){
			if(result == "success"){
				calCartTotalPrice();
			}else{
			}
		},
		error:function(){}
	});
}

//장바구니에서 상품 삭제
function removeCart(productNo,memberId){
	$.ajax({
		url:"/cart/remove.strap",
		data:{
			"productNo":productNo,
			"memberId":memberId
		},
		type:"get",
		success:function(result){
			if(result == "success"){
				calCartTotalPrice();
				location.href="/cart/cartView.strap";
			}else{
			}
		},
		error:function(){}
	});
}

//장바구니 상품 체크 여부
function cartCheck(checkBtn,memberId,productNo){
	var cartCheck = "";
	if(checkBtn.checked){
		cartCheck = "Y";
	}else{
		cartCheck = "N";
	}
	$.ajax({
		url:"/cart/modifyCheck.strap",
		data:{
			"cartCheck":cartCheck,
			"memberId":memberId,
			"productNo":productNo
			
		},
		type:"get",
		success:function(result){
			if(result == "success"){
				calCartTotalPrice();
			}else{
				
			}
		},
		error:function(){}
	});
}

</script>
</body>
</html>
