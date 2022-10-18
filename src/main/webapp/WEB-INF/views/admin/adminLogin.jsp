<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Strap Admin Login</title>
<link href="/resources/css/adminLogin.css" rel="stylesheet">
<script src="/resources/js/jquery-3.6.1.min.js"></script>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css"> -->
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<div class="wrap">
		<table>
			<tr>
				<td class="loginBoard" align="center">
					<h1>STRAP</h1>
<!--                         <form action="/admin/login.strap" method="post"> -->
                            <input class="form-control" id="admin-id" type="text" name="adminId" placeholder="ID" style="width:240px;" required="required">
                            <input class="form-control" id="admin-pwd" type="password" name="adminPwd" placeholder="Password" style="width:240px;" required="required">
<!--                         </form> -->
                        <br>
                        <div class="row">
	                        <div class="form-button col">
	                        	<button class="btn btn-dark" onclick="adminLogin()">로그인</button>
	                        	<button class="btn btn-dark" onclick="inquiryJoin();">회원가입</button>
	                        </div>
                        </div>
						<br>
                        <div>
                            <a href="#none" onclick="inquiryJoin();">ID / 비밀번호 찾기</a>
                        </div>
				</td>
			</tr>
		</table>
	</div>
	
	<script>
		function inquiryJoin(){
			alert("시스템 관리자에게 문의하세요\n(대표전화:1588-1588)");
		}
	
		function adminLogin(){
			$.ajax({
				url : "/admin/login.strap",
				type : "post",
				data : {"adminId":$("#admin-id").val(), "adminPwd":$("#admin-pwd").val()},
				success:function(data){
					console.log(data)
					if(data == "성공"){
						location.href='/admin/mainView.strap';					
					} else {
						alert("아이디와 비밀번호가 일치하지 않습니다.")
					}
				}
			});
		}
	
	</script>
	
	
	
	
</body>
</html>