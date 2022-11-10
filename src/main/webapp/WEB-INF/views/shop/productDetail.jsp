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

#pImg img{
	border:1px solid #c0c0c0;
	border-radius:4px;
}

#qtyControl button{
	font-size:16px;
	font-weight:bold;
}
#btn-wrap button{
	width:48%;
	height:70px;
	border-radius:4px;
	border: 2px solid darkorange;
}

.pageNav{
	item-align:center;
	vertical-align:bottom;
	background-color:rgb(250,250,250);
	border: 1px solid rgb(230,230,230);
	border-top-left-radius:8px;
	border-top-right-radius:8px;
	padding:5px;
}
#moveNav a{
	text-decoration:none;
	color:gray;
	vertical-align: bottom;
}

.inputStars{
	color:#c0c0c0;
	display:inline-block;
	height:auto;
}
.inputStars:hover{
	animation-name: rectani3;
    animation-duration: 1s;
    color:darkorange;
}
.graphStar{
	color:darkorange;
}
.backStar{
	color:#c0c0c0;
}

#reviewPaging a{
 color:gray;
 text-decoration:none;
}

#qnaPaging a{
 color:gray;
 text-decoration:none;
}

@keyframes rectani3{
    0%{}
	100%{background: linear-gradient(to right top, white,yellow);color: transparent;-webkit-background-clip: text;}
	
}
#order-wrap span{
	display:inline-block;
	padding:7px;
}

.rInfo{
	width:500px;
	margin:auto;
}

