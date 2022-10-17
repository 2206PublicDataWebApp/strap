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
			<li style="cursor: pointer;" onclick="location.href='/member/loginView.strap';">로그인</li>
	        <li style="cursor: pointer;" onclick="location.href='/order/list.strap';">마이쇼핑</li>
		</div>
		<div id="icon-menu">
			<div class="menu-img">
				<a href="/mypage/mypageView.strap">
					<img class="icon-img" src="/resources/images/mypage.png">
				</a>
			</div>
			<div class="menu-img">
				<a href="#">
					<img class="icon-img" src="/resources/images/cart.png">
				</a>
			</div>
		</div>
	</div>
</header>
<menu>
    <div class="navBar">
			<li onclick="location.href='#';">매칭</li>
	  		<li onclick="location.href='/product/list.strap';">보충제</li>
	  		<li onclick="location.href='/board/list.strap';">게시판</li>
	</div>
</menu>

</body>
</html>