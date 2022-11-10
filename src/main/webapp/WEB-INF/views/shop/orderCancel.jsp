<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- CDN -->
<!-- 부트스트랩 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" />
<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- css -->
<link rel="stylesheet" type="text/css" href="/resources/css/common.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"/>
</head>
<style>
	input{
		margin:10px;
	}
	input[type="radio"]{
		width:20px;
		height:20px;
	}
</style>
<body>
<div id="childHeader">
	<span style="font-weight:bold;">※취소사유</span>
	<hr>
</div>
<div id="childContents">
	<div><label><input checked type="radio" name="reason" onchange="lockInput(this);" value="상품을 잘못 구매했어요."> 상품을 잘못 구매했어요.</label></div>
	<div><label><input type="radio" name="reason" onchange="lockInput(this);" value="옵션을 변경해서 다시 구매할게요."> 옵션을 변경해서 다시 구매할게요.</label></div>
	<div><label><input type="radio" name="reason" onchange="lockInput(this);" value="더 조건이 좋은 상품을 찾았어요."> 더 조건이 좋은 상품을 찾았어요.</label></div>
	<div><label><input type="radio" name="reason" onchange="lockInput(this);" value="상품 정보가 잘못됐어요."> 상품 정보가 잘못됐어요.</label></div>
	<div><label><input type="radio" name="reason" onchange="lockInput(this);" value="구매의사가 없어졌어요."> 구매의사가 없어졌어요.</label></div>
	<div><label><input type="radio" name="reason" id="directInputReason" onchange="inputReason();"> 직접 입력</label></div>
	<div style="padding:5px;border:1px solid darkorange; border-radius:2px;"><input id="inputReason" style="border-style:none;padding:4px;width:90%;" onblur="valueSet(this);"; disabled required type="text" placeholder="취소사유를 입력해주세요."></div>
</div>
<br>
<div id="childFooter" >
	<span style="font-weight:bold;">※취소 안내사항</span>
	<hr>
	<ul style="font-size:14px;">
		<li>취소는 결제 후 7일 이내에 가능합니다.</li>
		<li>가상결제 취소는 구현중으로 관리자 문의 부탁드립니다.</li>
	</ul>
	<div id="orderComBtn" style="text-align:center;">
				<button style="font-size:16px;font-weight:bold;color:darkorange;background-color:white;border: 2px solid darkorange;border-radius:4px;height:30px;width:45%;" onclick="window.close();">취소</button>
				<button style="font-size:16px;font-weight:bold;color:white;background-color:darkorange;border: 2px solid darkorange;border-radius:4px;height:30px;width:45%;" onclick="cancelPay();">결제취소</button>
	</div>
</div>
</body>
<script>
var reason = "상품을 잘못 구매했어요.";
//사유 직접 입력
function inputReason(){
	if(document.querySelector("#inputReason").disabled == true){
		document.querySelector("#inputReason").disabled = false;
		document.querySelector("#inputReason").focus();
	}else{
		document.querySelector("#inputReason").disabled = true;
	}
}
//직접입력 창 잠금 및 값 셋팅
function lockInput(thisInput){
	document.querySelector("#inputReason").disabled = true;
	reason = thisInput.value;
	console.log(reason);
}
function valueSet(thisInput){
	reason = thisInput.value; 
	console.log(reason);
}

//결제취소
function cancelPay() {
  var orderNo = window.opener.document.querySelector("#thisOrderNo").innerText;
  var couponNo = window.opener.document.querySelector("#orderCouponNo").value;
  
  console.log(orderNo +"/"+ reason);
  
  $.ajax({
	  url:"/imp/payment/cancel",
	  data:{
		  "merchant_uid":orderNo,
		  "reason":reason,
		  "couponNo":couponNo
	  },
	  type:"post",
	  success:function(result){
		  if(result == "success"){
			  alert("결제가 취소되었습니다.");
			  window.close();
		  }else if(result == "fail"){
			  alert("이미 취소된 주문입니다.");	
			  window.close();
		  }
		  
	  },
	  error:function(){}
  });
  
	
//   jQuery.ajax({
//     "url": "#", // 예: http://www.myservice.com/payments/cancel
//     "type": "POST",
//     "contentType": "application/json",
//     "data": JSON.stringify({
//       "merchant_uid": "{결제건의 주문번호}", // 예: ORD20180131-0000011
//       "cancel_request_amount": 2000, // 환불금액
//       "reason": "테스트 결제 환불" // 환불사유
//       "refund_holder": "홍길동", // [가상계좌 환불시 필수입력] 환불 수령계좌 예금주
//       "refund_bank": "88" // [가상계좌 환불시 필수입력] 환불 수령계좌 은행코드(예: KG이니시스의 경우 신한은행은 88번)
//       "refund_account": "56211105948400" // [가상계좌 환불시 필수입력] 환불 수령계좌 번호
//     }),
//     "dataType": "json"
//   });
}

</script>
</html>