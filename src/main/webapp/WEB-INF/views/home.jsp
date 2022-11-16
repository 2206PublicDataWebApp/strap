<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
<html>
<head>
<link rel="icon" href="/resources/image/s.png">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>스트랩</title>
<!-- CDN -->
<!-- 부트스트랩 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" />
<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- css -->
<link rel="stylesheet" type="text/css" href="/resources/css/common.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"/>
<style>
.carousel-inner >.carousel-item >img {
   top: 0;
   left: 0;
   height: 300px;
   min-width: 100%;
   min-height: 300px;
}

.carousel-inner img{
   top: 0;
   left: 0;
   height: 300px;
   min-width: 100%;
   min-height: 300px;
}
.mainView{
	margin-bottom:20px;
}
.oneView{
	height:400px;
	width :350px;
	margin: 0 10px;
	border:1px solid #c0c0c0;
	border-radius:10px;
}
.star{
	color:darkorange;
	font-size:20px;
}
.rContents{
	  overflow: hidden;
	  text-overflow: ellipsis;
	  white-space: nowrap;
	  width: 280px;
	  height: 20px;
	  margin:auto;
}

#pTitle,#cTitle{
	text-align:center;
	font-weight:bold;
	font-size:25px;
	margin:10px;
}

#bTitle {
	margin-top: 15px;
	background-color: #F8F8F8;
	border-bottom: 1px solid #ccc;
	padding: 1rem !important;
}

#likeBtn-img {
	color: blue;
	font-size: 24px;
}

#likeBtn-count {
	color: blue;
	font-weight: bold;
	margin-right: 10px;
}

#rank {
	background: white;
    text-align: center;
    font-weight: bold;
	width: 50px;
	height: 48px;
    float: left;
    margin-right: 15px;
    transform: translate(-12px, -10px);
    padding: 10px 15px;
    border-radius: 25%;
    box-shadow: 1px 1px 3px 3px #ccc;
}

div > span > a > p > img { display: none; }

.pImg,.pBrandName:hover{
	cursor:pointer;
}
#cWrap{width: 1110px; margin: auto;}
#pWrap{width: 1110px; margin: auto; margin-bottom: 50px;}
</style>
</head>
<body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<div class="wrap container" style="padding: 0px;">
<!-- 헤더&메뉴바 -->
   <div id="header" class="row">
      <div class="col">
         <jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
      </div>
   </div>
	<!-- 캐러셀 -->
	<div class="contents-side col" style="width: 100%; padding:0px; margin-top: -16px;">
		<div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
			<div class="carousel-indicators">
				<c:forEach items="${bnList }" var="mainBnBtn" varStatus="bnBtn">
					<button type="button" data-bs-target="#carouselExampleIndicators"
						data-bs-slide-to="${bnBtn.index }" <c:if test="${bnBtn.index == 0 }">class="active" aria-current="true"</c:if>
						aria-label="Slide ${bnBtn.index+1 }"></button>
				</c:forEach>
			</div>
			<div class="carousel-inner">
				<c:forEach items="${bnList }" var="mainBn" varStatus="bn">
					<div class="carousel-item <c:if test='${bn.index == 0 }'>active</c:if>" data-bs-interval="3500">
						<c:choose >
						 	<c:when test="${mainBn.bannerTitle eq 'wellcome' }">
						 		<img onclick="getCoupon('${loginUser.memberId}',10);" src="/resources/bnuploadFiles/${mainBn.bannerFileRename }" class="d-block w-100" alt="${mainBn.bannerTitle }">
						 	</c:when>
						 	<c:when test="${mainBn.bannerTitle eq 'tigerCoupon' }">
						 		<img onclick="getCoupon('${loginUser.memberId}',21);" src="/resources/bnuploadFiles/${mainBn.bannerFileRename }" class="d-block w-100" alt="${mainBn.bannerTitle }">
						 	</c:when>
						 	<c:otherwise>
						 		<img src="/resources/bnuploadFiles/${mainBn.bannerFileRename }" class="d-block w-100" alt="${mainBn.bannerTitle }">
						 	</c:otherwise>
						</c:choose>
					</div>
				</c:forEach>
			</div>
			<button class="carousel-control-prev" type="button"
				data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Previous</span>
			</button>
			<button class="carousel-control-next" type="button"
				data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Next</span>
			</button>
		</div>
	</div>
