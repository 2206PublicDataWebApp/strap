<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스트랩(관리자) : 메인 페이지</title>

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
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/adminHeader.jsp"></jsp:include>
	<div class="container">
		<div class="row" align="center">
			<div class="col">
				<br>
				<p style="text-align:left; font-size:20px;">대시보드</p>
				<hr>
			</div>
		</div>
		<div class="row" align="center">
			<div class="col" align="left">
				<h3>문의</h3>
				<div class="row">
					<div class="col-auto">
						<c:if test="${qnaCount eq 0 }">
							<h1>남은 문의 : <b>${qnaCount }</b></h1>
						</c:if>
						<c:if test="${qnaCount ne 0 }">
							<a href="/admin/adminUnsolvedQna.strap" style="text-decoration:none;color:black;"><h1>남은 문의 : <b>${qnaCount }</b></h1></a>
						</c:if>
					</div>
					<div class="col">
						<h1><span></span></h1>
					</div>
				</div>
				<div class="row">
					<div class="col">
						<h3>오늘 문의 처리 : <b>${todayQnaAnswer }</b></h3>
					</div>
				</div>
				<div class="row">
					<div class="col">
						총 문의 수 : ${totalQna }
					</div>
				</div>
				<div class="row">
					<div class="col">
						총 처리 문의 수 : ${qnaAnswer }
					</div>
				</div>
			</div>
			<div class="col" align="left">
				<h3>신고</h3>
				<div class="row">
					<div class="col">
						<c:if test="${reportCount eq 0 }">
							<h1>남은 신고 : <b>${reportCount }</b></h1>
						</c:if>
						<c:if test="${reportCount ne 0 }">
							<a href="/admin/adminReportListView.strap" style="text-decoration:none;color:black;"><h1>남은 신고 : <b>${reportCount }</b></h1></a>
						</c:if>
					</div>
				</div>
				<div class="row">
					<div class="col">
						<h3>오늘 신고 처리 : <b>${todayReportProcess }</b></h3>
					</div>
				</div>
				<div class="row">
					<div class="col">
						총 신고 수 : ${totalReport }
					</div>
				</div>
				<div class="row">
					<div class="col">
						총 처리 신고 수 : ${reportProcess }
					</div>
				</div>
			</div>
		</div>
		<hr>
		
		<h3>배너 미리보기</h3>
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
		<br><br><br><br><br>
	</div>
	<script>
		var removeToast;
		function toast(string) {
		    const toast = document.getElementById("toast");
	
		    toast.classList.contains("reveal") ?
		        (clearTimeout(removeToast), removeToast = setTimeout(function () {
		            document.getElementById("toast").classList.remove("reveal")
		        }, 3000)) :
		        removeToast = setTimeout(function () {
		            document.getElementById("toast").classList.remove("reveal")
		        }, 3000)
		    toast.classList.add("reveal"),
		        toast.innerText = string
		}
	</script>
</body>
</html>