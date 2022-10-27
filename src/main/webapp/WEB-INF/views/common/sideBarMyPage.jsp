<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
/* .sideBar-list{ */
/* 	cursor: pointer; */
/* } */
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
		<li class="sideBar-list list-group-item list-group-item-action"><a href="/mypage/mypageView.strap">마이페이지</a></li>
		<li class="sideBar-list list-group-item list-group-item-action"><a href='javascript:void(0);' onClick="location.href='/mypage/noteBoxListView.strap'">쪽지함</a></li>
		<li class="sideBar-list list-group-item list-group-item-action"><a href='javascript:void(0);' onClick="location.href='/mypage/scheduleView.strap'">캘린더</a></li>
		<li class="sideBar-list list-group-item list-group-item-action"><a href='javascript:void(0);' onClick="location.href='/mypage/myinfoView.strap'">정보조회</a></li>
		<li class="sideBar-list list-group-item list-group-item-action"><a href="www.google.com">장바구니</a></li>
		<li class="sideBar-list list-group-item list-group-item-action"><a href='javascript:void(0);' onClick="location.href='/mypage/qnaView.strap'">문의</a></li>
	</ul>
	<br><br>
	
	<ul class="list-group">
		<li class="sideBar-list list-group-item list-group-item-action">마이쇼핑</li>
		<li class="sideBar-list list-group-item list-group-item-action" onclick="location.href='/order/listView.strap';">주문내역</li>
		<li class="sideBar-list list-group-item list-group-item-action" onclick="location.href='/order/cancel/listView.strap';">취소/반품</li>
		<li class="sideBar-list list-group-item list-group-item-action" onclick="location.href='/review/list.strap';">상품후기</li>
		<li class="sideBar-list list-group-item list-group-item-action" onclick="location.href='/product/like/listView.strap';">찜한상품</li>
		<li class="sideBar-list list-group-item list-group-item-action" onclick="location.href='/shopQna/list.strap';">상품문의</li>
	</ul>
</body>
</html>