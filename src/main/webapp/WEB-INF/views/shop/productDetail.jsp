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

.inputStars{
	display:inline-block;
	height:auto;
}
.inputStars:hover{
	animation-name: rectani3;
    animation-duration: 1s;
    color:gold;
}

@keyframes rectani3{
    0%{}
	100%{background: linear-gradient(to right top, white,yellow);color: transparent;-webkit-background-clip: text;}
}

</style>
</head>
<body>
<div class="wrap container">

<i class="fa-solid fa-house-user"></i>

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
							<div class="starGrade" 	style="position:relative; display:inline-block;">
								<div class="graphStar star" style="position:absolute; width:100%; overflow:hidden;"><h2>★★★★★</h2></div>
								<div class="backStar star" 	style="width:100%; width:100%;"><h2>☆☆☆☆☆</h2></div>
							</div>
							<div class="gradeInfo" style="display:inline-block;font-size:20px;">
								<span class="aver">${product.gradeAver }</span>
								<span class="review">(${product.reviewCount })</span>
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
<!-- 상품리뷰 영역 -->
				<div id="pReview" class="detail">
					<div id="pReview-wrap" class="">
						<br><h3>상품리뷰</h3>
						<hr>
						<div class="grade-area" style="text-align:center">
							<div class="gradeInfo" style="font-size:30px;">
									<span class="aver">${product.gradeAver }</span>
									<span class="review">(${product.reviewCount })</span>
							</div>
							<div class="starGrade" 	style="position:relative; display:inline-block; font-size:60px;">
								<div class="graphStar2 star" 	style="position:absolute; width:100%; overflow:hidden; height:auto;">★★★★★</div>
								<div class="backStar star"  	style="width:100%; height:auto;">☆☆☆☆☆</div>
							</div>
						</div>
						<hr>
					</div>
					<button id="reviewArcodian" onclick="loginCheck('${loginUser.memberId}',function(){reviewArcodian();});">리뷰작성</button>
					<div id="reviewWrite-wrap" style="text-align:center; display:none;">
						<form id="reviewForm" action="#" method="post" enctype="multipart/form-data">
							<div id="inputGrade">
								<div id="inputStarGrade" style="font-weight:bold;font-size:30px;">
									<span class="inputStars" onclick="addGrade(1);" onmouseover="effectStar(1);" onmouseout="effectStarEnd()" style="color:gold">☆</span>
									<span class="inputStars" onclick="addGrade(2);" onmouseover="effectStar(2);" onmouseout="effectStarEnd()">☆</span>
									<span class="inputStars" onclick="addGrade(3);" onmouseover="effectStar(3);" onmouseout="effectStarEnd()">☆</span>
									<span class="inputStars" onclick="addGrade(4);" onmouseover="effectStar(4);" onmouseout="effectStarEnd()">☆</span>
									<span class="inputStars" onclick="addGrade(5);" onmouseover="effectStar(5);" onmouseout="effectStarEnd()">☆</span>
								</div>
							</div>
							<input type="hidden" name="memberId" 	id="memberId"	value="${loginUser.memberId }">
							<input type="hidden" name="memberNick" 	id="memberNick"	value="${loginUser.memberNick }">
							<input type="hidden" name="productNo" 	id="productNo"	value="${product.productNo }">
							<input type="hidden" name="reviewGrade" id="gradeVal" value="1" readonly style="">
							
							<textarea name="reviewContents" id="reviewContents" placeholder="리뷰를 작성하세요."></textarea>
							<input type="file" name="reviewImg" id="rImgFile">
							<button type="button" onclick="registerReview();">등록</button>
						</form>
					</div>
<!-- 리뷰리스트 영역 5개씩 페이징, 정렬, 필터-->
					<div id="reviewList" class="">
					</div>
					<div id="reviewPaging" class="">
						<div id="pagingDiv">
							<a>이전</a>
							<a>n</a>
							<a>다음</a>
						</div>
					</div>
				</div>
<!-- 상품문의 영역 -->
				<div id="pQna" class="detail">
					<div id="pQna-wrap" class="">
						<br><h3>상품Q&A</h3>
						<hr>
					</div>
					<button id="qnaArcodian" onclick="loginCheck('${loginUser.memberId}',function(){qnaArcodian();});">문의작성</button><hr>
					<div id="qnaWrite-wrap" class="" style="text-align:center; display:none;">
						<form id="qnaForm" action="#" method="post">
							<input type="hidden" name="memberId" 	id="memberId"	value="${loginUser.memberId }">
							<input type="hidden" name="memberNick" 	id="memberNick"	value="${loginUser.memberNick }">
							<input type="hidden" name="productNo" 	id="productNo"	value="${product.productNo }">
							<input type="hidden" name="qnaCode" 	id="qnaCode"	value="QC2">
							<select name="qnaType">
								<option value="" selected disabled style="display:none">문의종류</option>
								<option value="QC2QT1">주문/결제</option>
								<option value="QC2QT2">배송</option>
								<option value="QC2QT3">취소/반품/교환</option>
								<option value="QC2QT4">기타</option>
							</select>
							<textarea name="qnaContents" id="qnaContents" placeholder="문의를 작성하세요."></textarea>
							<button type="button" onclick="registerQna();">등록</button>
						</form>
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
//온로드 실행
//별점그래프
document.querySelector(".graphStar").style.width= ""+('${product.gradeAver}'/5)*100+"%";
document.querySelector(".graphStar2").style.width= ""+('${product.gradeAver}'/5)*100+"%";

