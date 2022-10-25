<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		.contents-side{text-align: center;}
		#myInfo{table-layout: fixed; width: 400px; margin: 0 auto; border-collapse:separate; border-radius: 10px;}
		#myInfo th{width: 100px; margin-left: 15px;}
		#myInfo td{width: 300px; }
		#myInfo input{width: 280px; border: 0px}
		#myInfo select{border: 0px}
		#myInfo textarea{width: 280px; height: 50px; resize: none; border:0}
		#memberList{table-layout: fixed; width: 700px; height:200px; margin: 0 auto; padding-left: 30px;}
		.member{float:left; width: 100px; height: 200px; margin: 15px;}
		.img{width: 100px; height: 100px; overflow: hidden; border-radius: 70px;}
		.nick{width: 100px; height: 50px;}
		.nick button{width: 100px; height: 50px; font-size: 12px;}
		#profile{margin:0 auto; width: 700px; height: 700px; border:1px solid black;}
		#info{width: 100%; height: 200px; border:1px solid black;}
		#info-img{float:left; width: 30%; height: 200px;border:1px solid black;}
		#info-detail{float:left; width: 70%; height: 200px;border:1px solid black;}
		#imgs{width: 100%; height: 200px;border:1px solid black;}
		.profile-img{float:left; width: 33%; height: 200px;border:1px solid black;}
		#manner{width: 100%; height: 100px;border:1px solid black;}
		#msg{width: 100%; height: 200px;border:1px solid black;}	
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
			<h1>How to Matching</h1>
			<br>
			<div id="1">
				<img width="50px" height="50px" alt="1" src="/resources/image/matching/one.png">
			</div>
			<br>
			<h6>내 운동 정보를 불러오거나 입력하여 파트너 찾기를 누릅니다!</h6>
			<table id="myInfo" class="table">
				<tr>
					<th>운동경력</th>
					<td>1년~2년</td>
				</tr>
				<tr>
					<th>3대 기록</th>
					<td>300~350</td>
				</tr>
				<tr>
					<th>마이짐</th>
					<td>경기 부천시 원미동 94-5<br>바디업휘트니스</td>
				</tr>
				<tr>
					<th>성별</th>
					<td>남성</td>
				</tr>
				<tr>
					<th>자기소개</th>
					<td>안녕하세요 운동하는 30대 <br> 직장인입니다. 주말에 부천,광명에서 <br>같이 운동하실분 쪽지주세요!</td>
				</tr>
			</table>
			<br>
			<button class="btn btn-dark" onclick="alert('예시 페이지입니다')">내 운동정보 불러오기</button>
			<button class="btn btn-dark" onclick="alert('예시 페이지입니다')">운동 파트너 찾기</button>
			<br><br><br>
			
			<div id="2">
				<img width="50px" height="50px" alt="2" src="/resources/image/matching/two.png">
			</div>
			<br>
			<h6>내 운동 정보와 비슷한 회원이 추천됩니다</h6>
			<div id="memberList">
				<div class="member">
					<div class="img">
						<img width="100%" height="140px" src="/resources/image/matching/strap.png">
					</div>
					<br>
					<div class="nick">
						<button class="btn btn-light">리틀성엽</button>
					</div>
				</div>
				<div class="member">
					<div class="img">
						<img width="100%" height="140px" src="/resources/image/matching/img2.jpg">
					</div>
					<br>
					<div class="nick">
						<button class="btn btn-light">삶은달걀</button>
					</div>
				</div>
				<div class="member">
					<div class="img">
						<img width="100%" height="140px" src="/resources/image/matching/img3.jpg">
					</div>
					<br>
					<div class="nick">
						<button class="btn btn-light">3대499</button>
					</div>
				</div>
				<div class="member">
					<div class="img">
						<img width="100%" height="140px" src="/resources/image/matching/img4.png">
					</div>
					<br>
					<div class="nick">
						<button class="btn btn-light">운동합시다</button>
					</div>
				</div>
				<div class="member">
					<div class="img">
						<img width="100%" height="140px" src="/resources/image/matching/img5.jpg">
					</div>
					<br>
					<div class="nick">
						<button class="btn btn-light">언제철들래</button>
					</div>
				</div>
			</div>
			<br><br>
			<div id="3">
				<img width="50px" height="50px" alt="3" src="/resources/image/matching/three.png">
			</div>
			<br>
			<h6>프로필을 열람하고 같이 운동하고 싶은 회원에게 쪽지를 보내세요!</h6>
			<div id="profile">
				<div id="info">
					<div id="info-img"></div>
					<div id="info-detail"></div>
				</div>
				<div id="imgs">
					<div class="profile-img"></div>
					<div class="profile-img"></div>
					<div class="profile-img"></div>
				</div>
				<div id="manner">
				</div>
				<div id="msg"></div>
			</div>
			<br>
			<div id="4">
				<img width="50px" height="50px" alt="4" src="/resources/image/matching/four.png">
			</div>
			<br>
			<h6>상대방이 쪽지를 수락하면 마이페이지의 쪽지함에서 대화를 이어나갈 수 있습니다.</h6>
			<div id="5">
				<img width="50px" height="50px" alt="5" src="/resources/image/matching/five.png">
			</div>
			<br>
			<h6>1:1 쪽지함의 일정잡기 기능을 사용하면 운동일정 캘린더에 일정이 추가됩니다!</h6>
			<button class="btn btn-dark">매칭하러 가기</button>
				
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