<!-- 컨텐츠 -->
	<div id="contents" class="contents row">
		<!-- 캐러셀 -->
		<div class="contents-side col">
			<div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
				<div class="carousel-indicators">
					<c:forEach items="${bnList }" var="mainBnBtn" varStatus="bnBtn">
						<button type="button" data-bs-target="#carouselExampleIndicators"
							data-bs-slide-to="${bnBtn.index }" <c:if test="${bnBtn.index == 0 }">class="active" aria-current="true"</c:if>
							aria-label="Slide ${bnBtn.index+1 }"></button>
					</c:forEach>
				</div>
				<div class="carousel-inner">
					<c:forEach items="${bnList }" var="mainBn" varStatus="bn">
						<div class="carousel-item <c:if test='${bn.index == 0 }'>active</c:if>" data-bs-interval="3500">
							<c:choose >
							 	<c:when test="${mainBn.bannerTitle eq 'wellcomeCoupon' }">
							 		<img onclick="getCoupon('${loginUser.memberId}',10);" src="/resources/bnuploadFiles/${mainBn.bannerFileRename }" class="d-block w-100" alt="${mainBn.bannerTitle }">
							 	</c:when>
							 	<c:when test="${mainBn.bannerTitle eq 'tigerCoupon' }">
							 		<img onclick="getCoupon('${loginUser.memberId}',21);" src="/resources/bnuploadFiles/${mainBn.bannerFileRename }" class="d-block w-100" alt="${mainBn.bannerTitle }">
							 	</c:when>
							 	<c:otherwise>
							 		<img src="/resources/bnuploadFiles/${mainBn.bannerFileRename }" class="d-block w-100" alt="${mainBn.bannerTitle }">
							 	</c:otherwise>
							</c:choose>
						</div>
					</c:forEach>
				</div>
				<button class="carousel-control-prev" type="button"
					data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
					<span class="carousel-control-prev-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Previous</span>
				</button>
				<button class="carousel-control-next" type="button"
					data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
					<span class="carousel-control-next-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Next</span>
				</button>
			</div>
		</div>
		<!-- 베스트 서비스 후기 -->
		<div id="popularComunityView" class="mainView">
			<div id="cTitle" style="margin-top: 35px;">Best매칭후기</div>
			<div id="cWrap" class="row justify-content-md-center">
			<c:forEach items="${bList }" var="Board" varStatus="i">
				<div class="col-3 oneView" style="width:300px;">
					<div class="position-relative" id="bTitle">
							<div id="rank">${i.count }</div>
				    		<div style="width: 187px; overflow: hidden; text-overflow: ellipsis; 
				    		 transform: translate(-16px, 1px); white-space: nowrap;">${Board.boardTitle }</div>
						<div class="position-absolute top-50 end-0 translate-middle-y" id="likeBtn-count"> 
						<i class="fa-regular fa-thumbs-up" id="likeBtn-img"></i>
							${Board.boardLikeIt }
						</div>
					</div>
					<div style="margin-top: 15px;">
						<span>
							<a style="cursor:pointer;" href="/board/detail.strap?boardNo=${Board.boardNo }&page=${currentPage }">${Board.boardContents }</a>
						</span>
					</div>
				</div>
			</c:forEach>
			</div>
		</div>
		
		<!-- 베스트 상품 및 후기 -->
		<div id="popularProductReview" class="mainView" style="text-align:center;">
			<div id="pTitle" >Best보충제</div>
			<div id="pWrap" class="row justify-content-md-center">
				<c:forEach items="${pList }" var="product" varStatus="n">
					<div class="oneView" style="position:relative;padding:20x;">
					<div id="rank" style="position:absolute;left:22px;top:25px;">
						${n.count }
					</div>
						<div class="bestProduct">
							<div class="pImg">
								<img src="${product.mainImgRoot }" width="80%" height="60%" style="margin:auto;display:block;padding:12px;" onclick="location.href='/product/detailView.strap?productNo=${product.productNo}';">
							</div>
								<div class="pBrandName" style="font-weight:bold; height:40px;" onclick="location.href='/product/detailView.strap?productNo=${product.productNo}';">
									<span class="brand">
										[${product.productBrand }]
									</span><br>
									<span class="name">
										 <c:if test="${fn:length(product.productName) <= 22 }">
											 ${product.productName }
										 </c:if>
										 <c:if test="${fn:length(product.productName) > 22 }">
											 ${fn:substring(product.productName,0,22) }
										 </c:if>
									</span>
								</div>
							<div class="pInfo">
								<span class="star">★</span>
								<span>${product.gradeAver } (${product.reviewCount })</span>
								<span class="price">
									<fmt:formatNumber value="${product.productPrice }" pattern="#,###"/>
								</span>
								<span class="won">원</span>
							</div>
						
						</div>
						<hr>
						<div class="bestReview" style="margin-top:-7px;">
							<div class="rContents" style="height:25px;">
							 	<span>${product.review.reviewContents }</span>
							 </div>
							<div class="rInfo">
								<span class="memberId">
									${product.review.memberNick }
								</span>
								<span class="star">★</span>
								<span>${product.review.reviewGrade }점</span>
								<span class="member"></span>
							</div>
						</div>				
					</div>
				</c:forEach>
			</div>
		</div>

		
		
	</div>
	<!-- 푸터	 -->
	<div id="footer">
			<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	</div>
	</div>
<script>
// $('#carouselExampleIndicators').carousel('cycle');

function getCoupon(loginMember,couponNo){
   console.log(loginMember);
   if(loginMember != null || loginMember != ""){
      $.ajax({
         url:"/member/coupon/register.strap",
         data:{
            "memberId": loginMember,
            "couponNo":couponNo
         },
         type:"POST",
         success:function(result){
            if(result == "success"){
               alert("쿠폰 발급이 완료되었습니다.");
            }else if(result =="needLogin"){
               alert("로그인 후 쿠폰을 발급 받을 수 있습니다.");
            }else if(result =="fail"){
               alert("이미 쿠폰을 발급받으셨습니다.")
            }
         },
         error:function(){}
      });
   }else{
      console.log("!!");
      alert("로그인 후 쿠폰을 발급 받을 수 있습니다.");
   }
}
</script>

</body>
</html>