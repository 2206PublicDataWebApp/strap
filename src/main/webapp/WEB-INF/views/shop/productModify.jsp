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
<style>
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
	}
	img[name="infoFile"]{
		height:450px;
		border:1px solid gray;
	}
	
</style>
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
	<div id="contents" class="row" style="width:70%;margin:0 auto;">
		<!-- 사이드바 -->
		<div class="sidebar col-3" >
				<jsp:include page="/WEB-INF/views/common/sideBarAdmin.jsp"></jsp:include>
		</div>
		<div class="contents-side col">
			<div id="contents-wrap">
				<div id="title">
					<br>
					<h3>상품수정</h3><hr>
				</div>
			</div>
			
			<div class="row">
			
			<div id="productRegisterArea" class="col-4" style="height:1000px;border-right:1px solid #c0c0c0;">
					<h6 >상품 정보 수정</h6>
					<div style="border:1px solid gray; border-radius:10px; padding:12px;">
						<span style="color:red;font-size:12px;">*필수등록</span>
						<input type="text" onkeyup="previewTxt(this,'previewBrand');" 	value="${product.productBrand }"	name="productBrand" placeholder="브랜드명 입력"><br>
						<span style="color:red;font-size:12px;">*필수등록</span>
						<input type="text" onkeyup="previewTxt(this,'previewName')" 	value="${product.productName }" 	name="productName" 	placeholder="상품명 입력"><br>
						<span style="color:red;font-size:12px;">*필수등록</span>
						<input type="text" onkeyup="previewTxt(this,'previewPrice')" 	value="${product.productPrice }" 	name="productPrice" placeholder="상품가격 입력"><br>
						<textarea 		   onkeyup="previewTxt(this,'previewDesc')" 	name="productDesc" 	placeholder="상품정보 입력" style="width:90%;height:100px;margin-bottom:20px;" value="">${product.productDesc }</textarea>
						<div style="text-align:center;">
							<button  onclick="if(confirm('상품정보를 수정하시겠습니까?')){modifyProductInfo(${product.productNo});};" style="weight:120px;height:40px;font-weight:bold;color:white;background-color:darkorange;border:1px solid darkorange;border-radius:4px;">상품정보 수정</button>
						</div>
					</div>
					<br>
				
					<h6>이미지 수정</h6>
					<span style="font-size:12px;font-weight:bold">※수정 후 저장 시 기존 이미지가 초기화된 후 새로운 이미지가 등록됩니다.</span>
					<div id="modifyImgs" style="border:1px solid gray; border-radius:10px; padding:12px;">	
						<h6>메인(썸네일)이미지</h6>
						<div>
							<label class="imgLabel">메인이미지</label><span style="color:red;font-size:12px;">*필수등록</span>
							<input type="file" name="mainImg"  onchange="tempImgSave(this,'mainImg');" ><br>
							<div style="text-align:center;">
								<button id="mainLockBtn" type="button" onclick="modifyMainImgLock();" style="weight:120px;height:40px;font-weight:bold;color:darkorange;background-color:white;border:1px solid darkorange;border-radius:4px;">메인이미지 수정</button>
								<button id="mainModiBtn" type="button" onclick="if(confirm('메인이미지를 수정하시겠습니까?')){modifyMainImg(${product.productNo});};" style="weight:120px;height:40px;font-weight:bold;color:white;background-color:darkorange;border:1px solid darkorange;border-radius:4px;">저장</button>
							</div>
						</div>
						<hr>
						<h6>서브이미지 추가</h6>
						<div id="subImg-wrap">
								<form id="subForm" action="#" method="post" enctype="multipart/form-data" >
									<label class="imgLabel">서브이미지1</label>
									<input type="file" name="imgFile" onchange="tempImgSave(this,'sub1');"><br>
									<label class="imgLabel">서브이미지2</label>
									<input type="file" name="imgFile" onchange="tempImgSave(this,'sub2');"><br>
									<label class="imgLabel">서브이미지3</label>
									<input type="file" name="imgFile" onchange="tempImgSave(this,'sub3');"><br>
									<label class="imgLabel">서브이미지4</label>
									<input type="file" name="imgFile" onchange="tempImgSave(this,'sub4');"><br>
									<label class="imgLabel">서브이미지5</label>
									<input type="file" name="imgFile" onchange="tempImgSave(this,'sub5');"><br>
								</form>
								<div style="text-align:center;">
									<button id="subLockBtn" type="button" onclick="modifySubImgLock();" style="weight:120px;height:40px;font-weight:bold;color:darkorange;background-color:white;border:1px solid darkorange;border-radius:4px;">서브이미지 수정</button>
									<button id="subModiBtn" type="button" onclick="if(confirm('서브이미지를 수정하시겠습니까?')){modifySubImg(${product.productNo});};" style="weight:120px;height:40px;font-weight:bold;color:white;background-color:darkorange;border:1px solid darkorange;border-radius:4px;">저장</button>
								</div>
						</div>
						<hr>
						<h6>상품설명이미지추가</h6>
						<div id="infoImg-wrap">
							<form id="infoForm" action="#" method="post" enctype="multipart/form-data" >
								<label class="imgLabel">상품설명이미지1</label><span style="color:red;font-size:12px;">*필수등록</span>
								<input type="file" name="infoFile" onchange="tempImgSave(this,'info1');" ><br>
								<label class="imgLabel">상품설명이미지2</label>
								<input type="file" name="infoFile" onchange="tempImgSave(this,'info2');"><br>
								<label class="imgLabel">상품설명이미지3</label>
								<input type="file" name="infoFile" onchange="tempImgSave(this,'info3');"><br>
								<label class="imgLabel">상품설명이미지4</label>
								<input type="file" name="infoFile" onchange="tempImgSave(this,'info4');"><br>
								<label class="imgLabel">상품설명이미지5</label>
								<input type="file" name="infoFile" onchange="tempImgSave(this,'info5');"><br>
								<label class="imgLabel">상품설명이미지6</label>
								<input type="file" name="infoFile" onchange="tempImgSave(this,'info6');"><br>
								<label class="imgLabel">상품설명이미지7</label>
								<input type="file" name="infoFile" onchange="tempImgSave(this,'info7');"><br>
								<label class="imgLabel">상품설명이미지8</label>
								<input type="file" name="infoFile" onchange="tempImgSave(this,'info8');"><br>
								<label class="imgLabel">상품설명이미지9</label>
								<input type="file" name="infoFile" onchange="tempImgSave(this,'info9');"><br>
								<label class="imgLabel">상품설명이미지10</label>
								<input type="file" name="infoFile" onchange="tempImgSave(this,'info10');"><br>
							</form>
							<div style="text-align:center;">
								<button id="infoLockBtn" type="button" onclick="modifyInfoImgLock();" style="weight:120px;height:40px;font-weight:bold;color:darkorange;background-color:white;border:1px solid darkorange;border-radius:4px;">상품설명이미지 수정</button>
								<button id="infoModiBtn" type="button" onclick="if(confirm('상품설명 이미지를 수정하시겠습니까?')){modifyInfoImg(${product.productNo});};" style="weight:120px;height:40px;font-weight:bold;color:white;background-color:darkorange;border:1px solid darkorange;border-radius:4px;">저장</button>
							</div>
						</div>
