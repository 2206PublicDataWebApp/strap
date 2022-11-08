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
<!-- 아임포트 -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<!-- 아래 제이쿼리는 1.0이상이면 원하는 버전을 사용하셔도 무방합니다. -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<!-- 다음주소API -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style>
	body{
		font-size:14px;
	}
	input{
		margin-bottom:12px;
		border-style:none;
		padding:3px;
	}
		input[type="text"]{
			width:60%;
			border-bottom:1px solid #c0c0c0; 
		}
	.inputWrap{
	}	
		
	.distict{
		padding:12px;
	}
	.guideMenu{
		display:none;
		height:250px;
		font-size: 13px;
	}
	.subTitleTxt{
		display:inline-block;
		padding:6px 0px;
		font-size:14px;
		font-weight:bold;
	}
	.inputLabel{
		display:inline-block;
		width: 130px;
		text-align:left;
		font-size:12px;
		font-weight:bold;
		padding: 0px 10px;
	}
	.btn-outline-success{
		width:100px;
		height:50px;
		font-size:11px;
		font-weight:bold;
		vertical-align:middle;
	}
	.stickyPriceTxt{
		float:right;
		font-size:20px;
		font-weight:bold;
	}
	.stickyInfo{
		margin:2px;
		height:30px;
		margin:auto;
		font-size:12px;
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
		<div id="contents" class="row" style="width:60%; margin:50px auto;font-size:16px;">
			<div id="pageTItle" class="col-8" style="border-bottom:1px solid #c0c0c0;height:50px;">
				<span style="font-size:20px;font-weight:bold;padding:12px;">주문/결제</span>
			</div>
			<div class="col-8">
					<div id="ordererInfo" class="row distict" style="border-bottom:1px solid #c0c0c0;">
						<div class="col">
							<div><span class="subTitleTxt">주문자 정보</span></div>
							<span id="name">${loginUser.memberName }</span>/
							<span id="email">${loginUser.memberEmail }</span>
						</div>
					</div>
					<div id="deliverInfo" class="distict" style="border-bottom:1px solid #c0c0c0;">
						<div>
							<span class="subTitleTxt" style="margin-right:10px;">배송정보 입력 </span>
							<input type="checkbox" id="getAddressCheck" onchange="getMemberInfo(this); updateInput();"> <label for="getAddressCheck">기본 배송지 불러오기</label>
							<input type="button" style="font-size:13px;font-weight:bold;color:white;background-color:darkorange;border-style:none;border-radius:4px;height:30px;" value="주소검색" onclick="daumAddr();"> 
						</div>
						<div id="addrInput-wrap">
							<div class="inputWrap">
								<span class="inputLabel">우편번호 </span>
								<input type="text" id="postCode" placeholder="우편번호" readonly>
							</div>
							<div class="inputWrap">
								<span class="inputLabel">주소 </span>
								<input type="text" id="roadAddress" placeholder="주소" readonly>
							</div>
							<div class="inputWrap">
								<span class="inputLabel">상세주소 </span>
								<input type="text" id="detailAddr" placeholder="상세주소" onchange="updateInput();" required>
							</div>
							<div class="inputWrap">
								<span class="inputLabel">연락처 </span>
								<input type="text" id="phoneBodyNum" placeholder="'-'를제외한 10~11자리 숫자를 입력해주세요." onchange="updateInput();" required>
							</div>
							<div class="inputWrap">
								<span class="inputLabel">배송 요청사항 </span>
								<select id="deliveryRequest" name="deliveryRequest" style="width:60%;" oninput="directInput();"> 
									<option value="" selected disabled style="display:none;">메시지를 선택해주세요.</option>
									<option value="안전하게 와주세요.">안전하게 와주세요.</option>
									<option value="배송전에 연락주세요.">배송전에 연락주세요.</option>
									<option value="집 앞에 놓아주세요.">집 앞에 놓아주세요.</option>
									<option value="directInput">직접 입력</option>
								</select>
								<div style="padding:12px;">
									<span class="inputLabel"></span>
									<input id="userInputRqt" required type="text" disabled style="width:90%;margin:0px auto;" placeholder="배송메시지 입력해주세요.">
								</div>
							</div>
							<div class="inputWrap" style="text-align:right;">
								<button type="button" style="font-size:13px;font-weight:bold;color:white;background-color:darkorange;border-style:none;border-radius:4px;height:30px;" onclick="registerAddr();">배송지 저장하기</button>
							</div>
						</div>
					</div>
					<div id="productInfo" class="distict" style=" background-color:rgb(255,253,244);">
						<div style="margin: 0px auto;border-bottom:1px solid #c0c0c0;padding-bottom:5px;"><span class="subTitleTxt" >구매상품 정보</span></div>
						<c:forEach items="${cList }" var="cart" varStatus="n" >
							<div class="oneCart row" style="margin: 0px auto;border-bottom:1px solid #c0c0c0; padding:9px;">
								<div class="pImg col-3" style="text-align:center;margin:auto;">
									<img src="${cart.product.mainImgRoot }" style="width:80px;height:70px;">
								</div>
								<div class="cartInfo col-6" style="text-align:center;">
									<div class="pName" style="margin:auto;padding:5px;font-size:14px;font-weight:bold;">
										<span class="brandName">[${cart.product.productBrand }]</span>
										<span class="pName">${cart.product.productName }</span>
									</div>
									<div class="cartPrice-wrap" style="margin:auto;">
											<span class="cartPrice">
												<fmt:formatNumber value="${cart.product.productPrice}" pattern="#,###"/> 
											</span>
											<span class='wonSymbol'>원</span>
											<span> * </span>
											<span class="pQty">
												${cart.productAmount }개
											</span>
									</div>
								</div>
								<div class="col-3" style="margin:auto;font-size:20px;font-weight:bold;"">
									<span class="cartPrice">
										<fmt:formatNumber value="${cart.product.productPrice * cart.productAmount }" pattern="#,###"/> 
									</span>
									<span class='wonSymbol'>원</span>
								</div>
							</div>
							<input type="hidden" class="calPrice" value="${cart.product.productPrice * cart.productAmount }">
						</c:forEach>
					</div>
					<div id="couponInfo" class="distict" style="border-bottom:1px solid #c0c0c0;">
						<div><span class="subTitleTxt">쿠폰 <span style="font-size:12px;">*중복 사용 불가합니다.</span></span></div>
						<button onclick="" type="button" style="font-size:13px;font-weight:bold;color:white;background-color:darkorange;border-style:none;border-radius:4px;height:30px;">쿠폰 선택</button>
						<select id="couponSelect" onchange="couponSelected(this);" >
								<option value="-1">쿠폰 선택</option>
							<c:forEach items="${couponList }" var="coupon" varStatus="n">
									<option value="${n.index }" >${coupon.couponName }</option>	
							</c:forEach>
						</select>
						<div id="couponInfo">
							<div>
								<span>쿠폰 정보</span>
							</div>
							<div>
								<span>최저주문액</span>
								<span id="priceCondition"></span>
							</div>
							<div>
								<span id="brandCondition">대상 브랜드</span>
							</div>
							<div>
								<span id="productCondition">대상 상품</span>
							</div>
						</div>
						
						<input type="text" placeholder="쿠폰적용" readonly onchange="calculatorCost();">
					</div>
					<div id="payMethod" class="distict" style="border-bottom:1px solid #c0c0c0;">
						<div><span class="subTitleTxt">결제 수단</span></div>
						
						<input type="radio" class="btn-check" name="paymentMethod" id="card" value="card" autocomplete="off" onchange="guideMenuVisible(this,0);">
						<label class="btn btn-outline-success" for="card"">신용카드<br><i class="fa-regular fa-credit-card"></i></label>
						
						<input type="radio" class="btn-check" name="paymentMethod" id="rBanking" value="trans" autocomplete="off" onchange="guideMenuVisible(this,1);">
						<label class="btn btn-outline-success" for="rBanking">계좌이체<br><i class="fa-solid fa-right-left"></i></label>
						
						<input type="radio" class="btn-check" name="paymentMethod" id="vBanking" value="vbank" autocomplete="off" onchange="guideMenuVisible(this,2);">
						<label class="btn btn-outline-success" for="vBanking">무통장입금<br><i class="fa-solid fa-won-sign"></i></label>
						
						<input type="radio" class="btn-check" name="paymentMethod" id="kakao" value="kakaopay" autocomplete="off" onchange="guideMenuVisible(this,3);">
						<label class="btn btn-outline-success" for="kakao">카카오페이<img src="/resources/image/kakaopay.png" width="50%" height="50%";></label>
						
						<input type="radio" class="btn-check" name="paymentMethod" id="naver" value="naverpay" autocomplete="off" onchange="guideMenuVisible(this,4);">
						<label class="btn btn-outline-success" for="naver">네이버페이<img src="/resources/image/naverpay.png"width="50%" heifht="50%"></label>
						
					</div>
					<div id="cardInfo" class="distict guideMenu"  style="border-bottom:1px solid #c0c0c0;width:80%;">
						<div id="card-guide" style="background-color:rgb(250,250,250);padding:20px;">
							<span class="subTitleTxt">신용카드 결제 안내</span><hr>
								<ul>
									<li>안내1</li>
									<li>안내2</li>
								</ul>
						</div>
					</div>
					<div id="rBankInfo" class="distict guideMenu" style="border-bottom:1px solid #c0c0c0;width:80%;">
						<div id="rBanking-guide" style="background-color:rgb(250,250,250);padding:20px;">
							<span class="subTitleTxt">실시간계좌이체 결제 안내</span><hr>
								<ul>
									<li>본인 명의의 은행 계좌를 이용해 결제하실 수 있습니다.</li>
									<li>은행 점검 시간에는 결제가 불가할 수 있습니다.</li>
								</ul>
						</div>
					</div>
					<div id="vBankInfo" class="distict guideMenu" style="border-bottom:1px solid #c0c0c0;width:80%;">
						<div id="vBanking-guide" style="background-color:rgb(250,250,250);padding:20px;">
							<span class="subTitleTxt">가상계좌 이체 안내</span><hr>
								<ul>
									<li>안내1</li>
									<li>안내2</li>
								</ul>
						</div>
					</div>
					<div id="kakaoInfo" class="distict guideMenu" style="border-bottom:1px solid #c0c0c0;width:80%;">
						<div id="kakaopay-guide" style="background-color:rgb(250,250,250);padding:20px;">
							<span class="subTitleTxt">카카오페이 안내</span><hr>
								<ul>
									<li>안내1</li>
									<li>안내2</li>
								</ul>
						</div>
					</div>
					<div id="naverInfo" class="distict guideMenu" style="border-bottom:1px solid #c0c0c0;width:80%;">
						<div id="naverpay-guide" style="background-color:rgb(250,250,250);padding:20px;">
							<span class="subTitleTxt">네이버페이 혜택 안내</span><hr>
								<ul>
									<li>네이버쇼핑을 통해 방문 시 1% 적립(그 외 0.2%)</li>
									<li>충전포인트로 결제 시 1.5% 적립 + 소득공제</li>
									<li>주문 변경 시 카드사 혜택 및 할부 적용 여부는 해당 카드사 정책에 따라 변경될 수 있습니다.</li>
								</ul>
						</div>
					</div>
			</div>
<!-- 스띠키 사이드			 -->
			<div class="col-4" style="height:600px;position:sticky;top:0;font-size:14px;vertical-align:middle;">
				<div class="order-side" style="height:80%;width:95%;margin:0px auto;padding:12px; border: 1px solid #c0c0c0;width:80%;text-align:left;">
					 <span style="font-size:16px;font-weight:bold;margin:auto;">주문 결제 금액</span>
					 <hr>
					 <div id="productsPrice-wrap" class="stickyInfo">
				 		<span >상품금액</span>
				 		<span class="stickyPriceTxt" style="float:right;">
					 		<span id="productsPrice"></span>
					 		<span class='wonSymbol'>원</span>
				 		</span>
					 </div>
					 <hr>
					 <div id="discountAmount-wrap" class="stickyInfo">
					 	<span>할인 금액</span>
					 	<span class="stickyPriceTxt" style="float:right;">
					 		<span id="discountAmount"></span>
					 		<span class='wonSymbol'>원</span>
					 	</span>
					 </div>
					 <div id="deleiveryFee-wrap" class="stickyInfo">
					 	<span>배송비</span>
					 	<span  class="stickyPriceTxt" style="float:right;">
					 		<span id="deleiveryFee"></span>
					 		<span class='wonSymbol'>원</span>
					 	</span>
					 </div>
					 <hr>
					 <div id="finalCost-wrap" class="stickyInfo" style="height:50px;">
					 	<span>최종 결제금액</span>
					 	<span class="stickyPriceTxt" style="float:right;">
					 		<span id=finalCost style="color:darkorange;font-weight:bold;font-size:26px;"></span>
					 		<span class='wonSymbol'>원</span>
					 	</span>
					 </div>
					 <hr>
					 <div id="agreement" style="height:105px;">
					 	<div  style="font-size:10px;">처리위탁 및 3자 제공 동의   <span style="float:right;">내용보기>></span></div>
					 	<div  style="font-size:10px;">결제대행서비스 이용 동의   <span style="float:right;">내용보기>></span></div>
					 	<hr>
					 	<span style="font-size:12px;line-height:2px;">
						 	<input id="agreeCheck" type="checkbox"">
					 		구매조건 및 이용약관에 동의하며 결제를 진행합니다.
					 	</span>
					 </div>
					 <div id="paymenteBtn" style="text-align:center;">
						 <button style="font-size:26px;font-weight:bold;color:white;background-color:darkorange;border-style:none;border-radius:4px;height:50px;width:90%;" onclick="clickPayBtn();">결제하기</button>
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
var IMP = window.IMP; // 생략 가능
IMP.init("imp46682011"); // 예: imp00000000
//KG이니시스에서 pay_method를 변경하면 된다.
//card,trans,vbank,kakaopay,naverpay
// IMP.request_pay(param, callback) 결제창 호출
function kginisis(){
	  //class가 btn_payment인 태그를 선택했을 때 작동한다.
		IMP.request_pay({
				    pg : 'html5_inicis', 
				    pay_method : paymentMethod,
				    merchant_uid : orderNo,
				    name : orderProductName /*상품명*/,
				    amount : finalCost /*상품 가격*/, 
				    buyer_email : memberEmail /*구매자 이메일*/,
				    buyer_name : ordererName,
				    buyer_tel : contactPhone/*구매자 연락처*/,
				    buyer_addr : address.replace(/,_/g," ")/*구매자 주소*/,
				    vbank_due : afterThreeDaysStr
				}, function(rsp) {
					var result = '';
				    if ( rsp.success ) {
				    	console.log(rsp);
				        var msg = '결제가 완료되었습니다.';
				        msg += '고유ID : ' + rsp.imp_uid;
				        msg += '상점 거래ID : ' + rsp.merchant_uid;
				        msg += '결제 금액 : ' + rsp.paid_amount;
				        msg += '카드 승인번호 : ' + rsp.apply_num;
				        $.ajax({
				            url: "/order/payment/completeCheck.strap", // 예: https://www.myservice.com/payments/complete
				            method: "POST",
				            data: {
				                "imp_uid": rsp.imp_uid,
				                "merchant_uid": rsp.merchant_uid,
				                "paid_amount":rsp.paid_amount,
				                "status":rsp.status,
				                "vBankDueDate":rsp.vbank_date,
				                "vBankHolder":rsp.vbank_holder,
				                "vBankName":rsp.vbank_name,
				                "vBankNum":rsp.vbank_num
				            },
				            success:function(result){
				            	 // 가맹점 서버 검증로직 후 
				            	 console.log(result);
				            	 switch(result){
				            	 case "success":
				            		 //결제완료 페이지 이동
				            		 location.href="/order/completeView.strap?merchant_uid="+orderNo;
				            		break;
				            	 case "vbankIssued":
				            		 //가상계좌 발급페이지 이동
				            		 location.href="/order/completeView.strap?merchant_uid="+orderNo;
				            		 break;
				            	 case "forgery":
				            		 //위변조 결제, 환불처리
				            		 break;
				            	 }
				            },
				            error:function(){}
				        });
				        
				    } else {
				        var msg = '결제에 실패하였습니다.';
				        msg += '에러내용 : ' + rsp.error_msg;
				    }
				    alert(msg);
				});
}

//주소API
function daumAddr() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var roadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 참고 항목 변수

            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if(data.buildingName !== '' && data.apartment === 'Y'){
               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if(extraRoadAddr !== ''){
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('postCode').value = data.zonecode;
            document.getElementById("roadAddress").value = roadAddr;
        }
    }).open();
}