.rContents{
	overflow:hidden;
   	white-space:nowrap;
	text-overflow:ellipsis;
	margin:0 auto;
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
	<div id="contents" class="row" style="width:55%; margin:50px auto;">
		<div class="contents-side col">
			<div id="detail-wrap" style="font-size:20px;">
				<div id="pInfo-wrap" class="row detail ">
					<div id="pImg" class="col" style="text-align:center;padding:15px;">
						<div id="zoomImg">
							<img id="zoom" src="${product.mainImgRoot }" width="400px" height="360px" onerror="">
						</div>
						<div id="onImg" style="margin:5px auto;">
							<img src="${product.mainImgRoot }" width="15%" height="70px" onerror="" onmouseover="document.querySelector('#zoom').src=this.src">
							<c:forEach items="${subList }" var="subImg">
								<img src="${subImg.subRoot }" width="15%" height="70px" onerror="" onmouseover="document.querySelector('#zoom').src=this.src">
							</c:forEach>
						</div>
					</div>
					<div id="pInfo" class="col" style="text-align:center; item-align:center; padding:15px;">
						<div id="pTitle" style="height:auto;">
							<span id="pName" style="font-weight:bold; font-size:25px;">[${product.productBrand }] ${product.productName }</span>
						</div>
						<div id="star">
							<div class="starGrade" 	style="position:relative; display:inline-block;">
								<div class="graphStar star" style="position:absolute; width:100%; overflow:hidden;"><h2>★★★★★</h2></div>
								<div class="backStar star" 	style="width:100%; width:100%;"><h2>★★★★★</h2></div>
							</div>
							<div class="gradeInfo" style="display:inline-block;font-size:20px;">
								<span class="aver">${product.gradeAver }</span>
								<span class="review">(${product.reviewCount })</span>
							</div>
						</div>
						<div id="pPrice" style="text-align:center; font-size:26px;font-weight:bold;">
							<div id="price">
								<span id="price" style="font-size:30px;">
									<fmt:formatNumber value="${product.productPrice }" pattern="#,###"/>
								</span>
								<span id='wonSymbol'>원</span> 
							</div>
							<div id="function" style="color:#c0c0c0;">
								<span id="${product.productNo }" class="likeBtn" onclick="loginCheck('${loginUser.memberId}',function(){controlLike('${loginUser.memberId}',${product.productNo });});"><i class="fa-solid fa-heart"></i></span>
								<i class="fa-solid fa-share-nodes"></i>
							</div>
						</div>
						<hr>
						<div id="pQty">
<!-- 							<span id="qtyLabel">구매수량</span> -->
							<span id="qtyControl" class="btn-group" role="group" style="border:1px solid #c0c0c0;">
								<button class="btn" id="downQty" type="button" onclick="if(document.querySelector('#qty').value > 1)document.querySelector('#qty').value--; calTotalPrice();">-</button>
								<input  class="btn" id="qty" type="text" width="60px" value="1" readonly style="width:50px;text-align:center;">
								<button class="btn" id="upQty" type="button" onclick="document.querySelector('#qty').value++; calTotalPrice();">+</button>
							</span>
						</div>
						<div id="pTotalPrice" style="font-size:23px;padding:12px;">
							<span id="totalPriceLabel">총 상품금액  </span>
							<span id="totalPrice">
								<span style="font-size:36px;color:darkorange;font-weight:bold;">
									<fmt:formatNumber value="${product.productPrice }" pattern="#,###"/>
								</span> 
								<span id='wonSymbol'>원</span>
						</div>
						<hr>
						<div id="btn-wrap">
							<button type="button" style="font-weight:bold;color:darkorange;background-color:white;"onclick="loginCheck('${loginUser.memberId}',function(){addCart('${loginUser.memberId }',${product.productNo },document.querySelector('#qty').value)});">장바구니</button>
							<button type="button" style="font-weight:bold;color:white;background-color:darkorange;" onclick="if(confirm('선택 상품을 구매하시겠습니까?')){loginCheck('${loginUser.memberId }',function(){location.href='/detail/orderView.strap?qty='+document.querySelector('#qty').value+'&productNo=${product.productNo}'});};">주문하기</button>
						</div>
					</div>
				</div>
				<hr>
				<div id="moveNav" class="detail row" style="text-align:center;position:sticky;top:0px;background-color:white;z-index:1000;height:42px; font-size:16px">
					<div class="pageNav col"><a href="#contents">상품정보</a></div>
					<div class="pageNav col"><a href="#pReview">상품후기 (${product.reviewCount })</a></div>
					<div class="pageNav col"><a href="#pQna">상품문의<span id="numberOfQna"></span></a></div>
				</div>
<!-- 상품상세설명 -->
				<div id="pDetail" class="detail">
					<div id="productDesc-wrap">
						<div id="desc" style="width:70%; margin:0 auto;">
							<h3>상품상세설명</h3>
							${product.productDesc }
						</div>
					</div>
					<div id="infoImg-wrap" style="width:100%;margin:0 auto;height:600px;overflow:hidden;">
						<c:forEach items="${infoList }" var="info">
							<div class="oneInfo">
								<img src="${info.imgRoot }" width="100%">
							</div>
						</c:forEach>
					</div>
					<div id="arcodianBtn" style="width:100%; margin:0 auto;text-align:center;">
						<div id="gradiantDiv" style="height:100px; position:relative; top:-70px;  background: linear-gradient(180deg, rgba(255, 255, 255, 0) 4.17%, rgba(255, 255, 255, 0.961) 71.35%, #FFFFFF 100%);"></div>
						<button id="infoArcodianBtn" onclick="detailArcodian();" style="width:70%; border-radius:5px; padding:8px; background-color:white; border:1px solid #c0c0c0;">상품 상세 정보 펼치기▽</button>
					</div>
				</div>
<!-- 상품리뷰 영역 -->
				<div id="pReview" class="detail">
					<div id="pReview-wrap" class="">
						<br><h3>구매만족도</h3>
						<hr>
						<div class="grade-area" style="text-align:center">
							<div class="gradeInfo" style="font-size:30px;">
									<span class="aver">${product.gradeAver }점</span>
									<span class="review">(${product.reviewCount })</span>
							</div>
							<div class="starGrade" 	style="position:relative; display:inline-block; font-size:50px; vertical-align:middle;">
								<div class="graphStar graphStar2" 	style="position:absolute; width:100%; overflow:hidden; height:auto;">★★★★★</div>
								<div class="backStar"  	style="width:100%; height:auto;">★★★★★</div>
							</div>
						</div>
						<hr>
					</div>
					<div id="pReviewWrite" class="row">
						<div class="col">
							<h3>상품후기<span id="numberOfReview"></h3>
						</div>
						<div class="col" style="text-align:right;">
							<button id="reviewArcodian" style="font-weight:bold;color:white;background-color:darkorange;border-style:none;border-radius:4px;height:40px;"  onclick="loginCheck('${loginUser.memberId}',function(){reviewArcodian();});">후기작성</button>
						</div>
					</div>
					<hr>
<!-- 리뷰작성 -->
					<div id="reviewWrite-wrap" style="text-align:center; display:none;">
						<form id="reviewForm" action="#" method="post">
						보충제 상품은 어떠셨나요? 평점과 후기를 남겨보세요!
						<div style="font-size:12px;">※상품 후기는 구매 건당 7일 이내 1회 작성 가능합니다.</div>
							<div id="inputGrade">
								<div id="inputStarGrade" style="font-weight:bold;font-size:30px;">
									<span class="inputStars" onclick="addGrade(1);" onmouseover="effectStar(1);" onmouseout="effectStarEnd()" style="color:darkorange">★</span>
									<span class="inputStars" onclick="addGrade(2);" onmouseover="effectStar(2);" onmouseout="effectStarEnd()">★</span>
									<span class="inputStars" onclick="addGrade(3);" onmouseover="effectStar(3);" onmouseout="effectStarEnd()">★</span>
									<span class="inputStars" onclick="addGrade(4);" onmouseover="effectStar(4);" onmouseout="effectStarEnd()">★</span>
									<span class="inputStars" onclick="addGrade(5);" onmouseover="effectStar(5);" onmouseout="effectStarEnd()">★</span>
								</div>
							</div>
							<input type="hidden" name="memberId" 	id="memberId"	value="${loginUser.memberId }">
							<input type="hidden" name="memberNick" 	id="memberNick"	value="${loginUser.memberNick }">
							<input type="hidden" name="productNo" 	id="productNo"	value="${product.productNo }">
							<input type="hidden" name="reviewGrade" id="gradeVal" value="1" readonly style="">
							<div id="rInputTextarea" style="width:440px;height:240px;margin:auto; padding:5px;border:2px solid darkorange; border-top-left-radius:7px;border-top-right-radius:7px;">
								<textarea name="reviewContents" id="reviewContents" onkeyup="countText(this,300);" style="width:400px;height:200px;border-style:none;padding:5px;" required placeholder="다른 고객님에게 도움이 되도록 상품에 대한 솔직한 평가를 남겨주세요.(상품 품질과 관계 없는 배송,포장,질문,상품 가격 등은 상품문의에 남겨주세요.)"></textarea>
								<div style="text-align:left;font-size:14px;padding:5px;">
									<span id="inputCount">(0/300)</span>
								</div>
							</div>
							<div id="rFile" class="input-group mb-3" style="text-align:center;width:440px;margin:auto;">
								<input type="file" name="reviewImg" class="form-control" id="rImgFile">
							</div>
							<div id="rBtn">
								<button type="button"  style="font-weight:bold;color:white;background-color:darkorange;border-style:none;border-radius:4px;height:40px;" onclick="if(contentsCheck('review')){registerReview();}else{alert('내용을 입력해주세요.')}">후기 작성 완료</button>
							</div>
						</form>
					<hr>
					</div>
					<div id="search-wrap" style="text-align:center;color:gray; font-size:16px;">
							<div id="order-wrap">
								<span onclick="printReview(1,'review_grade','desc');" 	class="rOrder" id="order-high-grade"> 평점높은순 </span>
								<span onclick="printReview(1,'review_grade','asc');" 	class="rOrder" id="order-low-grade"> 평점낮은순 </span>
								<span onclick="printReview(1,'review_time','desc');" 	class="rOrder" id="order-sales"> 최신순 </span>
								<span onclick="printReview(1,'review_time','asc');" 	class="rOrder" id="order-high-price"> 오래된순 </span>
							</div>
						</div>
<!-- 리뷰리스트 영역 5개씩 페이징, 정렬, 필터-->
					<div id="reviewList" class="">
					</div>
					<div id="reviewPaging" class="" style="width:200px;margin:auto;text-decoration:none;text-align:center;font-size:16px;">
					</div>
				</div>
<!-- 상품문의 영역 -->
				<hr>
				<div id="pQna" class="detail row">
					<div id="pQna-wrap" class="col">
						<h3>상품Q&A<span id="numberOfQna2"></span></h3>
					</div>
					<div class="col" style="text-align:right;">
						<button id="qnaArcodian" style="font-weight:bold;color:white;background-color:darkorange;border-style:none;border-radius:4px;height:40px;" onclick="loginCheck('${loginUser.memberId}',function(){qnaArcodian();});">문의작성</button>
					</div>
					<hr>
<!-- 문의작성					 -->
					<div id="qnaWrite-wrap" class="" style="text-align:center; display:none;">
						<form id="qnaForm" action="#" method="post">
						 	궁금한 점이 있으신가요? 문의를 남겨보세요!
							<input type="hidden" name="memberId" 	id="memberId"	value="${loginUser.memberId }">
							<input type="hidden" name="memberNick" 	id="memberNick"	value="${loginUser.memberNick }">
							<input type="hidden" name="productNo" 	id="productNo"	value="${product.productNo }">
							<input type="hidden" name="qnaCode" 	id="qnaCode"	value="QC2">
							<div id="qnaSelect" style="font-size:16px;">
								<span style="color:gray; font-size:12px;">※문의유형을 꼭 선택해주세요.</span>
								<select id="qnaTypeSelect" name="qnaType" required >
									<option value="" disabled selected style="display:none;">유형선택</option>
									<option value="QC2QT1">주문/결제</option>
									<option value="QC2QT2">배송</option>
									<option value="QC2QT3">취소/반품/교환</option>
									<option value="QC2QT4">기타</option>
								</select>
							</div>
							<div id="qInputTextarea" style="width:440px;height:240px;margin:auto; padding:5px;border:2px solid darkorange; border-radius:7px;">
								<textarea name="qnaContents" id="qnaContents" onkeyup="countText(this,300);" style="width:400px;height:200px;border-style:none;padding:5px;" placeholder="문의를 작성하세요." required></textarea>
								<div style="text-align:left;font-size:14px;padding:5px;">
									<span id="inputCount">(0/300)</span>
								</div>
							</div>
							<div id="qBtn" style="font-size:16px;">
								 <label>
									 <i class="fa-solid fa-lock"></i>비밀문의<input type="checkbox" name ="secretStatus" value = "Y">
									<button type="button" style="font-weight:bold; margin-top:5px;color:white;background-color:darkorange;border-style:none;border-radius:4px;height:40px;" onclick="if(contentsCheck('qna')){registerQna();}else{alert('내용을 입력해주세요.')}">문의작성 완료</button>
								 </label>
							</div>
						</form>
						<hr>
					</div>
<!-- 상품문의 리스트					 -->
					<div id="qnaList" class="">
					</div>
					<div id="qnaPaging" class="" style="width:200px;margin:auto; text-decoration:none;text-align:center;font-size:16px;">
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
	totalPriceTag.innerHTML = "<span style='font-size:36px;color:darkorange;font-weight:bold;'> " + totalPrice.toLocaleString() + "</span><span id='wonSymbol'>원</span>";
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

//텍스트 체크
function countText(thisInput,limit){
	var count = thisInput.value.length;
	if(count>limit){
		thisInput.value=thisInput.value.substring(0,limit);
		count=limit;		
	}
	var text = "("+count+"/"+limit+")"
// 	document.querySelector("#inputCount").innerText = text;
	thisInput.nextElementSibling.childNodes[1].innerText = text;
}

//스무스스크롤
$(document).ready(function(){
  $("a[href^='#']").on('click', function(event) {
    if (this.hash !== "") {
      event.preventDefault();
      var hash = this.hash;
      $('html, body').animate({
        scrollTop: $(hash).offset().top
      }, 800, function(){
        window.location.hash = hash;
      });
    } 
  });
});

//상세정보 펼치기
var fold = true;
function detailArcodian(){
	var infoArcodianBtn = document.querySelector("#infoArcodianBtn");
	var infoImgDiv = document.querySelector("#infoImg-wrap");
	
	if(fold){
		infoImgDiv.style.height="auto";
		fold=false;
		document.querySelector("#gradiantDiv").style.display = "none";
		infoArcodianBtn.innerText="상품 상세 정보 접기△"
	}else{
		infoImgDiv.style.height="600px";
		fold=true;
		document.querySelector("#gradiantDiv").style.display = "block";
		infoArcodianBtn.innerText="상품 상세 정보 펼치기▽"
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
			inputStars.childNodes[2*i-1].style.color="#c0c0c0";
		}
	}else{
		for(var i=1; i<=number;i++){
			inputStars.childNodes[2*i-1].style.color="darkorange";
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
			inputStars.childNodes[2*i-1].style.color="darkorange";
		}
	}else{
		for(var i=pointer+1; i<=5; i++){
			inputStars.childNodes[2*i-1].style.color="#c0c0c0";
		}		
	}
}

