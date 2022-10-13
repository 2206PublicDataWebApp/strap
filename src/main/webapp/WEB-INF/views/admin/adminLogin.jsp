<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Strap Admin Login</title>
<link href="/resources/css/adminLogin.css" rel="stylesheet">
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="wrap">
		<table>
			<tr>
				<td class="loginBoard" align="center">
					<h1>STRAP</h1>
                        <p>관리자 홈페이지 입니다.</p>
                        <form action="/admin/login.strap" method="post">
                            <input class="form-control" type="text" name="adminId" placeholder="ID" style="width:240px;" required="required">
                            <input class="form-control" type="password" name="adminPwd" placeholder="Password" style="width:240px;" required="required">
                        </form>
                        <br>
                        <div class="row">
	                        <div class="form-button col">
	                        	<button class="btn btn-primary" onclick="location.href:">로그인</button>
	                        	<button class="btn btn-primary" onclick="inquiryJoin();">회원가입</button>
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
	
	
	</script>
	
	
	
	
</body>
</html>