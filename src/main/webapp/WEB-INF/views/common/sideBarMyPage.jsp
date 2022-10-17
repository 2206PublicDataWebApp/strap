<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.sideBar-list{
	cursor: pointer;
}
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
	<div class="sideBar">
		<ul class="list-group" style="text-align:center;">
			<li class="sideBar-list list-group-item list-group-item-action"><a href="/mypage/mypageView.strap">마이페이지</a></li>
			<li class="sideBar-list list-group-item list-group-item-action"><a href='javascript:void(0);' onClick="location.href='/mypage/noteBoxListView.strap'">쪽지함</a></li>
			<li class="sideBar-list list-group-item list-group-item-action"><a href="www.google.com">캘린더</a></li>
			<li class="sideBar-list list-group-item list-group-item-action"><a href="www.naver.com">정보수정</a></li>
			<li class="sideBar-list list-group-item list-group-item-action"><a href="www.google.com">장바구니</a></li>
			<li class="sideBar-list list-group-item list-group-item-action"><a href="www.naver.com">문의</a></li>
		</ul>
	</div>
</body>
</html>