function effectStarEnd(){
	for(var i=pointer+1; i<=5; i++){
		inputStars.childNodes[2*i-1].style.color="#c0c0c0";
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
			if(result == "success"){
				printReview(1,'review_grade','desc');
				document.querySelector("#reviewContents").value = "";
			}else if(result =="noneAuthority"){
				alert("상품 후기는 구매 건당 7일 이내 1회 작성 가능합니다.");
			}else if (result =="fail"){
				alert("후기 등록에 실패하였습니다.");
			}
		},
		error:function(){}
	});
}

//페이지 최초 랜더링 시 리뷰 목록 출력
printReview(1,'review_grade','desc');
//리뷰 리스트 출력
function printReview(page,searchColumn,orderCondition){
	var $reviewListDiv = document.querySelector("#reviewList");
	var $reviewPaging = document.querySelector("#reviewPaging");
	var productNo = ${product.productNo};
	
	console.log("page :" + page);
	console.log("searchColumn :" + searchColumn);
	console.log("orderCondition :" + orderCondition);
	
	
	$.ajax({
		url:"/review/detail/list.strap",
		data:{
			"productNo":productNo,
			"page":page,
			"searchColumn":searchColumn,
			"orderCondition":orderCondition
		},
		type:"get",
		success:function(result){
			var paging = JSON.parse(result.paging);
			var search = JSON.parse(result.search);
			var rList = JSON.parse(result.rList);
			console.log(search.searchColumn);
			console.log(search.orderCondition);
			
			//정렬 표시
			for(var k=0;k<4;k++){
				document.querySelectorAll(".rOrder")[k].style.fontWeight="normal";
				document.querySelectorAll(".rOrder")[k].style.textDecoration="none";
			}
			if(search.searchColumn=="review_grade" && search.orderCondition=="desc"){
				document.querySelector("#order-high-grade").style.fontWeight="bolder";
				document.querySelector("#order-high-grade").style.textDecoration="underline";
			}
			if(search.searchColumn=="review_grade"&& search.orderCondition=="asc" ){
				document.querySelector("#order-low-grade").style.fontWeight="bolder";
				document.querySelector("#order-low-grade").style.textDecoration="underline";
			}
			if(search.searchColumn=="review_time" && search.orderCondition =="desc"){
				document.querySelector("#order-sales").style.fontWeight="bolder";
				document.querySelector("#order-sales").style.textDecoration="underline";
			}
			if(search.searchColumn=="review_time" && search.orderCondition =="asc"){
				document.querySelector("#order-high-price").style.fontWeight="bolder";
				document.querySelector("#order-high-price").style.textDecoration="underline";
			}
			document.querySelector("#numberOfReview").innerHTML = "("+paging.totalCount+")"
			if(rList.length < 1){
				$reviewListDiv.innerHTML = "<h2>상품 리뷰가 없습니다.</h2>"
			}else{
				var rListStr = "";
				for(var i in rList){
					var oneReview = 
						'<div class="oneReviewWrap row" style="border-bottom:1px solid #c0c0c0; margin:2px auto; padding:5px;">'+
							'<div class="rInfoWrap col" style="text-align:left;">'+
								'<div class="rGrade rInfo" style="margin:2px;">'+
									'<div class="oneReviewGradeWrap" 	style="position:relative; display:inline-block;">'+
										'<div class="graphStar" style="position:absolute; width:100%; overflow:hidden;font-size:16px;">'+"★".repeat(rList[i].reviewGrade) +'</div>'+
										'<div class="backStar" 	style="width:100%; width:100%;font-size:16px;">★★★★★</div>'+
									'</div>'+
								'</div>'+
								'<div class="rUserTime rInfo" style="font-size:14px;color:gray; margin:2px;">'+rList[i].memberNick+' ｜ '+rList[i].reviewTime+'</div>'+
								'<div class="rContents rInfo" style="font-size:15px;margin:4px 2px;">'+rList[i].reviewContents+'</div>'+
								'</div>'+
							'<div class="rImgWrap col-3" style="text-align:center;">'+
								'<img class="rThumbImg" src="'+rList[i].reviewImgRoot+'" onerror="this.src =\'/resources/image/logo.png\'" style="width:70px;height:70px;" >'+
								'<div class="btnArea col-1" style="width:100px;margin:0 auto;">'+
										'<button class="reviewDetailBtn" onclick="rFold('+i+');" style="font-size:14px;background-color:white;border-style:none;width:100%;">펼치기▽</button>'+
								'</div>'+
							'</div>'+
						'</div>';
						rListStr += oneReview;
				}
				$reviewListDiv.innerHTML = rListStr;
				
				var pagingBefore = "<a href='#' onclick='event.preventDefault(); printReview("+(paging.startNavi - 1)+ ",\""+search.searchColumn+"\",\""+search.orderCondition+"\");' > < </a>";
				if(paging.startNavi == 1) pagingBefore = "";
				var pagingAfter = "<a href='#' onclick='event.preventDefault(); printReview("+(paging.endNavi + 1)+ ",\""+search.searchColumn+"\",\""+search.orderCondition+"\");' > > </a>";
				if(paging.endNavi == paging.endPage) pagingAfter = "";
				var pagingRepeat = "";
				for(var j = paging.startNavi; j<=paging.endNavi; j++){
					if(paging.page == j){
						pagingRepeat += " <a href='#' style='font-weight:bold;' onclick='event.preventDefault(); printReview("+ j + ",\""+search.searchColumn+"\",\""+search.orderCondition+"\");' >" + j + "</a> ";
					}else{
						pagingRepeat += " <a href='#' onclick='event.preventDefault(); printReview("+ j + ",\""+search.searchColumn+"\",\""+search.orderCondition+"\");' >" + j + "</a> ";
					}
				}
				
				$reviewPaging.innerHTML = pagingBefore + pagingRepeat + pagingAfter
			}
		},
		error:function(){}
	});
}

