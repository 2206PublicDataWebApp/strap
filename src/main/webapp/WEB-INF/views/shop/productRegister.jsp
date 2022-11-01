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
					<h3>상품등록</h3><hr>
				</div>
			</div>
			
			<div class="row">
			
			<div id="productRegisterArea" class="col-4" style="height:1000px;border-right:1px solid #c0c0c0;">
				<form id="info-form" action="/admin/product/register.strap" method="post" enctype="multipart/form-data" >
					<h6 >상품 정보 입력</h6>
					<div style="border:1px solid gray; border-radius:10px; padding:12px;">
						<span style="color:red;font-size:12px;">*필수등록</span>
						<input type="text" onkeyup="previewTxt(this,'previewBrand');" name="productBrand" placeholder="브랜드명 입력"><br>
						<span style="color:red;font-size:12px;">*필수등록</span>
						<input type="text" onkeyup="previewTxt(this,'previewName')" name="productName" placeholder="상품명 입력"><br>
						<span style="color:red;font-size:12px;">*필수등록</span>
						<input type="text" onkeyup="previewTxt(this,'previewPrice')" name="productPrice" placeholder="상품가격 입력"><br>
						<textarea 		   onkeyup="previewTxt(this,'previewDesc')" name="productDesc" placeholder="상품정보 입력" style="width:90%;height:100px;margin-bottom:20px;"></textarea>
					</div>
					<br>
				
					<h6>이미지 등록</h6>
					<div style="border:1px solid gray; border-radius:10px; padding:12px;">	
						<h6>메인(썸네일)이미지</h6>
						<div>
							<label class="imgLabel">메인이미지</label>
							<span style="color:red;font-size:12px;">*필수등록</span>
							<input type="file" name="mainImg"  onchange="tempImgSave(this,'mainImg');" required><br>
						</div>
						<hr>
						<h6>서브이미지 추가</h6>
						<div id="subImg-wrap">
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
						</div>
						<hr>
						<h6>상품설명이미지추가</h6>
						<div id="infoImg-wrap">
							<label class="imgLabel">상품설명이미지1</label>
							<span style="color:red;font-size:12px;">*필수등록</span>
							<input type="file" name="infoFile" onchange="tempImgSave(this,'info1');" required><br>
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
						</div>
					</div>
					<br>
					<div id="preview"></div>
					<hr>
					<div style="text-align:center;">
						<input type="submit" value="상품등록" style="weight:120px;height:40px;font-weight:bold;color:white;background-color:darkorange;border:1px solid darkorange;border-radius:4px;">
						<input type="reset" value="초기화" style="weight:120px;height:40px; font-weight:bold;color:darkorange;background-color:white;border:1px solid darkorange;border-radius:4px;" onclick="location.reload();">							
					</div>
				</form>
			</div>
		
		
		
			<div id="previewArea" class="col-8" style="height:1000px;overflow-y:scroll;color:gray;background-color:rgb(250,250,250)">
				<div id="pInfo-wrap" class="row detail ">
					<div id="pImg" class="col" style="text-align:center;padding:10px;">
						<div id="zoomImg">
							<img id="zoom" src="/resources/image/logo.png" width="330px" height="240px" onerror="">
						</div>
						<div id="onImg" style="margin:5px auto;">
								<img id="mainImg"src="" width="15%" height="50px" onerror="this.src='/resources/image/logo.png';" onmouseover="document.querySelector('#zoom').src=this.src">
								<img id="sub1"	 src="" width="15%" height="50px" onerror="this.src='/resources/image/logo.png';" onmouseover="document.querySelector('#zoom').src=this.src">
								<img id="sub2"	 src="" width="15%" height="50px" onerror="this.src='/resources/image/logo.png';" onmouseover="document.querySelector('#zoom').src=this.src">
								<img id="sub3"	 src="" width="15%" height="50px" onerror="this.src='/resources/image/logo.png';" onmouseover="document.querySelector('#zoom').src=this.src">
								<img id="sub4"	 src="" width="15%" height="50px" onerror="this.src='/resources/image/logo.png';" onmouseover="document.querySelector('#zoom').src=this.src">
								<img id="sub5"	 src="" width="15%" height="50px" onerror="this.src='/resources/image/logo.png';" onmouseover="document.querySelector('#zoom').src=this.src">
						</div>
					</div>
					<div id="pInfo" class="col" style="text-align:center; item-align:center; padding:10px;">
						<div id="pTitle" style="height:auto;">
							<span id="pName" style="font-weight:bold; font-size:21px;">[<span id="previewBrand">브랜드명</span>] <span id="previewName">제품명</span></span>
						</div>
						<div id="pPrice" style="text-align:center; font-size:18px;font-weight:bold;">
							<div id="price">
								<span id="previewPrice" style="font-size:21px;">0</span>
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
								상품 상세설명입니다.
							</span>
						</div>
					</div>
					<div id="infoImg-wrap" style="width:65%;margin:0 auto;height:auto;padding:20px;">
							<div class="previewInfoImgWrap">
								<img id="info1" src="/resources/image/logo.png" width="100%" height="450px" style="border:1px solid gray;">
								<img id="info2" width="100%">
								<img id="info3" width="100%">
								<img id="info4" width="100%">
								<img id="info5" width="100%">
								<img id="info6" width="100%">
								<img id="info7" width="100%">
								<img id="info8" width="100%">
								<img id="info9" width="100%">
								<img id="info10"width="100%">
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
			if(previewId == "mainImg"){
				document.querySelector("#zoom").src = result.tempImgPath;
			}
		},
		error:function(){}
	});
}
 
</script>
</body>
</html>
