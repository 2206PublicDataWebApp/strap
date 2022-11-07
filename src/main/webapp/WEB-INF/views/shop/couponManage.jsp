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
			<div>쿠폰 관리</div>
			<div>
				<button onclick="location.href='/admin/coupon/registerView.strap';">쿠폰 등록</button>
			
			</div>
			<div>
				<table>
					<tr>
						<th>쿠폰번호</th>
						<th>쿠폰이름</th>
						<th>쿠폰설명</th>
						<th>최저주문액</th>
						<th>대상 브랜드</th>
						<th>대상 상품</th>
						<th>유효기간(일)</th>
						<th>쿠폰 등록일</th>
						<th>쿠폰 이미지</th>
						<th>쿠폰 수정</th>
						<th>쿠폰 삭제</th>
					</tr>
					<c:forEach items="${couponList}" var="coupon">
						<tr>
							<th>${coupon.couponNo }</th>
							<th>${coupon.couponName }</th>
							<th>${coupon.couponDesc }</th>
							<th>${coupon.priceCondition }</th>
							<th>${coupon.brandCondition }</th>
							<th>${coupon.productCondition }</th>
							<th>${coupon.couponPeriod }</th>
							<th>${coupon.couponRegiDate }</th>
							<th>${coupon.couponImgRoot }</th>
							<th>수정▷</th>
							<th>삭제▷</th>
						</tr>
					</c:forEach>
				</table>
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
</body>
</html>