//주소창: 회원정보 가져오기 // ajax가 아닌 세션에서 가져옴.
function getMemberInfo(check){
	var receiver = "";
	var postCode = document.querySelector("#postCode");
	var postroadAddress = document.querySelector("#roadAddress");
	var detailAddr = document.querySelector("#detailAddr");
	var addrArr = '${loginUser.memberAddress}'.split(",_");
	if(check.checked){
		if('${loginUser.memberAddress ne null}'){
			receiver.value = '${loginUser.memberName}';
			postCode.value = addrArr[0];
			postroadAddress.value = addrArr[1];
			detailAddr.value = addrArr[2];
		}
	}else{
		receiver.value="";
		postCode.value="";
		postroadAddress.value="";
		detailAddr.value ="";
	}
}
    
//배송지 등록
function registerAddr(){
	var postCode = document.querySelector("#postCode").value;
	var postroadAddress = document.querySelector("#roadAddress").value;
	var detailAddr = document.querySelector("#detailAddr").value;
	var memberAddress = postCode + ",_" + postroadAddress +",_"+ detailAddr;
	var memberId = '${loginUser.memberId}';
	
	$.ajax({
		url:"/member/modifyAddr.strap",
		data:{
			"memberId":memberId,
			"memberAddress":memberAddress
		},
		type:"post",
		success:function(result){
			if(result =="success"){
				alert("기본배송지로 등록되었습니다.");
			}else{
				
			}
		},
		error:function(){}
	});
}
/////배송요청 직접입력
function directInput(){
	if(document.querySelector("#deliveryRequest").value == "directInput"){
		document.querySelector("#userInputRqt").disabled = false;
	}else{
		document.querySelector("#userInputRqt").disabled = true;
	}
}


