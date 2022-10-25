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
			<h6>내 운동 정보를 불러오거나 직접 입력하세요!</h6>
			<table id="myInfo" class="table">
				<tr>
					<th>운동경력</th>
					<td>
						<select name="memberCareer" id="memberCareer">
							<option value="1">1년 이하</option>
							<option value="1-2">1년~2년</option>
							<option value="2-3">2년~3년</option>
							<option value="3-5">3년~5년</option>
							<option value="5-10">5년~10년</option>
							<option value="10">10년 이상</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>3대 기록</th>
					<td>
						<select name="memberSBD" id="memberSBD">
							<option value="200">200 이하</option>
							<option value="200~300">200~300</option>
							<option value="300~350">300~350</option>
							<option value="350~400">350~400</option>
							<option value="400~450">400~450</option>
							<option value="450~500">450~500</option>
							<option value="500~600">500~600</option>
							<option value="600">600 이상</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>마이짐</th>
					<td><input type="text" name=memberJym val></td>
				</tr>
				<tr>
					<th>성별</th>
					<td><input type="text" name=memberGender></td>
				</tr>
				<tr>
					<th>자기소개</th>
					<td><textarea name=memberIntrouduce></textarea></td>
				</tr>
			</table>
			<br>
			<button class="btn btn-dark" onclick="myInfo();">내 운동정보 불러오기</button>
			<br><br><br>
			
			<div id="2">
				<img width="50px" height="50px" alt="2" src="/resources/image/matching/two.png">
			</div>
			<br>
			<h6>내 운동 정보와 비슷한 회원이 추천됩니다</h6>
			<div id="3">
				<img width="50px" height="50px" alt="3" src="/resources/image/matching/three.png">
			</div>
			<br>
			<h6>프로필을 열람하고 같이 운동하고 싶은 회원에게 쪽지를 보내세요!</h6>
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