//리뷰 펼치기 버튼
function rFold(num){
	console.log(num);
	var thisWhiteSpaceVal = document.querySelectorAll(".rContents")[num].style.whiteSpace;
	var thisImg = document.querySelectorAll(".rThumbImg")[num];
	var thisImgWrap = document.querySelectorAll(".rImgWrap")[num];
	var thisrInfoWrap = document.querySelectorAll(".rInfoWrap")[num];
	var reviewDetailBtn = document.querySelectorAll(".reviewDetailBtn")[num];
	
	console.log(thisWhiteSpaceVal);
	if(thisWhiteSpaceVal=="normal"){
		document.querySelectorAll(".rContents")[num].style.whiteSpace = "nowrap";
		thisImg.style.width="70px";
		thisImg.style.height="70px";
		thisImgWrap.className="rImgWrap col-3";
		reviewDetailBtn.innerText = "펼치기▽";
	}else{
		document.querySelectorAll(".rContents")[num].style.whiteSpace = "normal";
		thisImg.style.width="400px";
		thisImg.style.height="500px";
		thisImgWrap.className="rImgWrap";
		reviewDetailBtn.innerText = "접기△";
	}
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
	var qnaSelectVal = document.querySelector("#qnaTypeSelect").value;
	if(qnaSelectVal == ""){
		alert("문의유형을 선택해주세요.");		
	}else{
		$.ajax({
			url:"/shopQna/register.strap",
			data: formData,
			type:"POST",
	        contentType: false,
	        processData: false,
			success:function(result){
				console.log(result);
				if(result == "success"){
					printShopQna(1);
					document.querySelector("#qnaContents").value = "";
				}else{
				}
			},
			error:function(){}
		});
	}
}