//////////////////ORDER_TBL에 넣을 값들 셋팅
var orderNo; // 주문번호 날짜+고유번호 셋팅
var payNo; // 아임포트에서 반환되는 결제번호

//금액계산
var productsPrice=0;
var discountAmount=0;
var couponUse = 'N';
var deliveryFee=0;
var finalCost=0;

calculatorCost();
//금액을 초기화할 함수, 할인값변경 시 초기화?
function calculatorCost(){
	var $productsPrice = document.querySelector("#productsPrice");
	var $discountAmount = document.querySelector("#discountAmount");
	var $deleiveryFee = document.querySelector("#deleiveryFee");
	var $finalCost = document.querySelector("#finalCost");
	
	productsPrice = getProductsPrice();
	discountAmount = 0;
	if(productsPrice > priceCondition){
		if(cMethod ="amount"){
			discountAmount = cAmount;
		}else if(cMethod =="ratio"){
			discountAmount = Math.floor((productsPrice * cRatio)/100);
		}
	}
	if(couponUse = 'N'){
		console.log("설마?");
		discountAmount = 0;
	}
	
	console.log(discountAmount);
	
// 	deliveryFee = 3000;
// 	if(productsPrice >= 30000){
// 		deliveryFee = 0;
// 	}
	finalCost = productsPrice - discountAmount + deliveryFee;
	
	$productsPrice.innerHTML = productsPrice.toLocaleString();
	$discountAmount.innerHTML = discountAmount.toLocaleString();
	$deleiveryFee.innerHTML = deliveryFee.toLocaleString();
	$finalCost.innerHTML = finalCost.toLocaleString();
	console.log(productsPrice);
	console.log(discountAmount);
	console.log(deliveryFee);
	console.log(finalCost);
}

