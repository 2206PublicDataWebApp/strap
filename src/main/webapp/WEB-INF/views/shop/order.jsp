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
							<span id="name">일용자</span>/
							<span id="phone">01000000000</span>/
							<span id="email">khuser01@naver.com</span>
						</div>
						<div class="col">
							<button>변경</button>
						</div>
					</div>
					<div id="deliverInfo">
						<div><h3>배송지 정보</h3></div>
						<input type="text" placeholder="일용자"> <input type="button" value="주소검색"> <br>
						<input type="text" placeholder="우편번호" readonly> <input type="text" placeholder="주소" readonly> <br>
						<input type="text" placeholder="상세주소"> <br>
						<select>
							<option>010</option>
							<option>017</option>
							<option>019</option>
							<option>011</option>
							<option>016</option>
						</select>
						<input type="text" placeholder="'-'를제외한 7~8자리 숫자를 입력해주세요."> <br>
						<input type="checkbox"> 회원 주소 불러오기
					</div>
					<div id="productInfo">
						<div><h3>구매상품 정보</h3>
						
						</div>
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
<!-- 						 <button onclick="kakaoPay()">카카오페이</button> -->
<!-- 						 <button onclick="kginisis()">kg이니시스(웹표준)</button> -->
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
  </script>
</body>
</html>