<!-- 						<div style="text-align:center;"> -->
<!-- 							<input type="submit" value="이미지수정" style="weight:120px;height:40px;font-weight:bold;color:white;background-color:darkorange;border:1px solid darkorange;border-radius:4px;"> -->
<!-- 							<input type="reset" value="초기화" style="weight:120px;height:40px; font-weight:bold;color:darkorange;background-color:white;border:1px solid darkorange;border-radius:4px;" onclick="location.reload();">							 -->
<!-- 						</div> -->
						</div>
					<br>
					<div id="preview"></div>
					</div>
		
		
		
				<div id="previewArea" class="col-8" style="height:1000px;overflow-y:scroll;color:gray;background-color:rgb(250,250,250)">
				<h6 >미리보기</h6>
				<div style="border:1px solid gray; border-radius:10px; padding:12px;">
					<div id="pInfo-wrap" class="row detail ">
						<div id="pImg" class="col" style="text-align:center;padding:10px;">
							<div id="zoomImg">
								<img id="zoom" src="${product.mainImgRoot }" width="330px" height="240px" onerror="">
							</div>
							<div id="onImg" style="margin:5px auto;">
									<img name="mainImg" id="mainImg" src="${product.mainImgRoot }" width="15%" height="50px" onerror="this.src='/resources/image/logo.png';" onmouseover="document.querySelector('#zoom').src=this.src">
									<img name="imgFile" id="sub1"	 width="15%" height="50px" onerror="this.src='/resources/image/logo.png';" onmouseover="document.querySelector('#zoom').src=this.src">
									<img name="imgFile" id="sub2"	 width="15%" height="50px" onerror="this.src='/resources/image/logo.png';" onmouseover="document.querySelector('#zoom').src=this.src">
									<img name="imgFile" id="sub3"	 width="15%" height="50px" onerror="this.src='/resources/image/logo.png';" onmouseover="document.querySelector('#zoom').src=this.src">
									<img name="imgFile" id="sub4"	 width="15%" height="50px" onerror="this.src='/resources/image/logo.png';" onmouseover="document.querySelector('#zoom').src=this.src">
									<img name="imgFile" id="sub5"	 width="15%" height="50px" onerror="this.src='/resources/image/logo.png';" onmouseover="document.querySelector('#zoom').src=this.src">
							</div>
						</div>
						<div id="pInfo" class="col" style="text-align:center; item-align:center; padding:10px;">
							<div id="pTitle" style="height:auto;">
								<span id="pName" style="font-weight:bold; font-size:21px;">[<span id="previewBrand"><span style="color:darkorange;">${product.productBrand }</span></span>] <span id="previewName"><span style="color:darkorange;">${product.productName }</span></span></span>
							</div>
							<div id="pPrice" style="text-align:center; font-size:18px;font-weight:bold;">
								<div id="price">
									<span id="previewPrice" style="font-size:21px;">
										<span style="color:darkorange;"><fmt:formatNumber value="${product.productPrice }" pattern="#,###"/></span>
									</span>
									<span id='wonSymbol'>원</span> 
								</div>
							</div>
							<hr>
						</div>
					</div>
					<hr>
					<div id="pDetail" class="detail">
						<div id="productDesc-wrap">
							<div id="desc" style="width:70%; margin:0 auto;">
								<h6>상품상세설명</h6>
								<span id="previewDesc">
									<span style="color:darkorange;">${product.productDesc }</span>
								</span>
							</div>
						</div>
						<div id="infoImg-wrap" style="width:65%;margin:0 auto;height:auto;padding:20px;">
								<div id="infoImg" class="previewInfoImgWrap">
									<img name="infoFile" id="info1" src="/resources/image/logo.png" width="100%" height="450px" style="border:1px solid gray;" required>
									<img name="infoFile" id="info2" width="100%">
									<img name="infoFile" id="info3" width="100%">
									<img name="infoFile" id="info4" width="100%">
									<img name="infoFile" id="info5" width="100%">
									<img name="infoFile" id="info6" width="100%">
									<img name="infoFile" id="info7" width="100%">
									<img name="infoFile" id="info8" width="100%">
									<img name="infoFile" id="info9" width="100%">
									<img name="infoFile" id="info10"width="100%">
								</div>
						</div>
					</div>
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
 
 /////텍스트 미리보기
 function previewTxt(thisInput,previewId){
	 if(previewId == "previewPrice"){
		 document.querySelector("#"+previewId+"").innerHTML = "<span style='color:darkorange;'>"+Number(thisInput.value).toLocaleString() +"</span>";
	 }else{
		 document.querySelector("#"+previewId+"").innerHTML = "<span style='color:darkorange;'>"+thisInput.value +"</span>";
	 }
	 if(thisInput.value == ""){
		 switch(previewId){
		 case "previewBrand":
			 document.querySelector("#"+previewId+"").innerHTML = "브랜드명";
			 break;
		 case "previewName":
			 document.querySelector("#"+previewId+"").innerHTML = "제품명";
			 break;
		 case "previewPrice":
			 document.querySelector("#"+previewId+"").innerHTML = "0";
			 break;
		 case "previewDesc":
			 document.querySelector("#"+previewId+"").innerHTML = "상품 상세설명입니다.";
			 break;
		 }
	 }
 }
 
