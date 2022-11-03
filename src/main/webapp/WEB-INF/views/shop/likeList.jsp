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
			<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
		</div>
	</div>
<!-- 컨텐츠 -->
	<div id="contents" class="contents row">
		<div class="sidebar col-3" >
			<jsp:include page="/WEB-INF/views/common/sideBarShop.jsp"></jsp:include>
		</div>
		<div class="contents-side col">
			<div id="contents-wrap">
				<div id="title">
					<h3>찜한 상품 (${paging.totalCount })</h3><hr>
				</div>
			</div>
				<c:forEach items="${pList }" var="product" varStatus="n">
					<div class="product-wrap row" style="text-align: center;align-items: center;padding:9px; border-bottom: 1px solid #c0c0c0;">
						<div class="oneProduct col-1 number" style="font-weight:bold; font-size:20px;">${n.count + paging.offset }</div>
						<div class="oneProduct col-2 thumb" onclick="location.href='/product/detailView.strap?productNo=${product.productNo}';">
							<img class="thumb-img" src="${product.mainImgRoot }" onerror="this.src='';" width="100px" height="92px">
						</div>
						<div class="oneProduct col info" style="width:70%;">
							<div class="product-title" style="font-size:14px; font-weight:bold;" onclick="location.href='/product/detailView.strap?productNo=${product.productNo}';">
								<span class="p-brand">[${product.productBrand }]</span>
								<span class="p-name"> ${product.productName }</span>
							</div>
							<div class="product-grade" style="margin:5px;">
								<span><span style="color:darkorange;">★</span>${product.gradeAver }(${product.reviewCount })</span>
							</div>
						</div>
						<div class="oneProduct col-2 product-price">
								<span class="p-price" style="font-size:20px;font-weight:bold;">
									<fmt:formatNumber value="${product.productPrice }" pattern="#,###"/>
								</span>
								<span id="wonSymbol" style="font-weight:bold;">원</span>
							</div>
						<div class="oneProduct col-2 userMenu">
							<div class="p-menu-wrap" style="color:#c0c0c0;">
								<span id="${product.productNo }" class="likeBtn shopmenu" onclick="loginCheck('${loginUser.memberId}',function(){controlLike('${loginUser.memberId}',${product.productNo });});"><i class="fa-solid fa-heart"></i></span>
								<span class="cartBtn shopmenu" onclick="loginCheck('${loginUser.memberId}',function(){addCart('${loginUser.memberId }',${product.productNo },1);})"><i class="fa-solid fa-cart-shopping"></i></span>
							</div>
						</div>
					</div>
				</c:forEach>
				<nav aria-label="Page navigation example" style="width:200px;margin:10px auto; border-style:none; color:gray;">
				  <ul class="pagination">
				    <li class="page-item">
				    <c:if test="${paging.startNavi > paging.startPage }">
				      <a class="page-link" href="/product/${url}.strap?page=${paging.startNavi-1 }&searchVal=${search.searchVal}&searchColumn=${search.searchColumn}&orderCondition=${search.orderCondition}" aria-label="<">
				        <span aria-hidden="true">&laquo;</span>
				      </a>
				     </c:if>
				    </li>
				    <c:forEach begin="${paging.startNavi }" end="${paging.endNavi }" var="n">
				    <li class="page-item"><a class="page-link" <c:if test="${paging.page eq n }">style="font-weight:bold;color:darkorange;"</c:if>  href="/product/${url }.strap?page=${n }&searchVal=${search.searchVal}&searchColumn=${search.searchColumn}&orderCondition=${search.orderCondition}">${n }</a></li>
				    </c:forEach>
				    <c:if test="${paging.endNavi < paging.endPage }">
				    <li class="page-item">
				      <a class="page-link" href="/product/${url }.strap?page=${paging.endNavi+1 }&searchVal=${search.searchVal}&searchColumn=${search.searchColumn}&orderCondition=${search.orderCondition}" aria-label=">">
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
					likeBtnArr[j].style.color = "#c0c0c0";
					for(i in result){
						if(result[i].productNo ==likeBtnArr[j].id){
							likeBtnArr[j].style.color = "darkorange";
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
				markCart();
			}else{
				
			}
		},
		error:function(){}
	});
	
}

</script>
</body>
</html>
