<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"/>
</head>
<body>
<header class="header">
	<div class="logo" >
		<img src="/resources/image/logo.png" style="width: 450px; height: 110px; object-fit: cover; cursor: pointer;" onclick="location.href='/';">
	</div>
	<div class="login-wrap">
		<div id="text-menu">
			<ul style="margin:20px;">
			<c:if test="${sessionScope.loginUser.memberNick eq null}">
				<li style="cursor: pointer;" onclick="location.href='/member/loginView.strap';">로그인</li>
			</c:if>
			<c:if test="${sessionScope.loginUser.memberNick ne null}">
				<c:if test="${sessionScope.access_token eq null}">
					<li><a href="/member/logout.strap">로그아웃</a></li>
				</c:if>
				<c:if test="${sessionScope.access_token ne null}">
					<li><a href="/member/kakaoLogout.strap?token=${sessionScope.access_token}">로그아웃</a></li>
				</c:if>
			</c:if>
	        <li style="cursor: pointer;" onclick="location.href='/mypage/mypageView.strap';">
				<i class="fa-regular fa-user"></i>
	        </li>
	        <c:if test="${sessionScope.loginUser.memberNick eq null}">
		        <li style="cursor: pointer;" onclick="loginCheck('${loginUser.memberId}', function(){location.href='/home.strap';});">
					<i class="fa-regular fa-envelope"></i>
					<div id="messageMarker" style="display:none;position:relative;left:-10px;bottom:15px;height:16px;width:16px;border-radius:25px;background-color:red;color:white;font-size:10px;text-align:center;"></div>
		        </li>
	        </c:if>
	        <c:if test="${sessionScope.loginUser.memberNick ne null}">
		        <li style="cursor: pointer;" onclick="noteBoxPopup();">
					<i class="fa-regular fa-envelope"></i>
					<div id="messageMarker" style="display:none;position:relative;left:-10px;bottom:15px;height:16px;width:16px;border-radius:25px;background-color:red;color:white;font-size:10px;text-align:center;"></div>
		        </li>
	        </c:if>
	        <li style="cursor: pointer;" onclick="loginCheck('${loginUser.memberId}',function(){location.href='/cart/cartView.strap';});">
				<i class="fa-solid fa-cart-shopping"></i>
				<div id="cartMarker" style="display:none;position:relative;left:-10px;bottom:15px;height:16px;width:16px;border-radius:25px;background-color:red;color:white;font-size:10px;text-align:center;"></div>
	        </li>
			</ul>
		</div>
	</div>
</header>
<nav>
    <div class="navBar">
    	<ul>
			<li onclick="location.href='/match/matchingView.strap';">매칭</li>
	  		<li onclick="location.href='/product/listView.strap';">보충제</li>
	  		<li onclick="location.href='/board/list.strap';">게시판</li>
    	</ul>
	</div>
</nav>
<hr>
</body>

<script>
//로그인 체크
function loginCheck(loginId,action){
	event.preventDefault();
	if(loginId==""){
		alert("로그인을 해주세요.");
		location.href="/member/loginView.strap";		
	}else{
		action();
	}
}
//장바구니 마크
markCart();
function markCart(){
	if('${loginUser.memberId}' != null){
		$.ajax({
			url:"/cart/mark.strap",
			data:{},
			type:"post",
			success:function(count){
				if(Number(count)>0){
					document.querySelector("#cartMarker").style.display="inline-block";
					document.querySelector("#cartMarker").innerText=count;
				}
			},
			error:function(){}
		});
	}
}

var noteBoxWindow;
function noteBoxPopup(){
	var popupX = (document.body.offsetWidth / 2) - (600 / 2);
	var popupY = (window.screen.height / 2) - (850 / 2);
    if(noteBoxWindow == null){
		noteBoxWindow = window.open("/mypage/noteBoxListView.strap", '_blank', 'width=600, height=850, resizable=no, left='+ popupX + ', top='+ popupY); return false
    }else{
        if (noteBoxWindow.closed == false) {
        	noteBoxWindow.focus();
        }else{
			noteBoxWindow = window.open("/mypage/noteBoxListView.strap", '_blank', 'width=600, height=850, resizable=no, left='+ popupX + ', top='+ popupY); return false
        }
    }
}

// $(document).ready(function() {
// 	function noteBoxOffCanvas(memberId){
// 		console.log(memberId)
// 		$.ajax({
// 			type : "get",
// 			url : "/mypage/noteBoxListView.strap",
// 			success:function(data){
// 				console.log(data)
// 				$("#noteBoxListArea").html(data)
// 			}
// 		});
// 		$('#offcanvasRight').offcanvas('show');
// 	}
// });

// var myOffcanvas = document.getElementById('offcanvasRight')
// myOffcanvas.addEventListener('show.bs.offcanvas', function () {
// 	alert("성공")
// })

</script>
</html>