// 파일 선택 시 임시 폴더에 저장시키는 ajax
// 1.해당 input file을 임시 폼태그에 넣고 서버에 임시폴더를 만들어 임시저장한다.
// 2.json형태로 반환하고 이를 이용하여 이미지 미리보기를 만든다.
var tempFolderName =  "temp_"+Math.floor(Math.random()*1000)+""+new Date().getSeconds();
function tempImgSave(thisInput,previewId){
	//formData를 이용하여 파일 전송
	var formData = new FormData();
	var tempName = "img_"+Math.floor(Math.random()*1000)+""+new Date().getSeconds();
	formData.append("tempImg",thisInput.files[0]);
	formData.append("tempFolderName",tempFolderName);
	formData.append("tempName",tempName);
	$.ajax({
		url:"/admin/product/temp.strap",
		data: formData,
		type:"post",
		processData: false,
		contentType: false,
		success:function(result){
			console.log(result);
			
			document.querySelector("#"+previewId+"").src = result.tempImgPath;
			if(previewId.substring(0,4)=="info"){
				document.querySelector("#"+previewId+"").style.height="450px";
			}
			if(previewId.substring(0,3)=="sub"){
				document.querySelector("#"+previewId+"").style.display="inline-block";
			}
			if(previewId == "mainImg"){
				document.querySelector("#zoom").src = result.tempImgPath;
			}
		},
		error:function(){}
	});
}
/////el값으로 이미지 셋팅.
getImgs();
function getImgs(){
	<c:forEach items="${infoList}" var="info" varStatus="n">
		document.querySelector("#infoImg").childNodes[${n.count*2-1}].src = '${info.imgRoot}';
		document.querySelector("#infoImg").childNodes[${n.count*2-1}].style.height="450px";
	</c:forEach>
	<c:forEach items="${subList}" var="sub" varStatus="n">
		document.querySelector("#onImg").childNodes[${n.count*2+1}].src = '${sub.subRoot}';
		document.querySelector("#onImg").childNodes[${n.count*2+1}].style.display="inline-block";
	</c:forEach>
}
 
 //이미지 수정 잠금
  modifyMainImgLock();
  modifySubImgLock();
  modifyInfoImgLock();
 //메인이미지 잠금
