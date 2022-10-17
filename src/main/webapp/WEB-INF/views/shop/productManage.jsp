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
						<h1>상품관리</h1><hr>
						<button onclick="location.href='/admin/product/registerView.strap';">상품등록</button>
						<div>
							<input type="text" placeholder="상품검색"><button>검색</button>
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
							
							
							</c:forEach>						
						</table>
					</div>
				</div>
	
		</div>
	</div>
	<!-- 푸터 -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</div>
</body>
</html>