//페이지 최초 랜더링 시 문의 목록 출력
printShopQna(1);
//문의 리스트 출력
function printShopQna(page){
	var $qnaListDiv = document.querySelector("#qnaList");
	var $qnaPaging = document.querySelector("#qnaPaging");
	var productNo = ${product.productNo};
	$.ajax({
		url:"/shopQna/detail/list.strap",
		data:{
			"productNo":productNo,
			"page":page,
		},
		type:"get",
		success:function(result){
			var paging = JSON.parse(result.paging);
			var qList = JSON.parse(result.qList);
			document.querySelector("#numberOfQna").innerHTML = "("+paging.totalCount+")";
			document.querySelector("#numberOfQna2").innerHTML = "("+paging.totalCount+")";
			if(qList.length < 1){
				 $qnaListDiv.innerHTML = "<h2>상품 문의가 없습니다.</h2>"
			}else{
				var qListStr = "";
				for(var i in qList){
					//답변 조건 충족 시 onclick 추가
					var onclickTxt = 'onclick="qnaDetail(this);"';
					if(qList[i].secretStatus == 'Y' && qList[i].memberId !='${loginUser.memberId}'){
						onclickTxt = '';
					}
					//답변이 없을 경우 답변 대기중 출력
					var answerContents = "답변 대기중 입니다.";
					if(qList[i].answerContents != null){
						answerContents = qList[i].answerContents;
					}
					//주문타입 
					var qnaTypetxt = "";
					switch(qList[i].qnaType){
					case "QC2QT1":
						qnaTypetxt = "주문/결제";
						break;
					case "QC2QT2":
						qnaTypetxt = "배송";
						break;
					case "QC2QT3":
						qnaTypetxt = "취소/반품/교환";
						break;
					case "QC2QT4":
						qnaTypetxt = "기타";
						break;
					}
					//답변여부
					var qnaAnswer = "";
					var answerColor = "gray";
					switch(qList[i].answerStatus){
					case "Y":
						qnaAnswer = "답변완료";
						answerColor = "darkorange";
						break;
					case "N":
						qnaAnswer = "답변대기";
						break;
					}
					//비밀글 여부
					var secretIcon = '<i class="fa-solid fa-lock"></i>';
					if(qList[i].secretStatus != 'Y'){
						secretIcon='';	
					}
					
					var oneShopQna = '<table class="shopQnaTable table" style="font-size:15px;">'+
										'<tr>'+
											'<td class="answerYn col-2" style="font-weight:bold; color:'+answerColor+';">'+ qnaAnswer +'</td>'+
											'<td class="answerTitle col-4" '+onclickTxt+'>'+
												'<span class="answerType"> ['+ qnaTypetxt +']</span>'+
												'<span >문의글입니다.</span>'+
												'<span class="secretIcon">'+secretIcon+'</span>'+
											'</td>'+
											'<td class="col-2">'+qList[i].memberNick+'</td>'+
											'<td class="col-2">'+qList[i].qEnrollDate+'</td>'+
										'</tr>'+
										'<tr style="display:none;">'+
											'<td colspan="1" style="border-style:none;"></td>'+
											'<td colspan="3" style="text-align:left;border-style:none;">'+qList[i].qnaContents+'</td>'+
										'</tr>'+
										'<tr style="display:none;">'+
											'<td colspan="1" style="border-style:none;"></td>'+
											'<td colspan="3" style="text-align:left;border-style:none;background-color:rgb(240,240,240)">'+answerContents+'</td>'+
										'</tr>'+
									'</table>';
						qListStr += oneShopQna;
				}
				$qnaListDiv.innerHTML = qListStr;
				
				var pagingBefore = "<a href='#' onclick='event.preventDefault(); printShopQna("+(paging.startNavi - 1)+");' > < </a>";
				if(paging.startNavi == 1) {pagingBefore = "";}
				var pagingAfter = "<a href='#' onclick='event.preventDefault(); printShopQna("+(paging.endNavi + 1)+ ");' > > </a>";
				if(paging.endNavi == paging.endPage) {pagingAfter = "";}
				var pagingRepeat = "";
				for(var j = paging.startNavi; j<=paging.endNavi; j++){
					if(paging.page == j){
						pagingRepeat += "<a href='#' style='font-weight:bold;' onclick='event.preventDefault(); printShopQna("+ j +");'>" + j + "</a> ";
					}else{
						pagingRepeat += "<a href='#' onclick='event.preventDefault(); printShopQna("+ j +");'>" + j + "</a> ";
					}
				}
				$qnaPaging.innerHTML =  pagingBefore + pagingRepeat + pagingAfter;
			}
		},
		error:function(){}
	});
}

//문의글 온클릭 함수
function qnaDetail(thisQna){
	var qArea = thisQna.parentElement.parentElement.childNodes[1];
	var aArea = thisQna.parentElement.parentElement.childNodes[2];
	if(qArea.style.display == "none"){
		qArea.style.display = "table-row";
		aArea.style.display = "table-row";
	}else{
		qArea.style.display = "none";
		aArea.style.display = "none";
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

//리뷰 및 후기 컨텐츠 null체크
//컨텐츠가 있는지 여부를 확인하고 boolean을 반환하는 함수.
function contentsCheck(sort){
	var existContents = false;
	if(sort == "review"){
		var reviewContents = document.querySelector("#reviewContents").value;
		if(reviewContents != "" && reviewContents != null){
			existContents=true;
		}
		
	}else if(sort == "qna"){
		var qnaContents = document.querySelector("#qnaContents").value;
		if(qnaContents != "" && qnaContents != null){
			existContents=true;
		}
	}
	return existContents;
}


</script>
</body>
</html>