//  var mainImg;
//  var subImgs = new Array();
//  for(var i=0; i<subImgs.length; i++){
// 	 subImgs[i] = document.querySelectorAll("img[name='imgFile']")[i].src;
//  }
//  var infoImgs = new Array();
 function modifyMainImgLock(){
	 var mainCheck = document.querySelector("#mainModiBtn").disabled;
	 if(mainCheck){
		 document.querySelectorAll("input[type='file']")[0].disabled = false;
		 document.querySelector("#mainModiBtn").disabled = false;
	 }else{
		 document.querySelectorAll("input[type='file']")[0].disabled = true;
		 document.querySelector("#mainModiBtn").disabled = true;
	 }
 }
 //서브이미지 잠금
 function modifySubImgLock(){
	 var imgCount = document.querySelectorAll("input[type='file']").length;
	 var subCheck = document.querySelector("#subModiBtn").disabled;
	 if(subCheck){
		 for(var i=1; i<6; i++){
			 document.querySelectorAll("input[type='file']")[i].disabled = false;
			 document.querySelector("#subModiBtn").disabled = false;
		 }
	 }else{
		 for(var i=1; i<6; i++){
				 document.querySelectorAll("input[type='file']")[i].disabled = true;
				 document.querySelector("#subModiBtn").disabled = true;
		 }
	 }
 }
 //인포이미지 잠금
 function modifyInfoImgLock(){
	 var imgCount = document.querySelectorAll("input[type='file']").length;
	 var infoCheck = document.querySelector("#infoModiBtn").disabled;
	 if(infoCheck){
		 for(var i=6; i<imgCount; i++){
			 document.querySelectorAll("input[type='file']")[i].disabled = false;
			 document.querySelector("#infoModiBtn").disabled = false;
		 }
	 }else{
		 for(var i=6; i<imgCount; i++){
				 document.querySelectorAll("input[type='file']")[i].disabled = true;
				 document.querySelector("#infoModiBtn").disabled = true;
		 }
	 }
 }
 
 //////상품정보 수정 ajax
