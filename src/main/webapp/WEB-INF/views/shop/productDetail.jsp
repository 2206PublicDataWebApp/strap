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
<style>

.inputStars{

}
	.starColor{
		display:none;
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
	<div id="contents" class="row" style="width:80%;margin:0 auto;">
		<div class="contents-side col">
			<div id="detail-wrap" style="font-size:20px;">
				<div id="pInfo-wrap" class="row detail ">
					<div id="pImg" class="col" style="text-align:center;">
						<div id="zoomImg">
							<img id="zoom" src="${product.mainImgRoot }" width="500px" height="400px" onerror="" style="border:1px solid black">
						</div>
						<div id="onImg">
							<img src="${product.mainImgRoot }" width="15%" height="80px" onerror="" onmouseover="document.querySelector('#zoom').src=this.src" style="border:1px solid black">
							<c:forEach items="${subList }" var="subImg">
								<img src="${subImg.subRoot }" width="15%" height="80px" onerror="" onmouseover="document.querySelector('#zoom').src=this.src" style="border:1px solid black">
							</c:forEach>
						</div>
					</div>
					<div id="pInfo" class="col" style="text-align:center;">
						<div id="pTitle">
							<span id="pName"><h3>[${product.productBrand }] ${product.productName }</h3></span>
						</div>
						<div id="star">
							<div id="starGrade" 					style="position:relative; display:inline-block;">
								<div id="graphStar" class="star" 	style="position:absolute; width:100%; overflow:hidden;"><h2>★★★★★</h2></div>
								<div id="backStar" class="star" 	style="width:100%; width:100%;"><h2>☆☆☆☆☆</h2></div>
							</div>
							<div id="gradeInfo" style="display:inline-block;font-size:20px;">
								<span id="aver">${product.gradeAver }</span>
								<span id="review">(${product.reviewCount })</span>
							</div>
						</div>
						<div id="pPrice" style="text-align:center; font-size:30px;">
							<div id="price">
								<span id='wonSymbol'>\</span> 
								<fmt:formatNumber value="${product.productPrice }" pattern="#,###"/>
							</div>
							<div id="function">
								<img id="like" src="/resources/image/like.png" width="40px" height="36px">
								<img id="like" src="/resources/image/like2.png" width="40px" height="36px">
								<img id="url"  src="/resources/image/link.png" width="40px" height="36px">
							</div>
						</div>
						<hr>
						<div id="pQty">
							<span id="qtyLabel">구매수량</span>
							<span id="qtyControl">
								<button id="downQty" type="button" onclick="if(document.querySelector('#qty').value > 1)document.querySelector('#qty').value--; calTotalPrice();">-</button>
								<input id="qty" type="text" width="60px" value="1" readonly style="width:50px;text-align:center;">
								<button id="upQty" type="button" onclick="document.querySelector('#qty').value++; calTotalPrice();">+</button>
							</span>
						</div>
						<div id="pTotalPrice" style="font-size:30px;">
							<span id="totalPriceLabel">상품 구매 가격</span>
							<span id="totalPrice">
								<span id='wonSymbol'>\</span> 
								<fmt:formatNumber value="${product.productPrice }" pattern="#,###"/>
						</div>
						<div id="btn-wrap">
							<button type="button">장바구니</button>
							<button type="button">주문하기</button>
						</div>
					</div>
				</div>
				<div id="moveNav" class="detail row" style="text-align:center;position:sticky;top:0px;background-color:white;">
					<div class="pageNav col"><a href="#">상품정보</a></div>
					<div class="pageNav col"><a href="#pReview">상품후기</a></div>
					<div class="pageNav col"><a href="#pQna">상품문의</a></div>
				</div>
				<div id="pDetail" class="detail">
					<div id="productDesc-wrap">
						<div id="desc" style="width:70%; margin:0 auto;">
							<h3>상품상세설명</h3>
							${product.productDesc }
						</div>
					</div>
					<div id="infoImg-wrap" style="width:80%;margin:0 auto;height:600px;overflow:hidden;">
						<c:forEach items="${infoList }" var="info">
							<div class="oneInfo">
								<img src="${info.imgRoot }" width="100%">
							</div>
						</c:forEach>
					</div>
					<div id="arcodianBtn" style="width:90%; margin:0 auto;">
						<button id="infoArcodianBtn" onclick="detailArcodian();" style="width:100%;">상품 상세 정보 펼치기</button>
					</div>
				</div>
				<div id="pReview" class="detail">
					<div id="" class="">
						<h3>상품평점</h3>
						<button onclick="location.href='#';">후기작성</button>
					</div>
					<div id="reviewWrite-wrap" class="">
						<form action="#" method="post" enctype="multipart/form-data">
							<div id="inputGrade">
								<div id="inputStarGrade" style="font-weight:bold;font-size:30px;">
									<span class="inputStars" onclick="addGrade(1);" style="color:gold">☆</span>
									<span class="inputStars" onclick="addGrade(2);">☆</span>
									<span class="inputStars" onclick="addGrade(3);">☆</span>
									<span class="inputStars" onclick="addGrade(4);">☆</span>
									<span class="inputStars" onclick="addGrade(5);">☆</span>
								</div>
							</div>
							<input type="hidden" name="memberId" value="${session.loginUser.memberId }">
							<input type="hidden" name="memberNick" value="${session.loginUser.memberNick }">
							<input type="hidden" name="productNo" value="${product.productNo }">
							<input type="text" name="reviewGrade" id="inputGrade" value="1">
							<input type="text" name="reviewContents" placeholder="리뷰를 작성하세요.">
							<input type="file" name="reviewImg">
							
						</form>
					</div>
					<div id="reviewGrade" class="">
						<div></div>
						<div></div>
					</div>
					<div id="reviewList" class="">
					</div>
					<div id="reviewPaging" class="">
					</div>
				</div>
				<div id="pQna" class="detail">
					<div id="" class="">
						<h3>상품평점</h3>
						<button onclick="location.href='#';">문의작성</button>
					</div>
					<div id="qnaWrite-wrap" class="">
						
					</div>
					<div id="qnaGrade" class="">
						<div></div>
						<div></div>
					</div>
					<div id="qnaList" class="">
					</div>
					<div id="qnaPaging" class="">
					</div>
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
//별점그래프
document.querySelector("#graphStar").style.width= ""+('${product.gradeAver}'/5)*100+"%";

function calTotalPrice(){
	var totalPriceTag = document.querySelector("#totalPrice");
	var totalPrice = document.querySelector('#qty').value * '${product.productPrice}';
	console.log(totalPrice);
	totalPriceTag.innerHTML = "<span id='wonSymbol'>\\</span> " + totalPrice.toLocaleString();
}

//상세정보 펼치기
var fold = true;
function detailArcodian(){
	var infoArcodianBtn = document.querySelector("#infoArcodianBtn");
	var infoImgDiv = document.querySelector("#infoImg-wrap");
	
	if(fold){
		infoImgDiv.style.height="auto";
		fold=false;
		infoArcodianBtn.innerText="상품 상세 정보 접기"
	}else{
		infoImgDiv.style.height="600px";
		fold=true;
		infoArcodianBtn.innerText="상품 상세 정보 펼치기"
	}
	
}

//리뷰 별점 주기
var inputStars = document.querySelector("#inputStarGrade");
var inputGrade = document.querySelector("#inputGrade");
var pointer = 1;
function addGrade(number){
		console.log(pointer);
		//자식요소가 1,3,5,7,9
	if(number < pointer){
		for(var i=number+1; i<=5; i++){
			inputStars.childNodes[2*i-1].style.color="black";
		}
	}else{
		for(var i=1; i<=number;i++){
			inputStars.childNodes[2*i-1].style.color="gold";
		}
	}
		pointer = number;
		document.querySelector("#inputGrade").value = 5;
}

</script>
</body>
</html>
