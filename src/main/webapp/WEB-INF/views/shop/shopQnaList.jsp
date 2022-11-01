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

input:disabled {
  background: #ccc;
}
#order-wrap button{
	width:120px;
	height:auto;
	background-color : white;
	border: 2px solid gray;
	border-radius: 15px;
	margin:5px;
	padding:auto;
	font-size:13px;
	font-weight:bold;
	color:gray;
}

 .pagination a{
 	color:#c0c0c0;
 	border-style:none;
 }
 .qnaContents{
 	overflow:hidden;
   	white-space:nowrap;
	text-overflow:ellipsis;
	margin:0 auto;
 }
 #qnaList th,#qnaList td{
 	padding:3px;
 }
 .qnaFoldingBtn:hover{
 	cursor:pointer;
 }
 
 .toProductDetail:hover{
 	cursor:pointer;
 }
 
</style>

</head>
<body>
<div class="wrap container" >
<!-- 헤더&메뉴바 -->
	<div id="header" class="row">
		<div class="col">
			<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
		</div>
	</div>
<!-- 컨텐츠 -->
	<div id="contents" class="contents row">
		<div class="sidebar col-3" >
			<jsp:include page="/WEB-INF/views/common/sideBarShop.jsp"></jsp:include>
		</div>
		<div class="contents-side col" >
			<div id="contents-wrap">
				<div id="title">
					<h3>나의 문의 (${paging.totalCount })</h3><hr>
				</div>
				<div id="dateFilter" style="text-align:center;">
					<div id="selectDate">
						<div id="order-wrap">
							<button onclick="dateFilter(0);" 	<c:if test="${search.dayBefore eq 0 and search.startDate eq null}">style="border:2px solid darkorange; color:darkorange"</c:if>	 	id="order-aver">전체</button>
							<button onclick="dateFilter(31);" 	<c:if test="${search.dayBefore eq 31}">style="border:2px solid darkorange; color:darkorange"</c:if>	 	id="order-aver">1개월</button>
							<button onclick="dateFilter(183);" 	<c:if test="${search.dayBefore eq 183}">style="border:2px solid darkorange; color:darkorange"</c:if>	id="order-review">6개월</button>
							<button onclick="dateFilter(365);" 	<c:if test="${search.dayBefore eq 365}">style="border:2px solid darkorange; color:darkorange"</c:if>	id="order-sales">1년</button>
							<button onclick="abled();" 		    <c:if test="${search.startDate ne null}">style="border:2px solid darkorange; color:darkorange"</c:if>	id="order-high-price">기간선택</button>
						</div>
					</div>
					<div id="inputDate" <c:if test="${search.startDate eq null}">style="display:none;"</c:if>>
						<form id="search-form" action="/shopQna/list.strap" method="get">
							<input id="dayBefore"  name="dayBefore" type="hidden" value="0">
							<input id="startDate" class="dInput"  name="startDate" type="date"  value="${search.startDate }" disabled required> ~ 
							<input id="endDate"   class="dInput"  name="endDate" 	type="date" value="${search.endDate }" disabled required>
							<button id="dBtn" style="font-weight:bold;color:darkorange;background-color:white;border:1px solid darkorange; border-radius:4px;"  disabled >검색</button>
						</form>
					</div>
				</div>
				<div id="qnaList">
					<table style="text-align:center; font-size:14px;">
						<tr style="height:30px; border-bottom:1px solid #c0c0c0;">
							<th class="col-1">문의번호</th>
							<th class="col-3" >상품정보</th>
							<th class="col-1">답변여부</th>
							<th class="col-1">문의유형</th>
							<th class="col-1">상세내용 </th>
							<th class="col-1">날짜</th>
						</tr>
							<c:forEach items="${sqList}" var="sQna">
								<tr style="height:10px;"></tr>
								<tr>
									<td>${sQna.qnaNo }</td>
									<td class="toProductDetail" onclick="location.href='/product/detailView.strap?productNo=${sQna.product.productNo}';" >
										<img src="${sQna.product.mainImgRoot }" width="60px" height="60px">
										<span class="productBrand">[${sQna.product.productBrand }]</span>
										<span class="productName">${sQna.product.productName }</span>
									</td>
									<td>
										<c:if test="${sQna.answerStatus  eq 'Y'}"><span style="color:green;">답변완료</span></c:if>
										<c:if test="${sQna.answerStatus  ne 'Y'}"><span style="color:gray;">답변대기</span></c:if>
									</td>
									<td class="qnaContents">
										<c:if test="${sQna.qnaType  eq 'QC2QT1'}"><span style="color:gray;">[주문/결제]</span></c:if>
										<c:if test="${sQna.qnaType  eq 'QC2QT2'}"><span style="color:gray;">[배송]</span></c:if>
										<c:if test="${sQna.qnaType  eq 'QC2QT3'}"><span style="color:gray;">[취소/반품/교환]</span></c:if>
										<c:if test="${sQna.qnaType  eq 'QC2QT4'}"><span style="color:gray;">[기타]</span></c:if>
									</td>
									<td class="qnaFoldingBtn" onclick="qnaFolding(this);">펼치기▽</td>
									<td>${sQna.qEnrollDate}</td>
								</tr>
								<tr class="qnaDetailArea" style="display:none">
									<td colspan="7" style="padding:10px 70px;background-color:rgb(254,245,240);text-align:left;">
									 ${sQna.qnaContents }
									</td>
								</tr>
								<tr class="qnaDetailArea" style="margin-bottom:50px;display:none;">
									<td colspan="7" style="padding:10px 70px;background-color:rgb(250,250,250);text-align:left;">
										<c:if test="${sQna.answerContents eq '' or sQna.answerContents eq null}"><span>ㄴ답변 대기중입니다.</span></c:if>
										<c:if test="${sQna.answerContents ne '' and sQna.answerContents ne null}"><span>ㄴ${sQna.answerContents}</span></c:if>
									</td>
								</tr>
								<tr style="height:10px; border-bottom:1px solid #c0c0c0;"></tr>
							</c:forEach>
					</table>
				</div>
				<nav aria-label="Page navigation example" style="width:200px;margin:10px auto; border-style:none; color:gray;">
				  <ul class="pagination">
				    <li class="page-item">
				    <c:if test="${paging.startNavi > paging.startPage }">
				      <a class="page-link" href="/shopQna/list.strap?page=${paging.startNavi-1 }&dayBefore=${search.dayBefore}<c:if test="${search.startDate ne null }">&startDate=${search.startDate}&endDate=${search.endDate}</c:if>"aria-label="<">
				        <span aria-hidden="true">&laquo;</span>
				      </a>
				     </c:if>
				    </li>
				    <c:forEach begin="${paging.startNavi }" end="${paging.endNavi }" var="n">
				    <li class="page-item"><a class="page-link" <c:if test="${paging.page eq n }">style="font-weight:bold;color:darkorange;"</c:if>  href="/shopQna/list.strap?page=${n }&dayBefore=${search.dayBefore}<c:if test="${search.startDate ne null }">&startDate=${search.startDate}&endDate=${search.endDate}</c:if>">${n }</a></li>
				    </c:forEach>
				    <c:if test="${paging.endNavi < paging.endPage }">
				    <li class="page-item">
				      <a class="page-link" href="/shopQna/list.strap?page=${paging.endNavi+1 }&dayBefore=${search.dayBefore}<c:if test="${search.startDate ne null }">&startDate=${search.startDate}&endDate=${search.endDate}</c:if>" aria-label=">">
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
<script>
//날짜필터링
var startDate = document.querySelector("#startDate");
var endDate = document.querySelector("#endDate");
var dBtn = document.querySelector("#dBtn");