//주문자 정보
//연락처와 주소는 입력하는 마지막값으로 초기화 되어야한다.
//고로 연락처와 주소의 input값이 변경되는 이벤트 발생 시 초기화.
var memberId = '${loginUser.memberId}';
var memberEmail = '${loginUser.memberEmail}';
var address = "";
var contactPhone ="";
function updateInput(){
	memberId ='${loginUser.memberId}';
	//주문테이블 저장용 주소는 형식을 만든다.
	address = "["+document.querySelector("#postCode").value+"]"+document.querySelector("#roadAddress").value+" "+document.querySelector("#detailAddr").value;
	contactPhone = document.querySelector("#phoneBodyNum").value;
}
var productBrand = '[${cList[0].product.productBrand}]'; //첫번째 상품.
var productName = '${cList[0].product.productName}';
var orderProductName = productBrand + productName;
if('${cList.size()}' > 1){
	orderProductName = orderProductName + ' 외';
}

var ordererName='${loginUser.memberName}';
var deliveryRequest = "";
var agreeYn;
var paymentMethod = "";//guideMenuVisible()에서 초기화
var cardKind;
///////////////////
var payComplete;
var payComplete;
var orderCancel;
var deliveryStart;
var deliveryComplete;
var deliveryNo;
var orderDate;
//////////////////ORDER_PRODUCT_TBL에 넣을 값들 셋팅
var orderNo = ""; // insertOrder()에서 초기화
var productNo;
var orderQty;

