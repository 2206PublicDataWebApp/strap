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
		<div class="sidebar col-3" >
			<jsp:include page="/WEB-INF/views/common/sideBarAdmin.jsp"></jsp:include>
		</div>
		<div class="contents-side col">
			<div id="inner-header">
				<h1>상품등록</h1><hr>
			</div>
			<div id="inner-contents">
				<form id="info-form" action="/admin/product/register.strap" method="post" enctype="multipart/form-data" >
					<h2>상품 정보 입력</h2><hr>
					<input type="text" name="productBrand" 	value="${product.productBrand }"><br>
					<input type="text" name="productName" 	value="${product.productName }"><br>
					<input type="text" name="productPrice" 	value="${product.productPrice }"><br>
					<textarea 		   name="productDesc" >${product.productDesc }</textarea>
					<h2>이미지 등록</h2><hr>
					<h3>메인(썸네일)이미지</h3>
					<img src="${ product.mainImgRoot}" width="200px" height="200px">
					<input type="file" name="mainImg" required><br>
					<h3>서브이미지 추가</h3>
					<button onclick="addImgForm();">서브 이미지 추가</button>
					<button onclick="removeImgForm();">서브 이미지 삭제</button>
					<div id="subImg-wrap">
						<c:forEach items="${subList }" var="subImg">
							<img src="${ subImg.subRoot}" width="100px" height="100px">
						</c:forEach>
					</div>
					<br>
					<h3>상품설명이미지추가</h3>
					<button onclick="addInfoImgForm();">상품설명 이미지 추가</button>
					<button onclick="removeInfoImgForm();">상품설명 이미지 삭제</button>
					<div id="infoImg-wrap">
						<input type="file" name="infoFile" required>
						<c:forEach items="${infoList }" var="infoImg">
							<img src="${ infoImg.imgRoot}" width="600px" height="800px">
						</c:forEach>
						
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
