<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
	<title>STRAP MAIN</title>
	<link rel="stylesheet" type="text/css" href="/resources/css/header.css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" />
</head>
<body>
<header class="header">
<div class="logo" style="cursor: pointer;" onclick="location.href='/';" >Strap</div>
<div class="login">
	<ul>
		<li style="cursor: pointer;" onclick="location.href='#';">로그인</li>
        <li style="cursor: pointer;" onclick="location.href='#';">마이쇼핑</li>
		<li>
			<svg xmlns="http://www.w3.org/2000/svg" width="45" height="45" fill="currentColor" class="bi bi-person" viewBox="0 0 16 16">
 			<path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0zm4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10z"/>
 			</svg>
		</li>
		<li>
			<svg xmlns="http://www.w3.org/2000/svg" width="45" height="45" fill="currentColor" class="bi bi-cart3" viewBox="0 0 16 16">
			<path d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .49.598l-1 5a.5.5 0 0 1-.465.401l-9.397.472L4.415 11H13a.5.5 0 0 1 0 1H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM3.102 4l.84 4.479 9.144-.459L13.89 4H3.102zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/>
			</svg>
		</li>
    </ul>
</div>
</header>
<menu>
    <div>
		<ul class="nav justify-content-center">
			<li class="nav-item" style="cursor: pointer;" onclick="location.href='#';">매칭</li>
	  		<li class="nav-item" style="cursor: pointer;" onclick="location.href='#';">보충제</li>
	  		<li class="nav-item" style="cursor: pointer;" onclick="location.href='#';">게시판</li>
		</ul>
	</div>
</menu>
</body>
</html>
