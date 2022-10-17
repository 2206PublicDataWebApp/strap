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
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	<!-- 컨텐츠 -->
	<div class="contents">
		<div id="contents-wrap">
				<jsp:include page="/WEB-INF/views/common/sideBarAdmin.jsp"></jsp:include>
				<div class="contents-side">
					<div id="inner-header">
						<h1>상품등록</h1><hr>
					</div>
					<div id="inner-contents">
						<form id="info-form" action="/admin/product/register.strap" method="post" enctype="multipart/form-data" >
							<h2>상품 정보 입력</h2><hr>
							<input type="text" name="productBrand" placeholder="브랜드명 입력"><br>
							<input type="text" name="productName" placeholder="상품명 입력"><br>
							<input type="text" name="productPrice" placeholder="상품가격 입력"><br>
							<textarea 		   name="productDesc" placeholder="상품정보 입력"></textarea>
							<h2>이미지 등록</h2><hr>
							<input type="file" name="mainImg" required><br>
							<button>서브 이미지 추가</button><button>서브 이미지 삭제</button>
							<div id="subImg-wrap">
								<input type="file" name="sub1Img" ><br>
								<input type="file" name="sub2Img" ><br>
								<input type="file" name="sub3Img" ><br>
								<input type="file" name="sub4Img" ><br>
							</div>
							<input type="file" name="infoImg" required><br>
							<br><br>
							
							<input type="submit" value="상품등록">
							<input type="reset" value="초기화">							
						</form>
					</div>
				</div>
		</div>
	</div>
	<!-- 푸터 -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</div>
</body>
</html>
