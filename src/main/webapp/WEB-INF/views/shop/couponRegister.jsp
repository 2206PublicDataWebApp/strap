<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
<title>스트랩 : 쿠폰등록</title>
<!-- CDN -->
<!-- 부트스트랩 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" />
<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- css -->
<link rel="stylesheet" type="text/css" href="/resources/css/common.css">
</head>
<style>
	div span{
		display:inline-block;
		width:150px;
	}
	input[type="text"]{
		width: 300px;
	}
	textarea{
		width: 300px;
		height: 200px;
	}
	.rangeTxt{
		border-style:none;
		
	}
	
	input[type="text"]{
		padding:7px;
		width:90%;
		margin-bottom:7px;
	}
	#previewArea{
		overflow-y:scroll;
	}
		#previewArea::-webkit-scrollbar{
			display:none;
		}
	#productRegisterArea{
		overflow-y:scroll;
	}
		#productRegisterArea::-webkit-scrollbar{
			display:none;
		}
	input[type="file"]{
		margin-bottom:7px;
	}
	#previewArea img{
		border:1px solid gray;
	}
	#infoImg-wrap img{
		border-style:none;
	}
	.imgLabel{
		font-size:12px;
		font-weight:bold;
	}	
	h6{
		font-weight:bold;
	}
	label{
		color:gray;
	}
	img[name="imgFile"]{
		display:none;
	}
	
</style>
<body>
<div class="wrap container">
<!-- 헤더&메뉴바 -->
	<div id="header" class="row">
		<div class="col">
		</div>
	</div>
<!-- 컨텐츠 -->
	<div id="contents" class="row">
		<div class="sidebar col-3" >
				<jsp:include page="/WEB-INF/views/common/sideBarAdmin.jsp"></jsp:include>
		</div>`
		<div class="contents-side col">
			<div id="title">
					<h3>쿠폰등록</h3><hr>
				</div>
			<div> 
			<div style="border:1px solid gray; border-radius:10px; padding:12px;width:60%;margin:auto;">
				<form id="registerCouponForm" action="/admin/coupon.register.strap" method="post" enctype="multipart/form-data">
					<div>
						<input type="text" name="couponName"  onkeyup="countText(this,30);" placeholder="쿠폰이름" required>
						<div style="text-align:left;font-size:14px;padding:5px;display:inline-block;">
							<span id="inputCount">(0/30)</span>
						</div>
					</div>
					<div>
						<textarea name="couponDesc"  onkeyup="countText(this,50);" placeholder="쿠폰설명" required style=width:90%;></textarea>
						<div style="text-align:left;font-size:14px;padding:5px;display:inline-block;">
							<span id="inputCount">(0/50)</span>
						</div>
					</div>
					<div>
						<span>할인방식: </span>
						<label><input type="radio" name="discountMethod" value="amount"onchange="choiceMethod(this);">정액할인</label>
						<select name ="discountAmount"  value="0" disabled>
							<option value="1000">1,000원</option>
							<option value="2000">2,000원</option>
							<option value="3000">3,000원</option>
							<option value="5000">5,000원</option>
							<option value="10000">10,000원</option>
							<option value="15000">15,000원</option>
							<option value="30000">30,000원</option>
						</select>
						<label><input type="radio" name="discountMethod" value="ratio" onchange="choiceMethod(this);">정률할인</label>
						<select name = "discountRatio" value="0" disabled>
							<option value="5"> 5%</option>
							<option value="10"> 10%</option>
							<option value="15"> 15%</option>
							<option value="20"> 20%</option>
							<option value="25"> 25%</option>
							<option value="30"> 30%</option>
							<option value="50"> 50%</option>
						</select>
					</div>
					<div>
					</div>
					<div>
						<span>최저주문금액: </span>
						<select name ="priceCondition">
							<option value="10000" selected>10,000원</option>
							<option value="20000">20,000원</option>
							<option value="30000">30,000원</option>
							<option value="50000">50,000원</option>
							<option value="100000">100,000원</option>
							<option value="150000">150,000원</option>
						</select>
					</div>
					<div>
						<span>대상 브랜드명: </span>
						<input type="text" name="brandCondition" placeholder="대상 브랜드명" list="brandSelect"  value="" required>
						<datalist id="brandSelect" name="brandCondition">
							<option value="None" >미선택</option>
						<c:forEach items="${productBrands }" var="product">
							<option value="${product.productBrand }">${product.productBrand }</option>
						</c:forEach>
						</datalist>
						
						
					</div>
					<div>
						<span>대상 제품명: </span>
						<input type="text" name="productCondition" placeholder="대상 제품명" list="nameSelect"  value="" required>
						<datalist id="nameSelect" name="nameSelect">
							<option value="None" >미선택</option>
						<c:forEach items="${productNames }" var="product">
							<option value="${product.productName }">${product.productName }</option>
						</c:forEach>
						</datalist>
					</div>
					<div>
						<span>쿠폰유효기간(일): </span>
						<select name = "couponPeriod" required>
							<option value="1">1일</option>
							<option value="3">3일</option>
							<option value="7">7일</option>
							<option value="30">30일</option>
							<option value="60">60일</option>
							<option value="90">90일</option>
						</select>
					</div>
					<div>
						<span>쿠폰이미지: </span>
						<input type="file" name="couponImg" required onchange="tempImgSave(this,'mainImg');">
						<div style="width:80%;height:120px;">
							<img  id="previewCoupon" width="100%" height="100%">
						</div>
					</div>
					<div>
						<input type="submit" value="쿠폰 등록" style="width:150px;font-weight:bold;color:white;background-color:darkorange;border-style:none;border-radius:4px;">
					</div>
				</form>
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
//할인방식 선택
function choiceMethod(thisRadio){
	console.log(thisRadio.checked);
	console.log(thisRadio.parentElement.nextElementSibling.disabled);
	
	if(thisRadio.checked){
		document.querySelectorAll("select:not(disabled)")[0].disabled=true;
		document.querySelectorAll("select:not(disabled)")[1].disabled=true;
		thisRadio.parentElement.nextElementSibling.disabled = false;
	}else{
	}
}

var tempFolderName =  "temp_"+Math.floor(Math.random()*1000)+""+new Date().getSeconds();
function tempImgSave(thisInput,previewId){
	//formData를 이용하여 파일 전송
	var formData = new FormData();
	var tempName = "img_"+Math.floor(Math.random()*1000)+""+new Date().getSeconds();
	formData.append("tempImg",thisInput.files[0]);
	formData.append("tempFolderName",tempFolderName);
	formData.append("tempName",tempName);
	$.ajax({
		url:"/admin/coupon/temp.strap",
		data: formData,
		type:"post",
		processData: false,
		contentType: false,
		success:function(result){
			console.log(result);
			document.querySelector("#previewCoupon").src = result.tempImgPath;
		},
		error:function(){}
	});
}

//유효성
//텍스트 체크
function countText(thisInput,limit){
	var count = thisInput.value.length;
	if(count>limit){
		thisInput.value=thisInput.value.substring(0,limit);
		count=limit;		
	}
	var text = "("+count+"/"+limit+")"
	thisInput.nextElementSibling.childNodes[1].innerText = text;
}

//숫자 체크
function checkNumber(thisInput){
	var regExNum = /[0-9]/;
	if(!regExNum.test(thisInput.value)){
		thisInput.value = "";
		thisInput.focus();
	}
}

</script>
</body>
</html>
