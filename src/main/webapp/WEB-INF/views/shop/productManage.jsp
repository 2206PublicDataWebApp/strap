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
		<div id="contents-wrap">
			<div class="sidebar col-3" >
					<jsp:include page="/WEB-INF/views/common/sideBarAdmin.jsp"></jsp:include>
			</div>
				<div class="contents-side col">
					<div id="inner-header">
						<h1>상품관리</h1><hr>
						<button onclick="location.href='/admin/product/registerView.strap';">상품등록</button>
						<div id="search-wrap">
							<form id="search-form" action="/admin/productSearchView.strap" method="get">
								<input id="searchVal" name="searchVal" type="text" placeholder="상품검색"><button >검색</button>
							</form>
						</div>
					</div>
					<div id="inner-contents">
						<table>
							<tr>
								<th>상품명</th>
								<th>수정</th>
								<th>삭제</th>
								<th>상품등록일</th>
							</tr>
							<c:forEach items="${pList}" var="product">
							<tr>
								<td>[${product.productBrand }] ${product.productName }</td>
								<td><a href="/admin/product/modifyView.strap?productNo=${product.productNo }" >수정</a></td>
								<td><a href="#" onclick="deleteProduct(${product.productNo });">삭제</a></td>
								<td>${product.productRegiDate }</td>							
							</tr>
							</c:forEach>						
						</table>
						<div id="paging-wrap">
							<c:if test="${paging.startNavi > paging.startPage }">
								<a href="/admin/${url}.strap?page=${paging.startNavi-1 }&searchVal=${search.searchVal}"><</a>
							</c:if>
							<c:forEach begin="${paging.startNavi }" end="${paging.endNavi }" var="n">
								<a href="/admin/${url }.strap?page=${n }&searchVal=${search.searchVal}">${n }</a>
							</c:forEach>
							<c:if test="${paging.endNavi < paging.endPage }">
								<a href="/admin/${url }.strap?page=${paging.endNavi+1 }&searchVal=${search.searchVal}">></a>
							</c:if>					
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
</body>
<script>
function deleteProduct(thisNo){
	var productNo = thisNo;
	if(confirm("상품을 삭제하시겠습니까?")){
		$.ajax({
			url:"/admin/product/remove.strap",
			data:{"productNo":productNo},
			type:"get",
			success:function(result){
				if(result == "success"){
					location.reload();
				}else{
					
				}
			},
			error:function(){}
		});
	}
}

</script>

</html>
