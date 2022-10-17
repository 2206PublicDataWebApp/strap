<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta charset="UTF-8">
<script src="/resources/js/jquery-3.6.1.min.js"></script>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css"> -->
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>
<style>
.title{
	background-color:skyblue;
	font-size:50px;
}
.navbar{
	background-color:gold;
}
.admin-title{
	text-decoration:none;
	color:black;
}
.admin-menu{
	text-decoration:none;
}
</style>

<body>
	<div class="container text-center">
		<header class="header row text-center">
			<div class="title col">
				<a class="admin-title" href="/admin/mainView.strap">STRAP</a>
			</div>
		</header>
		<div class="navbar row">
			<div class="col">
				<a class="admin-menu" href="#">문의 관리</a>
			</div>
			<div class="col">
				<a class="admin-menu" href="#">신고 관리</a>
			</div>
			<div class="col">
				<a class="admin-menu" href="#">회원 검색</a>
			</div>
			<div class="col">
				<a class="admin-menu" href="/admin/noticeListView.strap">공지사항</a>
			</div>
			<div class="col">
				<a class="admin-menu" href="#">배너</a>
			</div>
		</div>
	</div>
</body>