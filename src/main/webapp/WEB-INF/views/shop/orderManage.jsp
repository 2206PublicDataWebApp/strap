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
 .pagination a{
	 	color:#c0c0c0;
	 	border-style:none;
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
	<div id="contents" class="row">
		<div class="sidebar col-3" >
				<jsp:include page="/WEB-INF/views/common/sideBarAdmin.jsp"></jsp:include>
		</div>
		<div class="contents-side col">
			<div id="contents-wrap">
				<div id="title">
					<h3>상품관리 (${paging.totalCount })</h3><hr>
				</div>
				<div id="searchArea" style="text-align:center;">
					<div id="search_border" style="border:2px solid darkorange;padding:3px; border-radius:4px; display:inline-block;height:40px;">
						<form id="search-form" action="/admin/productSearchView.strap" method="get">
							<input id="searchVal" name="searchVal" type="text" value="${search.searchVal }" placeholder=" 보충제 검색." style="border-style:none; padding:4px; width:400px;">
							<button style="background-color:white;border-style:none;" ><i class="fa-solid fa-magnifying-glass"></i></button>
						</form>
					</div>
				</div>
				<div id="adminProductBtnWrap" style="background-color:rgb(250,250,250);padding:12px;text-align:center;">
					<button style="width:150px;font-weight:bold;color:white;background-color:darkorange;border-style:none;border-radius:4px;" onclick="location.href='/admin/product/registerView.strap';">상품등록</button>
				</div>
				<div id="productList">
					<table style="text-align:center; font-size:14px; width:100%;">
						<tr style="height:30px; border-bottom:1px solid #c0c0c0;">
								<th class="col-1">상품번호</th>
								<th class="col-1" >브랜드</th>
								<th class="col-2">상품명</th>
								<th class="col-1">상품가격</th>
								<th class="col-1">판매량</th>
								<th class="col-1">매출</th>
								<th class="col-1">평점</th>
								<th class="col-1">수정</th>
								<th class="col-1">삭제</th>
								<th class="col-1">수정일</th>
								<th class="col-1">등록일</th>
						</tr>
						<c:forEach items="${pList}" var="product">
							<tr>
								<td>${product.productNo }</td>
								<td>${product.productBrand }</td>
								<td>${product.productName }</td>
								<td>
									<fmt:formatNumber value="${product.productPrice }" pattern="#,###"/>
									<span>원</span>
								</td>
								<td>${product.productSales }</td>
								<td>
									<fmt:formatNumber value="${product.productSales * product.productPrice }" pattern="#,###"/>
									<span>원</span>
								</td>
								<td>${product.gradeAver }</td>
								<td onclick="location.href='/admin/product/modifyView.strap?productNo=${product.productNo}';"><i class="fa-regular fa-pen-to-square"></i>수정</td>
								<td onclick="deleteProduct(${product.productNo});"><i class="fa-regular fa-trash-can"></i>삭제</td>
								<td>${product.productModiDate }</td>
								<td>${product.productRegiDate }</td>
							</tr>
						</c:forEach>						
					</table>
				</div>
				<nav aria-label="Page navigation example" style="width:200px;margin:10px auto; border-style:none; color:#c0c0c0;">
				  <ul class="pagination">
				    <li class="page-item">
				    <c:if test="${paging.startNavi > paging.startPage }">
				      <a class="page-link" href="/admin/${url}.strap?page=${paging.startNavi-1 }&searchVal=${search.searchVal}" aria-label="<">
				        <span aria-hidden="true">&laquo;</span>
				      </a>
				     </c:if>
				    </li>
				    <c:forEach begin="${paging.startNavi }" end="${paging.endNavi }" var="n">
				    <li class="page-item"><a class="page-link" <c:if test="${paging.page eq n }">style="font-weight:bold;color:darkorange"</c:if>  href="/admin/${url }.strap?page=${n }&searchVal=${search.searchVal}">${n }</a></li>
				    </c:forEach>
				    <c:if test="${paging.endNavi < paging.endPage }">
				    <li class="page-item">
				      <a class="page-link" href="/admin/${url }.strap?page=${paging.endNavi+1 }&searchVal=${search.searchVal}" aria-label=">">
				        <span aria-hidden="true">&raquo;</span>
				      </a>
				    </li>
				    </c:if>
				  </ul>
				</nav>
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
