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
			<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
		</div>
	</div>
	<!-- 컨텐츠 -->
	<div id="contents" class="row">
		<!-- 사이드바 -->
		<div class="sidebar col-3" >
				<jsp:include page="/WEB-INF/views/common/sideBarAdmin.jsp"></jsp:include>
		</div>
		<div class="contents-side col">
			<div id="contents-wrap">
				<div id="title">
					<h3>상품등록</h3><hr>
				</div>
			</div>
			
			
			<div id="productRegisterArea">
				<form id="info-form" action="/admin/product/register.strap" method="post" enctype="multipart/form-data" >
					<h2>상품 정보 입력</h2><hr>
					<input type="text" name="productBrand" placeholder="브랜드명 입력"><br>
					<input type="text" name="productName" placeholder="상품명 입력"><br>
					<input type="text" name="productPrice" placeholder="상품가격 입력"><br>
					<textarea 		   name="productDesc" placeholder="상품정보 입력"></textarea>
					<h2>이미지 등록</h2><hr>
					<h3>메인(썸네일)이미지</h3>
					<input type="file" name="mainImg" required><br>
					<h3>서브이미지 추가</h3>
					<button onclick="addImgForm();">서브 이미지 추가</button>
					<button onclick="removeImgForm();">서브 이미지 삭제</button>
					<div id="subImg-wrap">
					</div>
					<br>
					<h3>상품설명이미지추가</h3>
					<button onclick="addInfoImgForm();">상품설명 이미지 추가</button>
					<button onclick="removeInfoImgForm();">상품설명 이미지 삭제</button>
					<div id="infoImg-wrap">
						<input type="file" name="infoFile" required>
					</div>
					<br>
					<button onclick="preview();">미리보기</button>
					<div id="preview"></div>
					<br>
					<input type="submit" value="상품등록">
					<input type="reset" value="초기화">							
				</form>
			</div>
		</div>
		
		
		
		
				<div id="pInfo-wrap" class="row detail ">
					<div id="pImg" class="col" style="text-align:center;padding:15px;">
						<div id="zoomImg">
							<img id="zoom" src="${product.mainImgRoot }" width="400px" height="360px" onerror="">
						</div>
						<div id="onImg" style="margin:5px auto;">
							<img src="${product.mainImgRoot }" width="15%" height="70px" onerror="" onmouseover="document.querySelector('#zoom').src=this.src">
							<c:forEach items="${subList }" var="subImg">
								<img src="${subImg.subRoot }" width="15%" height="70px" onerror="" onmouseover="document.querySelector('#zoom').src=this.src">
							</c:forEach>
						</div>
					</div>
					<div id="pInfo" class="col" style="text-align:center; item-align:center; padding:15px;">
						<div id="pTitle" style="height:50px;">
							<span id="pName" style="font-weight:bold; font-size:25px;">[${product.productBrand }] ${product.productName }</span>
						</div>
						<div id="pPrice" style="text-align:center; font-size:26px;font-weight:bold;">
							<div id="price">
								<span id="price" style="font-size:30px;">
									<fmt:formatNumber value="${product.productPrice }" pattern="#,###"/>
								</span>
								<span id='wonSymbol'>원</span> 
							</div>
						</div>
						<hr>
					</div>
				</div>
				<hr>
<!-- 상품상세설명 -->
				<div id="pDetail" class="detail">
					<div id="productDesc-wrap">
						<div id="desc" style="width:70%; margin:0 auto;">
							<h3>상품상세설명</h3>
							${product.productDesc }
						</div>
					</div>
					<div id="infoImg-wrap" style="width:100%;margin:0 auto;height:600px;overflow:hidden;">
						<c:forEach items="${infoList }" var="info">
							<div class="oneInfo">
								<img src="${info.imgRoot }" width="100%">
								<img src="${info.imgRoot }" width="100%">
								<img src="${info.imgRoot }" width="100%">
								<img src="${info.imgRoot }" width="100%">
								<img src="${info.imgRoot }" width="100%">
								<img src="${info.imgRoot }" width="100%">
								<img src="${info.imgRoot }" width="100%">
								<img src="${info.imgRoot }" width="100%">
								<img src="${info.imgRoot }" width="100%">
								<img src="${info.imgRoot }" width="100%">
							</div>
						</c:forEach>
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
 var index = 1;
 function addImgForm(){
	 if(index < 6){
		 var $inputTag = document.createElement("input");
		 $inputTag.type="file";
		 $inputTag.name="imgFile";
		 $inputTag.required=true;
		 document.querySelector("#subImg-wrap").appendChild($inputTag);
		 index++;
	 }else{
	 }
 }
 function removeImgForm(){
	 if(index > 1){
		index--;	 
		 document.querySelector("#subImg-wrap").childNodes[index].remove();
	 }else{
	 }
 }
 
 var infoIndex = 2;
 function addInfoImgForm(){
	 if(infoIndex < 11){
		 var $infoTag = document.createElement("input");
		 $infoTag.type="file";
		 $infoTag.name="infoFile";
		 $infoTag.required=true;
		 document.querySelector("#infoImg-wrap").appendChild($infoTag);
		 infoIndex++;
	 }else{
	 }
 }
 function removeInfoImgForm(){
	 if(infoIndex > 2){
		infoIndex--;	 
		 document.querySelector("#infoImg-wrap").lastChild.remove();
	 }else{
	 }
 }
 

 function preview(){
	 
	 $.ajax({
		 url:"",
		 data:{},
		 type:"",
		 success:function(){},
		 error:function(){}
	 });
	 
 }
 
 
</script>
</body>
</html>
