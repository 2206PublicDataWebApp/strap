<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
/* .sideBar-list{ */
/* 	cursor: pointer; */
/* } */

ul{
	font-size:16px
}
</style>
</head>
<body>
	<!-- 사이드바 사용시 -->
	<c:set var = "nListSize" value ="${param.nListSize }"/>
	<ul class="list-group">
		<li class="sideBar-list list-group-item list-group-item-action"><a href="/mypage/mypageView.strap">나의 활동</a></li>
		<li class="sideBar-list list-group-item list-group-item-action"><a href='javascript:void(0);' onClick="location.href='/mypage/noteBoxListView.strap'">쪽지함</a><span class="badge rounded-pill bg-dark" id="noteBox-check"><span class="visually-hidden">unread messages</span></span></li>
		<li class="sideBar-list list-group-item list-group-item-action"><a href='javascript:void(0);' onClick="location.href='/mypage/scheduleView.strap'">캘린더</a></li>
		<li class="sideBar-list list-group-item list-group-item-action"><a href='javascript:void(0);' onClick="location.href='/mypage/myinfoView.strap'">정보조회</a></li>
		<li class="sideBar-list list-group-item list-group-item-action"><a href='javascript:void(0);' onClick="location.href='/mypage/qnaView.strap'">일반문의</a></li>
	</ul>
	
	<ul class="list-group">
		<li class="sideBar-list list-group-item list-group-item-action">나의 쇼핑</li>
		<li class="sideBar-list list-group-item list-group-item-action" onclick="location.href='/product/like/listView.strap';">찜한상품</li>
		<li class="sideBar-list list-group-item list-group-item-action" onclick="location.href='/order/listView.strap';">주문내역</li>
<!-- 			<li class="sideBar-list list-group-item list-group-item-action" onclick="location.href='/order/cancel/listView.strap';">취소/반품</li> -->
		<li class="sideBar-list list-group-item list-group-item-action" onclick="location.href='/review/list.strap';">상품후기</li>
		<li class="sideBar-list list-group-item list-group-item-action" onclick="location.href='/shopQna/list.strap';">상품문의</li>
	</ul>
</body>
<script>
markCart();
function markCart(){
	if('${loginUser.memberId}' != null){
		$.ajax({
			url:"/mypage/mark.strap",
			data:{},
			type:"post",
			success:function(count){
				if(Number(count)>0){
					document.querySelector("#noteBox-check").style.display="inline-block";
					document.querySelector("#noteBox-check").innerText=count;
				} else {
					document.querySelector("#noteBox-check").style.display="none";
				}
			},
			error:function(){}
		});
	}
}
</script>


</html>