//총 가격 계산
function calTotalPrice(){
	var totalPriceTag = document.querySelector("#totalPrice");
	var totalPrice = document.querySelector('#qty').value * '${product.productPrice}';
	console.log(totalPrice);
	totalPriceTag.innerHTML = "<span id='wonSymbol'>\\</span> " + totalPrice.toLocaleString();
}

//로그인 체크
function loginCheck(loginId,action){
	event.preventDefault();
	if(loginId==""){
		alert("로그인을 해주세요.");
		location.href="/member/loginView.strap";		
	}else{
		action();
	}
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
	document.querySelector("#gradeVal").value = pointer;
	console.log("밸류값" + document.querySelector("#gradeVal").value);
}

//리뷰 마우스오버 이펙트
var overPointer=1;
function effectStar(number){
	if(number>overPointer){
		for(var i=1; i<=number;i++){
			inputStars.childNodes[2*i-1].style.color="gold";
		}
	}else{
		for(var i=pointer+1; i<=5; i++){
			inputStars.childNodes[2*i-1].style.color="black";
		}		
	}
}

function effectStarEnd(){
	for(var i=pointer+1; i<=5; i++){
		inputStars.childNodes[2*i-1].style.color="black";
	}
}

//리뷰작성 아코디언 버튼
var reviewWrap = document.querySelector("#reviewWrite-wrap");
function reviewArcodian(){
	if(reviewWrap.style.display == "none"){
		reviewWrap.style.display = "block";
	}else{
		reviewWrap.style.display = "none";
	}
}

///리뷰 작성 ajax
function registerReview(){
	var form = document.querySelector("#reviewForm");
	var formData = new FormData(form);
	$.ajax({
		url:"/review/register.strap",
		data: formData,
		type:"POST",
        contentType: false,
        processData: false,
		success:function(result){
			if(result == "sucess"){
				console.log("성공.");
				printReview(1);
			}else{
				console.log("실패");
			}
		},
		error:function(){}
	});
}

printReview(1);

//리뷰 리스트 출력
function printReview(currentPage){
// 	리스트 출력을 위해 필요한 값들:
// 		상품번호, 로그인아이디, Search,Paging
	var $reviewListDiv = document.querySelector("#reviewList");
	var $reviewPaging = document.querySelector("#reviewPaging");
	var productNo = ${product.productNo};
	var page = 1;
	if(currentPage > 1 ){
		page = currentPage;		
	}
	$.ajax({
		url:"/review/detail/list.strap",
		data:{
			"productNo":productNo,
			"page":page
		},
		type:"post",
		success:function(rList){
			if(rList.length < 1){
				$reviewListDiv.innerHTML = "<h2>상품 리뷰가 없습니다.</h2>"
			}else{
				var rListStr = "";
				for(var i in rList){
					var oneReview = 
						'<div class="oneReviewWrap row" style="border:1px solid black;">'+
							'<div class="rImgWrap col-3">'+
								'<img class="rThumbImg" src="'+rList[i].reviewImgRoot+'" onerror="this.src =\'/resources/image/logo.png\'" style="width:100px;height:100px;" >'+
							'</div>'+
							'<div class="rInfoWrap col-8">'+
								'<div class="rGrade">'+
									'<div class="oneReviewGradeWrap" 	style="position:relative; display:inline-block;">'+
										'<div class="oneReviewGraph star" style="position:absolute; width:100%; overflow:hidden;"><h2>'+"★".repeat(rList[i].reviewGrade) +'</h2></div>'+
										'<div class="oneReviewBack star" 	style="width:100%; width:100%;"><h2>☆☆☆☆☆</h2></div>'+
									'</div>'+
								'</div>'+
							'<div class="rUserTime">'+rList[i].memberNick+'</div>'+
							'<div class="rBuyInfo">구매정보 추후 업데이트</div>'+
							'<div class="rContents">'+rList[i].reviewContents+'</div>'+
							'</div>'+
							'<div class="btnArea col-1">'+
									'<button class="reviewDetailBtn">펼치기</button>'+
							'</div>'+
						'</div>';
						rListStr += oneReview;
				}
				$reviewListDiv.innerHTML = rListStr;
				$reviewPaging.innerHTML = "<div>"+
												"<a onclick='alert(\"!\")'>이전</a>"+
												"<a onclick='alert(\"!\")'>N</a>"+
												"<a onclick='alert(\"!\")'>다음</a>"+
										   "</div>";
			}
		},
		error:function(){}
	});
}
//문의작성 아코디언 버튼
var qnaWrap = document.querySelector("#qnaWrite-wrap");
function qnaArcodian(){
	if(qnaWrap.style.display == "none"){
		qnaWrap.style.display = "block";
	}else{
		qnaWrap.style.display = "none";
	}
}
///문의 작성 ajax
function registerQna(){
	var form = document.querySelector("#qnaForm");
	var formData = new FormData(form);
	$.ajax({
		url:"/review/register.strap",
		data: formData,
		type:"POST",
        contentType: false,
        processData: false,
		success:function(result){
			if(result == "sucess"){
				console.log("성공.");
				printReview(1);
			}else{
				console.log("실패");
			}
		},
		error:function(){}
	});
}
//////////////////페이징을 여기서 해야하나?........
function paging(totalCount,page,pageLimit,naviSize){
	var totalCount;
	var pageLimit;
	var startPage;
	var endPage;
	var naviSize;
	var startNavi;
	var endNavi;
}
</script>
</body>
</html>