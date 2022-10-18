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
				<!-- 사이드바 사용시 여길 사용합니다. (미사용시 주석) -->
				<jsp:include page="/WEB-INF/views/common/sideBar.jsp"></jsp:include>
				<div class="contents-side">
				
				</div>
				
<!-- 				사이드바 미 사용시 여길 사용합니다. (미사용시 주석) -->
<!-- 				<div class="contents-noside"> -->
<!-- 				</div> -->
	
		</div>
	</div>
	<!-- 푸터 -->
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</div>
</body>
</html>
