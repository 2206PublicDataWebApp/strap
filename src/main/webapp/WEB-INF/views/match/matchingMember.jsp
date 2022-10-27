<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- CDN -->
<!-- 부트스트랩 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" />
<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- css -->
<link rel="stylesheet" type="text/css" href="/resources/css/common.css">
<style>
	#memberList{table-layout: fixed; width: 700px; height:200px; margin: 0 auto; padding-left: 30px;}
	.member{float:left; width: 100px; height: 200px; margin: 15px;}
	.img{width: 100px; height: 100px; overflow: hidden; border-radius: 70px;}
	.nick{width: 100px; height: 50px;}
	.nick button{width: 110px; height: 30px; font-size: 12px;}
</style>

</head>
<body>
<div class="wrap container">
<!-- 헤더&메뉴바 -->
	<div id="header" class="row">
		<div class="col">
			<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
		</div>
	</div>
<!-- 컨텐츠 -->
	<div id="contents" class="contents row">
		<div class="contents-side col">
		<br><br>
			<div id="memberList">
				<h6 align="center"><b>내 주변 친구</b></h6>
				<c:forEach items="${mList }" var="member">
					<div class="member">
						<div class="img">
							<c:if test="${member.mProfileRename eq null }">
								<img width="100%" height="100%" src="/resources/profileUploadFiles/default.png">
							</c:if>
							<c:if test="${member.mProfileRename ne null }">
								<img width="100%" height="100%" src="/resources/profileUploadFiles/${member.mProfileRename }">
							</c:if>
						</div>
						<br>
						<div class="nick">						
							<button class="btn btn-light">${member.memberNick }</button>
						</div>
					</div>
				</c:forEach>
				<br>
				<button class="btn btn-dark">새로 추천 받기</button>
			</div>
		</div>
	</div>
<!-- 푸터	 -->
	<div id="footer" class="row">
		<div class="col">
			<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
		</div>
	</div>
</div>
</body>
</html>