//쿠폰선택
var selectedIndex = selected.value;
var cMethod;
var cAmount;
var cRatio;
var priceCondition;
function couponSelected(selected){
	if(selected.value > -1){
		couponUse = 'Y';
		<c:forEach items="${couponList}" var="coupon" varStatus="n">
			if(selected.value == '${n.index}'){
				cMethod = '${coupon.discountMethod}';
				cAmount = '${coupon.discountAmount}';
				cRatio = '${coupon.discountRatio}';
				priceCondition = '${coupon.priceCondition}';
			}
		</c:forEach>
		calculatorCost();
	}
}

function getProductsPrice(){
	//총 상품가격 - 할인가격
	var totalPrice = 0;
	<c:forEach items="${cList }" var="cart" varStatus="n" >
		totalPrice += ${cart.product.productPrice * cart.productAmount};
	</c:forEach>
	return totalPrice;
}

//가이드메뉴 
function guideMenuVisible(thisCheck,n){
	if(thisCheck.checked){
		for(var i=0; i<5; i++){
			document.querySelectorAll(".guideMenu")[i].style.display="none";
		}
		document.querySelectorAll(".guideMenu")[n].style.display="block";
	}
	
	console.log(document.querySelectorAll("input[name='paymentMethod']")[n].value);
	paymentMethod = document.querySelectorAll("input[name='paymentMethod']")[n].value;
}
//결제버튼 온클릭
function clickPayBtn(){
	if(paymentMethod==''){
		alert('결제수단을 선택해주세요.')
	}else{
	}
		if(document.querySelector("#agreeCheck").checked){
			insertOrder(); 
			kginisis();
		}else{
			alert("구매조건 및 이용약관에 동의해주세요.");
		}
	}


