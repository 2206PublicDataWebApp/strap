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
			<div class="col-9" style="height:2000px;">
				<div id="contents-header">
					<h1>주문 페이지</h1><hr>
					<div id="ordererInfo" class="row" style="border-bottom:1px solid #c0c0c0;">
						<div class="col">
							<div><h3>주문자 정보</h3></div>
							<span id="name">${loginUser.memberName }</span>/
							<span id="email">${loginUser.memberEmail }</span>
						</div>
					</div>
					<div id="deliverInfo" style="border-bottom:1px solid #c0c0c0;">
						<div><h3>배송지 정보</h3></div>
						<input type="text" id="receiver" placeholder="수령인 이름" required> <input type="button" value="주소검색" onclick="daumAddr();"> <br>
						<input type="text" id="postCode" placeholder="우편번호" readonly> <input type="text" id="roadAddress" placeholder="주소" readonly> <br>
						<input type="text" id="detailAddr" placeholder="상세주소"> <br>
						<select id="phoneHeadNum">
							<option value="010">010</option>
							<option value="017">017</option>
							<option value="019">019</option>
							<option value="011">011</option>
							<option value="016">016</option>
						</select>
						<input type="text" placeholder="'-'를제외한 7~8자리 숫자를 입력해주세요."> <br>
						<input type="checkbox" onchange="getMemberInfo(this);"> 회원 주소 불러오기
						<button type="button" onclick="registerAddr();">기본 배송지로 저장</button>
					</div>
					<div id="productInfo" style="border-bottom:1px solid #c0c0c0;">
						<div><h3>구매상품 정보</h3></div>
					</div>
					<div id="couponInfo" style="border-bottom:1px solid #c0c0c0;">
						<div><h3>쿠폰</h3></div>
						<button type="button">쿠폰 선택</button>
						<input type="text" placeholder="쿠폰적용" readonly>
					</div>
					<div id="payMethod" style="border-bottom:1px solid #c0c0c0;">
						<div><h3>결제 수단</h3></div>
						<button type="button">신용카드</button>
						<button type="button">실시간 계좌이체</button>
						<button type="button">가상계좌</button>
						<button type="button">카카오페이</button>
						<button type="button">네이버페이</button>
					</div>
					<div id="cardInfo" style="border-bottom:1px solid #c0c0c0;">
						<div><h3>신용카드 정보</h3></div>
					</div>
					<div id="bankInfo" style="border-bottom:1px solid #c0c0c0;">
						<div><h3>은행 정보</h3></div>
					</div>
					<div id="kakaoInfo" style="border-bottom:1px solid #c0c0c0;">
						<div><h3>카카오페이 안내</h3></div>
					</div>
				</div>
			</div>
			<div class="col-3"  style="height:500px;position:sticky;top:0;">
				<div class="order-side" style="height:80%;width:95%;margin:100px auto; border: 1px solid #c0c0c0;text-align:center;">
					 <h3>결제 금액</h3>
					 <div id="productsPrice">
					 	<span>상품금액</span>
					 	<div>0000원</div>
					 </div>
					 <div id="discountAmount">
					 	<span>할인 금액</span>
					 	<div>0원</div>
					 </div>
					 <div id="finalPrice">
					 	<span>최종 결제금액</span>
					 	<div>0000원</div>
					 </div>
					 <div id="agreement">
					 	<div>처리위탁 및 3자 제공 동의>></div>
					 	<div>결제대행서비스 이용 동의>></div>
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
                
                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }

//주소창: 회원정보 가져오기
function getMemberInfo(check){
	var receiver = document.querySelector("#receiver");
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
	var receiver = document.querySelector("#receiver").value;
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

</script>
</body>
</html>
