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
		.myInfoClose{display: none;}
		#myInfoDiv{display: none;}
		#myInfoTable{table-layout: fixed; width: 400px; margin: 0 auto; border-collapse:separate; border-radius: 10px;}
		#myInfoTable th{width: 120px; margin-left: 15px;}
		#myInfoTable td{width: 300px; }
		#myInfoTable select{border: 0px}
		#myInfoTable textarea{width: 250px; height: 100px; resize: none;}
		.find{width: 320px; text-align: left}
		.findImg{width: 30px; height: 30px;}
		#profileImgDiv{overflow: hidden; border-radius: 125px; width: 180px; height: 180px; margin: 10px auto;}
		#profileImgDiv img{width: 100%; height: 100%;}
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
			<br>
			<button class="btn btn-dark myInfoShow" onclick="myInfoShow()">내 정보 보기</button>
			<button class="btn btn-dark myInfoClose" onclick="myInfoClose()">내 정보 닫기</button>
			<div id="myInfoDiv">
				<table id="myInfoTable" class="table">
					<tr>
						<th>프로필 사진</th>
						<td>
							<div id="profileImgDiv">
								<img id="profileImg">
							</div>
						</td>
					</tr>
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
							<input type="text" id="jymAddress" name="jymAddress" style="width: 250px;border:0;" readonly><br>
							<input type="text" id="jymTitle" name="jymTitle" style="width: 250px;border:0;" readonly>
						</td>
					</tr>
					<tr>
						<th>매너점수</th>
						<td>
							<input type="text" id="memberManner" name="memberManner" style="width: 250px;border: 0" readonly> 
						</td>
					</tr>
					<tr>
						<th>자기소개</th>
						<td><textarea id="memberIntroduce" readonly></textarea></td>
					</tr>
				</table>
				<br>
				<button class="btn btn-dark" onclick="modifyInfo();">프로필 수정</button>
			</div>
			<br>
			<br><br>
			<div id="recommend">
			<h6><b>맞춤 추천</b></h6>
			<br>
			<button class="btn btn-light find" onclick="findMember1();"><img class="findImg" src="/resources/image/matching/opacity.png"> 운동 실력이 비슷한 친구</button><br><br>
			<button class="btn btn-light find" onclick="findMember2();"><img class="findImg" src="/resources/image/matching/place.png"> 내 주변 친구</button><br><br>
			<button class="btn btn-light find" onclick="findMember3();"><img class="findImg" src="/resources/image/matching/heart.png"> 매너 점수가 높은 친구</button><br><br>
			<button class="btn btn-light find" onclick="findMember4();"><img class="findImg" src="/resources/image/matching/master.png"> 짬에서나오는 바이브를 가진 친구</button><br><br>
			<button class="btn btn-light find" onclick="findMember5();"><img class="findImg" src="/resources/image/matching/squat.png"> 쫌 치네? 3대 500 이상 친구</button><br><br>
			<button class="btn btn-light find" onclick="findMember6();"><img class="findImg" src="/resources/image/matching/high-five.png"> 동성 친구</button><br><br>
			</div>
			<br><br>
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
	function modifyInfo(){
		if(confirm("프로필 수정으로 이동하시겠습니까?")){
			location.href='/mypage/myinfoView.strap'
		}
	}

	function showMap(){
		window.open("/member/showMap.strap",null,"width=700,height=600,resizable=no");
	}
	
	function myInfoShow(){
		var mProfileRename = '${loginUser.mProfileRename}';
		var memberCareer = '${loginUser.memberCareer}';
		var memberSBD = '${loginUser.memberSBD}';
		var memberJym = '${loginUser.memberJym}'.split(",");
		var jymAddress = memberJym[0];
		var jymTitle = memberJym[1];
		var memberManner = '${loginUser.memberManner}';
		var memberIntroduce = '${loginUser.memberIntroduce}';
		//profileImt
		$("#profileImg").attr("src","/resources/profileUploadFiles/"+mProfileRename);
		//Career
		if(memberCareer =='1'){
			$("#memberCareer").val("1").prop("selected", true);
		} else if(memberCareer == '1-2'){
			$("#memberCareer").val("1-2").prop("selected", true);
		} else if(memberCareer == '2-3'){
			$("#memberCareer").val("2-3").prop("selected", true);
		} else if(memberCareer == '3-5'){
			$("#memberCareer").val("3-5").prop("selected", true);
		} else if(memberCareer == '5-10'){
			$("#memberCareer").val("5-10").prop("selected", true);
		}
		//SBD
		if(memberSBD == '200'){
			$("#memberSBD").val("200").prop("selected",true);
		} else if(memberSBD = '200~300'){
			$("#memberSBD").val("200~300").attr("selected",true);
		}else if(memberSBD = '300~350'){
			$("#memberSBD").val("300~350").attr("selected",true);
		}else if(memberSBD = '350~400'){
			$("#memberSBD").val("350~400").attr("selected",true);
		}else if(memberSBD = '400~450'){
			$("#memberSBD").val("400~450").attr("selected",true);
		}else if(memberSBD = '450~500'){
			$("#memberSBD").val("450~500").attr("selected",true);
		}else if(memberSBD = '500~600'){
			$("#memberSBD").val("500~600").attr("selected",true);
		}else if(memberSBD = '600'){
			$("#memberSBD").val("600").attr("selected",true);
		}
		//JYM
		$("#jymAddress").val(jymAddress);
		$("#jymTitle").val(jymTitle);
		//manner
		$("#memberManner").val(memberManner+'점');
		//Introduce
		$("#memberIntroduce").val(memberIntroduce);
		//show
		$("#myInfoDiv").show();
		$(".myInfoShow").hide();
		$(".myInfoClose").show();
	}
	
	function myInfoClose(){
		if(confirm("닫으시면 저장하지 않은 정보는 반영되지 않습니다.")){
		$("#myInfoDiv").hide();
		$(".myInfoShow").show();
		$(".myInfoClose").hide();
		}
	}
	
	function findMember1(){
		location.href="/match/sameMember.strap"
	}
	function findMember2(){
		location.href="/match/localMember.strap"		
	}
	function findMember3(){
		location.href="/match/mannerMember.strap"	
	}
	function findMember4(){
		location.href="/match/careerMember.strap"	
	}
	function findMember5(){
		location.href="/match/SBDMember.strap"	
	}
	function findMember6(){
		location.href="/match/genderMember.strap"	
	}
</script>
</body>
</html>