//////////////결제버튼 클릭 후 order테이블에 주문 레코드 삽입 ajax insert
function insertOrder(){
	//보낼것.
	//deliveryFee,couponNo,discountAmount,finalCost,memberId,address,contactPhone,
	//deliveryRequest,agreeYn,paymentMethod,
	//주문 상품들 배열을 서버로 보내주어야함.
	orderNo = (new Date().getFullYear())+""+(new Date().getMonth()+1) +(new Date().getDate())+new Date().getTime()+Math.floor(Math.random()*99);
	
	
	var jsonArr = new Array();
	<c:forEach items="${cList }" var="cart" varStatus="n" >
		var jsonTemp = new Object();
// 		deliveryRequest = document.querySelector("#deliveryRequest").value;
		deliveryRequest = (document.querySelector("#deliveryRequest").value != "directInput")?document.querySelector("#deliveryRequest").value:document.querySelector("#userInputRqt").value;
		
		jsonTemp.orderNo = orderNo;
		jsonTemp.productNo =${cart.productNo};
		jsonTemp.orderQty =${cart.productAmount};
		jsonArr.push(jsonTemp);
	</c:forEach>
	jsonArr = JSON.stringify(jsonArr);
	$.ajax({
		url:"/order/record.strap",
		data:{
			"orderNo":orderNo,
			"jsonArr":jsonArr,
			"finalCost":finalCost,
			"deliveryFee":deliveryFee,
			"discountAmount":discountAmount,
			"memberId":memberId,
			"address":address,
			"contactPhone":contactPhone,
			"deliveryRequest":deliveryRequest,
			"agreeYn":agreeYn,
			"paymentMethod":paymentMethod,
			"cardKind":cardKind,
		},
		type:"post",
		success:function(result){
			if(result=="success"){
				alert("주문레코드insert완료");
			}else{
			}
		},
		error:function(){}
	});
}

var afterThreeDaysStr = getAfterThreeDay();
//가상계좌 입금 기한 출력 함수. +3일  YYYYMMDDHHMM
function getAfterThreeDay(){
	now = new Date();
	afterThreeDays = new Date(now.setDate(now.getDate()+3));
	var year = afterThreeDays.getFullYear();
	var month = afterThreeDays.getMonth()+1;
	month = (month<10)? '0'+ month : month;
	var day = afterThreeDays.getDate();
	day =  (day<10)? '0' + day : day;
	console.log(year +""+ month +""+ day + "2359");
	return year +""+ month +""+ day + "2359";
}


  
</script>
</body>
</html>