function dateFilter(day){
	var searchForm = document.querySelector("#search-form");
	var dayBefore = document.querySelector("#dayBefore");
	dayBefore.value = day;
	
	startDate.disabled = true;	
	endDate.disabled = true;	
	dBtn.disabled = true;
	document.querySelector("#inputDate").style.display="none";
	
	searchForm.submit();
}
//날짜 직접입력
function abled(){
	startDate.disabled = false;	
	endDate.disabled = false;	
	dBtn.disabled = false;	
	var dayBefore = document.querySelector("#dayBefore");
	dayBefore.value=0;
	for(var i=0; i<5; i++){
		document.querySelectorAll("#order-wrap button")[i].style.color="gray";
		document.querySelectorAll("#order-wrap button")[i].style.border="2px solid gray";
	}
	document.querySelectorAll("#order-wrap button")[4].style.color="darkorange";
	document.querySelectorAll("#order-wrap button")[4].style.border="2px solid darkorange";
	document.querySelector("#inputDate").style.display="block";
}
//답변 펼치기
function qnaFolding(thisBtn){
	var thisQuestionArea =thisBtn.parentElement.nextSibling.nextElementSibling;
	var thisAnswerArea = thisBtn.parentElement.nextSibling.nextElementSibling.nextElementSibling;
	if(thisQuestionArea.style.display =="none"){
		thisQuestionArea.style.display = "table-row";
		thisAnswerArea.style.display = "table-row";
		thisBtn.innerHTML = "접기△";
	}else{
		thisQuestionArea.style.display = "none";
		thisAnswerArea.style.display = "none";
		thisBtn.innerHTML = "펼치기▽";
	}
}

</script>
</body>
</html>
