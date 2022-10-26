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
		#myInfo select{border: 0px}
		#myInfo textarea{width: 280px; height: 50px; resize: none;}
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
			<h6><i>내 운동정보를 불러오거나 입력하세요</i></h6>
			<br>
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
					<td>
						<input type="text" id="jymAddress" name="jymAddress" style="width: 280px;"><br>
						<input type="text" id="jymTitle" name="jymTitle" style="width: 217px;">
						<button type="button" class="btn btn-dark" onclick="showMap();">검색</button>
					</td>
				</tr>
				<tr>
					<th>성별</th>
					<td>
						<input type="radio" id="memberGender" name="memberGender" value="M" checked>Male
						<input type="radio" id="memberGender" name="memberGender" value="F" style="margin-left: 30px;">Female
					</td>
				</tr>
				<tr>
					<th>자기소개</th>
					<td><textarea></textarea></td>
				</tr>
			</table>
			<br>
			<button class="btn btn-dark" onclick="myInfo()">내 운동정보 불러오기</button>
			<button class="btn btn-dark" onclick="example()">운동 파트너 찾기</button>
			<br><br><br><br>	
		</div>
	</div>
<!-- 푸터	 -->
	<div id="footer" class="row">
		<div class="col">
			<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
		</div>
	</div>
</div>
<script type="text/javascript">
	function showMap(){
		window.open("/member/showMap.strap",null,"width=700,height=600,resizable=no");
	}
	function myInfo(){
		
	}
</script>
</body>
</html>