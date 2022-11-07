<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
		</div>
		<div class="contents-side col">
			<div>쿠폰 등록</div>
			<div> 
				<form id="registerCouponForm" action="/admin/coupon.register.strap" method="post" enctype="multipart/form-data">
					<div>
						<span>쿠폰이름: </span> 
						<input type="text" name="couponName" placeholder="쿠폰이름" required>
					</div>
					<div>
						<span>쿠폰설명: </span>
						<textarea name="couponDesc"  placeholder="쿠폰설명" required></textarea>
					</div>
					<div>
						<span>할인방식: </span>
						<input type="radio" name="method" onchecked="choiceMethod();">정액할인
						<select name ="discountAmount">
							<option value="1000">1,000원</option>
							<option value="2000">2,000원</option>
							<option value="3000">3,000원</option>
							<option value="5000">5,000원</option>
							<option value="10000">10,000원</option>
							<option value="15000">15,000원</option>
							<option value="30000">30,000원</option>
						</select>
						<input type="radio" name="method">정률할인
						<select name = "discountRatio">
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
							<option value="10000">10,000원</option>
							<option value="20000">20,000원</option>
							<option value="30000">30,000원</option>
							<option value="50000">50,000원</option>
							<option value="100000">100,000원</option>
							<option value="150000">150,000원</option>
						</select>
					</div>
					<div>
						<span>대상 브랜드명: </span>
						<input type="text" name="brandCondition" placeholder="대상 브랜드명">
					</div>
					<div>
						<span>대상 제품명: </span>
						<input type="text" name="productCondition" placeholder="대상 제품명">
					</div>
					<div>
						<span>쿠폰유효기간(일): </span>
						<select name = "couponPeriod">
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
						<input type="file" name="couponImg">
					</div>
					<div>
						<input type="submit" value="쿠폰 등록">
					</div>
				</form>
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
	
	
}
</script>
</body>
</html>
