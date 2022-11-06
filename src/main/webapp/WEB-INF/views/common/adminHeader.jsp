<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<meta charset="UTF-8">
<script src="/resources/js/jquery-3.6.1.min.js"></script>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css"> -->
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>
<style>
body { 
	background-color: #EAEAEA;
}
#title-img{
 	width:250px;
 	height: 100px;
 	object-fit: contain;
	cursor: pointer;"
}

.navbar{
	background-color:black;
}
.nav-menu{
	font-weight: 1000;
}
.admin-title{
	text-decoration:none;
	color:black;
}
.admin-menu{
	color: white;
	text-decoration:none;
}
#admin-logout{
	color: black;
	text-decoration:none;
}


</style>

<body>
	<div class="container text-center">
		<header class="header row text-center">
			<div class="col-3">
				<a class="admin-title" href="/admin/mainView.strap"><img id="title-img" alt="메인" src="/resources/image/admin/logo.png"></a>
			</div>
			<div class="title col" align="left">
				<br><br>
				<h5>관리자 페이지</h5>
			</div>
			<div class="col" align="right">
<%-- 				<br> <b>${sessionScope.loginUser.memberNick }</b><br> --%>
				<br>
				<h6><a id="admin-logout" href="/admin/logout.strap">로그아웃</a></h6>
			</div>
		</header>
		<div class="navbar row">
			<div class="nav-menu col">
				<a class="admin-menu" href="#">문의</a>
			</div>
			<div class="nav-menu col">
				<a class="admin-menu" href="#">신고</a>
			</div>
			<div class="nav-menu col">
				<a class="admin-menu" href="#">몰</a>
			</div>
			<div class="nav-menu col">
				<a class="admin-menu" href="#">회원</a>
			</div>
			<div class="nav-menu col">
				<a class="admin-menu" href="/admin/noticeListView.strap">공지사항</a>
			</div>
			<div class="nav-menu col">
				<a class="admin-menu" href="/admin/bannerListView.strap">배너</a>
			</div>
		</div>
	</div>
</body>