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
	input{
		margin-bottom:20px;
	}
	.distict{
		padding:20px;
	}
	.guideMenu{
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
		<div id="contents" class="row" style="width:60%; margin:50px auto;">
			<div class="col-9">
				<div id="contents-header">
					<h1>주문 페이지</h1><hr>
					<div id="ordererInfo" class="row distict" style="border-bottom:1px solid #c0c0c0;">
						<div class="col">
							<div><h3>주문자 정보</h3></div>
							<span id="name">${loginUser.memberName }</span>/
							<span id="email">${loginUser.memberEmail }</span>
						</div>
					</div>
					<br>
					<div id="deliverInfo" class="distict" style="border-bottom:1px solid #c0c0c0;">
						<div><h3>배송지 정보</h3></div>
						<input type="button" value="주소검색" onclick="daumAddr();"> 
						<input type="text" id="postCode" placeholder="우편번호" readonly>  <br> <input type="text" id="roadAddress" placeholder="주소" readonly> <br>
						<input type="text" id="detailAddr" placeholder="상세주소" onchange="updateInput();" required> <br>
						<select id="phoneHeadNum" oninput="updateInput();">
							<option value="010">010</option>
							<option value="017">017</option>
							<option value="019">019</option>
							<option value="011">011</option>
							<option value="016">016</option>
						</select>
						<input type="text" id="phoneBodyNum" placeholder="'-'를제외한 7~8자리 숫자를 입력해주세요." onchange="updateInput();" required> <br>
						<input type="checkbox" onchange="getMemberInfo(this); updateInput();"> 회원 주소 불러오기
						<button type="button" onclick="registerAddr();">기본 배송지로 저장</button>
					</div>
					<div id="productInfo" class="distict" style="border-bottom:1px solid #c0c0c0;">
						<div><h3>구매상품 정보</h3></div>
						<c:forEach items="${cList }" var="cart" varStatus="n" >
							<div class="oneCart row" style="margin: 10px auto;">
								<div class="pImg col-3" style="text-align:center;">
									<img src="${cart.product.mainImgRoot }" style="width:80px;height:70px;">
								</div>
								<div class="cartInfo col-6">
									<div>
										<div class="pName">
											<span class="brandName">[${cart.product.productBrand }]</span>
											<span class="pName">${cart.product.productName }</span>
										</div>
									</div>
									<div>
										<div class="cartPrice-wrap">
												<span class='wonSymbol'>\</span>
												<span class="cartPrice">
													<fmt:formatNumber value="${cart.product.productPrice}" pattern="#,###"/> 
												</span>
												<span class="pQty">
													${cart.productAmount }개
												</span>
										</div>
									</div>
								</div>
								<div class="col-3">
									<span class='wonSymbol'>\</span>
									<span class="cartPrice">
										<fmt:formatNumber value="${cart.product.productPrice * cart.productAmount }" pattern="#,###"/> 
									</span>
								</div>
							</div>
							<input type="hidden" class="calPrice" value="${cart.product.productPrice * cart.productAmount }">
						</c:forEach>	
					</div>
					<div id="couponInfo" class="distict" style="border-bottom:1px solid #c0c0c0;">
						<div><h3>쿠폰</h3></div>
						<button type="button">쿠폰 선택</button>
						<input type="text" placeholder="쿠폰적용" readonly onchange="calculatorCost();">
					</div>
					<div id="payMethod" class="distict" style="border-bottom:1px solid #c0c0c0;">
						<div><h3>결제 수단</h3></div>
						
						<input type="radio" class="btn-check" name="paymentMethod" id="card" autocomplete="off" onchange="guideMenuVisible(this,0);">
						<label class="btn btn-outline-success" for="card">신용카드</label>
						
						<input type="radio" class="btn-check" name="paymentMethod" id="rBanking" autocomplete="off" onchange="guideMenuVisible(this,1);">
						<label class="btn btn-outline-success" for="rBanking">실시간 계좌이체</label>
						
						<input type="radio" class="btn-check" name="paymentMethod" id="vBanking" autocomplete="off" onchange="guideMenuVisible(this,2);">
						<label class="btn btn-outline-success" for="vBanking">가상계좌</label>
						
						<input type="radio" class="btn-check" name="paymentMethod" id="kakao" autocomplete="off" onchange="guideMenuVisible(this,3);">
						<label class="btn btn-outline-success" for="kakao">카카오페이</label>
						
						<input type="radio" class="btn-check" name="paymentMethod" id="naver" autocomplete="off" onchange="guideMenuVisible(this,4);">
						<label class="btn btn-outline-success" for="naver">네이버페이</label>
						
						
					</div>
					<div id="cardInfo" class="distict guideMenu"  style="border-bottom:1px solid #c0c0c0;width:80%;">
						<div><h3>신용카드 정보</h3></div>
						카드사선택
						<select>
							<option>KB국민카드</option>
							<option>신한카드</option>
							<option>현대카드</option>
							<option>삼성카드</option>
							<option>우리카드</option>
							<option>롯데카드</option>
							<option>NH농협카드</option>
							<option>하나카드</option>
							<option>비씨카드</option>
							<option>씨티카드</option>
						</select>
					</div>
					<div id="rBankInfo" class="distict guideMenu" style="border-bottom:1px solid #c0c0c0;width:80%;">
						<div id="rBanking-guide" style="background-color:rgb(230,230,230);padding:20px;">
							<h4>실시간계좌이체 결제 안내</h4>
								<ul>
									<li>본인 명의의 은행 계좌를 이용해 결제하실 수 있습니다.</li>
									<li>은행 점검 시간에는 결제가 불가할 수 있습니다.</li>
								</ul>
						</div>
					</div>
					<div id="vBankInfo" class="distict guideMenu" style="border-bottom:1px solid #c0c0c0;width:80%;">
						<div id="vBanking-guide" style="background-color:rgb(230,230,230);padding:20px;">
							<h4>가상계좌 이체 안내</h4>
								<ul>
									<li>안내1</li>
									<li>안내2</li>
								</ul>
						</div>
					</div>
					<div id="kakaoInfo" class="distict guideMenu" style="border-bottom:1px solid #c0c0c0;width:80%;">
						<div><h3>카카오페이 안내</h3></div>
					</div>
					<div id="naverInfo" class="distict guideMenu" style="border-bottom:1px solid #c0c0c0;width:80%;">
						<div id="rBanking-guide" style="background-color:rgb(230,230,230);padding:20px;">
							<h4>네이버페이 혜택 안내</h4>
								<ul>
									<li>네이버쇼핑을 통해 방문 시 1% 적립(그 외 0.2%)</li>
									<li>충전포인트로 결제 시 1.5% 적립 + 소득공제</li>
									<li>주문 변경 시 카드사 혜택 및 할부 적용 여부는 해당 카드사 정책에 따라 변경될 수 있습니다.</li>
								</ul>
						</div>
					</div>
				</div>
			</div>
			<div class="col-3" style="height:800px;position:sticky;top:0;">
				<div class="order-side" style="height:80%;width:95%;margin:100px auto; border: 1px solid #c0c0c0;width:80%;text-align:center;">
					 <h3>결제 금액</h3>
					 <div id="productsPrice-wrap">
					 	<span>상품금액</span>
					 	<div>
					 		<span class='wonSymbol'>\</span>
					 		<span id="productsPrice"></span>
					 	</div>
					 </div>
					 <div id="discountAmount-wrap">
					 	<span>할인 금액</span>
					 	<div>
					 		<span class='wonSymbol'>\</span>
					 		<span id="discountAmount"></span>
					 	</div>
					 </div>
					 <div id="deleiveryFee-wrap">
					 	<span>배송료</span>
					 	<div>
					 		<span class='wonSymbol'>\</span>
					 		<span id="deleiveryFee"></span>
					 	</div>
					 </div>
					 <div id="finalCost-wrap">
					 	<span>최종 결제금액</span>
					 	<div>
					 		<span class='wonSymbol'>\</span>
					 		<span id=finalCost style="color:darkorange;font-weight:bold;font-size:30px;"></span>
					 	</div>
					 </div>
					 <div id="agreement" >
					 	<div  style="font-size:12px;">처리위탁 및 3자 제공 동의>></div>
					 	<div  style="font-size:12px;">결제대행서비스 이용 동의>></div>
					 	<input type="checkbox"">
					 	<span>구매조건 및 이용약관에 동의하며 결제를 진행합니다.</span>
					 </div>
					 <div id="paymenteBtn">
					 	<button>결제하기</button>
						 <button onclick="kakaoPay()">카카오페이</button>
						 <button onclick="kginisis()">kg이니시스(웹표준)</button>
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
	//카카오 결제 API
	// IMP.request_pay(param, callback) 결제창 호출
	function kakaoPay(){
	IMP.request_pay({
	    pg : 'kakaopay', //pg사 선택 (kakao, kakaopay 둘다 가능)
	    pay_method: 'card',
	    merchant_uid : 'merchant_' + new Date().getTime(), //주문번호
	    name : 'Bunddeuk', // 상품명
	    amount : "1000",
	    //customer_uid 파라메터가 있어야 빌링키 발급을 시도함
	    customer_uid : "2210180001",
	    buyer_email : "mbk1991@naver.com",
	    buyer_name : "일용자",
	    buyer_tel : "01012341234",
	    buyer_addr : "서울시 강남구",
	}, function(rsp) { //callback
	    if ( rsp.success ) {
	      console.log('빌링키 발급 성공', rsp)
	      //빌링키 발급이 완료되었으므로, 서버에 결제 요청
	      alert('예약 결제가 완료되었습니다!');
	    } else {
	      var msg = '결제에 실패하였습니다.\n';
	      msg += rsp.error_msg;
	      alert(msg);
	      return false;
	    }
	    $("#final-support-submit").submit();
	});
	}
function kginisis(){
	  //class가 btn_payment인 태그를 선택했을 때 작동한다.
		IMP.request_pay({
				    pg : 'html5_inicis', 
				    pay_method : 'card',
				    merchant_uid : 'merchant_' + new Date().getTime(),
				    name : '주문명:결제테스트'/*상품명*/,
				    amount : 1000/*상품 가격*/, 
				    buyer_email : 'iamport@siot.do'/*구매자 이메일*/,
				    buyer_name : '구매자이름',
				    buyer_tel : '010-1234-5678'/*구매자 연락처*/,
				    buyer_addr : '서울특별시 강남구 삼성동'/*구매자 주소*/,
				    buyer_postcode : '123-456'/*구매자 우편번호*/
				}, function(rsp) {
					var result = '';
				    if ( rsp.success ) {
				        var msg = '결제가 완료되었습니다.';
				        msg += '고유ID : ' + rsp.imp_uid;
				        msg += '상점 거래ID : ' + rsp.merchant_uid;
				        msg += '결제 금액 : ' + rsp.paid_amount;
				        msg += '카드 승인번호 : ' + rsp.apply_num;
				        result ='0';
				    } else {
				        var msg = '결제에 실패하였습니다.';
				        msg += '에러내용 : ' + rsp.error_msg;
				        result ='1';
				    }
				    if(result=='0') {
				    	location.href= $.getContextPath()+"/Cart/Success";
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

//주소창: 회원정보 가져오기
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

//////////////////ORDER_TBL에 넣을 값들 셋팅
var orderNo; // 주문번호 날짜+고유번호 셋팅
var payNo; // 아임포트에서 반환되는 결제번호
var couponNo = 0;

//금액계산
var productsPrice=0;
var discountAmount=0;
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
	deliveryFee = 3000;
	if(productsPrice >= 30000){
		deliveryFee = 0;
	}
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
var memberId;
var address;
var contactPhone;
function updateInput(){
	memberId ='${loginUser.memberId}';
	address = document.querySelector("#postCode").value+",_"+document.querySelector("#roadAddress").value+",_"+document.querySelector("#detailAddr").value;
	contactPhone = document.querySelector("#phoneHeadNum").value + document.querySelector("#phoneBodyNum").value;
	console.log(address);
	console.log(memberId);
	console.log(contactPhone);
}




var deliveryRequest;
var agreeYn;
var paymentMethod;
var cardKind;
var monthlyPay;
var bankKind;
var bankPayerName;
//////////////////OrderProduct에 담을 값
var orderNo;
var productNo;
var orderQty; 
///////////////////
var payComplete;
var payComplete;
var orderCancel;
var orderBack;
var deliveryStart;
var deliveryComplete;
var deliveryNo;
var orderDate;
//////////////////ORDER_PRODUCT_TBL에 넣을 값들 셋팅
var orderNo;
var productNo;
var orderQty;


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
}

</script>
</body>
</html>
