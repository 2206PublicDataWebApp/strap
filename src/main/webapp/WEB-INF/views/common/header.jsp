<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<header class="header">
	<div class="logo" style="cursor: pointer;" onclick="location.href='/';" >
		<img src="/resources/images/logo.png" style="width: 450px; height: 110px; object-fit: cover;">
	</div>
	<div class="login-wrap">
		<div id="text-menu">
			<li style="cursor: pointer;" onclick="location.href='#';">로그인</li>
	        <li style="cursor: pointer;" onclick="location.href='#';">마이쇼핑</li>
		</div>
		<div id="icon-menu">
			<div class="menu-img">
				<img class="icon-img" src="/resources/images/mypage.png">
			</div>
			<div class="menu-img">
				<img class="icon-img" src="/resources/images/cart.png">
			</div>
		</div>
	</div>
</header>
<menu>
    <div class="navBar">
			<li onclick="location.href='#';">매칭</li>
	  		<li onclick="location.href='#';">보충제</li>
	  		<li onclick="location.href='/board/list.strap';">게시판</li>
	</div>
</menu>

</body>
</html>