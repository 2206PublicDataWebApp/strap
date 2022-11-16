<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
	a{
	text-decoration:none;
	color:black;
	}
	a:hover{
		color:black;
	}
</style>

</head>
<body>
		<!-- 사이드바 사용시 -->
		<ul class="list-group">
			<li class="sideBar-list list-group-item list-group-item-action" style="font-size:18px"><a href="/admin/mainView.strap"> ◁관리자메뉴</a></li>
			<li class="sideBar-list list-group-item list-group-item-action"><a href="/admin/productView.strap">상품관리</a></li>
			<li class="sideBar-list list-group-item list-group-item-action"><a href="/admin/orderView.strap">주문관리</a></li>
			<li class="sideBar-list list-group-item list-group-item-action"><a href="/admin/couponView.strap">쿠폰관리</a></li>
<!-- 			<li class="sideBar-list list-group-item list-group-item-action"><a href="#">쿠폰관리</a></li> -->
		</ul>
</body>
</html>