function modifyProductInfo(productNo){
	 var productBrand = document.querySelector("input[name='productBrand']").value;
	 var productName = document.querySelector("input[name='productName']").value;
	 var productPrice = document.querySelector("input[name='productPrice']").value;
	 var productDesc = document.querySelector("textarea[name='productDesc']").value;
	 
	 var flag = true;
	 if(productBrand == "" || productBrand ==null){
		 alert("상품 브랜드를 입력하세요.");
		 flag = false;
	 }
	 if(productName == "" || productName ==null){
		alert("상품 이름을 입력하세요.");
		flag = false; 
	 }
	 if(productPrice == "" || productPrice ==null){
		alert("상품 가격을 입력하세요.");
	 	flag = false;
	 }
	 if(flag){
		 $.ajax({
			 url:"/admin/product/modify/info.strap",
			 data:{
				 "productNo":productNo,
				 "productBrand":productBrand,
				 "productName":productName,
				 "productPrice":productPrice,
				 "productDesc":productDesc
			 },
			 type:"post",
			 success:function(result){
				 if(result == "success"){
					 alert("상품 정보가 수정되었습니다.");
					 location.reload();
				 }else{
					 
				 }
			 },
			 error:function(){}
		 });
	 }
 }
 
 //메인이미지 수정 ajax
 function modifyMainImg(productNo){
	 var formData = new FormData();
	 var mainImg = document.querySelector("input[name='mainImg']");
	 formData.append("mainImg",mainImg.files[0]);
	 formData.append("productNo",productNo);
	 console.log(mainImg.files[0]);
	 $.ajax({
		 url:"/admin/product/modify/mainImg.strap",
		 data:formData,
		 type:"post",
		 processData: false,
		contentType: false,
		 success:function(result){
			 if(result=="success"){
				 alert("수정되었습니다.");
				 location.reload();
			 }else{
				 
			 }
		 },
		 error:function(){}
	 });
 }
 
 //서브이미지 수정 ajax
  function modifySubImg(productNo){
	 var formData = new FormData();
	 var subForm = document.querySelector("#subForm");
	 var subInputs = document.querySelectorAll("input[name='imgFile']");
	 
	 for(var i=0; i<subInputs.length;i++){
		 formData.append("imgFile",subInputs[i].files[0])
	 }
	 formData.append("productNo",productNo);
	 
	 $.ajax({
		 url:"/admin/product/modify/subImg.strap",
		 data:formData,
		 type:"post",
		 processData: false,
		 contentType: false,
		 success:function(result){
			 if(result=="success"){
				 alert("수정되었습니다.");
				 location.reload();
			 }else{
				 alert("실패!");
			 }
		 },
		 error:function(){}
	 });
 }
 //상품설명이미지 수정 ajax
  function modifyInfoImg(productNo){
	  	var formData = new FormData();
		 var infoForm = document.querySelector("#infoForm");
		 var infoInputs = document.querySelectorAll("input[name='infoFile']");
		 for(var i=0; i<infoInputs.length;i++){
			 formData.append("infoFile",infoInputs[i].files[0])
		 }
		 formData.append("productNo",productNo);
	 $.ajax({
		 url:"/admin/product/modify/infoImg.strap",
		 data:formData,
		 type:"post",
		 processData: false,
		 contentType: false,
		 success:function(result){
			 if(result=="success"){
				 alert("수정되었습니다.")
				 location.reload();
			 }else{
				 alert("수정실패!");
			 }
		 },
		 error:function(){}
	 });
 }
 
</script>
</body>
</html>
